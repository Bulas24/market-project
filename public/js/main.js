/*filters*/
$('body').on('change', '.w_sidebar input', function () {
        var checked = $('.w_sidebar input:checked'),
            data = '';
        checked.each(function () {
            data += this.value + ',';
        });
        if (data){
            $.ajax({
                url: location.href,
                data:{filter: data},
                type: 'GET',
                beforeSend: function () {
                    $('.preloader').fadeIn(300, function () {
                        $('.product-one').hide();
                    });
                },
                success: function (res) {
                        $('.preloader').delay(150).fadeOut('slow', function () {
                            $('.product-one').html(res).fadeIn();
                            var url = location.search.replace(/filter(.+?)(&|$)/g, ''); //$2
                            var newURL = location.pathname + url + (location.search ? "&" : "?") + "filter=" + data;
                            newURL = newURL.replace('&&', '&');
                            newURL = newURL.replace('?&', '?');
                            history.pushState({}, '', newURL);
                        });
                },
                error: function () {
                    alert('Ошибка!');
                }
            });
        }else {
            window.location = location.pathname;
        }
});
/*end filters*/

/*search*/
var products = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
        wildcard: '%QUERY',
        url: path + '/search/typeahead?query=%QUERY'
    }
});

products.initialize();

$("#typeahead").typeahead({
    // hint: false,
    highlight: true
},{
    name: 'products',
    display: 'title',
    limit: 10,
    source: products
});

$('#typeahead').bind('typeahead:select', function(ev, suggestion) {
    // console.log(suggestion);
    window.location = path + '/search/?s=' + encodeURIComponent(suggestion.title);
});

/*end search*/

/*cart*/
$('body').on('click', '.add-to-cart-link', function (e) {
    e.preventDefault();
    var id = $(this).data('id'),
        qty = $('.quantity input').val() ? $('.quantity input').val() : 1,
        mod = $('.available select').val();
    $.ajax({
        url: '/cart/add',
        data: {id: id, qty: qty, mod: mod},
        type: 'GET',
        success: function (res) {
                showCart(res);
        },
        error:function () {
            alert('Ошибка! Попробуйте позже');
        }
    });
});

$('#cart .modal-body').on('click', '.del-item', function () {
   var id = $(this).data('id');
    $.ajax({
        url: '/cart/delete',
        data: {id: id},
        type: 'GET',
        success: function (res) {
            showCart(res);
        },
        error:function () {
            alert('Ошибка!');
        }
    });
});

$('#cart .modal-body').on('change', 'input[type="number"]', function () {
    var id = $(this).data('id'),
        qty = $(this).val();
    $.ajax({
        url: '/cart/changeQty',
        data: {id: id, qty: qty},
        type: 'GET',
        success: function (res) {
            showCart(res);
        },
        error:function () {
            alert('Ошибка!');
        }
    });
});

function showCart(cart){
        if ($.trim(cart) == '<h3>Корзина пуста</h3>'){
            $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display', 'none');
        }else {
            $('#cart .modal-footer a, #cart .modal-footer .btn-danger').css('display', 'inline-block');
        }
        $('#cart .modal-body').html(cart);
        $('#cart').modal();
        if ($('.cart-sum').text()){
            $('.simpleCart_total').html($('#cart .cart-sum').text());
        }else {
            $('.simpleCart_total').text('Корзина пуста');
        }
}

function getCart(){
    $.ajax({
        url: '/cart/show',
        type: 'GET',
        success: function (res) {
            showCart(res);
        },
        error:function () {
            alert('Ошибка! Попробуйте позже');
        }
    });
}

function clearCart(){
    $.ajax({
        url: '/cart/clear',
        type: 'GET',
        success: function (res) {
            showCart(res);
        },
        error:function () {
            alert('Ошибка! Попробуйте позже');
        }
    });
}

/*end cart*/
$('#currency').change(function () {
    window.location = 'currency/change?curr=' + $(this).val();
});

$('.available select').on('change', function () {
    var modId = $(this).val(),
        color = $(this).find('option').filter(':selected').data('title'),
        price = $(this).find('option').filter(':selected').data('price'),
        priceold = $(this).find('option').filter(':selected').data('priceold'),
        basePrice = $('#base-price').data('base'),
        basePriceOld = $('#base-price-old').data('baseold');
    if (price){
        $('#base-price').text(symbolLeft + ' ' + price + ' ' + symbolRight);
    }else {
        $('#base-price').text(symbolLeft + ' ' + basePrice + ' ' + symbolRight);
    }

    if (priceold){
        $('#base-price-old').text(symbolLeft + ' ' + priceold + ' ' + symbolRight);
    }else if(price){
        $('#base-price-old').text(' ');
    }else {
        $('#base-price-old').text(symbolLeft + ' ' + basePriceOld + ' ' + symbolRight);
    }

    if (priceold){
        $('#base-price-del').text(symbolLeft + ' ' + priceold + ' ' + symbolRight);
    }else {
        $('#base-price-del').text(' ');
    }

});

// Can also be used with $(document).ready()
$(window).load(function() {
    $('.flexslider').flexslider({
        animation: "fade",
        controlNav: true,
        directionNav: true,
        prevText: "Назад",
        nextText: "Вперед",
        touch: true,
        slideshowSpeed: 3000,
    });
});

$(function() {

    var menu_ul = $('.menu_drop > li > ul'),
        menu_a  = $('.menu_drop > li > a');

    menu_ul.hide();

    menu_a.click(function(e) {
        e.preventDefault();
        if(!$(this).hasClass('active')) {
            menu_a.removeClass('active');
            menu_ul.filter(':visible').slideUp('normal');
            $(this).addClass('active').next().stop(true,true).slideDown('normal');
        } else {
            $(this).removeClass('active');
            $(this).next().stop(true,true).slideUp('normal');
        }
    });

});

// slick this start
$(document).ready(function(){
    $('.slick-product').slick({
        dots: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
        // setting-name: setting-value
    });
});

$(document).ready(function(){
    $('.slick-brands').slick({
        dots: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 3500,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
        // setting-name: setting-value
    });
});

// slick this end

// You can also use "$(window).load(function() {"
$(function () {
    // Slideshow 4
    $("#slider4").responsiveSlides({
        auto: true,
        pager: true,
        nav: true,
        speed: 500,
        namespace: "callbacks",
        before: function () {
            $('.events').append("<li>before event fired.</li>");
        },
        after: function () {
            $('.events').append("<li>after event fired.</li>");
        }
    });

});

