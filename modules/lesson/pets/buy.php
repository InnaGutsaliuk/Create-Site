<?php

if (isset($_POST['submit'], $_POST['pet'], $_POST['user'])) {
    $res = q("CALL buyPet('".$_POST['pet']."', '".$_POST['user']."');");
    $mess = $res -> fetch_assoc();
    $_SESSION['mess'] = $mess['result'];
    $res->close();
    unset($_POST);
}
header('Location: /pets');
exit();