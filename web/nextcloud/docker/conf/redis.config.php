<?php

if (getenv('REDIS_HOST')) {
    $CONFIG = [
        'memcache.distributed' => '\OC\Memcache\Redis',
        'memcache.locking'     => '\OC\Memcache\Redis',
        'redis' => [
            'host'     => getenv('REDIS_HOST'),
            'password' => getenv('REDIS_HOST_PASSWORD'),
        ],
    ];

    if (getenv('REDIS_HOST_PORT') !== false) {
        $CONFIG['redis']['port'] = (int) getenv('REDIS_HOST_PORT');
    } else if (getenv('REDIS_HOST')[0] !== '/') {
        $CONFIG['redis']['port'] = 6379;
    }
}
