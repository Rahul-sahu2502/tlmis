<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Utility\GetDataUtility;
use App\Models\log_tbl_login;
use App\Models\masters\master_designation;
use App\Models\tbl_user_map;
use App\Models\tbl_users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use function Symfony\Component\Clock\now;

class UserController extends Controller
{
    public function hierarchy()
    {
        $title = 'Office hierarchy';
        $page_title = "user_hierarchy";
        $page_subtitle = "";
        $levels = GetDataUtility::getLevels();
        $users = tbl_users::with([
            'userMaps' => function ($query) {
                $query->where('is_active', 1);
                $query->where('fk_level_id', '!=', Session::get("level_id"));
                $query->where('fk_level_id', '>', Session::get('level_id'));
            },
            'userMaps.level',
            'userMaps.designation',
            'userMaps.department'
        ])
            ->where('is_active', 1)
            ->where('user_id', '!=', Session::get('user_id'))
            ->whereHas('userMaps', function ($query) {
                $query->where('is_active', 1);
                $query->where('fk_level_id', '!=', Session::get("level_id"));
                $query->where('fk_level_id', '>', Session::get('level_id'));
            })
            ->get();
        return view('users.hierarchy', compact('title', 'page_title', 'page_subtitle', 'users', 'levels'));
    }
    function viewUser()
    {
        $data['title'] = 'Users';
        $data['page_title'] = "Users";
        $data['page_subtitle'] = "Users List";
        $data['users'] = tbl_users::with([
            'userMaps' => function ($query) {
                $query->where('is_active', 1);
                $query->where('fk_level_id', '!=', Session::get("level_id"));
                $query->where('fk_level_id', '>', Session::get('level_id'));
            },
            'userMaps.level',
            'userMaps.designation',
            'userMaps.department'
        ])
            ->where('is_active', 1)
            ->where('user_id', '!=', Session::get('user_id'))
            ->whereHas('userMaps', function ($query) {
                $query->where('is_active', 1);
                $query->where('fk_level_id', '!=', Session::get("level_id"));
                $query->where('fk_level_id', '>', Session::get('level_id'));
            })
            ->get();
        return view('users.list', $data);
    }

