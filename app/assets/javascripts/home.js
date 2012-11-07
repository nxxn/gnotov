$(document).ready(function() {

  $(function() {
  // OPACITY OF BUTTON SET TO 0%
  $(".roll").css("opacity","0");

  // ON MOUSE OVER
  $(".roll").hover(function () {

  // SET OPACITY TO 70%
  $(this).stop().animate({
  opacity: .7
  }, "slow");
  },

  // ON MOUSE OUT
  function () {

  // SET OPACITY BACK TO 50%
  $(this).stop().animate({
  opacity: 0
  }, "slow");
  });
  });

  if ($("#home").hasClass('active'))
    $("#works").hide();
    $("#contacts").hide();
    $("#welcome").show();

  $("#home").click(function(e){
    e.preventDefault();

    $("#portfolio").removeClass('active');
    $("#contactme").removeClass('active');
    $(this).toggleClass('active');


    $("#works").hide();
    $("#contacts").hide();
    $("#welcome").show();
  });

  $("#portfolio").click(function(e){
    e.preventDefault();

    $(this).toggleClass('active');
    $("#home").removeClass('active');
    $("#contactme").removeClass('active');

    $("#works").show();
    $("#welcome").hide();
    $("#contacts").hide();
  });

  $("#contactme").click(function(e){
    e.preventDefault();

    $(this).toggleClass('active');
    $("#portfolio").removeClass('active');
    $("#home").removeClass('active');

    $("#contacts").show();
    $("#works").hide();
    $("#welcome").hide();
  });

  $("#our-works").click(function(e){
    e.preventDefault();

    $("#portfolio").toggleClass('active');
    $("#works").removeClass('active');
    $("#home").removeClass('active');

    $("#works").show();
    $("#contacts").hide();
    $("#welcome").hide();
  });
});