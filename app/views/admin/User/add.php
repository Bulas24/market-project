<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Новый пользователь
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?= ADMIN ?>"><i class="fa fa-dashboard"></i> Главная</a></li>
        <li><a href="<?= ADMIN ?>/user"> Список пользователей</a></li>
        <li class="active">Добавление пользователя</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <form method="post" action="<?=ADMIN;?>/user/add" role="form" data-toggle="validator">
                    <div class="box-body">
                        <div class="form-group has-feedback">
                            <label for="login">Логин</label>
                            <input class="form-control" name="login" id="login" type="text" value="<?= isset($_SESSION['form_data']['login']) ? $_SESSION['form_data']['login'] : '' ?>" required>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="password">Пароль</label>
                            <input class="form-control" name="password" id="password" type="password" data-minlength="6" data-error="Пароль должен включать не менее 6 символов" required>
                            <div class="help-block with-errors"></div>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="name">Имя</label>
                            <input class="form-control" name="name" id="name" type="text" value="<?= isset($_SESSION['form_data']['name']) ? $_SESSION['form_data']['name'] : '' ?>" required>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="name">Телефон</label>
                            <input type="text" name="number" class="form-control" id="number"
                                   value="<?= isset($_SESSION['form_data']['number']) ? $_SESSION['form_data']['number'] : '' ?>"
                                   pattern="^[0-9]{1,}$" data-error="Телефон должен включать 11 чисел" data-minlength="11" maxlength="11" placeholder="8 9XX XXX XXXX" required>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="email">Email</label>
                            <input class="form-control" name="email" id="email" type="email" value="<?= isset($_SESSION['form_data']['email']) ? $_SESSION['form_data']['email'] : '' ?>" required>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>

                        <div class="form-group has-feedback">
                            <label for="address">Адрес</label>
                            <input class="form-control" name="address" id="address" value="<?= isset($_SESSION['form_data']['address']) ? $_SESSION['form_data']['address'] : '' ?>" required>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        </div>
                        <div class="form-group">
                            <label>Роль</label>
                            <select class="form-control" name="role">
                                <option value="user">Пользователь</option>
                                <option value="admin">Администратор</option>
                            </select>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
                <?php if(isset($_SESSION['form_data'])) unset($_SESSION['form_data']); ?>
            </div>
        </div>
    </div>
</section>
<!-- /.content -->