    function addUser(Request $request)
    {
        $data['title'] = 'Users';
        $data['page_title'] = "Users";
        $data['page_subtitle'] = "Add User";
        $data['levels'] = GetDataUtility::getLevels();
        $data['departments'] = GetDataUtility::getDepartments();
        $data['designations'] = GetDataUtility::getDesignations();
        //$data['sections'] = GetDataUtility::getSections();
        $data["user_id"] = 0;
        $data["users"] = "";
        if (isset($request->id) && !empty($request->id) && is_numeric(base64_decode(urldecode($request->id)))) {
            $data['title'] = 'Users';
            $data['page_title'] = "Users";
            $data['page_subtitle'] = "Update User";
            $data["user_id"] = base64_decode(urldecode($request->id));
            $data['users'] = tbl_users::with([
                'userMaps' => function ($query) {
                    $query->where('is_active', 1);
                },
                'userMaps.level',
                'userMaps.designation',
                'userMaps.department',
            ])
                ->where('is_active', 1)
                ->where('user_id', base64_decode(urldecode($request->id)))
                ->first();
            //dd($data['users']->userMaps);
        }

        if ($request->isMethod('post')) {
            $validator = Validator::make($request->all(), [
                'fk_level_id' => 'required|integer',
                'designation' => 'required|string|max:255',
                'fk_department_id' => 'required|array',
                'full_name' => 'required|string|max:255',
                'mobile' => 'required|digits:10|numeric',
                'email' => 'nullable|email'
            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
            }
            $fk_designation_id = 0;
            $designation = $request->designation;
            $existingDesignation = master_designation::where('designation', $designation)->first();
            if ($existingDesignation) {
                $fk_designation_id = $existingDesignation->designation_id;
            } else {
                $newDesignation = master_designation::create([
                    'designation' => $designation,
                    'is_active' => 1
                ]);
                $fk_designation_id = $newDesignation->designation_id;
            }

            $pass_keys = (new UtilController())->create_password('tlmis@2024');
            if (
                tbl_users::where('mobile', $request->mobile)
                    ->when($request->existing_user_id > 0, function ($query) use ($request) {
                        return $query->where('user_id', '!=', $request->existing_user_id);
                    })
                    ->exists()
            ) {
                return response()->json(['success' => false, 'message' => 'User with this mobile number already exists']);
            }

            if ($request->has('email') && !empty($request->email)) {
                if (
                    tbl_users::where('email', $request->email)
                        ->when($request->existing_user_id > 0, function ($query) use ($request) {
                            return $query->where('user_id', '!=', $request->existing_user_id);
                        })
                        ->exists()
                ) {
                    return response()->json(['success' => false, 'message' => 'User with this email address already exists']);
                }
            }
            if ($request->existing_user_id > 0) {
                DB::beginTransaction();
                try {
                    // Update tbl_users
                    $user = tbl_users::where('user_id', $request->existing_user_id)->first();
                    if ($user) {
                        DB::enableQueryLog();
                        $user->update([
                            'full_name' => $request->full_name,
                            'mobile' => $request->mobile,
                            'email' => $request->email,
                            //'is_active' => 1
                        ]);
                        // Update tbl_user_map
                        $userMap = tbl_user_map::where('fk_user_id', $request->existing_user_id)->first();
                        if ($userMap) {
                            if ($request->has('fk_department_id') && is_array($request->fk_department_id)) {
                                $existingDepartmentIds = tbl_user_map::where('fk_user_id', $user->user_id)->where('is_active', 1)
                                    ->pluck('fk_department_id')
                                    ->toArray();

                                // Get new section IDs from the request
                                $newDepartmentIds = $request->fk_department_id;

                                // Determine sections to delete
                                $departmentsToDelete = array_diff($existingDepartmentIds, $newDepartmentIds);
                                $departmentsToAdd = array_diff($newDepartmentIds, $existingDepartmentIds);


                                // Handle sections to delete
                                if (!empty($departmentsToDelete)) {
                                    foreach ($departmentsToDelete as $departmentId) {
                                        $resultMapped = DB::select('SELECT * FROM tbl_task_user_map WHERE fk_user_id = ? AND fk_dept_id = ?', [
                                            $user->user_id,
                                            $departmentId
                                        ]);

                                        if (count($resultMapped) > 0) {
                                            $skippedDepartments[] = $departmentId;
                                        } else {
                                            tbl_user_map::where('fk_user_id', $user->user_id)->where('fk_department_id', $departmentId)->where('is_active', 1)->delete();
                                        }
                                    }
                                }
                                foreach ($newDepartmentIds as $departmentIdNew) {
                                    if (!in_array($departmentIdNew, $existingDepartmentIds)) {
                                        tbl_user_map::create([
                                            'fk_user_id' => $user->user_id,
                                            'fk_level_id' => $request->fk_level_id,
                                            'fk_designation_id' => $fk_designation_id,
                                            'fk_department_id' => $departmentIdNew,
                                            'is_active' => 1,
                                            'create_by' => Session::get('user_id'),
                                            'create_ipaddress' => $request->getClientIp()
                                        ]);
                                    }
                                }
                                tbl_user_map::where('fk_user_id', $user->user_id)->update([
                                    'fk_designation_id' => $fk_designation_id,
                                    'fk_level_id' => $request->fk_level_id,
                                    'update_by' => Session::get('user_id'),
                                    'update_ipaddress' => $request->getClientIp()
                                ]);
                            }
                        } else {
                            DB::rollback();
                            return response()->json(['success' => false, 'message' => 'User mapping not found']);
                        }

                        DB::commit();
                        if (!empty($skippedDepartments)) {
                            return response()->json([
                                'success' => true,
                                'message' => 'User updated successfully.',
                                'skipped_offices' => $skippedDepartments
                            ]);
                        } else {
                            return response()->json(['success' => true, 'message' => 'User updated successfully']);
                        }
                    } else {
                        DB::rollback();
                        return response()->json(['success' => false, 'message' => 'User not found']);
                    }
                } catch
                (\Exception $e) {
                    DB::rollback();
                    return response()->json(['success' => false, 'message' => 'Failed to update user: ' . $e->getMessage()]);
                }
            }
            if ($request->existing_user_id == 0) {
                DB::beginTransaction();
                try {
                    $user = tbl_users::create([
                        'full_name' => $request->full_name,
                        'mobile' => $request->mobile,
                        'email' => $request->email,
                        //'username' => $request->mobile,
                        'password' => $pass_keys['hashed_password'],
                        'salt' => $pass_keys['salt'],
                        'is_active' => 1
                    ]);
                    $user->username = 'TL-' . config('custom.for_user_creation') . '-' . str_pad($user->user_id, 5, '0', STR_PAD_LEFT); // Pads the ID to 5 digits
                    $user->save();

                    if ($user) {
                        if ($request->has('fk_department_id') && is_array($request->fk_department_id)) {
                            foreach ($request->fk_department_id as $departmentId) {
                                tbl_user_map::create([
                                    'fk_user_id' => $user->user_id,
                                    'fk_level_id' => $request->fk_level_id,
                                    'fk_designation_id' => $fk_designation_id,
                                    'fk_department_id' => $departmentId,
                                    'is_active' => 1,
                                    'create_by' => Session::get('user_id'),
                                    'create_ipaddress' => $request->getClientIp()
                                ]);
                            }
                        }
                        DB::commit();
                        return response()->json(['success' => true, 'message' => 'User added successfully']);
                    }
                } catch (\Exception $e) {
                    DB::rollBack();
                    Log::error('Error adding user: ' . $e->getMessage());
                    return response()->json(['success' => false, 'message' => 'An error occurred. Please try again.'], 500);
                }
            }

        }
        /*  if ((Session::get('level_id') == 1 && !empty(Session::get('department_id'))) ||
              (Session::get('level_id') == 2 && !empty(Session::get('department_id')))) {
              return view('users.add-with-section', $data);
          } else {*/
        return view('users.add', $data);
        // }
    }

    function loginLog(Request $request)
    {
        $data['title'] = 'Users Log';
        $data['page_title'] = "login_log";
        $data['page_subtitle'] = "Login Log";
        $data['loginRecords'] = log_tbl_login::with(
            [
                'relatedUser.userMaps.department', // Ensure the department relationship is loaded
                'relatedUser.levels',
                'relatedUser.designations'
            ]
        )
            ->whereHas('relatedUser.userMaps', function ($query) {
                $query->where('fk_level_id', '!=', Session::get("level_id"));
                $query->where('is_active', '=', 1);
                $query->where('fk_level_id', '>', Session::get('level_id'));
            })->get();

        return view('users.login-log', $data);
    }

    public function getUsersByLevel(Request $request)
    {
        $levelId = $request->input('level_id');

        // Fetch users based on the level
        $users = tbl_users::with([
            'userMaps' => function ($query) {
                $query->where('is_active', 1)
                    ->with(['department', 'designation']);
            }
        ])->whereHas('userMaps', function ($query) use ($levelId) {
            $query->where('fk_level_id', $levelId)
                ->where('is_active', 1);
        })->get();

        $data = $users->map(function ($user) {
            $existingDetails = $user->userMaps->filter(function ($map) {
                return $map->is_active == 1 && !empty($map->department) && !empty($map->designation);
            });

            return [
                'user_id' => $user->user_id,
                'full_name' => $user->full_name,
                'departments' => $existingDetails->map(function ($map) {
                    return $map->department->department_eng . ' (' . $map->department->department_hin . ')';
                })->implode(', '),
                'department_ids' => $existingDetails->map(function ($map) {
                    return $map->department->dept_id;
                })->implode(','),
                'designation_ids' => $existingDetails->first()?->designation->designation_id,
                'designations' => $existingDetails->map(function ($map) {
                    return $map->designation->designation_eng . ' (' . $map->designation->designation_hin . ')';
                })->implode(', '),
            ];
        });

        return response()->json(['users' => $data]);
    }


    function transferUser(Request $request)
    {
        $data['title'] = 'Transfer User';
        $data['page_title'] = "transfer_user";
        $data['page_subtitle'] = "Transfer User";
        $data['departments'] = GetDataUtility::getDepartments();
        DB::enableQueryLog();
        $data['levels'] = GetDataUtility::getLevels();
        $data['users'] = tbl_users::with([
            'userMaps' => function ($query) {
                $query->whereIn('is_active', [0, 1]);
                $query->where('fk_level_id', '!=', Session::get("level_id"));
                $query->where('fk_level_id', '>', Session::get('level_id'));
            },
            'userMaps.level',
            'userMaps.designation',
            'userMaps.department'
        ])
            ->where('is_active', 1)
            ->where('user_id', '!=', Session::get('user_id'))
            ->whereHas('userMaps', function ($query) {
                $query->whereIn('is_active', [0, 1]);
                $query->where('fk_level_id', '!=', Session::get("level_id"));
                $query->where('fk_level_id', '>', Session::get('level_id'));
                //$query->where('fk_level_id', Session::get('level_id')+1);
            })
            ->get();

        if ($request->isMethod('post')) {
            $validator = Validator::make($request->all(), [
                'fk_user_id' => 'required|string|max:255',
                'fk_department_id' => 'required|array',
            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
            }
            $existingDepartmentIds = tbl_user_map::where('fk_user_id', $request->fk_user_id)->where('is_active', '1')
                ->pluck('fk_department_id')
                ->toArray();
            $newDepartmentIds = $request->fk_department_id;
            $departmentsToDelete = array_diff($existingDepartmentIds, $newDepartmentIds);
            $departmentsToAdd = array_diff($newDepartmentIds, $existingDepartmentIds);
            try {
                DB::beginTransaction();
                if (!empty($departmentsToDelete)) {
                    foreach ($departmentsToDelete as $departmentId) {
                        tbl_user_map::where('fk_user_id', $request->fk_user_id)->where('fk_department_id', $departmentId)->where('is_active', '1')->update(['is_active' => 0]);
                    }
                }
                foreach ($newDepartmentIds as $departmentIdNew) {
                    if (!in_array($departmentIdNew, $existingDepartmentIds)) {
                        tbl_user_map::create([
                            'fk_user_id' => $request->fk_user_id,
                            'fk_level_id' => $request->fk_level_id,
                            'fk_designation_id' => $request->fk_designation_id,
                            'fk_department_id' => $departmentIdNew,
                            'is_active' => 1,
                            'create_by' => Session::get('user_id'),
                            'create_ipaddress' => $request->getClientIp()
                        ]);
                    }
                }
                DB::commit();
                return response()->json(['success' => true, 'message' => 'User Transfer Successful.']);
            } catch (\Exception $e) {
                DB::rollBack();
                Log::error('Error adding user: ' . $e->getMessage());
                return response()->json(['success' => false, 'message' => 'An error occurred. Please try again.'], 500);
            }
        }

        return view('users.transfer-user', $data);
    }

    public function addRating(Request $request)
    {
        // Validate request data
        $validator = Validator::make($request->all(), [
            'final_rating' => 'required|numeric|min:1|max:5',
            'user_map_id' => 'required|integer|exists:tbl_task_user_map,map_id'
        ]);

        // If validation fails, return errors
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Validation failed',
                'errors' => $validator->errors()
            ], 422);
        }

