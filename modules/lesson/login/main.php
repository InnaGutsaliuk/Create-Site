<?php
CORE::$META['title'] = 'Авторизация';
CORE::$META['description'] = 'Выполнение домашних заданий.';
CORE::$META['keywords'] = 'Разработка, сайт, веб-сайт, создание, сопровождение';
CORE::$META['css'] = 'lesson.min.css';

if (!isset($_SESSION['user']['login'])) {

    if(isset($_SESSION['user']['id'])) {
        $res = q("
            SELECT `login` FROM `fw_users`
            WHERE id = ".$_SESSION['user']['id']."
            LIMIT 1
        ");

        if ($res -> num_rows) {
            while ($row = $res ->fetch_assoc()) {
                $_SESSION['user']['login'] = $row ['login'];
            }
        }
    } else {

        $form = new \FW\Form\Form('authorization');
        $form->create([
            'login' => [
                'title'=> '',
                'text' => '',
                'attr' => [
                    'placeholder' => 'Логин',
                    'class' => 'form-control',
                ],
                'rules' => [
                    'length' => '5,20',
                ]
            ],
            'password' => [
                'title'=>'',
                'text' => '',
                'type' => 'password',
                'attr' => [
                    'placeholder' => 'Пароль',
                    'class' => 'form-control',
                ],
                'rules' => [
                    'length' => '6,20',
                ]
            ],
            'submit' => [
                'title'=> '',
                'text' => '',
                'value'=> 'Авторизироваться',
                'type' => 'submit',
                'attr' => ['class' => 'btn btn-primary']
            ]
        ]);
        if($form->issend()) {
            $auth = new \FW\User\Authorization;
            $remember = (isset($_POST['checkbox']['remember'])? true : false);
            if($auth->authByLoginPass($_POST['login'],$_POST['password'],true)) {
                $status = 'ok';
                header("Location: /".$_GET['_module']."/".$_GET['_page']."/?page2=main");
                exit;
            } else {
                $status = '';

                foreach($auth->getErrorMess() as $k=>$v) {
                    if(isset($form->content[$k])) {
                        $form->content[$k]['error'] = $v;
                    } else {
                        $status = $v;
                    }
                }
                $form->error = $status;
                $_SESSION['wrong-form']['time'] = time();
                $_SESSION['wrong-form']['key'] = (isset($_SESSION['wrong-form']['key']) ? ($_SESSION['wrong-form']['key']+1) : 1);
            }
        }

        // Параметры приложения. Авторизация через VK.
        $clientId     = '7265264'; // ID приложения
        $redirectUri  = 'https://create-site.by/lesson/login?page2=auth_vk'; // Адрес, на который будет переадресован
        // пользователь
// после прохождения авторизации

// Формируем ссылку для авторизации
        $params = array(
            'client_id'     => $clientId,
            'redirect_uri'  => $redirectUri,
            'response_type' => 'code',
            'v'             => '5.103', // (обязательный параметр) версия API, которую Вы используете https://vk
            //.com/dev/versions
        );
    }
}







