<?php

use App\Events\NotificationSent;
use App\Http\Controllers\CustomBroadcastController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\PerformanceController;
use App\Services\NotificationService;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\UtilController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\TaskController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Controller;
use App\Http\Controllers\FileMgmtController;
use App\Http\Controllers\MasterController;

require base_path('routes/channels.php');
Route::match(['get', 'post'], 'broadcasting/auth/{userId?}', [CustomBroadcastController::class, 'authenticate']);
Route::get('notifications-test', function () {
    $notification = NotificationService::createNotification(Session::get("user_id"), "Notification", "Login", route('notifications.index'), ['message' => 'You have a new message!']);
    event(new NotificationSent($notification));
});
Route::get('cache_clear', [Controller::class, 'getArtisanCommand']);
Route::get('/', function () {
    return view('welcome');
});
Route::middleware([\App\Http\Middleware\RedirectIfAuthenticated::class])->group(function () {
    Route::match(['get', 'post'], 'sign-in', [AuthController::class, 'signIn'])->name('sign-in');
    Route::post('validate-login', [AuthController::class, 'validatedLogin'])->name('validate-login');
});

Route::get('sign-up', [AuthController::class, 'signUp'])->name('sign-up');
Route::get('forgot-password', [AuthController::class, 'forgotPass'])->name('forgot-password');
Route::get('generate-captcha/{length}', [UtilController::class, 'generateCaptcha'])->name('generate-captcha');
Route::get('logout', [AuthController::class, 'logout'])->name('logout');
//admin routes

Route::middleware([\App\Http\Middleware\AuthenticateUser::class . ':0'])->group(function () {
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('task-view', [DashboardController::class, 'tasksView'])->name('task_view');
    Route::get('task-overview', [DashboardController::class, 'tasksOverView'])->name('task_overview');
    Route::match(['get', 'post'], 'task-add', [DashboardController::class, 'tasksAdd'])->name('task_add');
    Route::match(['get'], 'task-status', [DashboardController::class, 'taskStatus'])->name('task_status');
    Route::match(['get', 'post'], 'task-details', [DashboardController::class, 'taskDetails'])->name('task_details');
    Route::get('get-docs-list', [DashboardController::class, 'getDocsList']);
    Route::get('sb-request-list', [DashboardController::class, 'getSBRequestList'])->name('sb_request_list');
    Route::get('task-allocate', [DashboardController::class, 'taskAllocate'])->name('task_allocate');
    Route::get('task-allocate-list', [DashboardController::class, 'taskAllocateList'])->name('task_allocate_list');
    Route::post('task-view-status-ajax', [DashboardController::class, 'taskViewStatusAjax'])->name('task_view_status_ajax');
    Route::get('offices-task-report', [DashboardController::class, 'officesTaskReport'])->name('offices_task_report');

    Route::match(['post'], 'task-insert', [TaskController::class, 'tasksInsert'])->name('task_insert');
    Route::match(['post'], 'task-reply', [TaskController::class, 'taskReply'])->name('task_reply');
    Route::match(['get', 'post'], 'task-reply-list/{task_id}', [TaskController::class, 'taskReplyList'])->name('task_reply_list');
    Route::match(['get', 'post'], 'task-history', [TaskController::class, 'taskHistory'])->name('task-history');
    Route::match(['get', 'post'], 'task-close', [TaskController::class, 'taskClose'])->name('task_close');
    Route::match(['post'], 'task-update', [TaskController::class, 'tasksUpdate'])->name('task_update');
    Route::match(['get', 'post'], 'task-send-back', [TaskController::class, 'taskSendBack'])->name('task_send_back');
    Route::match(['get', 'post'], 'task-sb-change-status', [TaskController::class, 'taskSBChangeStatus'])->name('task_sb_change_status');
    Route::post('user-task-allocate', [TaskController::class, 'userTaskAllocate'])->name('user_task_allocate');
    Route::post('offices-task-report-ajax', [TaskController::class, 'officesTaskReportAjax'])->name('offices_task_report_ajax');
    Route::post('attach-supporting-docs', [TaskController::class, 'attachSupportingDocs'])->name('attach_supporting_docs');
    Route::post('delete_task_file', [TaskController::class, 'deleteTaskFile'])->name('delete_task_file');
    Route::match(['get', 'post'], 'task-reopen', [TaskController::class, 'taskReopen'])->name('task_reopen');

    //TL Review routes
    Route::get('tl-new', [ReviewController::class, 'index'])->name('tl_new');
    Route::get('tl-view', [ReviewController::class, 'view'])->name('tl_view');
    Route::get('tl-detail', [ReviewController::class, 'detail'])->name('tl_detail');
    Route::get('tl-list', [ReviewController::class, 'list'])->name('tl_list');
    Route::post('tl-save', [ReviewController::class, 'save'])->name('tl_save');
    Route::post('update-status', [ReviewController::class, 'updateStatus'])->name('tl_upstatus');
    Route::post('update-task', [ReviewController::class, 'updateTask'])->name('tl_uptask');
    Route::get('tl-report', [ReviewController::class, 'tlReport'])->name('tl_report');
    Route::get('tl-review-analysis', [ReviewController::class, 'reviewAnalysis'])->name('review_analysis');
    Route::get('tl-dept-analysis', [ReviewController::class, 'deptAnalysis'])->name('dept_analysis');
    Route::get('get-report', [ReviewController::class, 'getReport'])->name('get_report');
    Route::get('get-trends', [ReviewController::class, 'getTrends'])->name('get_trends');

    //Docs routes
    Route::get('master-view/{key}', [MasterController::class, 'view'])->name('master_view');
    Route::get('master-get/{key}', [MasterController::class, 'index'])->name('master_get');
    Route::get('master-edit/{key}/{id}', [MasterController::class, 'edit'])->name('master_edit');
    Route::post('master-store/{key}', [MasterController::class, 'store'])->name('master_store');
    Route::delete('master-destroy/{key}/{id}', [MasterController::class, 'destroy'])->name('master_destroy');

    // Performance routes

    Route::get('performance/delay', [PerformanceController::class, 'delay'])->name('delay');
    Route::get('performance/count-tasks', [PerformanceController::class, 'count_tasks'])->name('count_tasks');
    Route::get('performance/ratings', [PerformanceController::class, 'rating'])->name('rating_page');
    Route::get('performance/give-ratings', [PerformanceController::class, 'give_rating_page'])->name('give_rating_page');

    Route::post('/task_delay_date', [TaskController::class, 'delay_date'])->name('task_delay_date');
    Route::post('/user_count_task', [TaskController::class, 'count_task'])->name('user_count_task');
    Route::post('/user_rating', [TaskController::class, 'show_user_rating'])->name('show_user_rating');
    Route::post('/user_task_rating', [TaskController::class, 'user_task_rating'])->name('user_task_rating');
    Route::post('/user_take_rating', [TaskController::class, 'user_take_rating'])->name('user_take_rating');

    // s3 testing
    // Route::get('/test-s3', [UtilController::class, 'test_s3']);
});

