<?php
/*require './'.Core::$CONT.'/'.$_GET['_module'].'/'.$_GET['_page'].'/'.$_GET['authorization'].'.php';
require './'.Core::$CONT.'/'.$_GET['_module'].'/'.$_GET['_page'].'/view/'.$_GET['authorization'].'.tpl';*/


if(!empty(Core::$SITEMAP[$_GET['_module']]['/OPTIONS']['allpages'])) {
    require './'.Core::$CONT.'/'.$_GET['_module'].'/_allpages.php';
}

require './'.Core::$CONT.'/'.$_GET['_module'].'/'.$_GET['_page'].'/'.$_GET['page2'].'.php';

if(!empty(Core::$SITEMAP[$_GET['_module']]['/OPTIONS']['before'])) {
    require './'.Core::$CONT.'/'.$_GET['_module'].'/view'.Core::$SKIN.'/_before.tpl';
}

require './'.Core::$CONT.'/'.$_GET['_module'].'/'.$_GET['_page'].'/view/'.$_GET['page2'].'.tpl';

if(!empty(Core::$SITEMAP[$_GET['_module']]['/OPTIONS']['after'])) {
    require './'.Core::$CONT.'/'.$_GET['_module'].'/view'.Core::$SKIN.'/_after.tpl';
}