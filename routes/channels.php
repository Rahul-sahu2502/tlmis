<?php

use Illuminate\Support\Facades\Broadcast;

// Define the broadcast channel with custom authorization
Broadcast::channel('notifications.{userId}', function ($user, $userId) {
    // Custom check can be added here
    return (int) $user->user_id === (int) $userId;
});
