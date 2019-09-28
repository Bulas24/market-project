<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Заказ № <?=$order['id'];?>
        <?php if (!$order['status']):?>
            <a href="<?=ADMIN;?>/order/change?id=<?=$order['id'];?>&status=1" class="btn btn-success btn-xs">Выполнить</a>
        <?php else:?>
            <a href="<?=ADMIN;?>/order/change?id=<?=$order['id'];?>&status=0" class="btn btn-default btn-xs">Вернуть в работу</a>
        <?php endif;?>
        <a href="<?=ADMIN;?>/order/delete?id=<?=$order['id'];?>" class="btn btn-danger btn-xs delete">Удалить заказ</a>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?=ADMIN;?>"><i class="fa fa-dashboard"></i> Главная</a></li>
        <li><a href="<?=ADMIN;?>/order">Список заказов</a></li>
        <li class="active">Заказ №<?=$order['id'];?></a></li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tbody>
                                <tr>
                                    <td>Номер заказа</td>
                                    <td><?=$order['id'];?></td>
                                </tr>
                                <tr>
                                    <td>Дата заказа</td>
                                    <td><?=$order['date'];?></td>
                                </tr>
                                <tr>
                                    <td>Дата изменения заказа</td>
                                    <td><?=$order['update_at'];?></td>
                                </tr>
                                <tr>
                                    <td>Количество позиций в заказе</td>
                                    <td><?=count($order_products);?></td>
                                </tr>
                                <tr>
                                    <td>Сумма заказа</td>
                                    <td class="<?=$order['status'] ? 'success' : 'active';?>"><?=$order['sum'];?> <?=$order['currency'];?></td>
                                </tr>
                                <tr>
                                    <td>Статус заказа</td>
                                    <td>
                                        <?//=$order['status'] ? 'Завершен' : 'Новый';?>
                                        <?php
                                        if($order['status'] == '1'){
                                            echo 'Завершен';
                                        }elseif($order['status'] == '2'){
                                            echo 'Оплачен';
                                        }else{
                                            echo 'Новый';
                                        }
                                        ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Имя заказчика</td>
                                    <td><?=$order['name'];?></td>
                                </tr>
                                <tr>
                                    <td>Телефон заказчика</td>
                                    <td><?=$order['number'];?></td>
                                </tr>
                                <tr>
                                    <td>Email заказчика</td>
                                    <td><?=$order['email'];?></td>
                                </tr>
                                <tr>
                                    <td>Комментарий к заказу</td>
                                    <td><?=$order['note'];?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <h3>Детали заказа</h3>
            <div class="box">
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Наименование</th>
                                    <th>Количество</th>
                                    <th>Цена</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $qty = 0; foreach ($order_products as $product):?>
                                <tr>
                                    <td><?=$product->product_id;?></td>
                                    <td><?=$product->title;?></td>
                                    <td><?=$product->qty; $qty += $product->qty;?> </td>
                                    <td><?=$product->price;?> <?=$order['currency'];?></td>
                                    </tr>
                                <?php endforeach;?>
                                    <tr class="active">
                                        <td colspan="2">
                                            <b>Итого:</b>
                                        </td>
                                        <td><b><?=$qty;?></b></td>
                                        <td><b><?=$order['sum'];?> <?=$order['currency'];?></b></td>
                                    </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /.content -->
