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
                <h5 class="card-title mb-0 flex-grow-1">Office wise report</h5>
            </div>
        </div>
        <div class=card-body>
            <div class="table-responsive table-card mb-4">
                <table class="table align-middle table-nowrap datatable mb-0" id=tasksTable>
                    <thead class="table-light text-muted">
                        <tr>
                            <th class=sort data-sort=id>S.No.</th>
                            <th class=sort data-sort=client_name>Offices</th>
                            <th class="sort text-center"  data-sort=total><span class="badge bg-info" style="font-size: 11px">Total Task</span></th>
                            <th class="sort text-center" data-sort=completed><span class="badge bg-success" style="font-size: 11px"> Completed Task</span></th>
                            <th class="sort text-center" data-sort=inprogress><span class="badge bg-danger" style="font-size: 11px">In-pogress Task</span></th>
                        </tr>
                    </thead>
                    <tbody id="tBody">
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

        get_list();
        function get_list(sData={}){
            $('.datatable').DataTable().destroy();
            $.ajax({
                url: "{{ route('offices_task_report_ajax') }}",
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}"
                },
                dataType:'json',
                success: function(response) {
                    $('#tBody').html('');
                    response.forEach((value, index) => {
                        const completed=value.completed==0?`<b>0</b>` :`<a target="_blank" title="Click to view list" href="task-status?search=4&d=${value.fk_dept_id}&sts=C"><b>${value.completed}</b></a>`;
                        const inprogress=value.inprogress==0?`<b>0</b>` :`<a target="_blank" title="Click to view list" href="task-status?search=4&d=${value.fk_dept_id}&sts=I"><b>${value.inprogress}</b></a>`;
                        const row = `
                            <tr>
                                <td>${index + 1}</td>
                                <td class="tasks_name">${value.department_eng} (${value.department_hin})</td>
                                <td class="total text-center"><a target="_blank" title="Click to view list" href="task-status?search=4&d=${value.fk_dept_id}&sts=A"><b>${value.total}</b></a></td>
                                <td class="completed text-center">${completed}</td>
                                <td class="inprogress text-center">${inprogress}</td>
                            </tr>
                        `;

                        $('#tBody').append(row); // Assuming your table body has the ID `task-table-body`.
                        // console.log(row);
                    });
                    $('.datatable').DataTable({
                        dom: '<"dt-top"lfB>rtip',
                        buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
                        language: {
                            search: "Search:",
                        },
                    });
                },
                error: function(xhr) {
                    console.log(xhr.responseText);
                },
            });
        }
    });
</script>
@endsection
