@extends('layouts.layout_admin')
@section('styles')
<link rel="stylesheet" href="{{asset('assets/libs/datatable/dataTables.bootstrap5.min.css')}}" />
<link rel="stylesheet" href="{{asset('assets/libs/datatable/buttons.dataTables.min.css')}}"/>
@endsection
@section('content')
<div class=row>
<div class=col-lg-12>
    <div class=card id=tasksList>
        <div class="card-header border-0">
            <div class="d-flex align-items-center">
                <h5 class="card-title mb-0 flex-grow-1">Task Allocate / <small> कार्य आवंटित करें</small></h5>
            </div>
        </div>
        <div class=card-body>
            <div class="table-responsive table-card mb-4">
                <table class="table align-middle table-nowrap datatable mb-0" id=tasksTable>
                    <thead class="table-light text-muted">
                        <tr>
                            <th class=sort data-sort=id>S.No.</th>
                            <th class=sort data-sort=tasks_name>Task</th>
                            <th class=sort data-sort=client_name>Department</th>
                            <th class=sort data-sort=entry_date>Task Entry Date</th>
                            <th class=sort data-sort=due_date>Task Due Date</th>
                            <th class=sort data-sort=status>Status</th>
                            <th class=sort data-sort=priority>Priority</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="list form-check-all">
                        @foreach ($list as $value)
                        @php
                            $sts = "Inprogress";$color="primary";
                            if($value->status == "P"){ $sts = "Pending";$color="secondary";}
                            elseif ($value->status == "C"){ $sts = "Completed";$color="success";}

                        @endphp
                        <tr>
                            <td>{{ $loop->index+1 }}</td>
                            <td class=tasks_name>{{ $value->title }}</td>
                            <td class=client_name>
                                @foreach (explode(',', $value->department_eng) as $val)
                                {{$loop->index+1 .". ". $val }}<br>
                                @endforeach
                            </td>
                            <td class=entry_date>{{ date("d M,Y", strtotime($value->entry_date)) }}</td>
                            <td class=due_date>{{ date("d M,Y", strtotime($value->due_date)) }}</td>
                            <td class=status>
                                <span class="badge bg-{{ $color }}-subtle text-{{ $color }} text-uppercase">{{ $sts }}</span>
                            </td>
                            <td class=priority><span class="badge bg-{{ $value->fk_task_priority_id==1?"success":"danger"}} text-uppercase">{{ $value->priority }}</span></td>
                            <td>
                                <a class="btn btn-info btn-xm" title="View" href="{{url('task-overview?var=').base64_encode($value->task_id) }}"> <i class="ri-eye-line"></i></a>
                                @if($value->status!="C")
                                    <a class="btn btn-primary btn-xm" title="Allocate task" href="{{url('task-allocate?var=').base64_encode($value->task_id) }}">Allocate</a>
                                @endif
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
    $(jQuery).ready(function() {
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
