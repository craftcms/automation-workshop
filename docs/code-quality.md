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

## Craft Code Style

- https://craftcms.com/docs/4.x/extend/coding-guidelines.html
- https://github.com/craftcms/phpstorm-settings

### 4 Noble Truths of Code Style

1. 😧 Suffering is an innate characteristic of writing code
2. 👩‍💻 The cause of this suffering is caring more about your code formatting than the code itself
3. 👐 The end of suffering can be achieved letting go of your code style preferences and focus on what your code is doing
4. 🧘 By embracing automated linters and formatters, you can finally transcend the superficial grip code style. You are an enlightened developer.

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
ddev exec npx prettier --check .
```

No useful output for CI, [yet](https://github.com/prettier/prettier/issues/6885).
