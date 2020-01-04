<?php
CORE::$META['title'] = 'Кабинет пользователя';
CORE::$META['description'] = 'Выполнение домашних заданий.';
CORE::$META['keywords'] = 'Разработка, сайт, веб-сайт, создание, сопровождение';
CORE::$META['css'] = 'lesson.min.css';

if (isset($_SESSION['info'])) {
    $info = $_SESSION['info'];
    unset($_SESSION['info']);
}

$res = q("
    SELECT *
    FROM `fw_users`
    WHERE `id` = ".(int)$_GET['id']."
    LIMIT 1
");
if (!mysqli_num_rows($res)) {
    $_SESSION['info'] = 'Пользователя с такими данными не существует';
} else {
    $_SESSION['info'] = 'Вы вошли в кабинет';
}

$row = mysqli_fetch_assoc($res);
$res->close();

if (isset($_POST['']))

if (isset($_POST['age'], $_POST['submit'])) {
    if (empty($_POST['age'])) {
        $errors['age']='Вы не заполнили поле Возраст!';
    } elseif (($_POST['age'] < 5) || ($_POST['age'] > 120)) {
        $errors['age']='Вам не может быть столько лет!';
    }

    if ($_FILES['file']['error'] != 0) {
        $errors['file'] = 'Ошибка загрузки файла';
    } else {
        if (Uploader::upload($_FILES['file'])) {
            Uploader::resize(100,100, '/uploaded/100x100/');
            $image = Uploader::$nameResize;
        } else {
            $errors['file'] = Uploader::$error;
        }
    }

    if(isset($errors['file'])) {
        if (!empty($row['img'])) {
            $image = $row['img'];
            unset($errors['file']);
        } else {
            $image = '/uploaded/20190809-235917img88074.jpg';
            unset($errors['file']);
        }
    }

    if (!count($errors)) {
        q("
            UPDATE `users` SET
            `age`    = '". es($_POST['age']) ."',
            `avatar` = '".$image."'
			WHERE `id` = '".(int)$_GET['id']."'
            LIMIT 1
        ");
        if (isset($_POST['password'])) {
            if (!empty($_POST['password'])) {
                if (strlen($_POST['password'])<6) {
                    $errors['password'] = 'Пароль должен содержать не менее 6 символов!';
                } elseif (strlen($_POST['password'])>12) {
                    $errors['password'] = 'Пароль должен содержать не более 12 символов!';
                }
            }
            if (!isset($errors['password']) && !empty($_POST['password'])) {
                q("
			    	UPDATE `users` SET
					`password`  = '" . es(myHash($_POST['password'])) . "'
					WHERE `id` = '".(int)$_GET['id']."'
					LIMIT 1
				");
            }
        }

        $_SESSION['info'] = 'Ваш профиль успешно отредактирован!';
        header('Location: /cab/edit&id='.$row['id']);
        exit();
    }
}