Route::middleware([\App\Http\Middleware\AuthenticateUser::class . ':0_3'])->group(function () {
    Route::match(['get', 'post'], 'change-password', [AuthController::class, 'changePassword'])->name('change-password');
    // typeahead
    Route::get('init-typeahead', [MasterController::class, 'initTypeahead'])->name('init_typeahead');

    Route::get('/notifications', [NotificationController::class, 'index'])->name('notifications.index');
    Route::post('/notifications/{id}/mark-as-read', [NotificationController::class, 'markAsRead'])->name('notifications.markAsRead');
    Route::post('/notifications/{id}/remove-notification', [NotificationController::class, 'remove'])->name('notifications.remove');

    Route::get('docs-list', [FileMgmtController::class, 'list'])->name('docs_list');
    Route::get('docs-get', [FileMgmtController::class, 'get'])->name('docs_get');
    Route::get('docs-add/{id?}', [FileMgmtController::class, 'index'])->name('docs_add');
    Route::post('docs-save', [FileMgmtController::class, 'save'])->name('docs_save');
    Route::put('docs-update/{id}', [FileMgmtController::class, 'update'])->name('docs_update');
    Route::delete('docs-delete/{id}', [FileMgmtController::class, 'delete'])->name('docs_delete');

    Route::get('/create-letter', [\App\Http\Controllers\LettersController::class, 'create_letter']);
    Route::get('/create-letter/{id}', [\App\Http\Controllers\LettersController::class, 'create_letter']);
    Route::post('/submit-letter-detail', [\App\Http\Controllers\LettersController::class, 'submit_letter_detail']);
    Route::get('/created-letters', [\App\Http\Controllers\LettersController::class, 'created_letters']);
    Route::get('/view-letter/{id}', [\App\Http\Controllers\LettersController::class, 'view_letter']);
    Route::get('/print-letter/{id}', [\App\Http\Controllers\LettersController::class, 'print_letter']);
    Route::get('/delete-letter', [\App\Http\Controllers\LettersController::class, 'delete_letter']);

    Route::get('manage-header', [\App\Http\Controllers\LettersController::class, 'manage_header']);
    Route::get('manage-header/{id}', [\App\Http\Controllers\LettersController::class, 'manage_header']);
    Route::post('submit-header-detail', [\App\Http\Controllers\LettersController::class, 'submit_header_detail']);

    Route::get('manage-signatory', [\App\Http\Controllers\LettersController::class, 'manage_signatory']);
    Route::get('manage-signatory/{id}', [\App\Http\Controllers\LettersController::class, 'manage_signatory']);
    Route::post('submit-signatory-detail', [\App\Http\Controllers\LettersController::class, 'submit_signatory_detail']);

    Route::get('change-signatory-status', [\App\Http\Controllers\LettersController::class, 'change_signatory_status']);

    Route::get('/get-prati-detail', [\App\Http\Controllers\LettersController::class, 'get_prati_detail']);
    Route::get('get-header-detail', [\App\Http\Controllers\LettersController::class, 'get_header_detail']);
});

Route::get('getDesignations', [\App\Http\Controllers\MasterController::class, 'getDesignations'])->name('getDesignations');
Route::get('checkOrCreateDesignation', [\App\Http\Controllers\MasterController::class, 'checkOrCreateDesignation'])->name('checkOrCreateDesignation');
Route::get('getDepartments', [\App\Http\Controllers\MasterController::class, 'getDepartments'])->name('getDepartments');

Route::get('language/{locale}', function ($locale) {
    if (!in_array($locale, ['en', 'hi'])) {
        abort(400, 'Invalid locale');
    }

    // Store in session
    Session::put('locale', $locale);

    // Set locale immediately
    App::setLocale($locale);
    config(['app.locale' => $locale]);

    // Debug information
    Log::info('Language switched', [
        'requested_locale' => $locale,
        'session_locale' => Session::get('locale'),
        'app_locale' => App::getLocale(),
        'config_locale' => config('app.locale')
    ]);

    return redirect()->back();
})->name('language');
