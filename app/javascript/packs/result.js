  // $(document).ready(function(){
    $("input:radio").click(function(){
      if ($(this).is(":checked")){
        $(".iObVhe").css({"color":"#fff"}) && $(this).closest(".iObVhe").css({"background":"#f283dc","color":"red"});
      }
    });
    $("#tab-1").addClass('current');
    $('ul.tabs li').click(function(){
      var tab_id = $(this).attr('data-tab');
      $('ul.tabs li').removeClass('current');
      $('.tab-content').removeClass('current');
      $('ul.tabs span').removeClass('violet');
      $(this).addClass('current');
      $("#"+tab_id).addClass('current');
    })

    $('ul.tabs li').click(function(){
      var i = $(this).text();


      console.log(i);

      var allUser = $('ul .marqs').map(function () {
        return $(this).text();
      }).get();
      console.log(allUser);
      var m = parseInt(i)
      console.log(m);

      $("#dm").click(function() {
        $('ul.tabs li').removeClass('current');
        $('ul.tabs span').removeClass('violet');
        $('.tab-content').removeClass('current');
          $("#tab-"+allUser[m]).addClass('current');
          $("#idtab"+allUser[m]).addClass('violet');
          m = m +1;
        });
    });
  });
