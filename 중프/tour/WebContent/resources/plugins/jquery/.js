$(window).on("load", function () {

    $('.mainVisual').owlCarousel({
        loop: true,
        autoplay: true,
        mouseDrag: false,
        touchDrag: false,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        autoplayTimeout: 5500,
        nav: true,
        dots: true,
        items: 1,
        dotsContainer: '.mVdots',
        navContainer: '.mVnav'

    });
    $('.pasuebtn').on('click', function () {
        if ($(this).hasClass('pause')) {

            $(this).removeClass('pause');
            $(this).addClass('playing');
            $('.mainVisual').trigger('stop.owl.autoplay');

        } else if ($(this).hasClass('playing')) {

            $(this).removeClass('playing');
            $(this).addClass('pause');
            $('.mainVisual').trigger('play.owl.autoplay');
        }

    });

    if (outerWidth <= 450) {
        $('.main_slide1').owlCarousel({
            nav: false,
            dots: true,
            loop: false,
            items: 1,
            margin: 22
        });

    }

    // $('.tpB-Slide').owlCarousel({
    //     loop: true,
    //     nav: true,
    //     dots: false,
    //     margin: 20,
    //     navContainer: '.pick-nav',
    //     responsiveBaseElement: 'body',
    //     responsive: {
    //         0: {
    //             items: 1,
    //             dots: true
    //         },
    //         575: {
    //             items: 2,
    //             margin: 0,
    //             nav: false
    //         },
    //         750: {
    //             items: 3

    //         }
    //     }
    // });

    // $('.festSlide').owlCarousel({
    //     loop: true,
    //     nav: true,
    //     dots: false,
    //     margin: 20,
    //     navContainer: '.fest-nav',
    //     responsive: {
    //         0: {
    //             items: 1,
    //             dots: true
    //         },
    //         510: {
    //             items: 2
    //         },
    //         1251: {
    //             items: 3
    //         }
    //     }
    // });

    if (window.outerWidth > 450) {
        

        

        $(document).scroll(function () {
            $("#container > section").each(function (i, e) {
                var sections = $(e);
                var scrlNav = $('.mainScrlnav ol');
                var ti = i + 1;
                if ($('html').scrollTop() + 145 >= sections.offset().top) {

                    scrlNav.find('> li').removeClass('here');
                    scrlNav.find('> li:nth-of-type(' + ti + ')').addClass('here');
                }
            });
            if ($('html').scrollTop() > 1) {
                $('header').addClass('on');
            } else {
                $('header').removeClass('on');

            }

        });

        if ($('html').scrollTop() + 145 >= $('.mainVisualWrap').outerHeight()) {
            $('header').on('mouseleave', function () {
                $('header').addClass('on');
            });
        }

        var scrlNavli = $('.mainScrlnav > ol > li');
        scrlNavli.on('click', function () {
            var navIdx = $(this).index() + 1;
            var idxsec = $('section.mc0' + navIdx).offset().top


            $('html').stop().animate({
                "scrollTop": idxsec - 145
            }, 300);
        });


    }
    if (window.outerWidth <= 450) {
        $(document).scroll(function () {
            if ($('html').scrollTop() > 1) {
                $('header').addClass('on');
            } else {
                $('header').removeClass('on');
            }

        });
    }
    $('.storyLft > li').on('mouseover', function () {
        $('.storyLft > li').removeClass('on');
        $(this).addClass('on');
    });
    $('.storyLft > li').on('mouseleave', function () {
        $('.storyLft > li').removeClass('on');
        $('.storyLft > li.lock').addClass('on');
    });
    $('.storyLft > li').on('click', function () {
        var stryidx = $(this).index();
        $('.storyLft > li').removeClass('on').removeClass('lock');
        $(this).addClass('on').addClass('lock');
        $('.storyRht > li').removeClass('on')
        $('.storyRht > li').eq(stryidx).addClass('on');
    });


    $('.askBttm > ul > li').on('mouseover', function () {
        $('.askBttm > ul > li').removeClass('on');
        $(this).addClass('on');
    });
    $('.askBttm > ul > li').on('mouseleave', function () {
        $('.askBttm > ul > li').removeClass('on');
        $('.askBttm > ul > li.lock').addClass('on');
    });
    $('.askBttm > ul > li').on('click', function () {
        $('.askBttm > ul > li').removeClass('on').removeClass('lock');
        $(this).addClass('on').addClass('lock');
    });


    // if (window.outerWidth >= 1200) {
    //     $('.mainVisual .item').on('mousemove',function(e){
    //         var Xpos = ( e.screenX * 100) / window.screen.width;
    //         var Ypos = ( e.screenY * 100) / window.screen.height;
    //         $('.mainVisual .item').css({
    //             'background-position': Xpos + '% ' + Ypos + '%'
    //         });
    //     });
    // }
});
