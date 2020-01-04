<!DOCTYPE html>
<html lang="<?php echo Core::$LANGUAGE['lang']; ?>">
<head>
<meta charset="UTF-8">
<?php foreach(Core::$META['dns-prefetch'] as $v) { ?>
<link rel="dns-prefetch" href="<?php echo $v; ?>">
<?php } ?>
<title><?php echo hc(Core::$META['title']); ?></title>
<meta name="apple-mobile-web-app-title" content="<?php echo hc(Core::$META['title']); ?>">
<meta name="description" content="<?php echo hc(Core::$META['description']); ?>">
<meta name="keywords" content="<?php echo hc(Core::$META['keywords']); ?>">
<meta name="author" content="Инна Гуцалюк">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<meta name="robots" content="index, follow">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<?php if(Core::$LANGUAGE['status']) {foreach(Core::$LANGUAGE['allow'] as $v) { if($v != Core::$LANGUAGE['lang']) { ?>
<link rel="alternate" hreflang="<?php echo $v; ?>" href="<?php echo createUrl('this',false,$v); ?>">
<?php } } } ?>
<?php if(!empty(Core::$META['prev'])) { ?>
<link rel="prev" href="<?php echo Core::$META['prev']; ?>">
<?php } ?>
<?php if(!empty(Core::$META['next'])) { ?>
<link rel="next" href="<?php echo Core::$META['next']; ?>">
<?php } ?>
<?php if(!empty(Core::$META['canonical'])) { ?>
<link rel="canonical" href="<?php echo Core::$META['canonical']; ?>">
<?php } ?>
<?php if(!empty(Core::$META['shortlink'])) { ?>
<link rel="shortlink" href="<?php echo Core::$META['shortlink']; ?>">
<?php } ?>

    <!-- ****** favicon ****** -->
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="manifest" href="/site.webmanifest">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">

    <link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="/apple-icon.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

<style><?php include './skins/css/normalize.min.css'; include './skins/css/begin.min.css'; ?></style>
<?php echo Core::$META['head']; ?>

<link rel="stylesheet" href="/skins/components/bootstrap/css/bootstrap.min.css">
<link id="theme-style" rel="stylesheet" href="/skins/css/styles.css">
    <?php if(!empty(Core::$META['css'])) { ?>
        <link rel="stylesheet" href="/skins/css/<?php echo Core::$META['css']; ?>">
    <?php } ?>

<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>

<!-- ******HEADER****** -->
<header id="header" class="header">
    <div class="container">
        <div class="logo">
            <a href="https://create-site.by">
                <span class="logo-icon-wrapper"><img class="logo-icon" src="/skins/img/logo-w.png" alt="icon"></span>
                <span class="text"><span class="highlight">Create</span>-Site</span></a>
        </div><!--//logo-->
        <nav class="main-nav navbar-right">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button><!--//nav-toggle-->
            </div><!--//navbar-header-->
            <div id="navbar-collapse" class="navbar-collapse collapse">

                <ul class="nav navbar-nav">
                    <?php
                    if($_GET['_module'] == 'lesson') { ?>
                        <li class="<?php if($_GET['_page'] == 'main'){echo 'active';} ?> nav-item"><a
                                href="/lesson/main?page2=main">Главная</a></li>
                        <li class="<?php if($_GET['_page'] == 'pets'){echo 'active';} ?> nav-item"><a
                                    href="/lesson/pets?page2=main">Покупка питомца</a></li>
                        <li class="<?php if($_GET['_page'] == 'phpdoc'){echo 'active';} ?> nav-item"><a
                                    href="/lesson/phpdoc?page2=main">phpDoc</a></li>
                        <li class="<?php if($_GET['_page'] == 'login'){echo 'active';} ?> nav-item"><a
                                    href="/lesson/login?page2=main">Авторизация</a></li>
                    <?php } else { ?>
                        <li class="active nav-item"><a class="scrollto" href="#about">О нас</a></li>
                        <li class="nav-item"><a class="scrollto" href="#pricing">Цены</a></li>
                        <li class="nav-item"><a class="scrollto" href="#contact">Контакты</a></li>
                        <li class="nav-item"><a class="scrollto" href="#">Работодателю</a></li>
                        <li class="nav-item"><a href="/lesson/main?page2=main">Курсы</a></li>
                    <?php } ?>
                </ul><!--//nav-->
            </div><!--//navabr-collapse-->
        </nav><!--//main-nav-->
    </div><!--//container-->
</header><!--//header-->

<main>
    <?php echo $content;?>
</main>

<footer class="footer text-center">
    <div class="container">
        <small class="copyright"><a href="https://create-site.by/">Create-Site</a> &copy;
        2019 - <?php echo date('Y'); ?>
        </small>
    </div><!--//container-->
</footer>

<link href="/skins/components/fontawesome-free-5.0.8/web-fonts-with-css/css/fontawesome-all.min.css" rel="stylesheet">
<link href="/skins/css/end.min.css" rel="stylesheet">
<link rel="stylesheet" href="/skins/components/font-awesome/css/font-awesome.css">

<!-- Javascript -->
<script>
    var antixsrf = '<?php echo (isset($_SESSION['antixsrf']) ? $_SESSION['antixsrf'] : 'no'); ?>';
</script>
<script src="/skins/components/node_modules/popper.js/dist/umd/popper.min.js"></script>
<script src="/vendor/schoolphp/library/Core/fw.min.js"></script>
<script src="/skins<?php echo Core::$SKIN;?>/js/scripts.js"></script>

<script src="/skins/components/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/skins/components/bootstrap/js/bootstrap.min.js"></script>
<script src="/skins/components/jquery-scrollTo/jquery.scrollTo.min.js"></script>
<script src="/skins/js/main.min.js"></script>
<?php echo Core::$END; ?>
</body>
</html>