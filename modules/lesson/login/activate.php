<?php
CORE::$META['title'] = 'Активация';
CORE::$META['description'] = 'Выполнение домашних заданий.';
CORE::$META['keywords'] = 'Разработка, сайт, веб-сайт, создание, сопровождение';
CORE::$META['css'] = 'lesson.min.css';

if(isset($_GET['id'], $_GET['hash'])) {
    $regist = new \FW\User\Registration;
    if(!$regist->activate($_GET['id'],$_GET['hash'])) {
        $error = 'Ваш аккаунт уже активирован!';
    }
}
