<?php

namespace App\Library;

trait ApiResponseHandler
{
    public function basicResponse(string $status, string $message)
    {
        return [
            'status' => $status, // Expected values: 'success' or 'failed'
            'message' => $message,
        ];
    }

    public function responseWithData(string $status, string $message, $data = [])
    {
        return [
            'status' => $status,
            'message' => $message,
            'data' => $data
        ];
    }

    public function responseWithToken(string $status, string $message, ?string $token, $tokenType = 'Bearer')
    {
        return [
            'status' => $status,
            'message' => $message,
            'token' => $token,
            'tokenType' => $tokenType
        ];
    }
}