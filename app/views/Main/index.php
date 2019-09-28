<!--banner-starts-->
<div class="bnr" id="home">
    <div  id="top" class="callbacks_container">
        <ul class="rslides" id="slider4">
            <li>
                <img src="images/watch-790079_1280.jpg" alt="большое фото часов"/>
            </li>
            <li>
                <img src="images/wrist-watch-573395_1280.jpg" alt="большое фото часов"/>
            </li>
            <li>
                <img src="images/time-3090387_1280.jpg" alt="большое фото часов"/>
            </li>
        </ul>
    </div>
    <div class="clearfix"> </div>
</div>
<!--banner-ends-->

<!--about-starts-->
<?php if ($brands):?>
    <div class="about">
        <div class="container">
            <div class="about-top grid-1">
                <div class="slick-brands">
                    <?php foreach ($brands as $brand): ?>
                        <div class="col-md-4 about-left">
                            <a href="brands/<?=$brand->alias;?>">
                                <figure class="effect-bubba">

                                    <img class="img-responsive" src="images/<?=$brand->img;?>" alt="<?=$brand->alias;?>"/>

                                    <figcaption>
                                        <h2><?=$brand->title;?></h2>
                                        <p><?=$brand->description;?></p>
                                    </figcaption>
                                </figure>
                            </a>
                            <h3 class="text-center"><a href="brands/<?=$brand->alias;?>"><?=$brand->title;?></a></h3>
                        </div>
                    <?php endforeach;?>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
<?php endif;?>
<!--about-end-->
<!--product-starts-->
<?php if ($hits):?>
    <?php $curr = \ishop\App::$app->getProperty('currency');?>
    <div class="product">
        <div class="container">
            <div class="product-top">
                <div class="product-one">
                    <div class="slick-product">
                        <?php foreach ($hits as $hit): ?>
                            <div class="col-md-3 product-left">
                                <div class="product-main simpleCart_shelfItem">
                                    <a href="product/<?=$hit->alias;?>" class="mask"><img class="img-responsive zoom-img" src="images/<?=$hit->img;?>" alt="<?=$hit->title;?>" /></a>
                                    <div class="product-bottom">
                                        <h3><a href="product/<?=$hit->alias;?>"><?=$hit->title;?></a></h3>
                                        <p>Explore Now</p>
                                        <h4>
                                            <a class="add-to-cart-link" href="cart/add?id=<?=$hit->id;?>" data-id="<?=$hit->id;?>"><i></i></a>
                                            <span class=" item_price"><?=$curr['symbol_left'];?> <?=round($hit->price*$curr['value']);?> <?=$curr['symbol_right'];?></span>
                                            <?php if ($hit->old_price): ?>
                                                <small><del><?=$curr['symbol_left'];?> <?=round($hit->old_price*$curr['value']);?> <?=$curr['symbol_right'];?> </del></small>
                                            <?php endif;?>
                                        </h4>
                                    </div>
                                    <?php if ($hit->old_price): ?>
                                        <div class="srch">
                                            <span>-<?=round(($hit->old_price - $hit->price)*100/$hit->old_price);?> %</span>
                                        </div>
                                    <?php endif;?>
                                </div>
                            </div>
                        <?php endforeach;?>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
<?php endif;?>
<!--product-end-->