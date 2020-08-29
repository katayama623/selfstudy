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
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .
//= require turbolinks

  // スクロール可能な要素を判別する関数
function getFirstScrollable(selector){
  var $scrollable;

  $(selector).each(function(){
    var $this = $(this);
    if( $this.scrollTop() > 0 ){
      $scrollable = $this;
      return false;
    }else{
      $this.scrollTop(1);
      if( $this.scrollTop() > 0 ){
        $scrollable = $this;
        return false;
      }
      $this.scrollTop(0);
    }
  });


  return $scrollable;
}

//スムーズスクロール処理を行う関数
function smoozScroll($target){

  if($('body.js_humburgerOpen').length){
    spNavInOut.switch();
  }

  //変数のセッティング
  var $win = $(window),
      $doc = $(document),
      $scrollElement = getFirstScrollable("html,body"),
      mousewheel = "onwheel" in document ? "wheel" : "onmousewheel" in document ? "mousewheel" : "DOMMouseScroll";

    var top;

    // 現在のウィンドウ幅を取得
    var w = $(window).width();

    // $targetが空の場合はキャンセル
    if( $target.size() < 1 ) return false;

    // スクロール先の位置を調整
    top = $target.offset().top;
    top = Math.min(top, $doc.height() - $win.height());

    // スクロール中は手動スクロールをキャンセルする
    $doc.on(mousewheel, function(e){ e.preventDefault(); });

    // 移動先へアニメーションする
    $scrollElement.stop().animate({scrollTop: top - 0}, 600, "linear", function(){
      $doc.off(mousewheel);
    });
};

  $(function(){

    var $win = $(window),
        $doc = $(document);

      //アンカーリンクをクリックした時にアクションを起こす処理
      $doc.on("click", "a[href^=\\#]", function(e){
        /*if($(this).data('option')){
          if($(this).data('option') === "close_selector"){
            $('.js_pullDownParent').removeClass('js_fire');
          }
        }*/
        var $target = $(this.hash),
            top;

        smoozScroll($target);

        return false;
      });
  });


//ハンバーガーメニュー
$(function(){
  $('.el_humburger').on('click',function(){
    spNavInout();
  });
  $('.navigation_item a').on('click',function(){
    spNavInout();
  });
});

//spナビ開く処理

function spNavIn(){
  $('body').removeClass('js_humburgerClose');
  $('body').addClass('js_humburgerOpen');
  $(".uq_spNavi").addClass("js_appear");
  $(".uq_spNavi").css({opacity:0});
  $(".uq_spNavi").animate({
    opacity: 1
  },200);
  scrollBlocker(true);
}

//spナビ閉じる処理
function spNavOut(){
  $(".uq_spNavi").animate({
    opacity: 0
  },200)
  $('body').removeClass('js_humburgerOpen');
  $('body').addClass('js_humburgerClose');
  setTimeout(function(){
    $(".uq_spNavi").removeClass("js_appear");
  },200);
  scrollBlocker(false);
}

//spナビ開閉処理
function spNavInout(){
  if($('body.spNavFreez').length){
    return false;
  }
  if($('body').hasClass('js_humburgerOpen')){
   spNavOut();
  } else {
   spNavIn();
  }
}

//ナビ向けスクロール無効化処理

var scrollBlockerFlag;

function scrollBlocker(flag){
  if(flag){
    scrollpos = $(window).scrollTop();
    $('body').addClass('js_fixed').css({'top': -scrollpos});
    scrollBlockerFlag = true;
  } else {
    $('body').removeClass('js_fixed').css({'top': 0});
    window.scrollTo( 0 , scrollpos );
    scrollBlockerFlag = false;
  }
}