# Tests

- [Test Pyramid](https://martinfowler.com/bliki/TestPyramid.html)
- [Write tests. Not too many. Mostly integration.](https://kentcdodds.com/blog/write-tests)
- [The Testing Trophy](https://twitter.com/kentcdodds/status/960723172591992832)
- [Pest](https://pestphp.com/)

## Codeception

```shell
ddev ssh --dir /var/www/html/vendor-local/apple-news
    ddev composer require codeception/codeception:^4.0.0
    ddev composer require codeception/module-asserts:^1.0.0
    ddev composer require codeception/module-datafactory:^1.0.0
    ddev composer require codeception/module-phpbrowser:^1.0.0
    ddev composer require codeception/module-rest:^1.0.0
    ddev composer require codeception/module-yii2:^1.0.0
    ddev composer require vlucas/phpdotenv:^5.4
```

Add to `scripts` in `vendor-local/apple-news/composer.json`:

```
"testunit": [
  "Composer\\Config::disableProcessTimeout",
  "codecept run unit"
]
```
