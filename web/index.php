<?php
/**
 * Craft web bootstrap file
 */

// Load shared bootstrap
require dirname(__DIR__) . '/bootstrap.php';

if ($cmsLicenseKey = craft\helpers\App::env('LICENSE_KEY')) {
    define('CRAFT_LICENSE_KEY', $cmsLicenseKey);
}

// Load and run Craft
/** @var craft\web\Application $app */
$app = require CRAFT_VENDOR_PATH . '/craftcms/cms/bootstrap/web.php';
$app->run();
