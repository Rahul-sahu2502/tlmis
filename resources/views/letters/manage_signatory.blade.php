@extends('layouts.layout_admin')
@section('styles')
@endsection
@section('content')
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row" id="blockUI">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title normal-text">Manage Signatory</h4>
                            <hr>
                            <form class="forms-sample" id="manageForm">
                                @csrf
                                <input type="hidden" id="id" name="id"
                                    value="{{ @$editItem->id && $editItem->id ? $editItem->id : 0 }}">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="">पद:</label>
                                            <select name="signatory_id" id="signatory_id" class="form-control">
                                                <option value="">-- चुनें --</option>
                                                @if (@$signatoryList)
                                                    @foreach ($signatoryList as $value)
                                                        @php
                                                            $sel =
                                                                @$editItem->signatory_id == $value->id
                                                                    ? 'selected'
                                                                    : '';
                                                        @endphp
                                                        <option value="{{ $value->id }}" {{ $sel }}>
                                                            {{ $value->signatory }}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                            <small class="error"></small>
                                        </div>
                                    </div>

                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <label for="">अधिकारी का नाम:</label>
                                            <input type="text" name="officer_name" class="form-control" id="officer_name"
                                                value="{{ @$editItem->officer_name }}">
                                            <small class="error"></small>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary mt-4 normal-text">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title normal-text">Signatory List</h4>
                            <hr>
                            <div class="table-responsive">
                                <table class="table table-bordered datatable">
                                    <thead>
                                        <tr>
                                            <th width="40" class="text-center normal-text">SNo.</th>
                                            <th class="text-wrap text-center normal-text">पद</th>
                                            <th class="text-wrap text-center normal-text">अधिकारी</th>
                                            <th class="text-wrap text-center normal-text">Status</th>
                                            <th class="text-wrap text-center normal-text">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if (@$signatoryData)
                                            @foreach ($signatoryData as $key => $value)
                                                <tr>
                                                    <td class="text-center">{{ $key + 1 }}</td>
                                                    <td class="text-center normal-text">{{ $value->signatory }}</td>
                                                    <td class="text-center normal-text">{!! $value->officer_name !!}</td>
                                                    <td class="text-center normal-text status-td">
                                                        @if ($value->status == 'Y')
                                                            <span class="text-success fw-bold">Active</span>
                                                        @else
                                                            <span class="text-danger fw-bold">Inactive</span>
                                                        @endif
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="{{ url('manage-signatory/' . $value->officer_id) }}"
                                                            class="btn btn-sm btn-primary btn-rounded edit normal-text"
                                                            data-id="{{ $value->officer_id }}"><i
                                                                class="mdi mdi-pencil-box-outline"></i> Edit</a>
                                                        {{-- <button class="btn btn-sm btn-danger btn-rounded delete normal-text"
                                                            data-id="{{ $value->id }}"><i
                                                                class="mdi mdi-delete-forever"></i> Delete</button> --}}
                                                        <button
                                                            class="btn btn-sm btn-info btn-rounded edit normal-text change-status"
                                                            data-id="{{ $value->officer_id }}"><i
                                                                class="mdi mdi-swap-horizontal"></i> Change Status</button>
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
    </div>
@endsection

@section('scripts')
    <script src="{{ asset('assets/libs/ckeditor/ckeditor.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.blockUI.js') }}"></script>
    <script>
        $(document).on('submit', '#manageForm', function(e) {
            e.preventDefault();
            $('.is-invalid').removeClass('is-invalid');
            $('.invalid-feedback').removeClass('invalid-feedback').text('');
            var form = new FormData(this);
            $.ajax({
                url: '{{ url("submit-signatory-detail") }}',
                type: "POST",
                data: form,
                contentType: false,
                cache: false,
                processData: false,
                dataType: 'json',
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
                            location.href = '{{ url("manage-signatory") }}';
                        });
                    } else if (response.status == 'failed') {
                        if (response.msg && $.isEmptyObject(response.errors) == true) {
                            Swal.fire("Sorry!", response.msg, "error");
                        } else {
                            $.each(response.errors, function(index, value) {
                                $('#' + index).addClass('is-invalid');
                                $('#' + index + '~small.error').addClass('invalid-feedback')
                                    .text(value);
                            });
                        }
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
        });

        $(document).on('click', '.change-status', function(e) {
            e.preventDefault();
            var officer_id = $(this).data('id');
            $.ajax({
                url: '{{ url("change-signatory-status") }}',
                type: "GET",
                data: {
                    officer_id: officer_id
                },
                contentType: false,
                cache: false,
                dataType: 'json',
                context: this,
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
                        let td_status = (response.new_status == 'Y') ?
                            '<span class="text-success fw-bold">Active</span>' :
                            '<span class="text-danger fw-bold">Inactive</span>';

                        $(this).closest('tr').find('.status-td').html(td_status);
                        Swal.fire("Great!", response.msg, "success");
                    } else if (response.status == 'failed') {
                        if (response.msg && $.isEmptyObject(response.errors) == true) {
                            Swal.fire("Sorry!", response.msg, "error");
                        } else {
                            $.each(response.errors, function(index, value) {
                                $('#' + index).addClass('is-invalid');
                                $('#' + index + '~small.error').addClass('invalid-feedback')
                                    .text(value);
                            });
                        }
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
        });
    </script>
@endsection
