<?php

namespace App\Http\Controllers;

use App\Models\tbl_notifications;
use App\Services\NotificationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class NotificationController extends Controller
{
    public function index()
    {
        $title= "Notifications";
        $page_title= "Notifications";
        $notifications = tbl_notifications::where('fk_user_id', Session::get('user_id'))
            ->where('is_removed', 0)
            ->orderBy('create_datetime', 'desc')->get();

        return view('notifications.notification', compact('notifications','title', 'page_title'));
    }



    public function markAsRead($id)
    {
        if (NotificationService::markAsRead($id)){
            return response()->json([
                'success' => true,
                'message' => 'Notification marked as read successfully!',
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Notification not found.',
            ]);
        }
    }

    public function remove($id)
    {
        if (NotificationService::removeNotification($id)){
            return response()->json([
                'success' => true,
                'message' => 'Notification removed successfully!',
            ]);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Notification not found.',
            ]);
        }
    }
}
