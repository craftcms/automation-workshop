# Local Automation

- [Lint Staged](https://github.com/okonet/lint-staged)
- [Husky](https://github.com/typicode/husky)
- [GrumPHP](https://github.com/phpro/grumphp)

```shell
ddev composer require craftcms/ecs:dev-main --dev
ddev composer config scripts.check-cs 'ecs check --ansi'
ddev composer config scripts.fix-cs 'ecs check --ansi --fix'
touch ecs.php

ddev composer require craftcms/phpstan:dev-main --dev
ddev composer config scripts.phpstan 'phpstan --memory-limit=1G'
touch phpstan.neon
```

`ecs.php`:

```php
# TODO: copy/paste
```

`phpstan.neon`:

```php
# TODO: copy/paste
```

```shell
# Try it out
ddev composer run check-cs
ddev composer run phpstan
```

## Husky & Lint Staged

````shell
ddev exec npx husky-init && npm install
ddev exec npm install --save-dev lint-staged
touch .lintstagedrc.json

`.lintstagedrc.json`:

```json
# TODO: copy/paste
````

Edit `.husky/pre-commit`, replacing `npm test` with:

```shell
# TODO: copy/paste
```

If using Tower, set your Git binary to `usr/local/bin/git`:
![Tower's Git binary selection](/automation-workshop/assets/tower-hooks.png)
