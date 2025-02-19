<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Library\ApiResponseHandler;
use App\Models\tbl_secrets;
use App\Models\tbl_users;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    use ApiResponseHandler;

    public function sendOTP(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mobile_number' => 'required|numeric|digits:10',       
        ]);

        if ($validator->fails()) {
            return response()->json($this->basicResponse('failed', $validator->errors()->first()), 200);
        }

        $mobile = $request->input('mobile_number');
        try {
            
            $user = tbl_users::where('mobile', $mobile)->select('user_id', 'mobile', 'is_active')->first();
            if ($user) {
    
                if($user->is_active == 0){
                    throw new \Exception("This user has been blocked!", 1);
                }

                $levelId = $user->userMaps->first()->fk_level_id;
                if($levelId !== 1){
                    throw new \Exception("You are not authorized to login!", 1);
                }

                // $otp = rand(1000, 9999);
                $otp = 123456;
                $secrets = tbl_secrets::where('mobile', $mobile)->whereNull('verified_at')->orderBy('otp_id', 'desc')->first();
                if (!$secrets) {
                    $secrets = new tbl_secrets();
                }

                $secrets->user_id = $user->user_id;
                $secrets->mobile = $mobile;
                $secrets->otp = $otp;
                $secrets->created_at = date('Y-m-d H:i:s');
                $secrets->save();

                //Send otp logic here.
                $hiddenMobile = substr($mobile, -4);
                return response()->json($this->basicResponse('success', "OTP has been sent to XXXXXX$hiddenMobile"), 200);
            }
            throw new \Exception("Mobile number not found", 1);

        } catch (\Exception $th) {
            $message = $th->getCode() == 1 ? $th->getMessage() : 'Failed to send OTP!';
            $message = $th->getMessage();
            return response()->json($this->basicResponse('failed', $message), 200);
        }
    }

    public function verifyOTP(Request $request) {

        $validator = Validator::make($request->all(), [
            'mobile_number' => 'required|numeric|digits:10',      
            'otp' => 'required|numeric|digits:6',      
        ]);

        if ($validator->fails()) {
            return response()->json($this->basicResponse('failed', $validator->errors()->first()), 200);
        }

        $mobile = $request->input('mobile_number');
        $otp = $request->input('otp');

        try {
            
            $secrets = tbl_secrets::where(['mobile' => $mobile, 'otp' => $otp])->whereNull('verified_at')
                                        ->orderBy('created_at', 'desc')->first();
            if ($secrets) {

                if ($secrets->otp == $otp) {

                    // Check if OTP is older than 15 minutes
                    $created_at = Carbon::parse($secrets->created_at);
                    $expires_at = $created_at->addMinutes(15);
                    if (Carbon::now()->greaterThan($expires_at)) {
                        throw new \Exception("Invalid or Expired OTP. Please request a new OTP!", 1);
                    }

                    $secrets->verified_at = date('Y-m-d H:i:s');
                    $secrets->save();

                    $user = tbl_users::where('user_id', $secrets->user_id)->where('is_active', 1)
                                ->select('user_id', 'full_name', 'mobile', 'email', 'username')->first();
                    
                    if(!$user){
                        throw new \Exception("User has been blocked or not found!", 1);
                    }

                    $levelId = $user->userMaps->first()->fk_level_id;
                    if($levelId !== 1){
                        throw new \Exception("You are not authorized to login!", 1);
                    }

                    $token = JWTAuth::fromUser($user);
                    return response()->json(['status' => 'success', 'message' => 'OTP verified successfully.',
                        'token' => $token, 
                        'token_type' => 'Bearer', 
                        'data' => [
                            'user' => $user,
                            'app_base' => [
                                'name' => 'TL-MIS',
                                'logo' => 'https://tlmis.s3.ap-south-1.amazonaws.com/tlmis-logo.png',
                                'base_url' => 'https://tlmis-vectre.blr1.cdn.digitaloceanspaces.com/',
                                'version' => '1.0.0',
                                'api_version' => 'v1',
                                'colors' => [
                                    'primary' => '#0ab39c',
                                    'secondary' => '#405189',
                                    'tertiary' => '#e5e5e5'
                                ],
                            ]
                        ]
                    ], 200);
                }
            }
            throw new \Exception("Invalid or Expired OTP!", 1);

        } catch (\Exception $th) {
            $message = $th->getCode() == 1 ? $th->getMessage() : 'Failed to verify OTP!';
            return response()->json($this->basicResponse('failed', $message), 200);
        }
    }

    public function profile()
    {
        $user = auth('api')->user();
        return response()->json($this->responseWithData('success', 'User retrieved successfully', $user));
    }

    public function refresh()
    {
        $token = JWTAuth::getToken();
        if($token == null){
            return response()->json($this->basicResponse('failed', 'Unauthorized Access!'), 200);
        }
        
        try {
            $newToken = JWTAuth::refresh($token);
            return response()->json($this->responseWithToken('success', 'Token refreshed successfully', $newToken));
        } catch (\Exception $th) {
            return response()->json($this->basicResponse('failed', 'Unauthorized Access!'), 200);
        }
        
    }

    public function logout(Request $request)
    {
        // Attempt to parse the token from the Authorization header
        try {
            // Get the currently authenticated user via the JWT token
            $user = JWTAuth::parseToken()->authenticate();

            // Invalidate the token, logging the user out
            JWTAuth::invalidate(JWTAuth::getToken());

            // Return a response confirming logout
            return response()->json($this->basicResponse('success', 'User logged out successfully.'), 200);
        } catch (\Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json($this->basicResponse('failed', 'Could not log out, please try again later.'), 200);
        }
    }
}
