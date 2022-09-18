<?php

use craft\helpers\App;

return [
    'channels' => [
        [
            'class' => applenewschannels\AppleFakeNews::class,
            'channelId' => App::env('NEWS_CHANNEL_ID'),
            'apiKeyId' => App::env('NEWS_API_KEY'),
            'apiSecret' => App::env('NEWS_API_SECRET')
        ],
    ],
];