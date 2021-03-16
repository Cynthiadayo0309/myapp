$(function () {
    const pagetop = $('#pagetop');
    pagetop.hide();

//ボタンは非表示をデフォルトにする

    $(window).scroll(function () {
	    if ($(this).scrollTop() > 150) {
	      pagetop.fadeIn();

//TOPの位置から150pxスクロールするとボタンをフェードインする

	    } else {
	      pagetop.fadeOut();
	    }
    });

//TOPの位置から150px以内に戻るとボタンをフェードアウトする

pagetop.click(function () {
	$('body,html').animate({
	    scrollTop: 0
	}, 800);
	  return false;
  });
});

//ボタンがクリックされたらTOPから0pxの位置までスクロールする
//スクロールの速さは500ミリ秒
