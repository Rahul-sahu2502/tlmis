<?php $__env->startSection('content'); ?>
<div class=row>
    <div class=col-lg-12>
        <!-- ### Table Container ###-->
        <div class=card id=tasksList>
            <div class="card-header border-0">
                <div class="d-flex align-items-center">
                    <h5 class="card-title mb-0 flex-grow-1"> User Ratings / उपयोगकर्ता रेटिंग</h5>
                    <?php if(Session::get('level_id') == "1"): ?>
                    <div class=flex-shrink-0>
                        <div class="d-flex flex-wrap gap-2">
                            <button type="button" id="viewChart" class="btn btn-danger add-btn"><i
                                    class="ri-eye-line align-bottom me-1"></i>View Chart</button>
                        </div>
                    </div>
                    <?php endif; ?>
                </div>
                <a class="mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#detailsToggleDiv" aria-expanded="false"
                    aria-controls="toggleDiv">See Details./ विवरण देखें</a>
                <br>
                <span class="badge border border-secondary text-secondary collapse  w-100" id="detailsToggleDiv"
                    style="font-size: 0.8rem; text-align: left;">
                    <b>Note :</b>
                    <ol class="text-break">
                        <li class="mt-2">Total number of tasks assigned to each individual user./प्रत्येक उपयोगकर्ता को सौंपे गए कार्यों की कुल संख्या।</li>
                        <li class="mt-1">Average rating according to the total tasks./ कुल कार्यों के अनुसार औसत रेटिंग।</li>
                        <li class="mt-1">Click the action button to view assigned tasks./आवंटित कार्य देखने के लिए एक्शन बटन पर क्लिक करें।</li>
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
                    <h5 class="card-title mb-0 flex-grow-1"> User Ratings Chart </h5>
                    <?php if(Session::get('level_id') == "1"): ?>
                    <div class=flex-shrink-0>
                        <div class="d-flex flex-wrap gap-2">
                            <button type="button" id="closeChart" class="btn btn-secondary add-btn"><i
                                    class="ri-eye-line align-bottom me-1"></i>View Task Table</button>
                        </div>
                    </div>
                    <?php endif; ?>
                </div>
            </div><!-- end card header -->

            <div class="card-body">
                <style>
                    @media (min-width:1281px) {
                        #bar_chart {
                            min-height: 100vh;
                            width: 120vh;
                        }
                    }
                </style>
                <div id="bar_chart" data-colors='["--vz-success"]' class="apex-charts" dir="ltr"></div>

            </div>

        </div>

    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
<script src="<?php echo e(asset('assets/libs/list.js/list.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/list.pagination.js/list.pagination.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/jquery.dataTables.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/dataTables.buttons.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.flash.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.html5.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.print.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/jszip.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/pdfmake.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/vfs_fonts.js')); ?>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
    integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<?php echo e(asset('assets/libs/apexcharts/apexcharts.min.js')); ?>"></script>
<script>
    $(document).ready(function() {
        $.ajax({
            url: "<?php echo e(route('show_user_rating')); ?>",
            type: "POST",
            headers: {
                'X-CSRF-TOKEN': "<?php echo e(csrf_token()); ?>"
            },
            success: function(rating_data) {
                console.log('rating data = ', rating_data);
                $('#tBody').html('');
                rating_data.forEach((value, index) => {

                    // if (value.submitted_date == null) {
                    //     var task_submit_date = 'Task Not Submitted';
                    // } else {
                    //     task_submit_date = value.submitted_date;
                    // }
                    var rating = '⭐⭐⭐';
                    const viewButton = `<a class="btn btn-info btn-xm" title="View" href="/performance/give-ratings?var=${btoa(value.user_id)}"><i class="ri-eye-line"></i></a>`;


                    const row = `
                        <tr>
                                    <td>${index + 1}</td>
                                    <td class="tasks_name">${value.full_name}</td>
                                    <td class="tasks_name">${value.total_task}</td>
                                    <td class="tasks_name">${rating}</td>
                                     <td>${viewButton}</td>
                                    
                                    
                        </tr>
                            `;
                    $('#tBody').append(row);
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


    // BAR Chart
    var options1 = {
        series: [{
            data: [400, 430, 448, 470, 540, 580, 690]
        }],
        chart: {
            type: 'bar',
            height: 350
        },
        plotOptions: {
            bar: {
                borderRadius: 4,
                borderRadiusApplication: 'end',
                horizontal: true,
            }
        },
        dataLabels: {
            enabled: false
        },
        xaxis: {
            categories: ['South Korea', 'Canada', 'United Kingdom', 'India', 'Italy', 'France', 'Japan'],
        }
    };

    var chart = new ApexCharts(document.querySelector("#bar_charts"), options1);
    chart.render();






    // Stacked Chart
    var options2 = {
        series: [{
            name: 'Marine Sprite',
            data: [44, 55, 41, 37, 22, 43, 21]
        }, {
            name: 'Striking Calf',
            data: [53, 32, 33, 52, 13, 43, 32]
        }, {
            name: 'Tank Picture',
            data: [12, 17, 11, 9, 15, 11, 20]
        }, {
            name: 'Bucket Slope',
            data: [9, 7, 5, 8, 6, 9, 4]
        }, {
            name: 'Reborn Kid',
            data: [25, 12, 19, 32, 25, 24, 10]
        }],
        chart: {
            type: 'bar',
            height: 350,
            stacked: true,
            stackType: '100%'
        },
        plotOptions: {
            bar: {
                horizontal: true,
            },
        },
        stroke: {
            width: 1,
            colors: ['#fff']
        },
        title: {
            text: '100% Stacked Bar'
        },
        xaxis: {
            categories: [2008, 2009, 2010, 2011, 2012, 2013, 2014],
        },
        tooltip: {
            y: {
                formatter: function(val) {
                    return val + "K"
                }
            }
        },
        fill: {
            opacity: 1

        },
        legend: {
            position: 'top',
            horizontalAlign: 'left',
            offsetX: 40
        }
    };

    var chart = new ApexCharts(document.querySelector("#bar_chart"), options2);
    chart.render();
</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/performance/rating.blade.php ENDPATH**/ ?>