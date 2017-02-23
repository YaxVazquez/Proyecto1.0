$('.carousel').carousel({
	interval :2000,
	pause:"hover"
});
    
function sesione(){
    $('#sesions').modal({
        show: true
    });
}
function abrir(){
    $('#registro').modal({
        show: true
    });
}
jQuery(document).ready(function($) {
  $(window).scroll(function() {
    var scrollPos = $(window).scrollTop(),
        navbar = $('.color');
    if (scrollPos > 20) {
      navbar.addClass('cambia-color');
    } else {
      navbar.removeClass('cambia-color');
    }
  });
});
$('#miModal').modal({
	show:true
});
$('#popover').popover({
   trigger: 'click',
   html: true,
   show:true
});
jQuery(document).ready(function($) {
  $(window).scroll(function() {
    var scrollPos = $(window).scrollTop(),
        ul = $('.enlaces>li>a');
    if (scrollPos > 20) {
      ul.addClass('cambia-color');
    } else {
      ul.removeClass('cambia-color');
    }
  });
});
jQuery(document).ready(function($) {
  $(window).scroll(function() {
    var scrollPos = $(window).scrollTop(),
        a = $('.hm-lk');
    if (scrollPos > 20) {
      a.addClass('cambia-color');
    } else {
      a.removeClass('cambia-color');
    }
  });
});

