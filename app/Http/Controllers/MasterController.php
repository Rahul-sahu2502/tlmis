<?php

namespace App\Http\Controllers;

use App\Models\file_mgmt;
use App\Models\masters\issuers;
use App\Models\masters\master_department;
use App\Models\masters\master_designation;
use App\Models\masters\master_issuer_types;
use App\Models\masters\master_level;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;

class MasterController extends Controller
{

    private function getModel($key)
    {
        switch ($key) {
            case 'ISS':
                return \App\Models\masters\master_issuer_types::class;
            case 'DOC':
                return \App\Models\masters\master_doc_types::class;
            default:
                abort(404, 'Invalid key provided.');
        }
    }

    public function view(Request $request, $key)
    {
        $title = 'Master Management';
        $page_title = match ($key) {
            'ISS' => 'Issuer_Type',
            'DOC' => 'Document_Type',
            default => abort(404, 'Invalid key provided.')
        };
        $page_subtitle = "";
        return view('masters.types', compact('page_title', 'page_subtitle', 'key'))->with('title', $title);
    }
    public function index(Request $request, $key)
    {
        $model = $this->getModel($key);
        $data = $model::where('status', 1)->orderBy('created_at', 'desc')->get();
        return response()->json(['data' => $data]);
    }
    public function store(Request $request, $key)
    {
        $model = $this->getModel($key);
        $request->validate([
            'name_en' => 'required',
            'name_hi' => 'required',
        ]);
        $data = [
            'name_en' => $request->name_en,
            'name_hi' => $request->name_hi,
            'status' => 1,
        ];

        $model::updateOrCreate(
            ['id' => $request->id],
           $data
        );
        return response()->json(['success' => 'Data saved successfully.']);
    }
    public function destroy($key, $id)
    {
        $model = $this->getModel($key);
        $record = $model::find($id);
        if (!$record) {
            return response()->json(['error' => 'Data not found.'], 404);
        }
        if ($key === 'DOC') {
            $isReferenced = file_mgmt::where('file_type_id', $id)->exists();
            if ($isReferenced) {
                return response()->json(['error' => 'Cannot delete. This record is being used in file management.'], 400);
            }
        }
    
        if ($key === 'ISS') {
            $isReferenced = issuers::where('issuer_type_id', $id)
            ->whereHas('fileMgmt', function ($query) {
                $query->where('status', 1);
            })->exists();
            if ($isReferenced) {
                return response()->json(['error' => 'Cannot delete. This issuer type is being used in file management.'], 400);
            }
        }
        $record->status = $record->status ? 0 : 1;
        $record->save();
        return response()->json([
            'success' => 'Record status updated successfully.',
            'new_status' => $record->status,
        ]);
    }
    public function edit($key, $id)
    {
        $model = $this->getModel($key);

        $data = $model::find($id);
        if (!$data) {
            return response()->json(['error' => 'Data not found.'], 404);
        }
        return response()->json($data);
    }
    public function getDesignations(Request $request){
        $query = $request->query('query');
        $response = master_designation::where('is_active', 1)
            ->where('designation', 'LIKE', "%$query%")
            ->get(['designation_id', 'designation']);
        return response()->json($response);
    }

    public function checkOrCreateDesignation(Request $request){
        $designation = $request->get('designation');
        $existingDesignation = master_designation::where('designation', $designation)->first();
        if ($existingDesignation) {
            return response()->json([
                'designation_id' => $existingDesignation->designation_id
            ]);
        } else {
            $newDesignation = master_designation::create([
                'designation' => $designation,
                'is_active' => 1
            ]);
            return response()->json([
                'designation_id' => $newDesignation->designation_id
            ]);
        }
    }

    public function getDepartments(Request $request){
        $query = $request->query('query');
        $response = master_department::where('is_active', 1)
            ->where(function ($q) use ($query) {
                $q->where('department_eng', 'LIKE', "%$query%")
                    ->orWhere('department_hin', 'LIKE', "%$query%");
            })
            ->get(['dept_id', 'department_eng','department_hin']);
        return response()->json($response);
    }

    public function initTypeahead(Request $request){
        $key=$request->get('key');
        $response='';
        $query = $request->query('query');
        switch($key){
            case 'DEPT':
                $response = master_department::where('is_active', 1)
                ->where('department_eng', 'LIKE', "%$query%")
                ->get([
                    'dept_id as id',
                    DB::raw("CONCAT(department_eng, ' (', department_hin, ')') as name")
                ]);
                break;
            case "ISS":
                $response = issuers::where('status', 1)
                ->where('name', 'LIKE', "%$query%")
                ->where('issuer_type_id', $request->param)
                ->get(['id', 'name']);
                break;
        }
        return response()->json($response);
    }
}
