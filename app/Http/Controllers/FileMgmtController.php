<?php

namespace App\Http\Controllers;

use App\Models\file_mgmt;
use App\Models\file_mgmt_uploads;
use App\Models\FileMgmt;
use App\Models\FileMgmtUploads;
use App\Models\masters\issuers;
use App\Models\masters\master_doc_types;
use App\Models\masters\master_issuer_types;
use App\Models\tbl_task;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class FileMgmtController extends Controller
{
    public function index($id = null)
    {
        $title = 'Document Management';
        $page_title = "Documents";
        $page_subtitle = "";
        $doc_types = master_doc_types::all();
        $issuer_types = master_issuer_types::all();
        $file_mgmt = $id ? file_mgmt::findOrFail($id) : null;
        return view('docs.add', compact('page_title', 'page_subtitle', 'doc_types', 'issuer_types', 'file_mgmt', 'title'));
    }
    public function list()
    {
        $title = 'Documents';
        $page_title = "Documents";
        $page_subtitle = "";
        $doc_types = master_doc_types::all();
        $files = file_mgmt::with('uploads', 'issuerDetails','fileTypeDetails')->orderBy('created_at', 'desc')->get();
        return view('docs.list', compact('page_title', 'page_subtitle','doc_types', 'files'))->with('title', $title);
    }
    public function get(Request $request)
    {
        $query = $request->get('search', '');
        $id = $request->get('id', null);
        if ($id) {
            $documents = file_mgmt::where('id', $id)
                ->with('issuerDetails')
                ->get(['id', 'reference_no', 'issue_date', 'issuer']);
        } else {
            $documents = file_mgmt::where('reference_no', 'LIKE', "%$query%")
                ->with('issuerDetails')
                ->get(['id', 'reference_no', 'issue_date', 'issuer']);
        }
        $results = $documents->map(function ($doc) {
            return [
                'id' => $doc->id,
                'name' => $doc->reference_no.'-'.date('d-m-Y', strtotime($doc->issue_date)).'('.$doc->issuerDetails->name.')'
            ];
        });
        return response()->json($results);
    }
    public function delete($id){
        try {
            $document = file_mgmt::findOrFail($id);
            $documentUpload = file_mgmt_uploads::where('fk_file_mgmt_id', $id)->first();
            $isReferenced = tbl_task::whereJsonContains('ref_docs', strval($id))->exists();
            if ($isReferenced) {
                return response()->json([
                    'success' => false,
                    'message' => 'Can Not Delete. Document is referenced in tasks.',
                ], 400);
            }
            
            if ($documentUpload) {
                // unlink($documentUpload->path);
                $documentUpload->delete();
            }
            if($document){
                $document->delete();
            }
            return response()->json([
                'success' => true,
                'message' => 'Document deleted successfully!',
            ], 200);
        } catch (ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Document not found.',
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'An error occurred while deleting the document.',
            ], 500);
        }
    }
    public function update(Request $request, $id)
    {
        $issuer_id = 0;
        $validator = Validator::make($request->all(), [
            'file_type' => 'required',
            'issue_date' => 'required|date',
            'rec_date' => 'required|date',
            'ref_no' => 'required|string|max:255',
            'issuer_type' => 'required',
            'issuer' => 'required|string|max:255',
            'doc_nature' => 'required',
            'doc_priority'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'errors' => $validator->errors()], 422);
        }

        $issuerName = $request->issuer;
        $issuerType = $request->issuer_type;
        $issuerExist = issuers::where('name', $issuerName)->where('issuer_type_id', $issuerType)->first();
        if ($issuerExist) {
            $issuer_id = $issuerExist->id;
        } else {
            $issuerNew = issuers::create([
                'name' => $issuerName,
                'issuer_type_id' => $issuerType,
                'status' => 1,
            ]);
            $issuer_id = $issuerNew->id;
        }
        try {
            $file = file_mgmt::findOrFail($id);
            $file->update([
                'file_type_id' => $request->file_type,
                'reference_no' => $request->ref_no,
                'issue_date' => $request->issue_date,
                'issuer' => $issuer_id,
                'receiving_date' => $request->rec_date,
                'doc_nature' => $request->doc_nature,
                'doc_priority' => $request->doc_priority,
            ]);
            return response()->json(['success' => true, 'message' => 'Document saved successfully!']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'An error occurred while saving the document.'], 500);
        }
    }
    public function save(Request $request){
        $validator = Validator::make($request->all(), [
            'file_type' => 'required',
            'issue_date' => 'required|date',
            'rec_date' => 'required|date',
            'ref_no' => 'required|string|max:255',
            'issuer_type' => 'required',
            'issuer' => 'required|string|max:255',
            'document' => 'required|file|mimes:pdf,png,jpeg,jpg',
            'doc_nature' => 'required',
            'doc_priority' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 422);
        }
        $issuer = issuers::firstOrCreate(
            ['name' => $request->issuer, 'issuer_type_id' => $request->issuer_type],
            ['status' => 1]
        );
        $uploadedFile = $request->file('document');
        $fileExtension = $uploadedFile->getClientOriginalExtension();
        $uploadFile = UtilController::upload_file(
            $uploadedFile,
            'documents',
            'uploads',
            ['jpeg', 'jpg', 'png', 'pdf'],
            ['image/jpeg', 'image/png', 'application/pdf']
        );
        if (!$uploadFile) {
            return response()->json([
                'success' => false,
                'message' => 'Unable to save file!',
            ], 422);
        }
        DB::beginTransaction();
        try {
            $uniqueFileId = uniqid();
            $file = file_mgmt::create([
                'file_type_id' => $request->file_type,
                'reference_no' => $request->ref_no,
                'issue_date' => $request->issue_date,
                'issuer' => $issuer->id,
                'receiving_date' => $request->rec_date,
                'unique_file_id' => $uniqueFileId,
                'doc_nature' => $request->doc_nature,
                'doc_priority' => $request->doc_priority,
            ]);
            if (!$file) {
                DB::rollback();
                return response()->json([
                    'success' => false,
                    'message' => 'Unable to save document!',
                ], 422);
            }
            file_mgmt_uploads::create([
                'fk_file_mgmt_id' => $file->id,
                'filename' => basename($uploadFile),
                'extension' => $fileExtension,
                'path' => $uploadFile,
            ]);
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'Document saved successfully!',
            ], 200);

        } catch (\Exception $e) {
            DB::rollback();
            return response()->json([
                'success' => false,
                'message' => 'An error occurred while saving the document.',
            ], 500);
        }
    }

}
