<?php
namespace Home\Model;
use Home\Model\GameMgrModel;

class EvoluationStrategyMgrModel extends DataMgrBaseModel{

    public function getList($isPage = false, $ids='', $game_id=''){

        $sql = "select id,title,game_id from $this->tableName order by id DESC limit 0, 8";

        if($isPage){
            $sql = "select id from $this->tableName";
            $res = $this->query($sql);
            $count = count($res);
            $Page = new \Think\Page($count,10);
            $sql = "select id,title,game_id from $this->tableName order by id DESC limit $Page->firstRow,$Page->listRows";
            $show = $Page->show();
        }
        else if($ids){
            $sql = "select id,title,game_id from $this->tableName where id in($ids)";

        }
        else if($game_id){
            $sql = "select id,title,game_id from $this->tableName where game_id = '$game_id' order by id DESC limit 0, 8";
        }

        $result = $this->query($sql);

        $data = $result;
        $gameMgr = new GameMgrModel();
        foreach($result as $k=>$v){
            if(!$v['game_id']){
                continue;
            }
            $gameInfo = $gameMgr->getInfo($v['game_id']);
            if(!$gameInfo){
                continue;
            }
            $data[$k]['game_name'] = $gameInfo['name'];

            $this->fillUrl($data[$k], $v['id']);
        }

        $retValue['show'] = $show;
        $retValue['data'] = $data;

        return $retValue;
    }


	public function getInfo($id){

		$sql = "select id,title,game_id,content,scan_num,created_date,meta_title,meta_keyword,meta_desc from $this->tableName where id='$id'";
		$result = $this->query($sql);

		if(empty($result)){
			return '';
		}

		$row = $result[0];

		$gameMgr = new GameMgrModel();
		$strategyObj['game_name'] = $gameMgr->getGameName($row['game_id']);
        $strategyObj['game_id'] = $row['game_id'];
		$strategyObj['id'] = $id;
		$strategyObj['title'] = $row['title'];
		$strategyObj['content'] = $row['content'];
		$strategyObj['created_date'] = $row['created_date'];
		$strategyObj['scan_num'] = $row['scan_num'];
		$strategyObj['meta_title'] = $row['meta_title'];
		$strategyObj['keyword'] = $row['meta_keyword'];
		$strategyObj['description'] = $row['meta_desc'];

		return $strategyObj;

	}

	public function updateScanNum($id){

		$sql = "update $this->tableName set scan_num=scan_num+1 where id='$id'";
		return $this->execute($sql);
	}

	public function getTitle($gameId){
		$sql = "select id,title,game_id from $this->tableName where game_id='$gameId' order by id desc";
		$result = $this->query($sql);
		return empty($result)?'':$result;
	}

	public function isExistByGameId($gameId){
	    $result = $this->getTitle($gameId);
	    return empty($result) ? '' : $result[0]['game_id'];
	}


	public function getSearchList($gameId){
	    return $this->getTitle($gameId);
	}

    public function getHotList($game_id){
        $sql = "select id from $this->tableName where game_id != '$game_id'";
        $info = $this->query($sql);
        shuffle($info);
        $data = array_slice($info,0,8);
        $idArray = array();
        foreach($data as $list){
            $idArray[] = $list['id'];
        }
        $Ids = implode(',',$idArray);
        return $this->getList(false,$Ids);
    }

}