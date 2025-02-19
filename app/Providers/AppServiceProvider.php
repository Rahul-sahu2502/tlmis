<?php

namespace App\Providers;

use App\Models\masters\master_department;
use App\Http\Middleware\ValidateToken;
use Illuminate\Support\ServiceProvider;
use App\Models\file_mgmt;
use App\Models\file_mgmt_uploads;
use App\Models\masters\issuers;
use App\Models\masters\master_issuer_types;
use App\Models\masters\master_doc_types;
use App\Models\tl_review;
use App\Models\tl_review_task_map;
use App\Observers\CommonObserver;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\URL;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        date_default_timezone_set('Asia/Kolkata');

        issuers::observe(CommonObserver::class);
        master_issuer_types::observe(CommonObserver::class);
        master_doc_types::observe(CommonObserver::class);
        file_mgmt::observe(CommonObserver::class);
        file_mgmt_uploads::observe(CommonObserver::class);
        tl_review::observe(CommonObserver::class);
        tl_review_task_map::observe(CommonObserver::class);
        master_department::observe(CommonObserver::class);
        if (config('app.env')!== 'development') {
            URL::forceScheme('https');
        }

        //Register Middleware.
        Route::aliasMiddleware('validate.token', ValidateToken::class);
    }
}
