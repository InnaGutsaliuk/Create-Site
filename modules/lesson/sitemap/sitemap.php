<?php
return [
    'main' => [
        'main' => [],
    ],
    'pets' => [
        'main' => [],
        'buy' => [],
    ],
    'phpdoc' => [
        'main' => [],
    ],
    'login' => [
        'main' => [
            'link' => 1,
        ],
        'registration' => 1,
        'restoration' => 1,
        'unsubscribe' => 1,
        'exit' => 1,
        'activate' => [
            'id' => [
                'req' => 1,
                'rules' => '[0-9]+',
                'type' => 'int',
            ],
            'hash' => [
                'req' => 1,
            ]
        ],
    ],
    'user' => [
        'authorization' => [],
        'registration' => [],
    ],
    '/OPTIONS' => [
        'controller' => true,
    ],
];


