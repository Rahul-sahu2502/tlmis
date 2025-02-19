<?php

namespace App\Observers;
use Illuminate\Support\Facades\Session;
class CommonObserver
{
    public function creating($model)
    {
        $model->created_by = Session::get('user_id');
        $model->created_ip = request()->getClientIp();
    }

    public function updating($model)
    {
        $model->updated_by = Session::get('user_id');
        $model->updated_ip = request()->getClientIp();
    }
    
}
