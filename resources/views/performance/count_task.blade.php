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
                        <h5 class="card-title mb-0 flex-grow-1">User Task Status / उपयोगकर्ता कार्य स्थिति</h5>
                        <div class="d-flex flex-wrap gap-2">
                            <button type="button" id="viewChart" class="btn btn-danger add-btn"><i
                                    class="ri-eye-line align-bottom me-1"></i>View Chart</button>
                        </div>
                    </div>
                    {{-- <a class="mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#detailsToggleDiv"
                            aria-expanded="false" aria-controls="toggleDiv">See Details./ विवरण देखें</a> --}}
                    <br>
                    <span class="badge border border-secondary text-secondary w-100" id="detailsToggleDiv"
                        style="font-size: 0.8rem; text-align: left;">
                        <b>Note :</b>
                        <ol class="text-break">
                            <li class="mt-2 lh-base text-wrap">How many tasks are assigned to each individual user./प्रत्येक उपयोगकर्ता को
                                कितने कार्य सौंपे गए हैं</li>
                            <li class="mt-1 lh-base text-wrap">The total number of completed tasks./कुल पूरे किए गए कार्यों की संख्या</li>
                            <li class="mt-1 lh-base text-wrap">How many tasks have been replied to by a user./उपयोगकर्ता द्वारा कितने कार्यों
                                का उत्तर दिया गया है|</li>
                        </ol>
                    </span>
                </div>
                <div class=card-body>
                    <div class="table-responsive table-card mb-4">
                        <table class="table align-middle datatable mb-0 w-100" width=100% id=tasksTable>
                            <thead class="table-light text-muted">
                                <tr>
                                    <th width="8%" class=sort data-sort=id>S.No</th>
                                    <th width="28%" class=sort data-sort=client_name>User Name</th>
                                    <th width="16%" class="sort text-center" data-sort=total><span class="badge bg-info"
                                            style="font-size: 12px">Total Task</span></th>
                                    <th width="16%" class="sort text-center" data-sort=total><span class="badge bg-success"
                                            style="font-size: 12px">Completed Task</span></th>
                                    <th width="16%" class="sort text-center" data-sort=total><span class="badge bg-warning"
                                            style="font-size: 12px">Number of Reply </span></th>
                                    <!-- <th width="16%" class="sort text-center" data-sort=total><span class="badge bg-danger"
                                                            style="font-size: 12px">Pending Task</span></th> -->

                                </tr>
                            </thead>
                            <tbody id="tBody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- ### Chart Container ###-->
            <div class="card" id="chartContainer" style="display: none;">
                <div class="card-header">

                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1"> User Task Chart </h5>
                        @if(Session::get('level_id') == "1")
                        <div class=flex-shrink-0>
                            <div class="d-flex flex-wrap gap-2">
                                <button type="button" id="closeChart" class="btn btn-secondary add-btn"><i
                                        class="ri-eye-line align-bottom me-1"></i>View Task Table</button>
                            </div>
                        </div>
                        @endif
                    </div>
                </div><!-- end card header -->

                <div class="card-body">
                    <!-- <style>
                        @media (min-width:1281px) {
                            #bar_chart {
                                min-height: 100vh;
                                width: 120vh;
                            }
                        }
                    </style> -->
                    <div id="bar_chart" data-chart='{{ $chartData }}' data-colors='["--vz-success", "--vz-warning","--vz-danger","--vz-primary"]'></div>
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="{{asset('assets/libs/apexcharts/apexcharts.min.js')}}"></script>

    <!-- ====Task Count data Display JS===== -->
    <script>
        $(document).ready(function() {
            $.ajax({
                url: "{{route('user_count_task')}}",
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}"
                },
                success: function(count_data) {
                    // console.log(count_data);
                    $('#tBody').html('');
                    count_data.forEach((value, index) => {

                        const row = `
                    <tr>
                        <td>${index + 1}</td>
                        <td class="tasks_name">${value.full_name}</td>
                        <td class="total text-center"><b>${value.total_task}</b></td>
                        <td class="total text-center"><b>${value.total_completed}</b></td>
                        <td class="total text-center"><b>${value.number_of_reply}</b></td>


                    </tr>
                    `;
                        $('#tBody').append(row);
                    });

                   $('#tasksTable').DataTable({
                        paginate: true,
                        language: {
                           search: "Search:",
                       },
                    });
                }
            })
        });
    </script>



    <!-- ====Task Chart Display data JS===== -->
    <script>
        $(document).ready(function() {
            $('#viewChart').click(function() {
                $('#tasksList').hide();
                $('#chartContainer').show();
            });

            $('#closeChart').click(function() {
                $('#tasksList').show();
                $('#chartContainer').hide();
            });
        });



        document.addEventListener("DOMContentLoaded", function() {
            let chartElement = document.getElementById("bar_chart");

            // Get chart data from data attribute
            let chartData = JSON.parse(chartElement.getAttribute("data-chart"));

            let categories = chartData.map(user => user.full_name);
            // let totalTasks = chartData.map(user => user.total_task);
            let completedTasks = chartData.map(user => user.total_completed);
            let replies = chartData.map(user => user.number_of_reply);
            // let noReplies = chartData.map(user => user.no_reply);

            // Extract CSS variable colors dynamically
            function getChartColorsArray(id) {
                let element = document.getElementById(id);
                if (!element) return [];
                let colors = element.getAttribute("data-colors");
                if (colors) {
                    colors = JSON.parse(colors.replace(/'/g, '"'));
                    return colors.map(color => getComputedStyle(document.documentElement).getPropertyValue(color).trim());
                }
                return [];
            }

            let chartColors = getChartColorsArray("bar_chart");

            var options = {
                series: [
                    // {
                    //     name: 'Total Tasks',
                    //     data: totalTasks
                    // },
                    {
                        name: 'Completed Tasks',
                        data: completedTasks
                    },
                    {
                        name: 'Replies',
                        data: replies
                    },
                    // {
                    // name: 'No Replies',
                    // data: noReplies
                    // }
                ],
                chart: {
                    type: 'bar',
                    height: 400,
                    stacked: true
                },
                plotOptions: {
                    bar: {
                        horizontal: true,
                        dataLabels: {
                            total: {
                                enabled: false,
                                style: {
                                    fontSize: '13px',
                                    fontWeight: 900
                                }
                            }
                        }
                    }
                },
                title: {
                    text: 'Task Performance by User'
                },
                xaxis: {
                    categories: categories
                },
                yaxis: {
                    title: {
                        text: ''
                    }
                },
                tooltip: {
                    y: {
                        formatter: val => val
                    }
                },
                fill: {
                    opacity: 1
                },
                colors: chartColors.length ? chartColors : undefined, // Apply dynamic colors if available
                legend: {
                    position: 'top',
                    horizontalAlign: 'left',
                    offsetX: 40
                }
            };

            var chart = new ApexCharts(document.querySelector("#bar_chart"), options);
            chart.render();
        });
    </script>





@endsection