<div class="hero-section hero-section-small">
</div>
<div class="about-section">
    <div class="container">

        <ul class="nav nav-tabs">
            <li role="presentation" <?php if($_GET['page2'] == 'main'){echo 'class="active"';} ?>><a
                        href="/lesson/login?page2=main">Авторизация</a></li>
            <li role="presentation" <?php if($_GET['page2'] == 'registration'){echo 'class="active"';} ?>><a
                        href="/lesson/login?page2=registration">Регистрация</a></li>
        </ul>
<?php
wtf($_SESSION,1);
?>

        <div class="auth">
            <h1>Регистрация</h1>
            <?php
            if (!empty($login_vk)) { ?>
                <p>
                    Вы еще не были зарегистрированы на нашем сайте, либо Ваш аккаунт ВК не прикреплен к вашему
                    профилю.<br>
                    Зарегистрировать Вас с таким
                    логином?
                    Если он Вам
                    не нравится, можете сменить.<br>
                    Введите, пожалуйста также пароль и e-mail.<br>
                    Если Вы уже регистрировались у нас, то аккаунт ВК Вы сможете прикрепить в своем кабинете. В таком
                    случае <a href="/lesson/login?page2=main">авторизируйтесь</a>.

                </p>
            <?php } ?>

            <?php if(!empty($error)) { ?>
                <div style="font-size:18px; color:#900; font-weight:bold; border:1px solid #CCC; background-color:white; margin:10px;"><?php echo $error; ?></div>
            <?php } ?>
            <?php if(isset($status) && $status == 'ok') { ?>
                <div>Вы успешно зарегистрировались. На ваш почтовый адрес отправлен код подтверждения.</div>
            <?php } else { ?>
                <?php echo $form->view(); ?>
            <?php } ?>
        </div>
    </div>
</div>