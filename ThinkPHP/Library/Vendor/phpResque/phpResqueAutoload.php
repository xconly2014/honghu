<?php

function phpResqueAutoload($classname)
{
    Vendor('phpResque.lib.Resque');
    Vendor('phpResque.lib.Resque.Event');
    Vendor('phpResque.lib.Resque.Job');
    //Vendor('phpResque.lib.Resque.Redis');
    require_once "/var/www/html/storeSystem/ThinkPHP/Library/Vendor/phpResque/lib/Resque/Redis.php";
    Vendor('phpResque.vendor.colinmollenhour.credis.Client');
}

if (version_compare(PHP_VERSION, '5.1.2', '>=')) {
    //SPL autoloading was introduced in PHP 5.1.2
    if (version_compare(PHP_VERSION, '5.3.0', '>=')) {
        spl_autoload_register('phpResqueAutoload', true, true);
    } else {
        spl_autoload_register('phpResqueAutoload');
    }
} else {
    /**
     * Fall back to traditional autoload for old PHP versions
     * @param string $classname The name of the class to load
     */
    function __autoload($classname)
    {
        phpResqueAutoload($classname);
    }
}
