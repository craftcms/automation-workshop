# Code Quality

## Bug Fixing

- [Static analysis tools for PHP](https://github.com/exakat/php-static-analysis-tools)
- [PHPStan](https://phpstan.org/)
- [Php Inspections (EA Extended)](https://plugins.jetbrains.com/plugin/7622-php-inspections-ea-extended-)

## Formatters & Linters

- [Easy Coding Standard (ECS)](https://github.com/symplify/easy-coding-standard)
- [Prettier](https://prettier.io/)

## Transformers & Parsers

- [Rector](https://getrector.org/)
- [nikic/PHP-Parser](https://github.com/nikic/PHP-Parser/)

## Install Prettier

```shell
ddev exec npm install --save-dev --save-exact prettier
echo '{"singleQuote": true}'> .prettierrc.json
echo '*.php
composer.lock
web/cpresources/*
storage/*
templates/*
vendor/*
vendor-local/*'> .prettierignore

# Try it out
prettier --check .
```
