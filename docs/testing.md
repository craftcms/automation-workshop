# Tests

- [Test Pyramid](https://martinfowler.com/bliki/TestPyramid.html)
- [Write tests. Not too many. Mostly integration.](https://kentcdodds.com/blog/write-tests)
- [The Testing Trophy](https://twitter.com/kentcdodds/status/960723172591992832)
- [Pest](https://pestphp.com/)

## Codeception

```shell
ddev mysql -uroot -proot
  create database craft_test;
```

```shell
ddev ssh --dir /var/www/html/vendor-local/apple-news
  git checkout 3.0
  cp .env.example.mysql .env
  composer update
  composer run testunit
```

## Playwright

```shell
ddev npm init playwright@latest

```
