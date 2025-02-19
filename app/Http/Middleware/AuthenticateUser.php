<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Symfony\Component\HttpFoundation\Response;

class AuthenticateUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, String $role): Response
    {
        if (!Session::get('user_id')) {
            return redirect()->route('sign-in'); // or any route where you want to redirect
        }else if (Session::get('is_password_changed') == 0) {
            if (!$request->routeIs('change-password', 'change-password')) {
                return redirect()->route('change-password')->with('error_message', 'You need to change your password before proceeding.');
            }
        }
        elseif ($request->session()->get("user_id")) {
            if (in_array($request->session()->get("role_id"), explode('_', $role))) {
                return $next($request);
            }
            return redirect()->back();
        }
        return $next($request);
    }
}
