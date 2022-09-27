# Debugging

- [bugsnag](https://bugsnag.com)
- [Logtail](https://logtail.com)

```shell
ddev composer require mead-steve/mono-snag
ddev composer require logtail/monolog-logtail
```

`config/app.php`

```php
<?php
use Bugsnag\Shutdown\PhpShutdownStrategy;
use craft\helpers\App;
use craft\log\Dispatcher;
use craft\log\MonologTarget;
use Illuminate\Support\Collection;
use Logtail\Monolog\LogtailHandler;
use MeadSteve\MonoSnag\BugsnagHandler;

return [
    'id' => App::env('CRAFT_APP_ID') ?: 'CraftCMS',
    'modules' => [
        'my-module' => \modules\Module::class,
    ],
    //'bootstrap' => ['my-module'],
    'components' => [
        'log' => static function() {
            $dispatcher = new Dispatcher();
            $bugsnagApiKey = App::env('BUGSNAG_API_KEY');
            $logtailToken = App::env('LOGTAIL_TOKEN');
            $handlers = [];

            if ($bugsnagApiKey) {
                $bugsnagClient = Bugsnag\Client::make($bugsnagApiKey);
                $bugsnagClient->setReleaseStage(App::env('CRAFT_ENVIRONMENT'));
                $shutdownStrategy = new PhpShutdownStrategy();
                $shutdownStrategy->registerShutdownStrategy($bugsnagClient);
                $handlers[] = new BugsnagHandler($bugsnagClient);
            }

            if ($logtailToken) {
                $handlers[] = new LogtailHandler($logtailToken);
            }

            $monologTarget = new MonologTarget([
                'name' => 'monolog',
                'allowLineBreaks' => false,
            ]);
            $monologTarget->getLogger()->setHandlers($handlers);
            $dispatcher->targets = [$monologTarget];

            return $dispatcher;
        },
    ],
];
```

## Add it to the pipeline

Append to `jobs.deploy.steps` in `.github/workflows/ci.yml`:

```yaml
- uses: lhansford/bugsnag-report-build-action@v1.1.0
  name: Report Build to Bugsnag
  with:
    appVersion: ${{ github.event.repository.updated_at }}
    apiKey: ${{ secrets.BUGSNAG_API_KEY }}
```
