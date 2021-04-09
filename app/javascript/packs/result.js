$(document).ready(function(){
  $("input:radio").click(function(){
    if ($(this).is(":checked")){
      $(".iObVhe").css({"color":"#fff"}) && $(this).closest(".iObVhe").css({"background":"#f283dc","color":"red"});
    }
  });
  $("#tab-1").addClass('current');
  $(".tab-link:first").addClass('current');
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');
    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');
    $('ul.tabs span').removeClass('violet');
    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
      function spiner(add,sub,idinput) {
      var numbersQ = $("#numbersQ").text();
      var i = parseInt(numbersQ)
      $("#sub").addClass('grey');
      console.log(numbersQ);
    $(add).click(function add() {
      var $rooms = $(idinput);
      var a = $rooms.val();
      if (a < i){
        a++;
        $rooms.val(a);
        console.log(a);

        $('ul.tabs li').removeClass('current');
        $('ul.tabs span').removeClass('violet');
        $('.tab-content').removeClass('current');
        $("#sub").removeClass('grey');
        $("#tab-"+a).addClass('current');
        $("#idtab"+a).addClass('violet');
      }
      else {
        $("#add").addClass('grey');
        $(sub).prop("disabled", !a);
        $rooms.val(a);
      }
    });
    $(sub).click(function subst() {
      var $rooms = $(idinput);
      var b = $rooms.val();
      if (b >= 2) {
        b--;
        $rooms.val(b);
        $('ul.tabs li').removeClass('current');
        $('ul.tabs span').removeClass('violet');
        $('.tab-content').removeClass('current');
        $("#add").removeClass('grey');
        $("#tab-"+b).addClass('current');
        $("#idtab"+b).addClass('violet');
      }
      else {
        $("#sub").addClass('grey');
        $(sub).prop("disabled", true);
      }
    });
  };
spiner('#add','#sub','#value')
});
