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
                    <h5 class="card-title mb-0 flex-grow-1">Last 5 TL Review Status / <small>पिछले 5 समीक्षा की स्थिति</small></h5>
                </div>
            </div>
            <div class=card-body>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                        <table class="table table-bordered" id="reviewTable">
                            <thead>
                                <tr>
                                    <th>#</th> <!-- Index Column -->
                                    <th>Review Title</th>
                                    <th>Task</th>
                                    <th>Office</th>
                                    <th class="text-center">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php $rowIndex = 0; @endphp
                                @foreach ($reviews as $review)
                                    @php $firstRowIndex = ++$rowIndex; @endphp
                                    <tr>
                                        <td rowspan="{{ count($review['tasks']) }}" class="align-middle text-center">{{ $firstRowIndex }}</td>
                                        <td rowspan="{{ count($review['tasks']) }}" class="align-middle">
                                            {{ $review['review_date'] }} -{{ $review['review_time']}} <br> {{ $review['review_title'] }}
                                        </td>
                                        <td>{{ $review['tasks'][0]['task_title'] }}</td>
                                        <td>{{ $review['tasks'][0]['department_name'] }}</td>
                                        @php
                                            $color = $review['tasks'][0]['status'] == 'REVIEWED' ? 'success' : 'warning';
                                        @endphp
                                        <td class="text-center">
                                            <span class="badge bg-{{ $color }}-subtle text-{{ $color }} text-uppercase">
                                                {{ $review['tasks'][0]['status'] }}
                                            </span>
                                        </td>
                                    </tr>
                                    @for ($i = 1; $i < count($review['tasks']); $i++)
                                        <tr>
                                            <td>{{ $review['tasks'][$i]['task_title'] }}</td>
                                            <td>{{ $review['tasks'][$i]['department_name'] }}</td>
                                            @php
                                                $color = $review['tasks'][$i]['status'] == 'REVIEWED' ? 'success' : 'warning';
                                            @endphp
                                            <td class="text-center">
                                                <span class="badge bg-{{ $color }}-subtle text-{{ $color }} text-uppercase">
                                                    {{ $review['tasks'][$i]['status'] }}
                                                </span>
                                            </td>
                                        </tr>
                                    @endfor
                                @endforeach
                            </tbody>
                        </table>

                        </div>
                        <div class="col-md-6">
                            <div id="chart"></div>
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
<script src="{{asset('assets/libs/apexcharts/apexcharts.min.js')}}"></script>
<script>
            let reviews = @json($reviews);
            let labels = [];
            let reviewedData = [];
            let notReviewedData = [];
            reviews.forEach(review => {
                labels.push(review.review_title);
                let reviewedCount = review.tasks.filter(task => task.status === 'REVIEWED').length;
                let notReviewedCount = review.tasks.filter(task => task.status === 'NOT-REVIEWED').length;
                reviewedData.push(reviewedCount);
                notReviewedData.push(notReviewedCount);
            });
            var options = {
                series: [{
                    name: 'Reviewed',
                    data: reviewedData
                }, {
                    name: 'Not Reviewed',
                    data: notReviewedData
                }],
                chart: {
                    type: 'bar',
                    height: 350
                },
                plotOptions: {
                    bar: {
                        horizontal: true,
                        columnWidth: '45%',
                        endingShape: 'rounded'
                    }
                },
                dataLabels: {
                    enabled: false
                },
                xaxis: {
                    categories: labels
                },
                yaxis: {
                    title: {
                        text: 'Task Count'
                    }
                },
                tooltip: {
                    shared: true,
                    intersect: false
                },
                fill: {
                    opacity: 1
                },
                colors: ['#13c56b', '#e8bc52']
            };
            var chart = new ApexCharts(document.querySelector("#chart"), options);
            chart.render();
        </script>
@endsection