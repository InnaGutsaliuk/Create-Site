<div class="hero-section hero-section-small"></div>

<div class="about-section">
    <div class="container">
        <ul class="nav nav-tabs">
            <li role="presentation" <?php if($_GET['page2'] == 'main'){echo 'class="active"';} ?>><a
                        href="/lesson/login?page2=main">Авторизация</a></li>
            <li role="presentation" <?php if($_GET['page2'] == 'registration'){echo 'class="active"';} ?>><a
                        href="/lesson/login?page2=registration">Регистрация</a></li>
            <li role="presentation" <?php if($_GET['page2'] == 'activate'){echo 'class="active"';} ?>><a
                        href="/lesson/login?page2=activate">Активация</a></li>
        </ul>
        <div class="auth">
            <h1>Активация</h1>
            <?php if(empty($error)) { ?>
                <div>Вы успешно активировали аккаунт, теперь можете авторизироваться.</div>
            <?php } else { ?>
                <div><?php echo $error; ?></div>
            <?php } ?>
        </div>
    </div>
</div>