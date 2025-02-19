<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_users;
use Illuminate\Support\Facades\Session;
use Pusher\Pusher;
use Illuminate\Support\Facades\Auth;

class CustomBroadcastController extends Controller
{
    public function authenticate(Request $request)
    {
        $channelName = $request->input('channel_name');
        $socketId = $request->input('socket_id');  // Get the socket_id from the request
        // Extract user ID from the channel name (e.g., private-notifications.2)
        $matches = explode('.', $channelName);
        if (!isset($matches[1])) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $userId = $matches[1];  // Extract the userId

        // Get the current authenticated user based on session data
        $user = tbl_users::where('user_id', Session::get("user_id"))->first();

        // Ensure that the user is authenticated and the userId matches
        if ($user && (int) $user->user_id === (int) $userId) {

            // Initialize the Pusher instance
            $pusher = new Pusher(
                env('PUSHER_APP_KEY'),
                env('PUSHER_APP_SECRET'),
                env('PUSHER_APP_ID'),
                [
                    'cluster' => env('PUSHER_APP_CLUSTER'),
                    'useTLS' => true
                ]
            );

            // Use Pusher's socket authentication method
            $auth = $pusher->socket_auth($channelName, $socketId);

            return response($auth);
        }

        // If authentication fails, return unauthorized error
        return response()->json(['error' => 'Unauthorized'], 403);
    }
}
