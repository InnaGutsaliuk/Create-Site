<?php
class MailProxy extends \PHPMailer\PHPMailer\PHPMailer {
	public $freehtml = false;
	public function __construct($exceptions = false) {
		$this->CharSet = 'UTF-8';
		$this->setFrom(\Core::$NOREPLY, \Core::$SITENAME);
		$this->addReplyTo(\Core::$NOREPLY, \Core::$SITENAME);
		return parent::__construct($exceptions);
	}

	public function addReplyTo($address, $name = '') {
		$this->ClearReplyTos();
		return parent::addReplyTo($address, $name);
	}

	public function addAddress($address, $name = '') {
		$res = q("
			SELECT 1
			FROM `fw_unsubscribe`
			WHERE `email` = '".es($address)."'
		");
		if($res->num_rows) {
			if($this->exceptions) {
				throw new phpmailerException('E-mail blocked');
			}
			$this->ErrorInfo = 'E-mail blocked';
			return false;
		}
		return parent::addAddress($address, $name);
	}

	public function msgHTML($message, $basedir = '', $advanced = false) {
		if(empty($this->to[0][0])) {
			if($this->exceptions) {
				throw new phpmailerException('E-mail not insert');
			}
			$this->ErrorInfo = 'E-mail not insert';
			return false;
		}

		$key = time();
		$hash = \myHash($this->to[0][0].preg_replace('#^.{2}(.+).{2}$#u',"\\1",$key));
		$unsubscribe = \Core::$DOMAIN.'/login/unsubscribe?email='.urlencode($this->to[0][0]).'&amp;key='.urlencode($key).'&amp;hash='.urlencode($hash);
		$this->addCustomHeader("List-Unsubscribe",'<mailto:'.\Core::$ADMIN.'>, <'.$unsubscribe.'>');

		if($this->freehtml) {
			$message = '<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>'.$this->Subject.'</title>
</head>
<body style="max-width:600px; margin:auto; font-size:14px; line-height:1.5">
<div role="main">
'.$message.'
</div>
</body>
</html>';
		} else {
			$message = '<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>'.$this->Subject.'</title>
</head>
<body style="max-width:600px; margin:auto; font-size:14px; line-height:1.5;">
<div style="background-color: #E0D3E7; border: 1px solid #6C3A87; border-radius: 5px; max-width: 600px; margin: auto; padding: 5px;">
    <div role="header" style="padding:10px; font-size:16px; text-align: center;">
	    <a href="https://create-site.by/" style="font-size: 28px; text-decoration: none; color: #6C3A87">
	        <img src="https://create-site.by/skins/img/logo-dark-gray.png" width="30" height="30" alt="Create-Site">
	        <span style="font-weight: 600;">Create</span>-Site
	    </a>
    </div>
    <hr>
    <div role="main" style="text-align: center; padding-top: 20px; padding-bottom: 20px;">'.$message.'</div>
    <hr>
    <div role="footer" style="text-align: center;">
        <p>Если вы не хотите получать уведомления с нашего сайта, перейдите по ссылке:<br>
        <a href="'.$unsubscribe.'" target="_blank" 
        style="display: block; 
        width: 170px; 
        height: 25px; 
        background-color: #6C3A87; 
        color: #ffffff; 
        text-align: center;
        margin: 15px auto;
        text-decoration: none;
        padding-top: 5px;
        border-radius: 4px;
        cursor: pointer;">ОТПИСАТЬСЯ</a></p>
        <p>--<br>
            С уважением, '.\Core::$SITENAME.', система рассылки.<br>
            Письмо сгенерировано автоматически, отвечать на него не нужно!
        </p>
    </div>
</div>
    
</body>
</html>';
		}

		return parent::msgHTML($message, $basedir, $advanced);
	}
}
