<?php
    // copy the following to logic/wordpress/wp-config.php
    define('WP_DEBUG', true);
    define('WP_DEBUG_LOG', true);
    define('WP_DEBUG_DISPLAY', false);
    @ini_set('log_errors', 1);
    @ini_set('display_errors', 0);