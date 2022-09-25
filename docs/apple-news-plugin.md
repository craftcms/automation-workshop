# Apple News Plugin

```shell
git clone https://github.com/craftcms/apple-news.git vendor-local/apple-news
```

```shell
ddev ssh

  # Within DDEV container
  cd vendor-local/apple-news
  composer require --dev "craftcms/ecs:dev-main" "craftcms/phpstan:dev-main" "craftcms/rector:dev-main"
  composer config scripts.fix-cs "ecs check --ansi --fix"
  composer config scripts.check-cs "ecs check --ansi"
  composer config scripts.phpstan "phpstan --memory-limit=1G"
  exit
```

`vendor-local/apple-news/phpstan.neon`

```json
includes:
    - vendor/craftcms/phpstan/phpstan.neon

parameters:
    level: 0
    paths:
        - src
```

## Upgrade

- [https://craftcms.com/knowledge-base/preparing-for-craft-4](https://craftcms.com/knowledge-base/preparing-for-craft-4)
- [https://craftcms.com/docs/4.x/upgrade.html](https://craftcms.com/docs/4.x/upgrade.html)

TODO: ACTUAL UPGRADE

## Link & install

- [Composer Link](https://github.com/SanderSander/composer-link)

```shell
ddev composer require "craftcms/apple-news:3.0.x-dev"
ddev composer require --dev sandersander/composer-link
ddev composer link './vendor-local/*'
ddev craft plugin/install apple-news
```
