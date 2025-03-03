@extends('layouts.layout_admin')


@section('content')
<div class=row>
    <div class=col-lg-12>
        <div class=card id=tasksList>
            <div class="card-header border-0">
                <div class="d-flex align-items-center">
                    <h5 class="card-title mb-0 flex-grow-1"> User Ratings / उपयोगकर्ता रेटिंग</h5>
                    <div class="d-flex flex-wrap gap-2">
                        <button type="button" id="viewChart" class="btn btn-danger add-btn"><i
                                class="ri-eye-line align-bottom me-1"></i>View Chart</button>
                    </div>
                </div>
                {{-- <a class="mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#detailsToggleDiv" aria-expanded="false"
                        aria-controls="toggleDiv">See Details./ विवरण देखें</a> --}}
                <br>
                <span class="badge border border-secondary text-secondary w-100" id="detailsToggleDiv"
                    style="font-size: 0.8rem; text-align: left;">
                    <b>Note :</b>
                    <ol class="text-break">
                        <li class="mt-2 text-wrap">Total number of tasks assigned to each individual user./प्रत्येक उपयोगकर्ता को सौंपे गए कार्यों की कुल संख्या।</li>
                        <li class="mt-1 text-wrap">Average rating according to the total tasks./ कुल कार्यों के अनुसार औसत रेटिंग।</li>
                        <li class="mt-1 text-wrap">Click the action button to view assigned tasks./आवंटित कार्य देखने के लिए एक्शन बटन पर क्लिक करें।</li>
                    </ol>
                </span>
            </div>
            <div class=card-body>
                <div class="table-responsive table-card mb-4">
                    <table class="table align-middle table-nowrap datatable mb-0" id=tasksTable>
                        <thead class="table-light text-muted">
                            <tr>
                                <th class=sort data-sort=id>S.No.</th>
                                <th class=sort data-sort=client_name>User Name</th>
                                <th class=sort data-sort=client_name>Total Task</th>
                                <th class=sort data-sort=client_name>Average Rating</th>
                                <th class=sort data-sort=client_name>Give Rating</th>
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
                <div id="bar_chart"></div>
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

<!-- Rating  Script ### -->

<script>
    let arrChartData = [];
    let chart; // Global variable to store chart instance

    $(document).ready(function() {
        // AJAX call to get rating data
        $.ajax({
            url: "{{route('show_user_rating')}}",
            type: "POST",
            headers: {
                'X-CSRF-TOKEN': "{{ csrf_token() }}"
            },
            success: function(rating_data) {
                $('#tBody').html('');

                rating_data.forEach((value, index) => {
                    let ratingArr = value.total_rating.split(',').map(Number);
                    let avgRating = 0;
                    let stars = '';

                    if (ratingArr.length > 0) {
                        let eachRating = '';
                        for (let i = 0; i < ratingArr.length; i++) {
                            eachRating = ratingArr[i];
                            avgRating = avgRating + eachRating;
                        }
                        avgRating = avgRating / ratingArr.length;
                    }

                    var roundedAvg = Math.round(avgRating);
                    // console.log(roundedAvg);

                    var chartRoundedAvg = !isNaN(roundedAvg) ? roundedAvg : 0;

                    arrChartData.push({
                        'userName': value.full_name,
                        'userAvgRating': chartRoundedAvg
                    });

                    for (let i = 0; i < avgRating; i++) {
                        stars += '⭐ ';
                    }

                    const viewButton = `<a class="btn btn-info btn-xm" title="View" href="/performance/give-ratings?var=${btoa(value.user_id)}"><i class="ri-eye-line"></i></a>`;

                    const row = `
                    <tr>
                        <td>${index + 1}</td>
                        <td class="tasks_name">${value.full_name}</td>
                        <td class="tasks_name">${value.total_task}</td>
                        <td class="tasks_name">${stars}</td>
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

                console.log("Chart Data Array " + JSON.stringify(arrChartData));

                // Initialize chart 
                initializeChart();
            }
        });

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
    function initializeChart() {
        let chartElement = document.getElementById("bar_chart");

        let categories = arrChartData.map(user => user.userName);
        let ratings = arrChartData.map(user => user.userAvgRating);

        // console.log('categories ::' + categories);
        // console.log('ratings ::' + ratings);


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
            series: [{
                name: 'Average Rating',
                data: ratings
            }],
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
                text: 'User Ratings'
            },
            xaxis: {
                categories: categories,
                title: {
                    text: 'Rating'
                },
                min:0,
                max:5,
                tickAmount:5
            },
            yaxis: {
                title: {
                    text: 'Users'
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
            colors: chartColors.length ? chartColors : ['#ffcc00'],
            legend: {
                position: 'top',
                horizontalAlign: 'left',
                offsetX: 40
            }
        };

        chart = new ApexCharts(document.querySelector("#bar_chart"), options);
        chart.render();
    }
</script>
@endsection