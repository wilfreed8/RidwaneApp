<?php

require __DIR__ . '/../public/index.php';  

$app = require_once __DIR__ . '/../laravel/bootstrap/app.php';

$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);

$request = Illuminate\Http\Request::capture();

$response = tap($kernel->handle($request))->send();

$kernel->terminate($request, $response);