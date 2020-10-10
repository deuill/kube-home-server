<?php

$AUTOCONFIG = [
    'dbtype'        => getenv('DATABASE_TYPE'),
    'dbhost'        => getenv('DATABASE_HOST'),
    'dbname'        => getenv('DATABASE_NAME'),
    'dbuser'        => getenv('DATABASE_USER'),
    'dbpass'        => getenv('DATABASE_PASSWORD'),
    'dbtableprefix' => getenv('NEXTCLOUD_TABLE_PREFIX') ?: '',
    'directory'     => getenv('NEXTCLOUD_DATA_DIR') ?: '/var/lib/nextcloud/data',
];
