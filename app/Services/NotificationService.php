<?php

namespace App\Services;

use App\Models\tbl_notifications;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class NotificationService
{
    /**
     * Create a new notification.
     *
     * @param int|null $userId User ID to associate the notification with, or null for broadcast notifications.
     * @param string $type Type of the notification.
     * @param array $data Notification data (e.g., message, URL, etc.).
     * @return tbl_notifications|null
     */
    public static function createNotification(?int $userId, string $type, string $module, string $url, array $data): ?tbl_notifications
    {
        if (!env('ENABLE_PUSHER_NOTIFICATIONS', false)) {
            Log::info('Pusher notifications are disabled.');
            return null; // Return null if notifications are disabled
        }
        return tbl_notifications::create([
            'fk_user_id' => $userId,
            'type' => $type,
            'module' => $module,
            'redirect_url' => $url,
            'data' => json_encode($data),
            'is_read' => false,
            'create_ipaddress' => request()->getClientIp(),
            'create_by' => Session::get("user"),
        ]);
    }

    /**
     * Get all notifications for a specific user.
     *
     * @param int $userId
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public static function getUserNotifications(int $userId)
    {
        return tbl_notifications::where('fk_user_id', $userId)
            ->orderBy('create_datetime', 'desc')
            ->get();
    }

    /**
     * Mark a notification as read.
     *
     * @param int $notificationId
     * @return
     */
    public static function markAsRead(int $notificationId)
    {
        $notification = tbl_notifications::find($notificationId);
        if ($notification) {
            return $notification->update(['is_read' => true, 'update_ipaddress' => request()->getClientIp(), 'update_by' => Session::get("user_id")]);
        }
        return false;
    }

    /**
     * Mark all notifications for a user as read.
     *
     * @param int $userId
     * @return void
     */
    public static function markAllAsRead(): void
    {
        tbl_notifications::where('fk_user_id', Session::get("user_id"))->update(['is_read' => 1,
            'update_ipaddress' => request()->getClientIp(), 'update_by' => Session::get("user_id")]);
    }

    public static function removeNotification(int $notificationId){
        $notification = tbl_notifications::find($notificationId);
        if ($notification) {
            return $notification->update(['is_read' => true, 'is_removed' => true,'update_ipaddress' => request()->getClientIp(), 'update_by' => Session::get("user_id")]);
        }
        return false;
    }
}
