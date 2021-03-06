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

$(document).ready(function () {
  $(".theTarget").skippr({
      // スライドショーの変化 ("fade" or "slide")
      transition : 'fade',
      // 変化に係る時間(ミリ秒)
      speed : 1000,
      // easingの種類
      easing : 'easeOutQuart',
      // ナビゲーションの形("block" or "bubble")
      navType : 'bubble',
      // 子要素の種類("div" or "img")
      childrenElementType : 'div',
      // ナビゲーション矢印の表示(trueで表示)
      arrows : false,
      // スライドショーの自動再生(falseで自動再生なし)
      autoPlay : true,
      // 自動再生時のスライド切替間隔(ミリ秒)
      autoPlayDuration : 5000,
      // キーボードの矢印キーによるスライド送りの設定(trueで有効)
      keyboardOnAlways : true,
      // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
      hidePrevious : false
  });
});

// $(function() {
// 	$('.a').slick({
// 		autoplay:true,
// 		dots:true,
// 	});
// });
// $(function(){
// 	$(".a").slick({
// 		dots: true,
// 	});
// });

//ハンバーガーメニュー
$(function(){
      $(".menu-trigger").on("click",function(){
            $(this).toggleClass("active");
            $("#sp-menu").fadeToggle();
            return false;
      });
});
$(function(){
      function readURL(input){
            if (input.files && input.files[0]){
                  var reader = new FileReader();
                  //html5世代のユーザーのＰＣ内にあるファイルやバッファ上(バッファとは一時的に保存)
                  //のデータに対して読み取りとアクセスが出来る
                  reader.onload = function (e){
                        $("#file_prevew").attr("src",e.target.result);
                        //attrメソッドは引数が一つのときは取得、
                        //２つ引数がある場合は2つ目の引数が変更させる値
                  }
                  reader.readAsDataURL(input.files[0]);
                  //(input.files[0])のdataURLScheme文字列を取得する
                  }
            }
            $("#file_sample").change(function(){
                  readURL(this);
            });
});
// prop,メソッド要素の取得の使い方だが、状態をtrue,falseで押してくれる、あるか、ないかなど
//