@extends('layouts.layout_admin')


@section('content')
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=tasksList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1"> Task Delay Count / कार्य विलंब गणना</h5>
                        <div class="d-flex flex-wrap gap-2">
                            <button type="button" id="viewChart" class="btn btn-danger add-btn"><i
                                    class="ri-eye-line align-bottom me-1"></i>View Chart</button>
                        </div>
                    </div>
                    {{-- <a class="mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#detailsToggleDiv"
                            aria-expanded="false" aria-controls="toggleDiv">See Details./ विवरण देखें</a> --}}
                    <br>
                    <span class="badge border border-secondary text-secondary w-100" id="detailsToggleDiv" style="font-size: 0.8rem; text-align: left;">
                        <b>Note :</b>
                        <ol>
                            <li class="mt-2 lh-base text-wrap">If a task is completed after its due date, the extra days are calculated as a
                                delay.
                                / यदि कोई कार्य अपनी नियत तारीख के बाद पूरा होता है, तो अतिरिक्त दिन देरी के रूप में गणना
                                किए जाते हैं।</li>
                            <li class="mt-1 lh-base text-wrap">By clicking the action button, you can see how many users have been assigned this task./एक्शन बटन पर क्लिक करके आप देख सकते हैं कि यह कार्य कितने उपयोगकर्ताओं को सौंपा गया है।</li>

                        </ol>
                    </span>
                </div>
                <div class=card-body>
                    <div class="table-responsive table-card mb-4">
                        <table class="table align-middle table-nowrap datatable mb-0" id=tasksTable>
                            <thead class="table-light text-muted">
                                <tr>
                                    <th class=sort data-sort=id>S.No.</th>
                                    <th class=sort data-sort=client_name>Task</th>
                                    <th class=sort data-sort=entry_date>Task Entry Date</th>
                                    <th class=sort data-sort=due_date>Task Due Date</th>
                                    <th class=sort data-sort=submit_date>Submit Date</th>
                                    <th class=sort data-sort=delay_date>Total Delay (days)</th>
                                    <th>Action</th>

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
                        <h5 class="card-title mb-0 flex-grow-1"> Task Delay Chart </h5>
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
                    <style>
                        @media (min-width:1281px) {
                            #bar_chart {
                                min-height: 80vh;
                                width: 80vh;
                            }
                        }
                    </style>
                    <div id="bar_chart"
                        data-chart='{{ $chartData }}'
                        data-colors='["#28a745", "#007bff", "#ffc107", "#dc3545"]'>
                    </div>


                </div>
            </div>
        </div>
        <!-- end col -->
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

<!-- <script src="{{asset('assets/js/pages/apexcharts-bar.init.js"')}}"></script> -->
<!-- <script src="assets/libs/chart.js/chart.umd.js"></script> -->

<!-- ====Task Delay Display data JS===== -->
<script>
    $(document).ready(function() {
        $.ajax({
            url: "{{route('task_delay_date')}}",
            type: "POST",
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            success: function(response) {
                let delay_data = response;


                console.log('dealy data = ', delay_data);
                $('#tBody').html('');
                delay_data.forEach((value, index) => {

                    var new_submitted_date = '';

                    if (!isNaN(Date.parse(value.submitted_date))) {
                        new_submitted_date = `${new Date(value.submitted_date).toLocaleDateString('en-US', {
                                day: '2-digit',
                                month: 'short',
                                year: 'numeric'
                            })}`;

                    } else {
                        new_submitted_date = value.submitted_date;
                    }

                    const viewButton = `<a class="btn btn-info btn-xm" title="View" href="/task-overview?var=${btoa(value.task_id)}">
                        <i class="ri-eye-line"></i></a>`;

                    const row = `
                            <tr>
                                        <td>${index + 1}</td>
                                        <td class="tasks_name">${value.title}</td>
                                        <td class="total text-center"><b>${new Date(value.entry_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>
                                        <td class="total text-center"><b>${new Date(value.due_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>                                                        
                                        <td class="total text-center"><b>${new_submitted_date}</b></td>
                                        <td class="total text-center"><b>${value.difference_in_days}</b></td>
                                        <td>${viewButton}</td>
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


        // Chart show/hide controls
        $('#viewChart').click(function() {
            $('#tasksList').hide();
            $('#chartContainer').show();
        });

        $('#closeChart').click(function() {
            $('#tasksList').show();
            $('#chartContainer').hide();
        });

    });



    // Chart Implement JS
    document.addEventListener("DOMContentLoaded", function() {
        let chartElement = document.getElementById("bar_chart");

        if (!chartElement) return;

        // Get chart data from the div attributes
        let chartData = JSON.parse(chartElement.getAttribute("data-chart"))[0]; // Get first object since query returns an array
        let chartColors = JSON.parse(chartElement.getAttribute("data-colors"));

        // Extracting task counts
        let seriesData = [
            chartData.Complete_tasks || 0,
            chartData.Inprocess_tasks || 0,
            chartData.Pending_tasks || 0,
            chartData.Delay_tasks || 0
        ];

        let categories = ["Completed Tasks", "In Progress Tasks", "Pending Tasks", "Delayed Tasks"];

        let options = {
            series: [{
                name: "Tasks Count",
                data: seriesData
            }],
            chart: {
                type: 'bar',
                height: 400,
                stacked: false
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '60%',
                    distributed: true // Different colors for each bar
                }
            },
            colors: chartColors, // Apply colors dynamically
            title: {
                text: 'Task Performance Overview',
                align: 'center'
            },
            xaxis: {
                categories: categories
            },
            yaxis: {
                title: {
                    text: 'Status of Tasks'
                }
            },
            tooltip: {
                y: {
                    formatter: function(val) {
                        return val + " tasks";
                    }
                }
            },
            legend: {
                show: false // Hide legend since colors are already set per category
            }
        };

        var chart = new ApexCharts(chartElement, options);
        chart.render();
    });
</script>

@endsection