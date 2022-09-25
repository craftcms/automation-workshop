```shell
git clone https://github.com/craftcms/apple-news.git vendor-local/apple-news
ddev composer link './vendor-local/*'
git -C vendor-local/apple-news checkout 01-start
```

- [https://craftcms.com/knowledge-base/preparing-for-craft-4](https://craftcms.com/knowledge-base/preparing-for-craft-4)
- [https://craftcms.com/docs/4.x/upgrade.html](https://craftcms.com/docs/4.x/upgrade.html)

`phpstan.neon`

```json
includes:
    - vendor/craftcms/phpstan/phpstan.neon

parameters:
    level: 0
    paths:
        - src
```

`composer.json`

```json
"require-dev": {
  "craftcms/ecs": "dev-main",
  "craftcms/phpstan": "dev-main",
  "craftcms/rector": "dev-main"
},
```

```json
"scripts": {
  "check-cs": "ecs check --ansi",
  "fix-cs": "ecs check --ansi --fix",
  "phpstan": "phpstan --memory-limit=1G"
},
```

```json
"scripts": {
  "check-cs": "ecs check --ansi",
  "fix-cs": "ecs check --ansi --fix",
  "phpstan": "phpstan --memory-limit=1G"
},
```
