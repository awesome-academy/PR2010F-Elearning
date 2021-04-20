$(document).ready(function(){
  if(localStorage.getItem("total_seconds")){
    var total_seconds = localStorage.getItem("total_seconds");
  } else {
    var timer = document.getElementById("demo").innerHTML;
    var total_seconds = timer*60;
  }
  var minutes = parseInt(total_seconds/60);
  var seconds = parseInt(total_seconds%60);
  function countDownTimer(){
    if(seconds < 10){
    seconds= "0"+ seconds ;
    }
    if(minutes < 10){
        minutes= "0"+ minutes ;
    }
      document.getElementById("demo").innerHTML = minutes + " : " + seconds
      if(total_seconds <= 0){
        window.localStorage.removeItem('total_seconds');
        document.getElementById('timesup').click();
      }
      else{
        total_seconds = total_seconds -1;
        minutes = parseInt(total_seconds/60);
        seconds = parseInt(total_seconds%60);
        localStorage.setItem("total_seconds",total_seconds)
        // setTimeout("countDownTimer()",1000);
        $("#nopb").click(function() {
          window.localStorage.removeItem('total_seconds');
        });
      }
  }
  setTimeout(countDownTimer(),1000);
  $("#acxep").click(function() {
    $("#nopb").click();
  });
});
