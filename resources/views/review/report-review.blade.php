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
                    <h5 class="card-title mb-0 flex-grow-1"> Review Wise Task Status  / <small>साप्ताहिक समीक्षानुसार कार्यों की स्थिति</small></h5>
                </div>
            </div>
            <div class=card-body>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Review </th>
                                        <th class="text-center">Total Tasks</th>
                                        <th class="text-center">Reviewed Tasks</th>
                                        <th class="text-center">Not Reviewed Tasks</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($reportData as $report)
                                    @php
                                    $totalTasks = $reviewedTasks = $notReviewedTasks = 0;
                                        $totalTasks += $report['total_tasks'];
                                        $reviewedTasks += $report['reviewed_tasks'];
                                        $notReviewedTasks += $report['not_reviewed_tasks'];
                                    @endphp
                                        <tr>
                                            <td>{{ $report['review_date'] }} -{{ $report['review_time']}} <br> {{ $report['review_title'] }}</td>
                                            <td class="text-center">{{ $report['total_tasks'] }}</td>
                                            <td class="text-center">{{ $report['reviewed_tasks'] }}</td>
                                            <td class="text-center">{{ $report['not_reviewed_tasks'] }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>TOTAL</th>
                                        <th class="text-center">{{ $totalTasks }}</th>
                                        <th class="text-center">{{ $reviewedTasks }}</th>
                                        <th class="text-center">{{ $notReviewedTasks }}</th>
                                    </tr>
                                </tfoot>
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
<script src="{{asset('assets/libs/datatable/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.flash.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.html5.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/buttons.print.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/jszip.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/pdfmake.min.js')}}"></script>
<script src="{{asset('assets/libs/datatable/vfs_fonts.js')}}"></script>
@endsection