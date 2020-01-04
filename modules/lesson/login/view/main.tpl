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

    <?php if(!isset($_SESSION['user']['id'])) { ?>
        <div class="auth">
            <h1>Авторизация на сайте</h1>

            <?php if(!empty($form->error)) { ?>
                <div class="alert alert-danger" role="alert"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> <?php echo $form->error; ?></div>
            <?php } ?>
            <?php echo $form->view(); ?>

            <h2>Авторизация через:</h2>
            <?php echo '<a class="auth-vk btn" href="http://oauth.vk.com/authorize?' . http_build_query( $params ) . '">ВКонтакте</a>'; ?>

            <?php } else { ?>
                <div class="h2">Вы авторизированы. Здравствуйте, <?php echo hc($_SESSION['user']['login']); ?>!</div>
                <div class="a-button"><a href="/lesson/login?page2=exit" class="btn btn-success">Выйти</a></div>
                <div class="a-button"><a href="/lesson/login?page2=cab&id=<?=$_SESSION['user']['id']?>" class="btn
                btn-success">Кабинет</a></div>
            <?php } ?>
        </div>
    </div>
</div>
