jQuery(function(){
	var topBtn = jQuery('#pagetop');
    		topBtn.hide(); //最初は非表示
    		jQuery(window).scroll(function() {
			if (jQuery(this).scrollTop() > 100) { //700以上、下にスクロールされた時
				topBtn.fadeIn(""); //表示
			} else { //それ意外は
				topBtn.fadeOut(""); //非表示
		}
	});
});

