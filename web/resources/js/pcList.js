/// <reference path="../typings/index.d.ts" />
$(function () {
    // Activate Carousel
    $("#mainImgSlide").carousel({interval: 1000});
    
    // Enable Carousel Indicators
    $(".item1").click(function(){
        $("#mainImgSlide").carousel(0);
    });
    $(".item2").click(function(){
        $("#mainImgSlide").carousel(1);
    });
    $(".item3").click(function(){
        $("#mainImgSlide").carousel(2);
    });
    
    // Enable Carousel Controls
    $(".left").click(function(){
        $("#mainImgSlide").carousel("prev");
    });
    $(".right").click(function(){
        $("#mainImgSlide").carousel("next");
    });
    
    $(".gridView").mouseover(
        function (e) {
            e.preventDefault();
            $(this).fadeOut(50, function () {
                $(this).prop("src", "../ShopImages/gridView_over.jpg");
            }).fadeIn(50);
        }
    );
    $(".gridView").mouseout(
        function (e) {
            e.preventDefault();
            $(this).fadeOut(50, function () {
                $(this).prop("src", "../ShopImages/gridView_out.jpg");
            }).fadeIn(50);
        }
    );
    $(".listView").mouseover(
        function (e) {
            e.preventDefault();
            $(this).fadeOut(50, function () {
                $(this).prop("src", "../ShopImages/listView_over.jpg");
            }).fadeIn(50);
        }
    );
    $(".listView").mouseout(
        function (e) {
            e.preventDefault();
            $(this).fadeOut(50, function () {
                $(this).prop("src", "../ShopImages/listView_out.jpg");
            }).fadeIn(50);
        }
    );

    $(".filter-nav-title").click(function(e) {
        $('.filter-nav-body').addClass('expand');
    });
    /*
    if (menu.is(":visible")) {
        menu.slideUp(400);
        $(this).removeClass("open");
    }
    // otherwise, slide the menu down
    else {
        menu.slideDown(400);
        $(this).addClass("open");
    }*/
});