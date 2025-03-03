<?php $__env->startSection('content'); ?>
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=tasksList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1" title="Date After task Due Date Count As Delay Days "> Task
                            Delay Count / कार्य विलंब गणना</h5>
                    </div>
                    
                    <br>
                    <span class="badge border border-secondary text-secondary w-100" id="detailsToggleDiv" style="font-size: 0.8rem; text-align: left;">
                        <b>Note :</b>
                        <ol>
                            <li class="mt-2 text-wrap">If a task is completed after its due date, the extra days are calculated as a
                                delay.
                                / यदि कोई कार्य अपनी नियत तारीख के बाद पूरा होता है, तो अतिरिक्त दिन देरी के रूप में गणना
                                किए जाते हैं।</li>
                            <li class="mt-1 text-wrap">By clicking the action button, you can see how many users have been assigned this task./एक्शन बटन पर क्लिक करके आप देख सकते हैं कि यह कार्य कितने उपयोगकर्ताओं को सौंपा गया है।</li>

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
    <!-- end col -->
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

<!-- <script src="<?php echo e(asset('assets/js/pages/apexcharts-bar.init.js"')); ?>"></script> -->
<!-- <script src="assets/libs/chart.js/chart.umd.js"></script> -->

<!-- ====Task Delay Display data JS===== -->
<script>
    $(document).ready(function() {
        $.ajax({
            url: "<?php echo e(route('task_delay_date')); ?>",
            type: "POST",
            headers: {
                'X-CSRF-TOKEN': "<?php echo e(csrf_token()); ?>"
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
    var options = {
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

    var chart = new ApexCharts(document.querySelector("#bar_chart"), options);
    chart.render();



    // Stacked Chart
    var options = {
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

    var chart = new ApexCharts(document.querySelector("#bar_charts"), options);
    chart.render();
</script>






<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/performance/delay.blade.php ENDPATH**/ ?>