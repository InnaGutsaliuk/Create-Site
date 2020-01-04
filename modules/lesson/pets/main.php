<?php
CORE::$META['title'] = 'Покупка питомца';
CORE::$META['description'] = 'Выполнение домашних заданий.';
CORE::$META['keywords'] = 'Разработка, сайт, веб-сайт, создание, сопровождение';
CORE::$META['css'] = 'lesson.min.css';


$users = q("
    SELECT *
    FROM `users`
");

$pets = q("
    SELECT *
    FROM `pets`
");

$user_pet = q("
    SELECT `users`.`name` AS `user`, GROUP_CONCAT(`pets`.`name` SEPARATOR ', ') AS `pet`
    FROM `users`
    LEFT JOIN `users2pets` ON `users2pets`.`user_id` = `users`.`id`
    LEFT JOIN `pets` ON `pets`.`id` = `users2pets`.`pet_id`
    GROUP BY `users`.`name`
");

