@extends('layouts.layout_admin')
@section('content')
    <div class=row>
        <div class=col-lg-12>
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
            <form method="post" id="userInsertion" autocomplete="off">
                @csrf
                <div class=card id=UsersList>

                    <div class="card-header border-0">
                        &nbsp;<small class="mt-2 text-primary"><span class="badge badge-gradient-danger">Note:</span> If a task is assigned into a section then that section can not be updated or removed. /
                            यदि किसी अनुभाग में कोई कार्य सौंपा गया है, तो उस अनुभाग को अपडेट अथवा हटाया नहीं  सकता। </small><br/>
                        <div class="d-flex align-items-center">
                            <h5 class="card-title mb-0 flex-grow-1">Add New / <small> नया जोड़ें</small><br/></h5>
                            <div class=flex-shrink-0>
                                <div class="d-flex flex-wrap gap-2">
                                    <a href="{{ route('view-user') }}" class="btn btn-danger add-btn"><i
                                            class="bx bx-list-ul me-1"></i> View List</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body border border-dashed border-end-0 border-start-0">
                        <input type="hidden" name="existing_user_id" value="{{ @$user_id }}">
                        <div class="row g-3">
                            <div class="col-lg-4">
                                <div>
                                    <label for="section" class="form-label">Section Office / <small> शाखा कार्यालय</small> <span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="fk_section_id[]" multiple id="fk_section_id" aria-label="multiple select" class="form-control select2" required>
                                        <option value="" disabled>Select</option>
                                        @foreach($sections as $section)
                                            <option value="{{ $section->id }}"
                                            @if(isset($users) && !empty($users))
                                                @foreach ($users->userMaps as $userMap) {
                                                {{ $section->id == $userMap->section->id ? 'selected' : '' }}
                                                @endforeach
                                                @endif
                                            >{{ $section->name_en . ' ('.$section->name_hi.')' }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('fk_level_id')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div>
                                    <label for="fk_designation_id" class="form-label">Designation / <small> पदनाम</small> <span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="text" id="designation" name="designation"
                                           class="form-control typeahead"
                                           placeholder="Search or Add Designation" value="@if(isset($users) && !empty($users))
    {{ $users->userMaps->first()->designation->designation }}@endif">
                                    @error('designation')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                            @if(!Session::get('department_id'))
                            <div class="col-lg-4">
                                <div>
                                    <label for="fk_department_id" class="form-label">Department / <small> विभाग</small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="text" id="department" name="department" class="form-control typeahead"
                                           placeholder="Search or Add Department" value="@if(isset($users) && !empty($users) ){{ $users->userMaps->first()->department->department_eng . ' (' . $users->userMaps->first()->department->department_hin . ')' }}
                                    @endif">
                                    <input type="hidden" id="fk_department_id" name="fk_department_id"
                                           value="@if(isset($users) && !empty($users) && $users->userMaps->isNotEmpty()) {{ @$users->userMaps->first()->department->dept_id }} @endif">
                                    @error('department')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                                @else
                                <input type="hidden" id="fk_department_id" name="fk_department_id"
                                       value="{{ Session::get('department_id') }}">
                            @endif
                            <div class="col-lg-4">
                                <label for="full_name" class="form-label">Full Name / <small> पूरा नाम</small><span
                                        style="color:red;font-size: 16px">*</span></label>
                                <input type="text" id="full_name" name="full_name" class="form-control" required=""
                                       value="{{ @$users->full_name }}">
                                @error('full_name')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="col-lg-4">
                                <label for="mobile" class="form-label">Mobile Number / <small> मोबाइल नंबर</small><span
                                        style="color:red;font-size: 16px">*</span></label>
                                <input type="text" id="mobile" name="mobile" class="form-control" required=""
                                       maxlength="10" minlength="10"
                                       pattern="^[6-9]\d{9}$" value="{{ @$users->mobile }}">
                                @error('mobile')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>
                            <div class="col-lg-4">
                                <label for="email" class="form-label">Email-Id / <small> ईमेल आईडी</small><span
                                        style="color:red;font-size: 16px"></span></label>
                                <input type="email" id="email" name="email" class="form-control"
                                       pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                       title="Enter a valid email address." value="{{ @$users->email }}">
                                @error('email')
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
    </div>
@endsection
@section('scripts')
    <script src="{{ asset('assets/js/typeahead.bundle.js') }}"></script>
    <script src="{{ asset('assets/libs/select2/select2.min.js') }}"></script>
    <script>
        $(document).ready(function () {
            let designationTypeahead = $('#designation');
            let departmentTypeahead = $('#department');
            let departmentInput = $('#fk_department_id');

            $(".select2").select2();
            designationTypeahead.typeahead({
                minLength: 3,
                highlight: true,
                hint: true
            }, {
                name: 'designations',
                display: 'designation',
                source: function (query, syncResults, asyncResults) {
                    $.ajax({
                        url: '{{ route("getDesignations") }}',
                        data: {query: query},
                        success: function (data) {
                            asyncResults(data);
                        }
                    });
                }
            });

            departmentTypeahead.typeahead({
                minLength: 3,
                highlight: true,
                hint: true
            }, {
                name: 'departments',
                display: function (item) {
                    return `${item.department_eng} (${item.department_hin})`; // Combine English and Hindi names
                },
                source: function (query, syncResults, asyncResults) {
                    $.ajax({
                        url: '{{ route("getDepartments") }}', // Route to get departments
                        data: {query: query},
                        success: function (data) {
                            asyncResults(data); // Pass the data to typeahead
                        }
                    });
                }
            });

            // Handle selection and set ID
            departmentTypeahead.on('typeahead:select', function (e, selected) {
                // Set the selected department ID in a hidden input field
                departmentInput.val(selected.dept_id);
            });

            $('#userInsertion').on('submit', function (e) {
                e.preventDefault();

                let formData = $(this).serialize();
                $(':input[type="submit"]').prop('disabled', true);
                $.ajax({
                    url: '{{ route("add-user") }}',
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
                                    $('#userInsertion')[0].reset();
                                    window.location.href = "{{ route('view-user') }}";
                                    $(':input[type="submit"]').prop('disabled', false);
                                }
                            });

                        } else {
                            SwalWithCustomSettings.fire('Error!', response.message || 'An error occurred.', 'error');
                        }
                        $(':input[type="submit"]').prop('disabled', false);
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