        // Check if rating already exists for this map_id
        $existingRating = DB::table('tbl_users_rating')
            ->where('fk_tu_map_id', $request->user_map_id)
            ->exists();

        if ($existingRating) {
            return response()->json([
                'status' => 'error',
                'message' => 'Rating already submitted for this user.',
            ], 409); // HTTP 409 Conflict
        }

        // Prepare data for insertion
        $data = [
            'rating' => $request->final_rating,
            'fk_tu_map_id' => $request->user_map_id,
            'created_at' => now(),
            'created_ip' => $request->ip()
        ];

        try {
            // Insert rating into database
            DB::table('tbl_users_rating')->insert($data);

            return response()->json([
                'status' => 'success',
                'message' => 'Rating inserted successfully',
                'data' => $data
            ], 201);
        } catch (\Exception $e) {
            // Log the error for debugging
            Log::error('Error inserting rating: ' . $e->getMessage());

            return response()->json([
                'status' => 'error',
                'message' => 'Failed to insert rating. Please try again later.'
            ], 500);
        }
    }


    // this function is use for direct input the rating 5, check the condition that the task is completed or not if completed then check that there is no delay.
    public function directEntry()
    {
        $data = DB::select("SELECT 
                                        tr.created_by AS user_id, 
                                        tr.fk_task_id AS task_id, 
                                        tr.created_datetime AS last_comment, 
                                        tbl1.due_date AS due_date,
                                        tbl1.status AS status
                                    FROM tbl_task_reply_trs tr
                                    JOIN tbl_task tbl1 
                                       ON tr.fk_task_id = tbl1.task_id
                                    WHERE tbl1.status = 'C'
                                    AND tr.created_datetime = (
                                       SELECT MAX(created_datetime) 
                                       FROM tbl_task_reply_trs 
                                       WHERE fk_task_id = tbl1.task_id 
                                       AND created_by = tr.created_by)"
                            );


        if (!empty($data)) {
            foreach ($data as $row) {
                $due_date = strtotime($row->due_date); // Convert to UNIX timestamp
                $last_comment = strtotime($row->last_comment); // Convert to UNIX timestamp

                if ($last_comment > $due_date) {
                    $diff_seconds = $last_comment - $due_date; // Only count if delayed
                    $diff_days = floor($diff_seconds / (60 * 60 * 24)); // Convert to days
                } else {
                    $diff_days = 0; // No delay if on or before due date
                    DB::table('tbl_users_rating')->insert([
                        'fk_user_id' => $row->user_id,
                        'fk_task_id' => $row->task_id,
                        'rating' => 5,
                        'created_ip' => request()->ip(), // Get the user's IP address
                        'created_at' => now() // Current timestamp
                    ]);
                }
                echo "User ID: {$row->user_id}, Task ID: {$row->task_id}, Delay: {$diff_days} days <br>";

            }
        }
        dd($data);
    }
}
