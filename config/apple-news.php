<?php

use craft\helpers\App;

$channels = [];
$channelId = App::env('NEWS_CHANNEL_ID');

if ($channelId) {
    $channels[] = [
        'class' => applenewschannels\AppleFakeNews::class,
        'channelId' => $channelId,
        'apiKeyId' => (string) App::env('NEWS_API_KEY'),
        'apiSecret' => (string) App::env('NEWS_API_SECRET')
    ];
}

return [
    'channels' => $channels,
];
