/// <reference path="../typings/index.d.ts" />
$(function() {
	/*
    var wingPosition = parseInt($('.wing-banner').css('top'));
    $(window).scroll(function() {
        var scrollTop = $(window).scrollTop();
        var newWingPosition = scrollTop + wingPosition + "px";
        $(".wing-banner").stop().animate({
            "top" : newWingPosition
        }, 100)
    }).scroll();
    */
	var event = false;
	$('#DetailImgSlide').carousel({
	}).on('mouseover', '.list-group li', function() {
			event = true;
			$('.list-group li').removeClass('active');
			$(this).addClass('active');		
	}).on('slid.bs.carousel', function(e) {
		if(!event) {
			var count = $('.list-group').children().length -1;
			var current = $('.list-group li.active');
			current.removeClass('active').next().addClass('active');
			var id = parseInt(current.data('slide-to'));
			if(count == id) {
				$('.list-group li').first().addClass('active');	
			}
		}
		event = false;
	});
});

