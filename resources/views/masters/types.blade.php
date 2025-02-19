@extends('layouts.layout_admin')
@section('styles')
<link rel="stylesheet" href="{{asset('assets/libs/datatable/dataTables.bootstrap5.min.css')}}" />
<link rel="stylesheet" href="{{asset('assets/libs/datatable/buttons.dataTables.min.css')}}" />
@endsection
@section('content')
<div class=row>
    <div class=col-lg-5>
        <form method="post" id="masterForm" autocomplete="off">
            @csrf
            <input type="hidden" name="id" id="id">
            <div class=card id=department>
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Add New / <small> नया जोड़ें</small></h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-lg-12">
                            <label for="name_en`" class="form-label"> Name in English / <small> इंग्लिश में नाम </small><span
                                    style="color:red;font-size: 16px">*</span></label>
                            <input type="text" id="name_en" name="name_en" title="Please enter only English letters and spaces." class="form-control" required="">
                        </div>
                        <div class="col-lg-12">
                            <label for="name_hi" class="form-label"> Name in Hindi / <small> हिन्दी में नाम </small><span
                                    style="color:red;font-size: 16px">*</span></label>
                            <input type="text" id="name_hi" name="name_hi" title="Please enter only Hindi letters and spaces." class="form-control" required="">
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-end">
                        <div class="ms-auto">
                            <button type="submit" id="submit" class="btn btn-success">Save</button>
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
                    <h5 class="card-title mb-0 flex-grow-1">Existing List / <small> उपलब्ध सूची</small></h5>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive simplebar-scrollable-y mb-4 " data-simplebar="init" data-simplebar-auto-hide="false" data-simplebar-track="dark" style="max-height: 400px;">
                    <table class="table table-bordered datatable mb-0" id="usersTable" width="100%">
                        <thead class="table-dark">
                            <tr>
                                <th width="10%" class="sort" data-sort="id">S.No.</th>
                                <th width="35%" class="sort" data-sort="nameen">Name (English)</th>
                                <th width="35%" class="sort" data-sort="namehi">Name (Hindi)</th>
                                <th width="20%" class="sort" data-sort="action">Action</th>
                            </tr>
                        </thead>
                        <tbody class="list form-check-all">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('scripts')
<script src="{{asset('assets/libs/datatable/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.flash.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.html5.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.print.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/jszip.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/pdfmake.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/vfs_fonts.js')}}"></script>
<script>
    $(document).ready(function() {
        // Initialize DataTable
        var table = $('#usersTable').DataTable({
            dom: '<"dt-top"lfB>rtip',
            buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
            language: {
                search: "Search:",
            },
        });
        fetchIssuerTypes();
        function fetchIssuerTypes() {
            $.ajax({
                url: "{{ route('master_get',['key' => $key]) }}",
                method: "GET",
                success: function(response) {
                    let data = [];
                    response.data.forEach((issuer, index) => {
                        data.push([
                            index + 1,
                            issuer.name_en,
                            issuer.name_hi,
                            `<button class="btn btn-sm btn-primary editBtn" data-id="${issuer.id}"><i class="ri-pencil-line"></i></button>
                             <button class="btn btn-sm btn-danger deleteBtn" data-id="${issuer.id}"><i class="ri-delete-bin-line"></i></button>`
                        ]);
                    });
                    table.clear().rows.add(data).draw();
                },
                error: function() {
                    alert('Failed to fetch issuer types.');
                }
            });
        }
        $('#masterForm').submit(function(e) {
            e.preventDefault();
            var formData = $(this).serialize();
            $('#submit').prop('disabled', true);
            $.ajax({
                url: "{{ route('master_store',['key' => $key]) }}",
                method: 'POST',
                data: formData,
                success: function(response) {
                    $('#masterForm')[0].reset();
                    showAlert(response.success, 'success');
                    fetchIssuerTypes();
                    $('#submit').prop('disabled', false);
                },
                error: function(xhr) {
                    showAlert('Something went wrong. Please check the inputs.', 'error');
                    $('#submit').prop('disabled', false);
                }
            });
        });
        $('body').on('click', '.editBtn', function() {
            var id = $(this).data('id');
            $.get("{{ url('master-edit') }}/{{$key}}/" + id, function(data) {
                $('#masterForm [name=id]').val(data.id);
                $('#masterForm [name=name_en]').val(data.name_en);
                $('#masterForm [name=name_hi]').val(data.name_hi);
            });
        });
        $('body').on('click', '.deleteBtn', function() {
            SwalWithCustomSettings.fire({
                title: 'Are you sure?',
                text: "This action cannot be undone!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    var id = $(this).data('id');
                    $.ajax({
                        url: "{{ url('master-destroy') }}/{{$key}}/" + id,
                        method: 'DELETE',
                        data: {
                            _token: "{{ csrf_token() }}"
                        },
                        success: function(response) {
                            showAlert(response.success, 'success');
                            fetchIssuerTypes();
                        },
                        error: function(xhr) {
                            let errorMessage = 'Error deleting record.';
                            if (xhr.responseJSON && xhr.responseJSON.error) {
                                errorMessage = xhr.responseJSON.error;
                            }
                            showAlert(errorMessage, 'error');
                        }
                    });
                }
            });
        });
    });
</script>
@endsection