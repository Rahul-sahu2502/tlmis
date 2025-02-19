@extends('layouts.layout_admin')
@section('styles')
    <link rel="stylesheet" href="{{asset('assets/libs/datatable/dataTables.bootstrap5.min.css')}}" />
    <link rel="stylesheet" href="{{asset('assets/libs/datatable/buttons.dataTables.min.css')}}" />
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
                                    <th class=sort data-sort=client_name>User Name</th>
                                    <th class="sort text-center" data-sort=total><span class="badge bg-info"
                                            style="font-size: 11px">Total Task</span></th>
                                    {{-- <th class="sort text-center" data-sort=completed><span class="badge bg-success"
                                            style="font-size: 11px"> Completed Task</span></th>
                                    <th class="sort text-center" data-sort=inprogress><span class="badge bg-danger"
                                            style="font-size: 11px">In-pogress Task</span></th> --}}
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <div>
        <h1>Hello Count</h1>
    </div>

    <script>
        $(document).ready(function () {
            $.ajax({
                url: "{{route('user_task_performance')}}",
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}"
                },
                success: function (data) {
                    console.log(data);
                    $('#tBody').html('');
                    data.forEach((value, index) => {
                        const row = `
                        <tr>
                                    <td>${index + 1}</td>
                                    <td class="tasks_name">${value.fullName}</td>
                                    <td class="total text-center"><a target="_blank" title="Click to view list" ><b>${value.totalCount}</b></a></td>
                        </tr>
                            `;
                        $('#tBody').append(row);
                    });
                }
            })
        });
    </script>
@endsection