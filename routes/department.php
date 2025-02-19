<?php

use App\Http\Controllers\DepartmentController;
use Illuminate\Support\Facades\Route;

Route::match(['get', 'post'], 'department', [DepartmentController::class, 'department'])
    ->name('department');
