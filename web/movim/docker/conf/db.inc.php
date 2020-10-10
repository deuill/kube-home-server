<?php

$conf = [
    'type'     => getenv('MOVIM_DB_TYPE') ?? 'mysql',
    'database' => getenv('MOVIM_DB_NAME') ?? 'movim',
    'host'     => getenv('MOVIM_DB_HOST') ?? 'localhost',
    'port'     => getenv('MOVIM_DB_PORT') ?? 3306,
    'username' => getenv('MOVIM_DB_USER') ?? 'movim',
    'password' => getenv('MOVIM_DB_PASS') ?? '',
];
