<?php

// See: https://developer.wordpress.org/apis/wp-config-php/

// Login
define('DB_NAME', 'wordpress');
define('DB_USER', 'balls');
define('DB_PASSWORD', 'balls1234');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

// Some security shit
define('AUTH_KEY',         'BruhMoment42');
define('SECURE_AUTH_KEY',  'BruhMoment42');
define('LOGGED_IN_KEY',    'BruhMoment42');
define('NONCE_KEY',        'BruhMoment42');
define('AUTH_SALT',        'BruhMoment42');
define('SECURE_AUTH_SALT', 'BruhMoment42');
define('LOGGED_IN_SALT',   'BruhMoment42');
define('NONCE_SALT',       'BruhMoment42');

// Some fucking weird ass prefix that is missing ?
$table_prefix = 'wp_';

// Misc
define('WP_DEBUG', true);

if (!defined('ABSPATH')) 
	define('ABSPATH', dirname(__FILE__).'/');

require_once(ABSPATH.'wp-settings.php');
