@extends('layouts.layout_admin')
@section('styles')
<link rel="stylesheet" href="{{asset('assets/libs/datatable/dataTables.bootstrap5.min.css')}}" />
<link rel="stylesheet" href="{{asset('assets/libs/datatable/buttons.dataTables.min.css')}}"/>
@endsection
@section('content')
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=usersList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Send back request list/अनुरोध सूची</h5>
                    </div>
                </div>
                {{-- <div class="card-body border border-dashed border-end-0 border-start-0">
                    @if (Session::has('success'))
                        <div class="alert alert-success">
                            {{ Session::get('success') }}
                        </div>
                    @endif

                    @if (Session::has("error"))
                        <div class="alert alert-danger">
                            {{ Session::get('error') }}
                        </div>
                    @endif
                </div> --}}
                <div class=card-body>
                    <div class="table-responsive mb-4">
                        <table class="table table-bordered datatable mb-0" id=usersTable>
                            <thead class="table-light text-muted">
                            <tr>
                                <th class=sort data-sort=id>S.No.</th>
                                <th class=sort data-sort=task_title>Task Title</th>

                                <th class=sort data-sort=full_name>User Details</th>
                                {{-- <th class=sort data-sort=mobile>Mobile Number</th>
                                <th class=sort data-sort=dept>Department</th> --}}

                                <th class=sort data-sort=sb_req_remark>Request Remark</th>
                                <th class=sort data-sort=send_back_date>Request Date</th>
                                <th>Action Remark</th>
                                <th class=sort data-sort=action_date>Action Date</th>
                                <th class=sort data-sort=status>Status</th>
                                <th class=sort width="12%" data-sort=action>Action</th>
                            </tr>
                            </thead>
                            <tbody class="list form-check-all">
                            @if(isset($list) && !empty($list))
                            @foreach ($list as $value)
                            @php
                                $sts = "Pending";$color="primary";
                                if($value->send_back_status == "R"){ $sts = "Rejected";$color="danger";}
                                elseif ($value->send_back_status == "A"){ $sts = "Approved";$color="success";}
                            @endphp
                                <tr>
                                    <td>{{ $loop->index+1 }}</td>
                                    <td class=task_title>{{ $value->title }}</td>
                                    <td class=full_name>
                                        <b>Name: </b>{{ $value->full_name }}<br>
                                        <b>Mobile: </b>{{ $value->mobile }}<br>
                                        <b>Depatment: </b>{{ $value->department_eng }}
                                    </td>
                                    {{-- <td class=mobile>{{ $value->mobile }}</td> --}}
                                    {{-- <td class=dept>{{ $value->department_eng }}</td> --}}

                                    <td class=sb_req_remark>{{ $value->send_back_remark }}</td>
                                    <td class=send_back_date>{{ $value->send_back_date }}</td>

                                    <td>{{ $value->sb_action_remark }}</td>
                                    <td>{{ $value->sb_action_date }}</td>

                                    <td class=status><span class="badge bg-{{ $color }}-subtle text-{{ $color }} text-uppercase">{{ $sts }}</span></td>
                                    <td class=edit>
                                        <a class="btn btn-info btn-xm" title="View task details" href="{{url('task-overview?var=').base64_encode($value->task_id) }}"><i class="ri-eye-line"></i></a>
                                        @if($value->send_back_status=="P" && Session::get('level_id')=='1')
                                        <button class="btn btn-success btn-xm change_status" type="button" id="approve" title="Approve" value="{{ base64_encode($value->task_id.'_'.$value->fk_map_id.'_'.$value->td_sb_id.'_A') }}"><i class=" ri-thumb-up-fill"></i></button>
                                        <button class="btn btn-danger btn-xm change_status" type="button" id="reject" title="Reject" value="{{ base64_encode($value->task_id.'_'.$value->fk_map_id.'_'.$value->td_sb_id.'_R') }}"><i class=" ri-thumb-down-fill"></i></button>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                            @endif
                            </tbody>
                        </table>
                    </div>
                    {{-- <div class="d-flex justify-content-end mt-2">
                        <div class="pagination-wrap hstack gap-2">
                            <a class="page-item pagination-prev disabled" href=#>
                                Previous
                            </a>
                            <ul class="pagination listjs-pagination mb-0"></ul>
                            <a class="page-item pagination-next" href=#>
                                Next
                            </a>
                        </div>
                    </div> --}}
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    <script src="{{asset('assets/libs/list.js/list.min.js')}}"></script>
    <script src="{{asset('assets/libs/list.pagination.js/list.pagination.min.js')}}"></script>
    <script src="{{asset('assets/libs/list.js/list.min.js')}}"></script>
    <script src="{{asset('assets/libs/list.pagination.js/list.pagination.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.flash.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.html5.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.print.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/jszip.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/pdfmake.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/vfs_fonts.js')}}"></script>
    @include('tasks.sb_request_list_js')
@endsection
