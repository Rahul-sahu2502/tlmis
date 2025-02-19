@extends('layouts.layout_admin')
@section('styles')
<link rel="stylesheet" href="{{asset('assets/libs/datatable/dataTables.bootstrap5.min.css')}}" />
<link rel="stylesheet" href="{{asset('assets/libs/datatable/buttons.dataTables.min.css')}}"/>
@endsection
@section('content')
    <div class=row>
        <div class=col-lg-5>
            @if (Session::has('success'))
                <div class="alert alert-success">
                    {{ Session::get('success') }}
                </div>
            @endif
            @if (Session::has('error'))
                <div class="alert alert-danger">
                    {{ Session::get('error') }}
                </div>
            @endif
            <form method="post" id="departmentForm" autocomplete="off">
                @csrf
                <input type="hidden" name="existing_dept_id" value="{{ @$dept_id }}">
                <div class=card id=department>
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <h5 class="card-title mb-0 flex-grow-1">Add New / <small> नया जोड़ें</small></h5>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="issuer_type" class="form-label">Issuer Type <small>/ जारीकर्ता का
                                            प्रकार </small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="issuer_type" id="issuer_type" class="form-control" required>
                                        <option value="">Select Type</option>
                                        @foreach($issuer_types as $issuer_type)
                                            <option @if(isset($department->fk_issuer_type) && $issuer_type->id == $department->fk_issuer_type) {{ "selected" }} @endif
                                                value="{{ $issuer_type->id }}" {{ isset($file_mgmt) && $file_mgmt->issuerDetails->issuer_type_id == $issuer_type->id ? 'selected' : '' }}>
                                                {{ $issuer_type->name_en }} ({{ $issuer_type->name_hi }})
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <label for="department_eng" class="form-label">Department Name In English / <small> विभाग का नाम इंगलिश में</small><span
                                        style="color:red;font-size: 16px">*</span></label>
                                <input type="text" id="department_eng" name="department_eng"  pattern="^[a-zA-Z\s]+$"  title="Please enter only English letters and spaces." class="form-control" required=""
                                       value="{{ @$department->department_eng }}">
                                @error('department_eng')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="col-lg-12">
                                <label for="department_hin" class="form-label">Department Name In Hindi  / <small> विभाग का नाम हिन्दी में</small><span
                                        style="color:red;font-size: 16px">*</span></label>
                                <input type="text" id="department_hin"  pattern="^[\p{Devanagari}\s]+$"  title="Please enter only Hindi letters and spaces." name="department_hin" class="form-control" required=""
                                       value="{{ @$department->department_hin }}">
                                @error('department_hin')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-end">
                            <div class="ms-auto">
                                <button type="submit" class="btn btn-success">Save</button>
                                {{-- <button type="button" class="btn btn-secondary">Cancel</button> --}}
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-7">
            <div class=card id=departmentList>

                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Existing List  / <small> उपलब्ध सूची</small></h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive simplebar-scrollable-y mb-4" data-simplebar="init" data-simplebar-auto-hide="false" data-simplebar-track="dark" style="max-height: 400px;">
                        <table class="table table-bordered datatable mb-0" id=usersTable width="100%">
                            <thead class="table-dark">
                            <tr>
                                <th width="10%" class=sort data-sort=id>S.No.</th>
                                <th width="40%" class=sort data-sort=type>Type</th>
                                <th width="40%" class=sort data-sort=deptEng>Name In English</th>
                                <th width="40%" class=sort data-sort=deptHin>Name In Hindi</th>
                                <th width="10%" class=sort data-sort=action>Action</th>
                            </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                @foreach( $departments as $dept)
                                    <tr>
                                        <td>{{ $loop->index+1 }}</td>


                                        <td class=full_name>
                                            @if($dept->issuerType->isNotEmpty()&&isset($dept->issuerType)&&!empty($dept->issuerType))
                                            {{ $dept->issuerType->first()->name_en .' ('.$dept->issuerType->first()->name_hi .')'}}
                                            @endif
                                        </td>
                                        <td class=full_name>{{ $dept->department_eng }}</td>
                                        <td class=mobile>{{ $dept->department_hin }}</td>
                                        <td class=edit>
                                            <a class="btn btn-info btn-sm" href="{{ route('department',['id'=>urlencode(base64_encode($dept->dept_id))]) }}">Update</a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    <script src="{{ asset('assets/js/typeahead.bundle.js') }}"></script>
    <script src="{{asset('assets/libs/datatable/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.flash.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.html5.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.print.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/jszip.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/pdfmake.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/vfs_fonts.js')}}"></script>
    <script>
        $(document).ready(function () {
            $('.datatable').DataTable({
                dom: '<"dt-top"lfB>rtip',
                buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
                language: {
                    search: "Search:",
                },
            });
            $('#departmentForm').on('submit', function (e) {
                e.preventDefault();
                let formData = $(this).serialize();
                $(':input[type="submit"]').prop('disabled', true);
                $.ajax({
                    url: '{{ route("department") }}',
                    type: 'POST',
                    data: formData,
                    success: function (response) {
                        if (response.success) {
                            //SwalWithCustomSettings.fire('Success!', response.message, 'success');
                            SwalWithCustomSettings.fire({
                                title: 'Success!',
                                text: response.message,
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $('#departmentForm')[0].reset();
                                    window.location.href = "{{ route('department') }}";
                                    $(':input[type="submit"]').prop('disabled', false);
                                }
                            });

                        } else {
                            SwalWithCustomSettings.fire('Error!', response.message || 'An error occurred.', 'error');
                        }
                    },
                    error: function (xhr) {
                        if (xhr.status === 422) {
                            let errors = xhr.responseJSON.errors;
                            let errorMessage = '';
                            $.each(errors, function (key, value) {
                                errorMessage += value[0] + '\n';
                            });
                            SwalWithCustomSettings.fire('Validation Error!', errorMessage, 'warning');
                        } else {
                            SwalWithCustomSettings.fire('Error!', 'An unexpected error occurred.', 'error');
                        }
                        $(':input[type="submit"]').prop('disabled', false);
                    }
                });
            });
        });
    </script>
@endsection
