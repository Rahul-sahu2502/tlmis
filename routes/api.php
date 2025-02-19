<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\V1\AuthController;
use App\Http\Controllers\API\V1\DataController;
use App\Http\Controllers\API\V1\ReviewController;
use App\Http\Controllers\API\V1\TaskController;

//Version 1 APIs.
Route::prefix('v1')->name('api.v1.')->group(function () {

    Route::post('send-otp', [AuthController::class, 'sendOTP'])->name('send-otp');
    Route::post('verify-otp', [AuthController::class, 'verifyOTP'])->name('verify-otp');
    Route::get('refresh', [AuthController::class, 'refresh'])->name('refresh');

    //Authenticated routes.
    Route::middleware(['validate.token'])->group(function () {

        Route::get('profile', [AuthController::class, 'profile'])->name('profile');
        Route::post('logout', [AuthController::class, 'logout'])->name('logout');


        Route::get('pre-request', [ReviewController::class, 'pagePreRequest'])->name('pre-request');
        Route::get('dashboard', [DataController::class, 'dashboard'])->name('dashboard');
        //Task APIs.
        Route::prefix('review')->name('review.')->group(function () {

            Route::get('list', [ReviewController::class, 'review_list'])->name('list');
            Route::get('/{review_id}/task/list', [ReviewController::class, 'task_list'])->name('task_list');
        });

        Route::prefix('task')->name('task.')->group(function () {

            Route::post('/remark-update', [TaskController::class, 'remark_update'])->name('remark_update');
            Route::get('/overview', [TaskController::class, 'overview'])->name('overview');
            Route::get('/reply-logs', [TaskController::class, 'reply_logs'])->name('reply_logs');
            Route::post('/reply', [TaskController::class, 'reply'])->name('reply');
            Route::post('/close', [TaskController::class, 'close'])->name('close');
        });
    });

});





