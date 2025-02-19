@extends('layouts.layout_admin')
@section('styles')
    <link rel="stylesheet" href="{{asset('assets/libs/datatable/dataTables.bootstrap5.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('assets/libs/datatable/buttons.dataTables.min.css')}}"/>
@endsection
@section('content')
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=usersList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Users Login/Log-out Details / <small> उपयोगकर्ताओं लॉग इन एवं लॉग आउट की जानकारी</small></h5>
                       {{-- <div class=flex-shrink-0>
                            <div class="d-flex flex-wrap gap-2">
                                <a href="{{route('add-user')}}" class="btn btn-danger add-btn"><i
                                        class="ri-add-line align-bottom me-1"></i> Add New </a>
                            </div>
                        </div>--}}
                    </div>
                </div>
                <div class="card-body border border-dashed border-end-0 border-start-0">
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
                    {{--<form>
                        <div class="row g-3">
                            <div class="col-xxl-5 col-sm-12">
                                <div class=search-box>
                                    <input type=text class="form-control search bg-light border-light"
                                           placeholder="Search for users or something...">
                                    <i class="ri-search-line search-icon"></i>
                                </div>
                            </div>
                            <div class="col-xxl-3 col-sm-4">
                                <input type=text class="form-control bg-light border-light"
                                       id=demo-datepicker data-provider=flatpickr data-date-format="d M, Y"
                                       data-range-date=true placeholder="Select date range">
                            </div>
                            <div class="col-xxl-3 col-sm-4">
                                <div class=input-light>
                                    <select class=form-control data-choices data-choices-search-false
                                            name=choices-single-default id=idStatus>
                                        <option value>Status</option>
                                        <option value=all selected>All</option>
                                        <option value=New>New</option>
                                        <option value=Pending>Pending</option>
                                        <option value=Inprogress>Inprogress</option>
                                        <option value=Completed>Completed</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xxl-1 col-sm-4">
                                <button type=button class="btn btn-primary w-100">
                                    <i class="ri-equalizer-fill me-1 align-bottom"></i>
                                    Filter
                                </button>
                            </div>
                        </div>
                    </form>--}}
                </div>
                <div class=card-body>
                    <div class="table-responsive mb-4">
                        <table class="table table-bordered datatable mb-0" id=usersTable>
                            <thead class="table-light text-muted">
                            <tr>
                                <th class=sort data-sort=id>S.No.</th>
                                <th class=sort data-sort=user_name>UserId</th>
                                <th class=sort data-sort=full_name>Name</th>
                                <th class=sort data-sort=current_status>Status</th>
                                <th class=sort data-sort=timedate>Login/Logout Datetime</th>
                                <th class=sort data-sort=Level>Level</th>
                                <th class=sort data-sort=designation>Designation</th>
                                <th class=sort data-sort=department>Offices</th>
                            </tr>
                            </thead>
                            <tbody class="list form-check-all">
                            @if(isset($loginRecords) && !empty($loginRecords))
                                @foreach ($loginRecords as $login)
                                    <tr>
                                        <td>{{ $loop->index+1 }}</td>
                                        <td class=user_name>{{ $login->relatedUser->username }}</td>
                                        <td class=full_name>{{ $login->relatedUser->full_name }}</td>
                                        <td class=status>@if($login->current_status=="IN")
                                                            <span class="badge badge-gradient-success"> {{ "Logged In" }} </span>
                                            @elseif($login->current_status=="OUT")
                                                <span class="badge badge-gradient-danger"> {{ "Logged Out" }} </span>
                                            @endif
                                        </td>
                                        <td class=status> {{
                                                $login->current_status === 'IN'
                                                ? \Carbon\Carbon::parse($login->login_datetime)->format('d-m-Y H:i:s')
                                                : (
                                                    $login->current_status === 'OUT'
                                                    ? \Carbon\Carbon::parse($login->logged_out_datetime)->format('d-m-Y H:i:s')
                                                    : 'N/A'
                                                )
                                            }}
                                        </td>
                                        <td class=level>
                                            @if ($login->relatedUser->levels->isNotEmpty())
                                                {{ $login->relatedUser->levels->first()->level }}
                                            @endif
                                        </td>
                                        <td class=designation>
                                            @foreach ($login->relatedUser->designations as $designation)
                                                {{ $designation->designation }}
                                            @endforeach
                                        </td>
                                        <td class=department>
                                            @php
                                                $offices = [];
                                                if($login != null && $login->relatedUser->userMaps != null){
                                                    $offices = $login->relatedUser->userMaps->filter(function ($map) {
                                                        return !empty($map->department);
                                                    })->map(function ($map) {
                                                        return $map->department->department_eng . ' (' . $map->department->department_hin . ')';
                                                    });
                                                }

                                            @endphp

                                            @if(sizeof($offices) > 1)
                                                {{ $offices->implode(', ') }}
                                            @elseif(!empty($offices))
                                                {{ $offices->first() }}
                                            @endif

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
    <script>
        $(document).ready(function () {
            $('.datatable').DataTable({
                dom: '<"dt-top"lfB>rtip',
                buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
                language: {
                    search: "Search:",
                },
            });
        });
    </script>
@endsection
