/**
 * Created by Administrator on 15-6-10.
 */
function setProgressBar(step){
    var steps = $(".step-no");
    for(var i=0; i<step; i++){
        $(".step-no").eq(i).parent().addClass('step-done');
        $(".step-no").eq(i).html("");
    }//for
}
