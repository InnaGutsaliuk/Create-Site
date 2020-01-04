<?php

namespace FW\User;
use \Core;

/**
 * Class Registration
 * @package FW\Use
 * @author Stanislav Uskov <inpost@list.ru>
 */
class Registration {
    /**
     * @var array - массив ошибок для вывода предупреждений на экран
     */
    public $error = [];
    /**
     * @var int - id пользователя
     */
    public $id = 0;
    /**
     * @var string - генерируемый набор символов для подтверждения регистрации через e-mail
     */
    public $hash = '';

    /**
     * @param array $data
     * @return bool
     *
     * Если e-mail и пароль успешно прошли проверку, данные пользователя вставляются в БД, ему присваивается
     * уникальный hash и функция возвращает true.
     * В противном случае в массив error записывается ошибка и функция возвращает false.
     */
    function registByField($data = []):bool {
        if(empty($data['email']) || !filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
            $this->error['email'] = 'Корректный e-mail является обязательным для регистрации';
            return false;
        }

        if(isset($data['password'])) {
            if(mb_strlen($data['password']) < 7) {
                $this->error['password'] = 'Вы ввели короткий пароль. Минимум 7 символов';
                return false;
            }

            $data['password'] = password_hash($data['password'],PASSWORD_DEFAULT);
        }

        $res = q("
			SELECT 1
			FROM `fw_users`
			WHERE `email` = '".\es($data['email'])."'
		");
        if($res->num_rows) {
            $this->error['email'] = 'E-mail занят';
            return false;
        }

        $insert = [];
        foreach($data as $k=>$v) {
            $insert[] = "`".\es($k)."` = '".\es($v)."'";
        }

        q("
			INSERT INTO `fw_users` SET
			".implode(',',$insert)."
		");
        $this->id = \DB::_()->insert_id;
        $this->hash = md5($this->id.microtime(true).rand(1,1000000).(isset($data['password']) ?? time()));

        q("
			UPDATE `fw_users` SET
			`hash` = '".es($this->hash)."',
			`auth_hash` = '".es($this->hash)."'
			WHERE `id` = ".$this->id."
		");

        return true;

        /* Письма лучше слать уже отдельной функцией, не стоит делать жирные классы!
        // return $this->sendActivate($id,$hash,$data['email']);
        */
    }

    /**
     * @param array $data
     * @param int $id
     * @return bool
     *
     * Функция для редактирования данных пользователя.
     * В случае успешного редактирования возвращает true.
     * Если данные не соответствуют условиям, в массив error записывается ошибка и функция возвращает false.
     */
    function edit(array $data, int $id):bool {
        if(isset($data['id'])) {
            $this->error['form'] = 'Нельзя изменять ID';
            return false;
        }

        if(isset($data['password'])) {
            if(!empty($data['password'])) {
                if(mb_strlen($data['password']) < 7) {
                    $this->error['password'] = 'Вы ввели короткий пароль. Минимум 7 символов';

                    return false;
                }

                $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
            } else {
                unset($data['password']);
            }
        }

        if(isset($data['email'])) {
            if(!filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
                $this->error['email'] = 'Корректный e-mail является обязательным для регистрации';
                return false;
            }

            $res = q("
				SELECT 1
				FROM `fw_users`
				WHERE `email` = '".\es($data['email'])."'
				  AND `id` <> ".(int)$id."
			");
            if($res->num_rows) {
                $this->error['email'] = 'E-mail занят';
                return false;
            }
        }

        $update = [];
        foreach($data as $k=>$v) {
            $update[] = "`".\es($k)."` = '".\es($v)."'";
        }

        q("
			UPDATE `fw_users` SET
			".implode(',',$update)."
			WHERE `id` = ".(int)$id."
		");
        return true;
    }

    /**
     * @param $login
     * @param $password
     * @param $email
     * @return bool
     *
     * Регистрация пользователя.
     * Функция записывает login, password, email и hash в БД и отправляет письмо через функцию sendActivate, которая
     * в случае успеха возвращает true, в обратном случае - false.
     *
     */
    function regist($login,$password,$email) {
        $pass = password_hash($password,PASSWORD_DEFAULT);
        q("
			INSERT INTO `fw_users` SET
			`login` = '".es($login)."',
			`password` = '".es($pass)."',
			`email` = '".es($email)."'
		");
        $id = \DB::_()->insert_id;
        $hash = md5($id.microtime(true).rand(1,1000000).$pass);
        q("
			UPDATE `fw_users` SET
			`hash` = '".es($hash)."'
			WHERE `id` = ".$id."
		");
        return $this->sendActivate($id,$hash,$email);
    }

    /**
     * @param $email
     * @return bool
     * Функция проверяет, активирован ли пользователь с указанным e-mail.
     * Если не активирован, отправляет письмо для завершения регистрации.
     * Если пользователь уже прошел активацию, возвращает false.
     */
    function againActivate($email) {
        $res = q("
			SELECT `id`,`hash`
			FROM `fw_users`
			WHERE `email` = '".es($email)."'
			  AND `access` = 0
			LIMIT 1
		");
        if($res->num_rows) {
            $row = $res->fetch_assoc();
            return $this->sendActivate($row['id'],$row['hash'],$email);
        } else {
            return false;
        }
    }

    /**
     * @param $id
     * @param $hash
     * @param $email
     * @return bool
     * Функция отправки письма дл завершения регистрации.
     */
    function sendActivate($id,$hash,$email) {
        try {
            $mail = new \MailProxy(true);
            $mail->Subject = 'Вы зарегистрировались на сайте '.Core::$DOMAIN;
            $mail->addAddress($email,$email);
            $mail->msgHTML('<div>Вы успешно зарегистрировались на сайте.</div><div>Для завершения регистрации пройдите по ссылке:<br><a href="'.Core::$DOMAIN.'/login/activate/'.$id.'/'.$hash.'">'.Core::$DOMAIN.'/login/activate/'.$id.'/'.$hash.'</a></div>');
            $mail->send();
            unset($mail);
        } catch(\Exception $e) {
            trigger_error('Ошибка регистрации: '. print_r($e,1));
        }
        return true;
    }

    /**
     * @param $id
     * @param $hash
     * @return bool
     * Функция активации пользователя.
     * Вносит в БД данные о том, что пользователь успешно прошел активацию.
     */
    function activate($id,$hash) {
        q("
			UPDATE `fw_users` SET
			`access` = 1
			WHERE `id` = ".(int)$id."
			  AND `access` = 0
			  AND `hash` = '".es($hash)."'
		");
        if(!\DB::_()->affected_rows) {
            return false;
        }
        return true;
    }
}

