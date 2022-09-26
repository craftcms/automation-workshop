# Apple News Plugin

```shell
git clone https://github.com/craftcms/apple-news.git vendor-local/apple-news
```

```shell
ddev ssh --dir /var/www/html/vendor-local/apple-news

  # Within DDEV container
  composer require "craftcms/ecs:dev-main" "craftcms/phpstan:dev-main" "craftcms/rector:dev-main" --dev
  composer config scripts.fix-cs "ecs check --ansi --fix"
  composer config scripts.check-cs "ecs check --ansi"
  composer config scripts.phpstan "phpstan --memory-limit=1G"
  touch ecs.php
  touch phpstan.neon
  exit
```

`vendor-local/apple-news/phpstan.neon`:

```yaml
includes:
  - vendor/craftcms/phpstan/phpstan.neon

parameters:
  level: 0
  paths:
    - src
```

`vendor-local/apple-news/ecs.php`:

```php
<?php

declare(strict_types=1);

use craft\ecs\SetList;
use Symplify\EasyCodingStandard\Config\ECSConfig;

return static function(ECSConfig $ecsConfig): void {
    $ecsConfig->paths([
        __DIR__ . '/src',
        __FILE__,
    ]);

    $ecsConfig->sets([
        SetList::CRAFT_CMS_4,
    ]);
};
```

## Upgrade

- [https://craftcms.com/knowledge-base/preparing-for-craft-4](https://craftcms.com/knowledge-base/preparing-for-craft-4)
- [https://craftcms.com/docs/4.x/upgrade.html](https://craftcms.com/docs/4.x/upgrade.html)
- [https://craftcms.com/docs/4.x/extend/updating-plugins.html](https://craftcms.com/docs/4.x/extend/updating-plugins.html)
- [Rector Rules for Craft CMS](https://github.com/craftcms/rector)

```shell
ddev ssh --dir /var/www/html/vendor-local/apple-news
    composer update
    composer run phpstan
    composer require craftcms/redactor:* --dev
    composer config version 3.0.0
    composer config prefer-stable true
    composer config minimum-stability dev
    composer update
    vendor/bin/rector process src --config vendor/craftcms/rector/sets/craft-cms-40.php
```

`vendor-local/apple-news/composer.json`:

```
"craftcms/cms": "^4.0.0-alpha"
```

- 👉 _Rerun PhpStorm inspections after running Rector_
- `craft\elements\Asset::getTransformSource()` ➡ `craft\elements\Asset:getImageTransformSourcePath()`️

- [PHPStan](https://phpstan.org)
- [Ignoring Errors](https://phpstan.org/user-guide/ignoring-errors)

## Install Plugin

- [Composer Link](https://github.com/SanderSander/composer-link)

```shell
ddev composer require "craftcms/apple-news:3.0.x-dev"
ddev composer require --dev sandersander/composer-link
ddev composer link './vendor-local/*'
ddev craft plugin/install apple-news
```
