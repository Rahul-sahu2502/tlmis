<?php

namespace App\Events;

use App\Models\tbl_notifications;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;


class NotificationSent implements  ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * Create a new event instance.
     */
    public $notification;

    public function __construct(tbl_notifications $notification)
    {
        $this->notification = $notification;
        Log::info('NotificationSent Event Triggered: ', ['notification' => $this->notification]);
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return array<int, \Illuminate\Broadcasting\Channel>
     */
    public function broadcastOn(): array
    {
        Log::info('NotificationSent Data: ', ['data' => "Channel"]);
        return [
            new PrivateChannel('notifications.' . $this->notification->fk_user_id)
        ];
    }

    public function broadcastWith()
    {
        $data = json_decode($this->notification->data, true);
        Log::info('NotificationSent Data: ', ['data' => $data]);
        return [
            'id' => $this->notification->id,
            'type' => $this->notification->type,
            'module' => $this->notification->module,
            'message' => $data['message'] ?? null,
            'redirect_url' => $this->notification->redirect_url,
            'is_read' => $this->notification->is_read,
            'created_at' => $this->notification->create_datetime,
        ];
    }
}
