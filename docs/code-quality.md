# Code Quality

## Bug Fixing

- [Static analysis tools for PHP](https://github.com/exakat/php-static-analysis-tools)
- [PHPStan](https://phpstan.org/)
- [Php Inspections (EA Extended)](https://plugins.jetbrains.com/plugin/7622-php-inspections-ea-extended-)

## Transformers & Parsers

- [Rector](https://getrector.org/)
- [nikic/PHP-Parser](https://github.com/nikic/PHP-Parser/)

## Formatters & Linters

- [Easy Coding Standard (ECS)](https://github.com/symplify/easy-coding-standard)
- [Prettier](https://prettier.io/)

### 4 Noble Truths of Code Style

1. Suffering is an innate characteristic of being a developer
2. TODO
3. TODO
4. 🧘TODO

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
