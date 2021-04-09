$(document).ready(function(){
  $(".fpb .pb .qsx").click(function(){
    var w = $(this).attr('data-pb');
    console.log(w)
    $('#qs'+w).toggleClass('edit')
      $(".fff").attr("disabled", true )
  });
});
