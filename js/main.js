$(function(){

    $('.menu-btn').click(function(){
        $(this).toggleClass('active');
        $('.menu').toggleClass('active');
    })

    $('.menu__link').click(function(){
        $('.menu').removeClass('active');
        $('.menu-btn').removeClass('active')
    })

    $('.menu, .to-top, .down').on("click","a", function (event) {



        event.preventDefault();


        var id  = $(this).attr('href'),


        top = $(id).offset().top;



        $('body,html').animate({scrollTop: top}, 1500);

    });

    
$(window).scroll(function() {
    if ($(this).scrollTop() > 1){
    $('.header').addClass("sticky");
    }
    else{
    $('.header').removeClass("sticky");
    }
    });
    
    //-------end sticky header--------


});