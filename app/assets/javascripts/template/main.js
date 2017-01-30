var app = function() {

    $(function() {
        toggleSettings();
        navToggleRight();
        navToggleLeft();
        navToggleSub();
        profileToggle();        
        fullscreenMode();
    });

    var toggleSettings = function() {
        $('.config-link').click(function() {
            if ($(this).hasClass('open')) {
                $('#config').animate({
                    "right": "-205px"
                }, 150);
                $(this).removeClass('open').addClass('closed');
            } else {
                $("#config").animate({
                    "right": "0px"
                }, 150);
                $(this).removeClass('closed').addClass('open');
            }
        });
    };

    var navToggleRight = function() {
        $('#toggle-right').on('click', function() {
            $('#sidebar-right').toggleClass('sidebar-right-open');
            $("#toggle-right .fa").toggleClass("fa-indent fa-dedent");

        });
    };

    var customCheckbox = function() {
        $('input.icheck').iCheck({
            checkboxClass: 'icheckbox_flat-grey',
            radioClass: 'iradio_flat-grey'
        });
    }



    var navToggleLeft = function() {
        $('#toggle-left').on('click', function() {
            var bodyEl = $('#main-wrapper');
            ($(window).width() > 767) ? $(bodyEl).toggleClass('sidebar-mini'): $(bodyEl).toggleClass('sidebar-opened');
        });
    };

    var navToggleSub = function() {
        var subMenu = $('.sidebar .nav');
        $(subMenu).navgoco({
            caretHtml: false,
            accordion: true
        });

    };

    var profileToggle = function() {
        $('#toggle-profile').click(function() {
            $('.sidebar-profile').slideToggle();
        });
    };


    //Sliders
    var sliders = function() {
        $('.slider-span').slider()
    };

    var fullscreenMode = function() {
       $('#toggle-fullscreen.expand').on('click',function(){
        $(document).toggleFullScreen()
        $('#toggle-fullscreen .fa').toggleClass('fa-expand fa-compress');  
       });
    };

}();

