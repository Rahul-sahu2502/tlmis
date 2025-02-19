<?php

namespace App\Http\Controllers;

use App\Models\masters\master_department;
use App\Models\masters\master_issuer_types;
use App\Models\tbl_user_map;
use App\Models\tbl_users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class DepartmentController extends Controller
{
    //
    function department(Request $request){
        $data['title'] = 'Departments';
        $data['page_title'] = "Departments";
        $data['page_subtitle'] = "";
        $data['departments'] = "";
        $data['department'] = "";
        $data["dept_id"] = 0;
        $data['issuer_types'] = master_issuer_types::all();
        if (isset($request->id) && !empty($request->id)) {
            $decodedId = base64_decode(urldecode($request->id));
            if (is_numeric($decodedId)) {
                $data["dept_id"] = $decodedId;
                $data['department'] = master_department::where('is_active', 1)
                    ->where('dept_id', $decodedId)
                    ->first();
                $data['departments'] = master_department::where('is_active', 1)->with('issuerType')->get();
            } else {
                $data['departments'] = master_department::where('is_active', 1)->with('issuerType')->get();
            }
        } else {
            $data['departments'] = master_department::where('is_active', 1)->with('issuerType')->get();
        }

        if ($request->isMethod('post')) {
            $validator = Validator::make($request->all(), [
                'department_hin' => 'required|string|max:255|regex:/^[\p{Devanagari}\s]+$/u',
                'department_eng' => 'required|string|max:255|regex:/^[a-zA-Z\s]+$/u'
            ]);
            if ($validator->fails()) {
                return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
            }
            if ($request->existing_dept_id > 0) {
                DB::beginTransaction();
                try {
                    $department = master_department::where('dept_id', $request->existing_dept_id)->first();
                    if ($department) {
                        $department->update([
                            'department_hin' => $request->department_hin,
                            'department_eng' => $request->department_eng,
                            'fk_issuer_type' => $request->issuer_type,
                            'is_active' => 1
                        ]);
                        DB::commit();
                        return response()->json(['success' => true, 'message' => 'Department updated successfully']);
                    } else {
                        DB::rollback();
                        return response()->json(['success' => false, 'message' => 'Department not found']);
                    }
                } catch (\Exception $e) {
                    DB::rollback();
                    return response()->json(['success' => false, 'message' => 'Failed to update Department: ' . $e->getMessage()]);
                }
            } if($request->existing_dept_id == 0){
                DB::beginTransaction();
                try {
                    $department = master_department::create([
                        'department_hin' => $request->department_hin,
                        'department_eng' => $request->department_eng,
                        'fk_issuer_type' => $request->issuer_type,
                        'is_active' => 1
                    ]);

                    if ($department) {
                        DB::commit();
                        return response()->json(['success' => true, 'message' => 'Department added successfully']);
                    }
                } catch (\Exception $e) {
                    DB::rollBack();
                    Log::error('Error adding Department: ' . $e->getMessage());
                    return response()->json(['success' => false, 'message' => 'An error occurred. Please try again.'], 500);
                }
            }

        }
        return view('department.department',$data);
    }

}
