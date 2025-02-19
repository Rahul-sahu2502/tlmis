@extends('layouts.layout_admin')
@section('styles')
<link rel="stylesheet" href="{{asset('assets/libs/datatable/dataTables.bootstrap5.min.css')}}" />
<link rel="stylesheet" href="{{asset('assets/libs/datatable/buttons.dataTables.min.css')}}" />
<style>
    .min-card-height {
        height: 460px;
        min-height: 460px;
    }

    .check_all,
    .doc_check {
        height: 25px;
        width: 25px;
        margin: auto;
    }

    .usage {
        font-size: .8em;
        font-weight: 600;
    }

    .bg-body .form-control,
    .bg-body .form-select {
        padding: 2px 4px
    }
</style>
@endsection
@section('content')
<div class=row>
    <div class=col-lg-12>
        <form method="post" action="{{ route('task_insert') }}" id="submit_form" enctype="multipart/form-data" autocomplete="off">
            @csrf
            <div class=card id=tasksList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Add New Task / <small>नया कार्य जोड़ें</small></h5>
                        <div class=flex-shrink-0>
                            <div class="d-flex flex-wrap gap-2">
                                <a href="{{ route('task_view') }}" class="btn btn-danger add-btn"><i
                                        class="bx bx-list-ul align-bottom me-1"></i> View List </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body border border-dashed border-end-0 border-start-0">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h5 for="ref_docs" class="form-label">Task Details <small>/ कार्य विवरण </small></h5>
                                    <label for="title" class="form-label">Title/शीर्षक<span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="text" id="title" name="title" class="form-control"
                                        placeholder="Enter title here..." required="">
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg-6 col-md-6">
                                    <label for="entry_date" class="form-label">Task Entry Date/कार्य प्रविष्टी दिनांक<span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="date" id="entry_date" name="entry_date" value="<?= date('Y-m-d') ?>" max="<?= date('Y-m-d') ?>"
                                        class="form-control" required="">
                                </div>
                                <div class="col-lg-6">
                                    <label for="due_date" class="form-label">Task Due Date/कार्य प्राप्य दिनांक<span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="date" id="due_date" name="due_date" min="<?= date('Y-m-d') ?>" class="form-control"
                                        required="">
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="fk_task_priority_id" class="form-label"> Priority/प्राथमिकता<span
                                                style="color:red;font-size: 16px">*</span></label>
                                        <select name="fk_task_priority_id" id="" class="form-control" required>
                                            <option value="">Select</option>
                                            @foreach ($task_priority as $value)
                                            <option value="{{ $value->task_priority_id }}">
                                                {{ $loop->index + 1 . '. ' . $value->priority }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="fk_task_category_id" class="form-label">Task Category/कार्य वर्ग <span
                                                style="color:red;font-size: 16px">*</span></label>
                                        <select name="fk_task_category_id" id="fk_task_category_id" required
                                            class="form-control">
                                            <option value="">Select</option>
                                            @foreach ($task_category as $value)
                                            <option value="{{ $value->task_category_id }}">
                                                {{ $loop->index + 1 . '. ' . $value->category }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="fk_dept_id" class="form-label">Concerned Executive Officer/संबंधित कार्यकारी अधिकारी<span
                                                style="color:red;font-size: 16px">*</span><br><span
                                                style="color:grey;"><i>(select one or more Executive Officer)</i></span></label>
                                        <select name="fk_dept_id[]" multiple aria-label="multiple select"
                                            required id="fk_dept_id" class="form-control select2">
                                            <option value="" disabled>Select</option>
                                            @foreach ($user_list as $value)
                                            <option value="{{ $value->fk_user_id.'_'.$value->fk_department_id }}">
                                                {{ $loop->index+1 .'. '.$value->department_eng.' ('. $value->full_name.'-'. $value->level.')' }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 mt-2">
                                <div class="form-group">
                                    <label for="description" class="form-label">Description/विवरण<span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <textarea id="description" name="description" class="form-control"
                                        placeholder="Enter description here..." required=""></textarea>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg-8 col-md-8">
                                    <div class="form-group">
                                        <label for="file" class="form-label">Attach Supporting Document/सहायक दस्तावेज़ <small>(if
                                                any)</small></label>
                                        <input type="file" name="file" id="file" accept="image/*, application/pdf"
                                            class="form-contorl p-2">
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="form-group">
                                        <div id="filePreviewContainer" class="file-preview"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            @include('tasks._partial_files', ['doc_types' => $doc_types,'task_id'=>''])
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-end">
                        <div class="ms-auto">
                            <button type="submit" class="btn btn-success">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
@section('scripts')
<script src="{{ asset('assets/libs/list.js/list.min.js') }}"></script>
<script src="{{ asset('assets/libs/select2/select2.min.js') }}"></script>
<script src="{{ asset('assets/libs/list.pagination.js/list.pagination.min.js') }}"></script>
<script src="{{asset('assets/libs/datatable/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.flash.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.html5.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.print.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/jszip.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/pdfmake.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/vfs_fonts.js')}}"></script>
@include('tasks.details_js')
@endsection
