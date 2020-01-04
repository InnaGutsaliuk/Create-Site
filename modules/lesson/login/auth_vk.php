<?php
if ( isset( $_GET['code'] ) ) {
    $clientId     = '7265264'; // ID приложения
    $clientSecret = '0TywWxuib7vCwnN4LYeJ'; // Защищённый ключ
    $redirectUri  = 'https://create-site.by/lesson/login?page2=auth_vk'; // Адрес, на который будет переадресован

    $params = array(
        'client_id'     => $clientId,
        'client_secret' => $clientSecret,
        'code'          => $_GET['code'],
        'redirect_uri'  => $redirectUri
    );

    if (!$content = @file_get_contents('https://oauth.vk.com/access_token?' . http_build_query($params))) {
        $error = error_get_last();
        throw new Exception('HTTP request failed. Error: ' . $error['message']);
    }

    $response = json_decode($content);

    // Если при получении токена произошла ошибка
    if (isset($response->error)) {
        throw new Exception('При получении токена произошла ошибка. Error: ' . $response->error . '. Error description: ' . $response->error_description);
    }

    $token = $response->access_token; // Токен
    $userId = $response->user_id; // ID авторизовавшегося пользователя

    $res_id_vk = q("
        SELECT `id` FROM `fw_users`
        WHERE `id_vk` = ".$userId."
        LIMIT 1
    ");

    if ($res_id_vk -> num_rows) {
        while ($row = $res_id_vk ->fetch_assoc()) {
            $_SESSION['user']['id'] = $row ['id'];
            $res_id_vk -> close();
            header("Location: /".$_GET['_module']."/".$_GET['_page']."?page2=main");
            exit();
        }
    } else {

        /*Запрашиваем имя и фамилию*/

        $user = [
            'user_ids' => $userId,
            'access_token' => $token,
            'v' => '5.103',
        ];
        $user_content = @file_get_contents('https://api.vk.com/method/users.get?' . http_build_query($user));
        $user_response = json_decode($user_content);

        $first_name = $user_response -> response[0] -> first_name;
        $last_name = $user_response -> response[0] -> last_name;
        $_SESSION['user']['id_vk'] = $user_response -> response[0] -> id;

        $_SESSION['login_vk'] = $first_name.'_'.$last_name;

        header("Location: /".$_GET['_module']."/".$_GET['_page']."?page2=registration");
        exit();

    }

} elseif ( isset( $_GET['error'] ) ) { // Если при авторизации произошла ошибка

    throw new Exception( 'При авторизации произошла ошибка. Error: ' . $_GET['error']
        . '. Error reason: ' . $_GET['error_reason']
        . '. Error description: ' . $_GET['error_description'] );
}