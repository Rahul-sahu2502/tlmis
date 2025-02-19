@extends('layouts.layout_admin')
@section('styles')
@endsection
@section('content')
    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row" id="blockUI">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title normal-text">Created Letters</h4>
                            <hr>
                            <div class="table-responsive">
                                <table class="table table-bordered datatable">
                                    <thead>
                                    <tr>
                                        <th width="40">क्र.</th>
                                        <th class="text-wrap normal-text">पत्र क्र.</th>
                                        <th class="text-wrap normal-text">आवक/जावक क्र.</th>
                                        <th class="text-wrap normal-text">आवक/जावक दिनांक</th>
                                        <th class="text-wrap normal-text">पृष्ठीय क्र.</th>
                                        <th class="text-wrap normal-text">पृष्ठीय दिनांक</th>
                                        <th class="text-wrap normal-text">विषय</th>
                                        <th class="text-wrap normal-text">पत्र देखें</th>
                                        <th class="text-wrap">Created By</th>
                                        <th class="text-wrap">Updated By</th>
                                        <th class="text-wrap">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @if (@$letterList)
                                        @foreach ($letterList as $key => $value)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td class="normal-text">{{ $value->letter_no }}</td>
                                                <td class="normal-text">{{ $value->aavak_no }}</td>
                                                <td class="normal-text">{{ (strtotime($value->aavak_date) ? date('d-m-Y', strtotime($value->aavak_date)) : '') }}</td>
                                                <td class="normal-text">{{ $value->prishthiy_no }}</td>
                                                <td class="normal-text">{{ (strtotime($value->prishthiy_date) ? date('d-m-Y', strtotime($value->prishthiy_date)) : '') }}</td>
                                                <td class="text-wrap normal-text">{{ $value->subject }}</td>
                                                <td class="text-wrap">
                                                    <a href="{{ url('view-letter/' . $value->id) }}"
                                                       class="btn btn-primary btn-sm normal-text" target="_blank">पत्र देखें</a>
                                                </td>
                                                <td class="text-wrap"><small class="text-success fw-bold normal-text">{{ $value->created_by }}</small></td>
                                                <td class="text-wrap"><small class="text-info fw-bold normal-text">{{ $value->updated_by }}</small></td>
                                                <td>
                                                    <a href="{{ url('create-letter/' . $value->id) }}"
                                                       class="btn btn-sm btn-primary btn-rounded edit normal-text"
                                                       data-id="{{ $value->id }}"><i
                                                            class="mdi mdi-pencil-box-outline"></i> Edit</a>
                                                    <button class="btn btn-sm btn-danger btn-rounded delete normal-text"
                                                            data-id="{{ $value->id }}"><i
                                                            class="mdi mdi-delete-forever"></i> Delete</button>
                                                </td>
                                            </tr>
                                        @endforeach
                                    @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->

    </div>
    <!-- main-panel ends -->
@endsection

@section('scripts')
    <script src="{{ asset('assets/libs/ckeditor/ckeditor.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.blockUI.js') }}"></script>
    <script>
        $(document).on('click', '.delete', function() {
            var id = $(this).data('id');
            if (confirm('क्या आप डिलीट करना चाहते हैं?')) {
                $.ajax({
                    url: '{{ url("delete-letter") }}',
                    type: "GET",
                    data: {
                        id: id
                    },
                    cache: false,
                    beforeSend: function() {
                        $('#blockUI').block({
                            message: '<h6>Processing...</h6>',
                            css: {
                                border: '1px solid #000'
                            }
                        });
                    },
                    success: function(response) {
                        if (response.status == 'success') {
                            Swal.fire("Great!", response.msg, "success").then(function() {
                                location.reload();
                            });
                        } else if (response.status == 'failed') {
                            Swal.fire("Sorry!", response.msg, "error");
                        }
                    },
                    complete: function() {
                        $('#blockUI').unblock();
                    },
                    error: function(xhr) {
                        console.log(xhr);
                        $('#blockUI').unblock();
                    }
                });
            } else {
                return false;
            }
        });
    </script>
    @endsection
