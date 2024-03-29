<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Поиск по запросу "<?=h($query);?>"
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?=ADMIN;?>"><i class="fa fa-dashboard"></i> Главная</a></li>
        <li class="active">Поиск по запросу</li>
    </ol>
</section>

<!-- Main content -->
<?php if (!empty($products)):?>
<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Категория</th>
                                <th>Бренд</th>
                                <th>Наименование</th>
                                <th>Цена</th>
                                <th>Статус</th>
                                <th>Действия</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($products as $product): ?>
                                <tr>
                                    <td><?=$product['id'];?></td>
                                    <td><?=$product['cat'];?></td>
                                    <td><?=$product['brand'];?></td>
                                    <td><?=$product['title'];?></td>
                                    <td><?=$product['price'];?></td>
                                    <td><?=$product['status'] ? 'On' : 'Off';?></td>
                                    <td><a href="<?=ADMIN;?>/product/edit?id=<?=$product['id'];?>"><i class="fa fa-fw fa-edit"></i></a>
                                        <a href="<?=ADMIN;?>/product/delete?id=<?=$product['id'];?>" class="delete"><i class="fa fa-fw fa-remove text-danger"></i></a></td>
                                </tr>
                            <?php endforeach;?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php endif;?>
<!-- /.content -->
