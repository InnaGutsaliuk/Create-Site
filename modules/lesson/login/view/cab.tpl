<div class="hero-section hero-section-small">
</div>
<div class="about-section">
    <div class="container">

        <?php if (isset($info)) { ?>
            <span class="h3 warning"><?php echo $info; ?></span>
        <?php } ?>

        <img src="<?php echo $row['avatar'] ?>" class="padding-top-20">
        <form action="" method="post" enctype="multipart/form-data">

            <span class="bold form-text">Логин:</span>
            <input type="text" name="login" class="input-text" value="<?php if(isset($_POST['login'])){echo hc
            ($_POST['login']);}else{echo hc($row['login']);} ?>" disabled><br>
            <?php if (isset($errors['login'])) {
                echo '<span class="text-red bold">'.$errors['login'].'</span>';
            } ?>

            <span class="bold form-text">Новый пароль(если хотите изменить):</span>
            <input type="text" name="password" class="input-text"><br>
            <?php if (isset($errors['password'])) {
                echo '<span class="text-red bold">'.$errors['password'].'</span>';
            } ?>

            <span class="bold form-text">e-mail:</span>
            <input type="text" name="email" class="input-text" value="<?php if(isset($_POST['email'])){echo hc
            ($_POST['email']);}else{echo hc($row['email']);} ?>" disabled><br>
            <?php if (isset($errors['email'])) {
                echo '<span class="text-red bold">'.$errors['email'].'</span>';
            } ?>

            <span class="bold form-text">О себе:</span>
            <input type="text" name="about" class="input-text" value="<?php if(isset($_POST['about'])){echo hc
            ($_POST['about']);}else{echo hc($row['about']);} ?>" disabled><br>
            <?php if (isset($errors['about'])) {
                echo '<span class="text-red bold">'.$errors['about'].'</span>';
            } ?>

            <span class="bold form-text">Вы можете загрузить новую аватарку:</span><br>
            <input type="file" name="file" accept="image/*"><br>
            <?php if (isset($errors['file'])) {
                echo '<span class="text-red bold">'.$errors['file'].'</span>';
            } ?><br>
            <br>

            <?php
                if (!empty($row['id_vk'])) { ?>
                    Аккаунт ВКонтакте прикреплен
                    <a href="/lesson/login?page2=vk_off">Открепить</a>
            <?php    } else { ?>

                    <?php echo '<a class="auth-vk btn" href="http://oauth.vk.com/authorize?' . http_build_query($params) . '">Прикрепить аккаунт ВКонтакте</a>'; ?>

                    <a href="/lesson/login?page2=vk_on">Прикрепить аккаунт ВКонтакте</a>

                    <?php
                }
            ?>

            <input type="submit" name="submit" value="Сохранить" class="black-button goods_button">

        </form>

    </div>
</div>