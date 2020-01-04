<?php
\FW\User\Authorization::logout();

header("Location: /".$_GET['_module']."/".$_GET['_page']."/?page2=main");
exit;

/*redirect();*/
