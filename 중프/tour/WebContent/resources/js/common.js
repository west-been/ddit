/********************************FADE**************************/
$(window).on("load", function () {


    $('.outSlide').fadeOut();
    $('.mobileutil').removeClass('on');

    $('html').addClass("start");

    if ($('.subVisual').hasClass('inView')) {
        $('.tourWther').addClass('withView');
    }

    $('.subutil .shre > a').on('click', function () {
        $('.snsgrp').animate({
            width: 'toggle'
        });
    });

    $('.mobControll .mobTop').on('click', function () {
        $('html').stop().animate({
            "scrollTop": 0
        }, 300);
    });

    $('.otherList > button').on('click', function () {
        if ($('.otherList').hasClass('on')) {
            $('.otherList').removeClass('on');
            $('.djList').removeClass('on');
        } else if (!$('.otherList').hasClass('on')) {
            $('.otherList').addClass('on');
            $('.outSlide').fadeIn();
        }

    });



});

$(window).bind('pageshow', function () {

    if (window.outerWidth > 450) {
        if ($('html').scrollTop() > 1) {
            $('header').addClass('on');
        }
    }

});

$(document).ready(function () {

    var $header = $('header');
    var $dep1li = $('.depth1 > li');
    var $dep2 = $('.depth2');
    var $dep2li = $dep2.children('> li');

    $dep1li.on('mouseover', function () {
        $dep2.each(function () {
            var parenLi = $(this).parent('li').position().left;
            var parenLiW = $(this).parent('li').outerWidth() * 0.5;
            $(this).css('left', parenLi + parenLiW + 'px');
        });
    });



    function addOn(a) {
        a.on('mouseover', function () {
            $(this).addClass('on');
        });
        a.on('mouseleave', function () {
            if (window.outerWidth > 450) {
                if ($('html').scrollTop() > 1) {
                    $(this).addClass('on');
                } else {
                    $(this).removeClass('on');
                }
            }
            
        });
    }
    addOn($header);
    $header.on('mouseleave', function () {
        $dep1li.removeClass('on');
        $dep2.hide();
        $('.gnbBg').css('height', '');
    });

    // $dep1li.on('mouseleave', function () {
    //     $dep2.hide();
    //     $(this).removeClass('on');
    // });

    $dep1li.on('mouseover', function () {
        $dep1li.removeClass('on');
        $dep2.hide();
        $(this).addClass('on');
        $(this).find($dep2).show();
        var nowH = $(this).find($dep2).outerHeight();
        $('.gnbBg').css('height', nowH + 'px');
    });

    $(".nav ol li a").each(function (index, item) {
        if (index == '1') {
            var navText = item.innerText;
            $(".depth1 li a span").each(function (index2, item2) {
                var depthText = item2.innerText;
                if (navText == depthText) {
                    $(item2).parent('a').parent('li').addClass("lock");
                }
            });
        }
    });


    $('.hdlang > a').on('click', function () {

        var $langbox = $('.langBox');

        $('.outSlide').fadeIn();
        $langbox.addClass('on');
    });
    $('.langBox ul > li:not(:first-child) > a').on('click', function () {
        $('.langBox').removeClass('on');
        $('.outSlide').fadeOut();
    });

    $('.gnbBtn').on('click', function () {
        $('.allMenu').addClass('on');
        $('body.tourm').addClass('ofx');

        $('#container').css({
            'display': 'none',
            'position': 'absolute',
            'height': '0'
        });
        $('.mainScrlnav').css('display', 'none');
    });
    $('.allopen').on('click', function () {
        $('.allMenu').addClass('allv');

    });
    $('.allclose').on('click', function () {
        $('#container').css({
            'display': 'inline-block',
            'position': '',
            'height': ''
        });
        $('body.tourm').removeClass('ofx');
        $('.mainScrlnav').css('display', 'inline-block');
        $('.allMenu').removeClass('on');

        $('.allMenu').removeClass('allv');
        $('.alldepth1 > li').removeClass('on');
        if (window.outerWidth <= 750) {
            $('.alldepth2').slideUp();
        }
    });
    $('.langOpen').on('click', function () {
        $('.outSlide').fadeIn();
        $('.mobLang').toggleClass('on');
    });


    var $places = $('.placeList > li');
    var $mtrR = $('.mtrResult');
    $places.on('click', function () {
        $mtrR.addClass('open');
    });
    $('.mtropbtn').on('click', function () {
        if ($mtrR.hasClass('open')) {
            $mtrR.removeClass('open');
        } else {
            $mtrR.addClass('open');
        }
    });

    $('.pupClose > a').on('click', function () {
        $('.mainPupWrap').removeClass('on');
    });
    $('.pup-back').on('click', function () {
        $('.mainPupWrap').removeClass('on');
    });

    $('.selecBox .selcbtn').on('click', function () {
        $('.outSlide').fadeIn();
        $(this).siblings('ul').stop().slideToggle();
    });
    $('.selecBoxT .selcbtn').on('click', function () {
        $('.outSlide').fadeIn();
        $(this).siblings('ul').stop().slideToggle();
    });

    $('.dataReqst > ul > li > div').on('mouseover', function () {
        $(this).addClass('on');
    });
    $('.dataReqst > ul > li > div').on('mouseleave', function () {
        $(this).removeClass('on');
    });

    /* 모바일 반응형 gnb */
    $('.utilOpen').on('click', function () {
        $('.mobileutil').toggleClass('on');

    })
    if (window.outerWidth < 750) {
        $('.gnbBtn').addClass('mob');

        $(document).scroll(function () {
            if ($('html').scrollTop() >= 100) {
                // $('.gnbBtn').addClass('mob');
                $('.mobControll').addClass('on');
            } else {
                // $('.gnbBtn').removeClass('mob');
                $('.mobControll').removeClass('on');

            }
        });
        $('.alldepth1 > li').on('click', function () {
            if (!$(this).hasClass('on')) {
                $('.alldepth1 > li').removeClass('on');
                $(this).addClass('on');
                $('.alldepth2').slideUp()
                $(this).children('.alldepth2').slideDown();
            } else {
                $(this).removeClass('on');
                $(this).children('.alldepth2').slideUp();
            }

        });

        $('.hashtab li > a').on('click', function () {

            if ($('.hashtab ul').hasClass('on')) {
                if ($(this).parent('li').hasClass('on')) {
                    $('.hashtab ul').removeClass('on');


                } else if (!$(this).parent('li').hasClass('on')) {
                    $('.hashtab li').removeClass('on');
                    $('.hashtab ul').removeClass('on');
                    $(this).parent('li').addClass('on');

                }

            } else if (!$('.hashtab ul').hasClass('on')) {
                $('.hashtab ul').addClass('on');
                $('.outSlide').fadeIn();
            }
        });
        $('.listTab li').on('click', function () {
            if ($('.listTab ul').hasClass('on')) {
                if ($(this).hasClass('on')) {
                    $('.listTab ul').removeClass('on');

                } else if (!$(this).hasClass('on')) {
                    $('.listTab li').removeClass('on');
                    $('.listTab ul').removeClass('on');
                    $(this).addClass('on');
                }
                fg

            } else if (!$('.listTab ul').hasClass('on')) {
                $('.listTab ul').addClass('on');
            }
        });
    }
    if (window.outerWidth < 1057) {
        $('.djList > button').on('click', function () {
            if ($('.djList').hasClass('on')) {
                $('.djList').removeClass('on');
                $('.otherList').removeClass('on');

            } else {
                $('.djList').addClass('on');
                $('.outSlide').fadeIn();
            }
        });
    }

    if (window.outerWidth <= 800) {
        $('.tabWrapT2 > ul > li').on('click', function () {
            $('.tabWrapT2').addClass('on');
        });
    }
    if (window.outerWidth <= 650) {
        $('.maintourWrap .mtrLeft .placeList li').on('click', function () {
            $('.placeMob').removeClass('on');
            $('.detailSelect').removeClass('on');
            if ($(this).hasClass('on')) {
                $('.placeMob').addClass('on');
            } else if (!$(this).hasClass('on')) {
                $('.placeMob').removeClass('on');
            }

        });
    }
    if (window.outerWidth <= 650) {
        $('.hashtab').addClass('slds');
    }


    $('.outSlide').on('click', function () {
        $('.slds').removeClass('on');
        $('.hashtab > ul').removeClass('on');
        $('.selecBox ul').slideUp();
        $('.selecBoxT ul').slideUp();
        $('.mobLang').removeClass('on');
        $('.langBox').removeClass('on');
        $('.outSlide').fadeOut();
    })


    $('.topBtn').on('click', function () {
        $('html').stop().animate({
            "scrollTop": 0
        }, 300);
    });

    $(document).scroll(function () {
        if ($('html').scrollTop() > 1) {
            $('.topBtn').addClass('on');
        } else {
            $('.topBtn').removeClass('on');

        }
    });

});
