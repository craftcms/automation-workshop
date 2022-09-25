# Tests

- https://martinfowler.com/bliki/TestPyramid.html
- https://kentcdodds.com/blog/write-tests
- https://twitter.com/kentcdodds/status/960723172591992832

- Don't be like https://news.ycombinator.com/item?id=32883596

## Codeception

`composer.json`

```json
  "codeception/codeception": "^4.0.0",
  "codeception/module-asserts": "^1.0.0",
  "codeception/module-datafactory": "^1.0.0",
  "codeception/module-phpbrowser": "^1.0.0",
  "codeception/module-rest": "^1.0.0",
  "codeception/module-yii2": "^1.0.0",
  "vlucas/phpdotenv": "^5.4"
```

```json
"testunit": [
  "Composer\\Config::disableProcessTimeout",
  "codecept run unit"
]
```