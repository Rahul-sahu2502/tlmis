<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class LettersController extends Controller
{
    function create_letter($id=0)
    {
        $data['title'] = 'Create Letter';
        $data['page_title'] = 'Create_Letter';

        $data['editItem'] = null;
        if ($id) {
            $data['editItem'] = DB::table('tbl_letters')->where(['id' => $id, 'status' => 'Y'])->first();
        }
        $data['signatoryList'] = DB::select("SELECT mso.*, ms.signatory FROM master_signatory_officer as mso left join master_signatory as ms ON ms.id = mso.signatory_id WHERE mso.status = 'Y'");
        $data['masterPratiList'] = DB::table('master_letter_prati')->where(['status' => 1])->get();
        $data['headerList'] = DB::table('tbl_header')->get();
        return view('letters.add', $data);
    }
    public function submit_letter_detail(Request $request)
    {
        $status = "failed";
        $msg = "";
        $errors = null;
        $id = (@$request->id && $request->id) ? $request->id : 0;
        $validator = Validator::make(
            $request->all(),
            [
                "header_id" => "required",
                "header" => "required",
                "letter_for" => "required",
                "subject" => "required",
                "main_content" => "required",
                "signatory" => "required",
            ],
            [
                "required" => "This field is required",
            ]
        );

        if ($validator->errors()->isEmpty() == false || $validator->fails()) {
            foreach ($validator->errors()->keys() as $field) {
                $errors[$field] = $validator->errors()->first($field);
            }
            $msg = "Validation Error";
        } else {
            DB::beginTransaction();
            try {
                $data = null;
                $data['aavak_no'] = $request->aavak_no;
                $data['aavak_date'] = (strtotime($request->aavak_date) > 0) ? date('Y-m-d', strtotime($request->aavak_date)) : null;
                $data['prishthiy_no'] = $request->prishthiy_no;
                $data['prishthiy_date'] = (strtotime($request->prishthiy_date) > 0) ? date('Y-m-d', strtotime($request->prishthiy_date)) : null;
                $data['letter_for'] = $request->letter_for;
                $data['header_id'] = $request->header_id;
                $data['header'] = $request->header;
                $data['subject'] = $request->subject;
                $data['sandarbh'] = $request->sandarbh;
                $data['main_content'] = $request->main_content;
                $data['pratilipi'] = $request->pratilipi;
                $data['signatory'] = $request->signatory;
                if ($id) {
                    $data['updated_by'] = Session::get('user_id');
                    $data['updated_at'] = date('Y-m-d H:i:s');
                    $result = DB::table('tbl_letters')
                        ->where('id', $id)
                        ->update($data);
                } else {
                    DB::enableQueryLog();
                    $data['created_by'] = Session::get('user_id');
                    $data['created_at'] = date('Y-m-d H:i:s');
                    $id = DB::table('tbl_letters')->insertGetId($data);
                    $letter_no = 'WCDL' . str_pad($id, 5, '0', STR_PAD_LEFT);
                    $result = DB::table('tbl_letters')->where('id', $id)->update(['letter_no' => $letter_no]);
                }


                if ($result) {
                    DB::commit();
                    $status = "success";
                    $msg = "Letter details saved successfully";
                } else {
                    DB::rollBack();
                    $msg = "Something went wrong. Unable to save letter details";
                }
            } catch (\Exception $e) {
                DB::rollBack();
                $msg = $e->getMessage();
                dd($msg);
                // $msg = "Something went wrong. Please try again";
            } finally {
                DB::disconnect("mysql");
            }
        }

        return response()->json(["status" => $status, "msg" => $msg, "errors" => $errors, 'id' => $id]);
    }

    public function created_letters()
    {
        $data['title'] = 'Created Letters';
        $data['page_title'] = 'Created_Letters';
        $data['letterList'] = DB::select("SELECT tl.*, cb.full_name AS created_by, ub.full_name AS updated_by FROM (
            SELECT * FROM tbl_letters WHERE status = 'Y' ORDER BY id DESC
        ) as tl
        LEFT JOIN tbl_users AS cb ON cb.user_id = tl.created_by
        LEFT JOIN tbl_users AS ub ON ub.user_id = tl.updated_by
        ");
        return view('letters.list', $data);
    }

    public function view_letter($id = 0)
    {
        $letterDetail = DB::select("SELECT tl.*, mso.officer_name, ms.signatory as signatory_name FROM (
            SELECT * FROM tbl_letters WHERE id = ?
        ) as tl
        LEFT JOIN master_signatory_officer mso on mso.id = tl.signatory
        LEFT JOIN master_signatory ms ON ms.id = mso.signatory_id", [$id]);
        $data['letterDetail'] = (@$letterDetail[0] && $letterDetail[0]->id) ? $letterDetail[0] : null;
        $data['title'] = 'पत्र-' . $data['letterDetail']->letter_no;
        $data['page_title'] = 'पत्र-' . $data['letterDetail']->letter_no;
        return view('letters.view_letter', $data);
    }

    public function print_letter($id = 0)
    {
        $letterDetail = DB::select("SELECT tl.*, mso.officer_name, ms.signatory as signatory_name FROM (
            SELECT * FROM tbl_letters WHERE id = ?
        ) as tl
        LEFT JOIN master_signatory_officer mso on mso.id = tl.signatory
        LEFT JOIN master_signatory ms ON ms.id = mso.signatory_id", [$id]);
        $data['letterDetail'] = (@$letterDetail[0] && $letterDetail[0]->id) ? $letterDetail[0] : null;
        $data['title'] = 'पत्र-' . $data['letterDetail']->letter_no;
        $data['page_title'] = 'पत्र-' . $data['letterDetail']->letter_no;
        return view('letters.print_letter', $data);
    }

    public function delete_letter(Request $request)
    {
        $id = (@$request->id && $request->id) ? $request->id : 0;
        $status = 'failed';
        $msg = '';
        if ($id) {
            DB::beginTransaction();
            try {
                DB::table('tbl_letters')->where('id', $id)->update(['status' => 'N']);
                DB::commit();
                $status = 'success';
                $msg = 'Letter has been deleted';
            } catch (\Exception $e) {
                DB::rollBack();
                // $msg = $e->getMessage();
                $msg = "Something went wrong. Please try again";
            } finally {
                DB::disconnect("mysql");
            }
        } else {
            $msg = 'Missing parameter';
        }

        return response()->json(['status' => $status, 'msg' => $msg]);
    }

    public function get_prati_detail(Request $request){
        $prati_id = (@$request->prati_id && $request->prati_id) ? $request->prati_id : 0;
        $response = DB::table('master_letter_prati')->where(['id' => $prati_id, 'status' => 'Y'])->first();
        return $response;
    }

    public function get_header_detail(Request $request){
        $header_id = (@$request->header_id && $request->header_id) ? $request->header_id : 0;
        $response = DB::table('tbl_header')->where(['id' => $header_id])->first();
        return $response;
    }

    public function manage_header($id = 0){
        $data['title'] = 'Manage Header';
        $data['page_title'] = 'Manage_Header';
        $data['editItem'] = DB::table('tbl_header')->where('id', $id)->first();
        $data['headerList'] = DB::table('tbl_header')->orderBy('header_name', 'ASC')->get();
        return view('letters.manage_header', $data);
    }

    public function submit_header_detail(Request $request)
    {
        $status = "failed";
        $msg = "";
        $errors = null;
        $id = (@$request->id && $request->id) ? $request->id : 0;
        $validator = Validator::make(
            $request->all(),
            [
                "header_name" => "required",
                "description" => "required",
            ],
            [
                "required" => "This field is required",
            ]
        );

        if ($validator->errors()->isEmpty() == false || $validator->fails()) {
            foreach ($validator->errors()->keys() as $field) {
                $errors[$field] = $validator->errors()->first($field);
            }
            $msg = "Validation Error";
        } else {
            DB::beginTransaction();
            try {
                $data = [];
                $data['header_name'] = $request->header_name;
                $data['description'] = $request->description;
                if ($id) {
                    $data['updated_by'] = Session::get('user_id');
                    $data['updated_at'] = date('Y-m-d H:i:s');
                    $result = DB::table('tbl_header')
                        ->where('id', $id)
                        ->update($data);
                } else {
                    $data['created_by'] = Session::get('user_id');
                    $data['created_at'] = date('Y-m-d H:i:s');
                    $result = DB::table('tbl_header')->insertGetId($data);
                }


                if ($result) {
                    DB::commit();
                    $status = "success";
                    $msg = "Header details saved successfully";
                } else {
                    DB::rollBack();
                    $msg = "Something went wrong. Unable to save letter details";
                }
            } catch (\Exception $e) {
                DB::rollBack();
                $msg = $e->getMessage();
                // $msg = "Something went wrong. Please try again";
            } finally {
                DB::disconnect("mysql");
            }
        }

        return response()->json(["status" => $status, "msg" => $msg, "errors" => $errors]);
    }


    public function manage_signatory($id = 0){
        $data['title'] = 'Manage Signatory';
        $data['page_title'] = 'Manage_Signatory';
        $data['editItem'] = DB::table('master_signatory_officer')->where('id', $id)->first();
        $data['signatoryList'] = DB::table('master_signatory')->orderBy('signatory', 'ASC')->get();

        $data['signatoryData'] = DB::SELECT("SELECT a.id AS officer_id, a.officer_name, a.status, b.signatory FROM master_signatory_officer a
            LEFT JOIN master_signatory b ON b.id = a.signatory_id");
        return view('letters.manage_signatory', $data);
    }

    public function submit_signatory_detail(Request $request)
    {
        $status = "failed";
        $msg = "";
        $errors = null;
        $id = (@$request->id && $request->id) ? $request->id : 0;
        $validator = Validator::make(
            $request->all(),
            [
                "signatory_id" => "required",
                "officer_name" => "required",
            ],
            [
                "required" => "This field is required",
            ]
        );

        if ($validator->errors()->isEmpty() == false || $validator->fails()) {
            foreach ($validator->errors()->keys() as $field) {
                $errors[$field] = $validator->errors()->first($field);
            }
            $msg = "Validation Error";
        } else {
            DB::beginTransaction();
            try {
                $data = [];
                $data['signatory_id'] = $request->signatory_id;
                $data['officer_name'] = $request->officer_name;
                if ($id) {
                    $data['updated_by'] = Session::get('user_id');
                    $data['updated_at'] = date('Y-m-d H:i:s');
                    $result = DB::table('master_signatory_officer')
                        ->where('id', $id)
                        ->update($data);
                } else {
                    $data['created_by'] = Session::get('user_id');
                    $data['created_at'] = date('Y-m-d H:i:s');
                    $result = DB::table('master_signatory_officer')->insertGetId($data);
                }


                if ($result) {
                    DB::commit();
                    $status = "success";
                    $msg = "Signatory details saved successfully";
                } else {
                    DB::rollBack();
                    $msg = "Something went wrong. Unable to save letter details";
                }
            } catch (\Exception $e) {
                DB::rollBack();
                $msg = $e->getMessage();
                // $msg = "Something went wrong. Please try again";
            } finally {
                DB::disconnect("mysql");
            }
        }

        return response()->json(["status" => $status, "msg" => $msg, "errors" => $errors]);
    }

    public function change_signatory_status(Request $request){
        $officer_id = (@$request->officer_id && $request->officer_id) ? $request->officer_id : 0;
        $status = 'failed';
        $msg = '';
        if($officer_id){
            DB::beginTransaction();
            try {
                $prev_status = DB::table('master_signatory_officer')->where('id', $officer_id)->pluck('status')->first();
                $new_status = (@$prev_status == 'Y') ? 'N' : 'Y';
                $data = [
                    'status' => $new_status,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => Session::get('user_id'),
                ];

                $update = DB::table('master_signatory_officer')->where('id', $officer_id)->update($data);
                if($update){
                    DB::commit();
                    $status = 'success';
                    $msg = 'Status changed successfully';
                }else{
                    DB::rollBack();
                    $msg = 'Unable to update';
                }
            } catch (\Exception $e) {
                DB::rollBack();
                $msg = $e->getMessage();
                // dd($msg);
                $msg = "Something went wrong. Please try again";
            } finally {
                DB::disconnect("mysql");
            }
        }else{
            $msg = 'Missing parameter';
        }

        return response()->json(['status' => $status, 'msg' => $msg, 'new_status' => $new_status]);
    }
}
