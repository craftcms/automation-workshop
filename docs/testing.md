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
npx playwright install --with-deps webkit
rm -rf tests-examples
```

Append to `config.use`:

```
browserName: ‘webkit’,
```

```shell
npx playwright codegen --browser webkit applefakenews.com
```

### Add screenshot

```js
  await testInfo.attach(“article”, {
    body: await page.screenshot({ fullPage: true }),
    contentType: “image/png”,
  });
```

Append to `jobs` in `.github/workflows/ci.yml`

```yaml
e2e:
  needs: deploy
  timeout-minutes: 60
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v2
    - uses: actions/setup-node@v2
      with:
        node-version: "16.x"
    - name: Install dependencies
      run: npm ci
    - name: Install Playwright Browsers
      run: npx playwright install --with-deps chromium
    - name: Run Playwright tests
      run: npx playwright test
    - uses: actions/upload-artifact@v2
      if: always()
      with:
        name: playwright-report
        path: playwright-report/
        retention-days: 30
```

### Run tests

```shell
npx playwright test
npx playwright show-report
```
