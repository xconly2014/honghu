<?php
namespace Admin\Model;

class CountOrderMgrModel extends DataMgrBaseModel{
    private $tableName = 'order_count';
    
    public function getList($year,$month){
        $sql = "select id, year, month, day, numbers from $this->tableName where year='$year' and month='$month' order by day";
        $result = $this->query($sql);
        foreach($result as $row){
            $retValue[$row['month']][] = $row['numbers'];
            $count[$row['month']] = join($retValue[$row['month']],',');
            $sum[$row['month']] += $row['numbers'];
        }
        
        $data['count'] = $count;
        $data['sum'] = $sum;
        return $data;
    }
    
    public function getCount(){
        $date = I('post.out_date');
        $sql = "select day,numbers,money from $this->tableName where year = year('$date') and month = month('$date')";
        $result = $this->query($sql);
        return empty($result)?'':$result;
    }
}