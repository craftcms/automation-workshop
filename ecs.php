<?php

declare(strict_types=1);

use craft\ecs\SetList;
use Symplify\EasyCodingStandard\Config\ECSConfig;

return static function(ECSConfig $ecsConfig): void {
    $ecsConfig->paths([
        __DIR__ . '/modules',
        __DIR__ . '/config',
        __DIR__ . '/bootstrap.php',
        __DIR__ . '/web/index.php',
        __FILE__,
    ]);

    $ecsConfig->sets([
        SetList::CRAFT_CMS_4,
    ]);
};
