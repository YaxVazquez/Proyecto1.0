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



