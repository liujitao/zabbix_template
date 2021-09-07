<?php
// Zabbix GUI configuration file
global $DB;

$DB['TYPE']     = 'MYSQL';
$DB['SERVER']   = '10.10.2.2';
$DB['PORT']     = '3306';
$DB['DATABASE'] = 'zabbix_server';
$DB['USER']     = 'zabbix_server';
$DB['PASSWORD'] = 'YfRUQ1gO';

// SCHEMA is relevant only for IBM_DB2 database
$DB['SCHEMA'] = '';

$ZBX_SERVER      = '10.10.2.3';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = '10.10.2.3';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;




?>
