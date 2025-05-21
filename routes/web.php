<?php

use App\Models\User;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    
    $admin = User::create(
       [
    'name' => 'Admin',
    'email' => 'admin@example.com',
    'password' =>'admin',
    'role' => 'admin',
    'is_approved' => true,
       ]
    );
    return $admin ;
});
