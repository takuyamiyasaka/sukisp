// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .

// $(function() {
//   var i = 1;
//   setInterval(function() {
//     if(i > 4) i = 1;
//     $(".main-top").css("background","url('images/main"+i+".jpg')");
//     i++;
//     }, 4000
//   );
// });
// // ふわっと変えるための予備
// function slideSwitch() {
//    var $active = $('#slideshow img.active');

//    if ( $active.length == 0 ) $active = $('#slideshow img:last');

//    var $next =  $active.next().length ? $active.next()
//       : $('#slideshow img:first');

//    $active.addClass('last-active');

//    $next.css({opacity: 0.0})
//       .addClass('active')
//       .animate({opacity: 1.0}, 1000, function() {
//            $active.removeClass('active last-active');
//       });
// }

// $(function() {
//    setInterval( "slideSwitch()", 3000 );
// });

$(function(){
	$(".inqbtn").on("click",function(){
		$(".inquiry").removeClass("inquiry");
	});
	$(".inqbtn").on("click",function(){
		$(".inquiry").addClass("inquiry");
	});
});