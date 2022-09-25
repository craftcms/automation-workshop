# Debugging

## Bugsnag

`composer.json`

```json
"mead-steve/mono-snag": "^4.1",
```

## Logtail

`composer.json`

```json
"logtail/monolog-logtail": "^0.1.3"
```

`config/app.php`

```php
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
```
