<?php

namespace App\Http\Controllers;

use App\Models\log_tbl_login;
use App\Models\tbl_users;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    function __construct()
    {
        if (session()->get('user_id') > 0) {
            return redirect()->route('dashboard');
        }
    }

    public function signIn(Request $request)
    {
        //dd((new UtilController())->create_password('tlmis@2024'));
        /*$users = tbl_users::where(['username'=>'123',"is_active"=>1])->firstOrFail();
        $level = $users->level;
        $designation = $users->designation;
        dd($users->username, $users->password, $level->level, $designation->designation);*/
        $title = 'Sign In';
        $data['captcha'] = (new UtilController())->generateCaptcha(4);
        return view('auth.sign_in', $data)->with('title', $title);
    }
    public function validatedLogin(Request $request)
    {
        if ($request->isMethod('post')) {
            $validator = Validator::make(
                $request->all(),
                [
                    'username' => 'required',
                    'password' => 'required',
                    'captcha' => 'required'
                ]
            );
            if ($validator->fails() || $request->captcha !== session('captcha')) {
                $errors = $validator->errors();
                if ($request->input('captcha') !== session('captcha')) {
                    $errors->add('captcha', 'Invalid Captcha');
                }
                return Redirect::back()->withInput()->withErrors($errors);
            } else {
                $password = $request->password;
                $remember = $request->has('remember');
                try {
                    $user = tbl_users::where(['username' => $request->username, 'is_active' => 1])->firstOrFail();
                    $userMap = $user->userMaps()->where('is_active', 1)->firstOrFail();
                    $final_hashed_password = hash('SHA512', $password . $user->salt);
                    if ($final_hashed_password == $user->password) {

                        $depart_id = DB::select("SELECT GROUP_CONCAT(dept_id) dept_id FROM
                        (
                            SELECT DISTINCT(m.fk_dept_id) dept_id FROM tbl_task_user_map m
                            WHERE m.fk_user_id = $user->user_id
                            GROUP BY m.fk_dept_id
                        ) t")[0]->dept_id;

                        // dd($depart_id);
                        $designation = $userMap->designation;
                        // $department = $userMap->department;
                        $level = $userMap->level;
                        $dept_id = 0;
                        if (!empty($depart_id))
                            $dept_id = $depart_id;
                        Auth::login($user, $remember);


                        $slevel_id = 0;
                        $slevel = "O1";
                        $sdesignation_id = 0;
                        $sdesignation = "Operator";

                        if ($user->fk_role_id != 3) {
                            $slevel_id = $level->level_id;
                            $slevel = $level->level;
                            $sdesignation_id = $designation->designation_id;
                            $sdesignation = $designation->designation;
                        }
                        Session::put([
                            'user_id' => $user->user_id,
                            'username' => $user->username,
                            'fullname' => $user->full_name,
                            'is_active' => 1,
                            'level_id' => $slevel_id,
                            'level' => $slevel,
                            'designation_id' => $sdesignation_id,
                            'designation' =>  $sdesignation,
                            'department_id' => $dept_id,
                            'create_by' => $userMap->create_by,
                            'is_password_changed' => $user->is_password_changed,
                            'role_id' => $user->fk_role_id
                        ]);
                        log_tbl_login::create([
                            'fk_user_id' => $user->user_id,
                            'current_status' => "IN",
                            'login_ipaddress' => $request->getClientIp(),
                        ]);
                        if ($user->is_password_changed == 0) {
                            Session::flash('error_message', 'You need to change your password before proceeding.');
                            return redirect()->route('change-password'); // Redirect to change-password route
                        }
                        Session::flash('success_message', 'Welcome back ' . $user->username);
                        if ($user->fk_role_id == 3)
                            return redirect()->route('docs_add');
                        else
                            return redirect()->route('dashboard');
                    } else {
                        Session::flash('error_message', 'User id or password is incorrect!');
                    }
                } catch (ModelNotFoundException $e) {
                    Log::error($e->getMessage());
                    Session::flash('error_message', 'User not found!');
                }
                return redirect()->route('sign-in');
            }
        }
    }
    public function signUp(Request $request)
    {
        $title = 'Sign Up';
        return view('auth.sign_up')->with('title', $title);
    }
    public function forgotPass(Request $request)
    {
        $title = 'Forgot Password';
        return view('auth.forgot_password')->with('title', $title);
    }

    public function logout()
    {
        log_tbl_login::where("fk_user_id", Session::get('user_id'))->update([
            'current_status' => "OUT",
            'logged_out_ipaddress' => request()->getClientIp(),
        ]);
        Session::flush();
        Session::flash('success_message', 'You have been logged out! Visit again.');
        return redirect()->route('sign-in');
    }

    public function changePassword(Request $request)
    {
        $data['title'] = 'Password';
        $data['page_title'] = "Password";
        $data['page_subtitle'] = "Change Password";
        if ($request->isMethod('post')) {
            $validator = Validator::make($request->all(), [
                'current_password' => 'required|string',
                'new_password' => [
                    'required',
                    'string',
                    'min:8'
                ],
                'confirm_new_password' => 'required|same:new_password',
            ], [
                'new_password.regex' => 'Password must include an uppercase letter, a lowercase letter, a number, and a special character.',
                'confirm_new_password.same' => 'Confirm Password must match New Password.',
            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
            }
            if ($request->new_password == $request->confirm_new_password) {
                $password = $request->current_password;
                $user = tbl_users::where(['user_id' => Session::get("user_id"), 'is_active' => 1])->firstOrFail();
                if ($user) {
                    $final_hashed_password = hash('SHA512', $password . $user->salt);
                    if ($final_hashed_password == $user->password) {
                        $auth_keys = (new UtilController())->change_password($request->confirm_new_password);
                        $isUpdated = $user->update([
                            'password' => $auth_keys['hashed_password'],
                            'salt' => $auth_keys['salt'],
                            'update_by' => Session::get("user_id"),
                            'update_ipaddress' => $request->getClientIp(),
                            'is_password_changed' => 1
                        ]);
                        if ($isUpdated) {
                            Session::put('is_password_changed', 1);
                            return response()->json(['success' => true, 'message' => 'Password changed successfully. Please login again to continue.']);
                        } else {
                            return response()->json(['success' => false, 'message' => 'Password could not be changed']);
                        }
                    }
                } else {
                    return response()->json(['success' => false, 'message' => 'User not found']);
                }
            } else {
                return response()->json(['success' => false, 'message' => 'New Password and Confirm New Password do not match.']);
            }
        }
        return view('auth.change_password', $data);
    }
}
