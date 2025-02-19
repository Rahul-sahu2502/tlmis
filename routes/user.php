<?php

use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('view-user', [UserController::class, 'viewUser'])->name('view-user');
Route::match(['get', 'post'], 'add-user', [UserController::class, 'addUser'])->name('add-user');
Route::match(['get', 'post'], 'user-details', [UserController::class, 'userDetails'])->name('user-details');
Route::get('login-log', [UserController::class, 'loginLog'])->name('login-log');
Route::match(['get', 'post'], 'transfer-user', [UserController::class, 'transferUser'])->name('transfer-user');
Route::post('/get-users-by-level', [UserController::class, 'getUsersByLevel'])->name('get-users-by-level');
Route::get('/user-hierarchy', [UserController::class, 'hierarchy'])->name('user_hierarchy');
