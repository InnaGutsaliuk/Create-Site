<?php
CORE::$META['title'] = 'Создание сайтов. Разработка сайтов Минск, Беларусь.';
CORE::$META['description'] = 'Разработка сайтов любой сложности. Быстро, качественно, недорого. Доработка, сопровождение и гарантия. Минск и вся Беларусь.';
CORE::$META['keywords'] = 'Разработка, сайт, веб-сайт, создание, сопровождение';

\FW\Pagination\Pagination::$onpage = 2;
\FW\Pagination\Pagination::$curpage = (isset($_GET['page']) ? $_GET['page'] : 1);

$res = \FW\Pagination\Pagination::q("
	SELECT *
	FROM `fw_unsubscribe`
");

if(isset($_POST['name'], $_POST['tel'], $_POST['submit'])) {
    $email = 'innlinag@gmail.com';
    $mail = new \MailProxy(true);
    $mail->Subject = 'Обратный звонок с сайта ' . Core::$DOMAIN;
    $mail->addAddress($email, $email);
    $mail->msgHTML('<div>С сайта create-site.by поступила заявка на обратный звонок. Данные пользователя приведены ниже.</div><div>Имя: ' . $_POST['name'] . '</div><div>Телефон: ' .
        $_POST['tel'] . '</div>');
    $mail->send();
    unset($mail);
    unset($_POST['name']);
    unset($_POST['tel']);
    unset($_POST['submit']);
}
