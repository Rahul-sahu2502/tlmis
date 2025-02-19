@extends('layouts.layout_admin')
@section('styles')
<style>
    .file-img {
        width: 100%;
        height: auto;
    }

    .delete-btn {
        position: absolute;
        top: -8px;
        right: 5px;
        background-color: red;
        color: white;
        border: none;
        border-radius: 50%;
        width: 17px;
        height: 17px;
        font-size: 14px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }

    .delete-btn:hover {
        background-color: darkred;
    }

    .bg-body .form-control,
    .bg-body .form-select {
        padding: 2px 4px
    }

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
        <form method="post" id="submit_form" action="{{ route('task_update') }}" enctype="multipart/form-data" autocomplete="off">
            @csrf
            <div class=card id=tasksList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Task Details/कार्य विवरण</h5>
                        <div class=flex-shrink-0>
                            <div class="d-flex flex-wrap gap-2">
                                <a href="{{ route('task_view') }}" class="btn btn-danger add-btn"><i
                                        class="bx bx-list-ul align-bottom me-1"></i> View Tasks</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body border border-dashed border-end-0 border-start-0">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-12">
                                    <label for="title" class="form-label">Title/शीर्षक<span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="text" id="title" name="title" class="form-control"
                                        placeholder="Enter title here..." value="{{ $details[0]->title }}" required="">
                                </div>

                            </div>
                            <div class="row mt-2">
                                <div class="col-lg-6 col-md-6">
                                    <label for="entry_date" class="form-label">Task Entry Date/कार्य प्रविष्टी दिनांक<span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="hidden" value="{{ $details[0]->task_id }}" name="task_id">
                                    <input type="date" id="entry_date" value="{{ date("Y-m-d", strtotime($details[0]->entry_date)) }}" name="entry_date" max="<?= date('Y-m-d') ?>"
                                        class="form-control" required="">
                                </div>
                                <div class="col-lg-6">
                                    <label for="due_date" class="form-label">Task Due Date/कार्य प्राप्य दिनांक<span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="date" id="due_date" value="{{ date("Y-m-d", strtotime($details[0]->due_date)) }}" min="{{ date("Y-m-d", strtotime($details[0]->entry_date)) }}" name="due_date" class="form-control" required="">
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-lg-6">
                                    <div>
                                        <label for="fk_task_category_id" class="form-label">Task Category/कार्य वर्ग<span
                                                style="color:red;font-size: 16px">*</span></label>
                                        <select name="fk_task_category_id" id="fk_task_category_id" required class="form-control">
                                            <option value="">Select</option>
                                            @foreach ($task_category as $value)
                                            <option value="{{ $value->task_category_id }}" @if($details[0]->fk_task_category_id == $value->task_category_id) selected @endif>
                                                {{ $loop->index + 1 . '. ' . $value->category }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div>
                                        <label for="fk_task_priority_id" class="form-label"> Priority/प्राथमिकता<span
                                                style="color:red;font-size: 16px">*</span></label>
                                        <select name="fk_task_priority_id" id="" class="form-control" required>
                                            <option value="">Select</option>
                                            @foreach ($task_priority as $value)
                                            <option value="{{ $value->task_priority_id }}" @if($details[0]->fk_task_priority_id == $value->task_priority_id) selected @endif>
                                                {{ $loop->index + 1 . '. ' . $value->priority }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            @php
                            $dept_section_officer = [];
                            @endphp
                            @foreach ($details['dept_section_officer'] as $value)
                            @php
                            array_push($dept_section_officer, $value->user_dept);
                            @endphp
                            @endforeach
                            <input type="hidden" name="old_dept_section_officer" value="{{ json_encode($dept_section_officer) }}">
                            <div class="row mt-2">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="fk_dept_id" class="form-label">Concerned Executive Officer/संबंधित कार्यकारी अधिकारी<span
                                                style="color:red;font-size: 16px">*</span><br><span
                                                style="color:grey;"><i>(Select one or more Executive Officer)</i></span></label>
                                        <select name="fk_dept_id[]" multiple aria-label="multiple select"
                                            required id="fk_dept_id" class="form-control select2">
                                            <option value="" disabled>Select</option>
                                            @foreach ($user_list as $value)
                                            @php
                                            $u_dept = $value->fk_user_id.'_'.$value->fk_department_id;
                                            @endphp
                                            <option value="{{ $u_dept }}"
                                                @if(in_array($u_dept, $dept_section_officer)) selected @endif>
                                                {{ $loop->index+1 .'. '.$value->department_eng.' ('. $value->full_name.'-'. $value->level.')' }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            @if($details[0]->has_file=="Y")
                            <div class="row mt-3">
                                <label for="document" class="form-label">Uploaded Document <small>/अपलोड की गयी फ़ाइल</small></label>
                                @foreach ($details['files'] as $value)
                                <div class="col-lg-1 col-md-1 file-icon">
                                    @php
                                    $file_path= asset('uploads/' . $value->file);
                                    if (config('app.env')=='production') {
                                    $file_path = config('custom.file_point').$value->file;
                                    }
                                    @endphp
                                    <button type="button" data-file="{{ basename($value->file_name) }}" data-src="{{ $file_path }}" data-type="{{ pathinfo($value->file, PATHINFO_EXTENSION) }}" class="btn btn-sm btn-outline-info file-preview-icon">
                                        <i class="bx bx-file"></i>
                                    </button>
                                    <button type="button" data-id="{{ $details[0]->task_id }}" value="{{ $value->file_id }}" class="delete-btn">&times;</button>
                                </div>
                                @endforeach
                            </div>
                            @endif
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
                            <div class="col-lg-12 mt-2">
                                <label for="description" class="form-label">Description/विवरण<span
                                        style="color:red;font-size: 16px">*</span></label>
                                <textarea id="description" name="description" class="form-control" placeholder="Enter description here..." required="">{{ $details[0]->description }}</textarea>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            @include('tasks._partial_files', ['doc_types' => $doc_types, 'task_id' => $details[0]->task_id])
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-end">
                        <div class="ms-auto">
                            <button type="submit" class="btn btn-success">Update</button>
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
@include('tasks.details_js')
<script>
    $('.delete-btn').click(function() {
        $this = $(this);
        let file_id = $(this).val();
        let task_id = $(this).attr("data-id");
        SwalWithCustomSettings.fire({
            title: 'Are you sure you want to delete?',
            text: 'Note: The file you are deleting can not be recovered',
            icon: "question",
            showCancelButton: true,
            confirmButtonText: 'Submit',
            cancelButtonText: 'Cancel',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "{{ route('delete_task_file') }}", // Route to the controller
                    type: "post",
                    headers: {
                        'X-CSRF-TOKEN': "{{ csrf_token() }}"
                    },
                    data: {
                        'task_id': task_id,
                        'file_id': file_id
                    },
                    success: function(response) {
                        let sts = response.sts;
                        let icon = "";
                        let msg = "";
                        if (sts == 1) {
                            $this.closest('.file-icon').fadeOut(300, function() {
                                $(this).remove(); // Remove the file icon from DOM
                            });
                        } else if (sts == 2) {
                            icon = "azxkyjta.json";
                            msg = "Please try again";
                            swal_alert(icon, msg);
                        }
                    },
                    error: function(xhr) {
                        console.log(xhr.responseText);
                    },
                });
            } else if (result.isDismissed) {
                console.log('Closed without submission');
            }
        });
    });
</script>
@endsection