<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
    <base href="/">
    <?php if (!empty($canonical)) : ?>
        <link rel="canonical" href="<?=$canonical?>" />
    <?php endif;?>
    <link rel="shortcut icon" href="images/star.png" type="image/png" />
    <?=$this->getMeta();?>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--Custom-Theme-files-->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <!--//theme-style-->
    <!--start-menu-->
    <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
    <link href="megamenu/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="megamenu/css/ionicons.min.css">
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

</head>
<body>
<!--top-header-->
<div class="top-header">
    <div class="container">
        <div class="top-header-main">
            <div class="col-md-6 top-header-left">
                <div class="drop">
                    <div class="box">
                        <select id="currency" tabindex="4" class="dropdown">
                           <?php new \app\widgets\currency\Currency();?>
                        </select>
                    </div>
                    <div class="btn-group">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <?php if (!empty($_SESSION['user'])) : ?>
                                <?=h($_SESSION['user']['name']);?>
                            <?php else:?>
                                Кабинет
                            <?php endif;?>
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <?php if (!empty($_SESSION['user'])) : ?>
                                <li><a href="user/cabinet">Личный кабинет</a></li>
                                <li><a href="user/logout">Выход</a></li>
                            <?php else:?>
                                <li><a href="user/login">Вход</a></li>
                                <li><a href="user/signup">Регистрация</a></li>
                            <?php endif;?>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-6 top-header-left">
                <div class="cart box_1">
                            <a href="cart/show" onclick="getCart(); return false;">
                                <div class="total">
                                    <img src="images/cart-2.png" alt="Картинка корзины" />
                                    <?php if (!empty($_SESSION['cart'])):?>
                                        <span class="simpleCart_total"><?=$_SESSION['cart.currency']['symbol_left'].' '.round($_SESSION['cart.sum']).' '.$_SESSION['cart.currency']['symbol_right']?>
                                        </span>
                                    <?php else:?>
                                    <span class="simpleCart_total">Корзина пуста</span>
                                    <?php endif;?>
                                </div>
                            </a>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--top-header-->
<!--start-logo-->
<div class="logo">
    <a href="<?=PATH?>"><h1>Luxury Watches</h1></a>
</div>
<!--start-logo-->
<!--bottom-header-->
<div class="header-bottom">
    <div class="container">
        <div class="header">
            <div class="col-md-9 header-left">

                <div class="menu-container">
                <div class="menu">
                    <?php new \app\widgets\menu\Menu([
                                'tpl' => WWW.'/menu/menu.php',

                         ]);?>
                </div>
                </div>

                <div class="clearfix"> </div>
            </div>
            <div class="col-md-3 header-right">
                <div class="search-bar">
                    <form action="search" method="get" autocomplete="off">
                            <input type="text" class="typeahead" id="typeahead" name="s" placeholder="Поиск">
                            <input type="submit" value="">
                    </form>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!--bottom-header-->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <?php if (isset($_SESSION['error'])): ?>
                    <div class="alert alert-danger">
                        <?php echo $_SESSION['error']; unset($_SESSION['error']);?>
                    </div>
                <?php endif;?>
                <?php if (isset($_SESSION['success'])): ?>
                    <div class="alert alert-success">
                        <?php echo $_SESSION['success']; unset($_SESSION['success']);?>
                    </div>
                <?php endif;?>
            </div>
        </div>
    </div>
    <?=$content;?>
</div>
<!--information-starts-->
<div class="information">

</div>
<!--information-end-->
<!--footer-starts-->
<div class="footer">
    <div class="container">
        <div class="infor-top">
            <div class="col-md-3 infor-left">
                <h3>Всегда на связи</h3>
                <ul>
                    <li><a href="#"><span class="fb"></span><h6>Facebook</h6></a></li>
                    <li><a href="#"><span class="vkn"></span><h6>Vkontakte</h6></a></li>
                    <li><a href="#"><span class="inst"></span><h6>Instagram</h6></a></li>
                </ul>
            </div>
            <div class="col-md-3 infor-left">
                <h3>О нас</h3>
                <ul>
                    <li><a href="#"><p>О компании</p></a></li>
                    <li><a href="#"><p>Гарантия</p></a></li>
                    <li><a href="#"><p>Отзывы</p></a></li>
                    <li><a href="#"><p>Доставка и оплата</p></a></li>
                    <li><a href="#"><p>Контакты</p></a></li>
                </ul>
            </div>
            <div class="col-md-3 infor-left">
                <h3>Мой аккаунт</h3>
                <ul>
                    <li><a href="user/cabinet"><p>Мой аккаунт</p></a></li>
                    <li><a href="user/edit"><p>Мои личные данные</p></a></li>
                    <li><a href="user/orders"><p>Мои заказы</p></a></li>
                    <li><a href="product-all"><p>Мои просмотренные товары</p></a></li>
                </ul>
            </div>
            <div class="col-md-3 infor-left">
                <h3>Контакты</h3>
                <h4>The company name,
                    <span>Lorem ipsum dolor,</span>
                    Glasglow Dr 40 Fe 72.</h4>
                <h5>+955 123 4567</h5>
                <p><a href="mailto:example@email.com">contact@example.com</a></p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--footer-end-->
<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog"
     aria-labelledby="MyModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="MyModalLabel">Корзина</h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default modal-btn" data-dismiss="modal">Продолжить покупки</button>
                <a href="cart/view" type="button" class="btn btn-primary modal-btn">Оформить заказ</a>
                <button type="button" class="btn btn-danger modal-btn" onclick="clearCart()">Очистить корзину</button>
            </div>
        </div>
    </div>
</div>
<div class="preloader"><img src="images/ring.svg" alt="Картинка загрузки"></div>

<?php $curr = \ishop\App::$app->getProperty('currency'); ?>
        <script>
            var path = '<?=PATH;?>',
                course = <?=$curr['value'];?>,
                symbolLeft = '<?=$curr['symbol_left'];?>',
                symbolRight = '<?=$curr['symbol_right'];?>';
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="megamenu/js/megamenu.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/validator.js"></script>
        <!--dropdown-->
        <script src="js/jquery.easydropdown.js"></script>
        <!--Slider-Starts-Here-->
        <script src="js/responsiveslides.min.js"></script>
        <script src="js/typeahead.bundle.js"></script>
<!-- FlexSlider -->
        <script src="js/imagezoom.js"></script>
        <script defer src="js/jquery.flexslider.js"></script>
    <script src="js/jquery.easydropdown.js"></script>
<!--Slick script-->
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
    <script src="js/main.js"></script>
        <!--End-slider-script-->
</body>
</html>
