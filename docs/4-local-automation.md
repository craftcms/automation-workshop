# Local Automation

- [Lint Staged](https://github.com/okonet/lint-staged)
- [Husky](https://github.com/typicode/husky)
- [Prettier](https://prettier.io/)

```shell
npm init
npx husky-init && npm install
npm install --save-dev lint-staged
npm install --save-dev --save-exact prettier
echo '{
  "**/*.php": [
    "./vendor/bin/ecs check --ansi --fix",
    "./vendor/bin/phpstan analyse --memory-limit=1G"
  ],
  "*": "prettier --ignore-unknown --write"
}'> .lintstagedrc.json
echo '*.php
composer.lock
web/cpresources/*
storage/*
templates/*
vendor/*
vendor-local/*'> .prettierignore
```

Edit `.husky/pre-commit`, replacing `npm test` with:

```shell
# Add to path for GUIs (Tower, etc.)
PATH="/usr/local/bin:$PATH"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

npx lint-staged
```
