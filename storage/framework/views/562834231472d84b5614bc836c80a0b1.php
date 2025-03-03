<?php $__env->startSection('content'); ?>
<div class="row project-wrapper">
    <div class=col-xxl-12>
        <div class=row>
            <div class="col-xl-4">
                <a href="<?php echo e(route('task_view')); ?>">
                    <div class="card card-animate">
                        <div class=card-body>
                            <div class="d-flex align-items-center">
                                <div class="avatar-sm flex-shrink-0">
                                    <span class="avatar-title bg-primary-subtle text-primary rounded-2 fs-2">
                                        <i class="bx bx-task text-primary"></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 overflow-hidden ms-3">
                                    <p class="text-uppercase fw-medium text-muted text-truncate">
                                        Total Tasks / <small>कुल कार्य</small></p>
                                    <div class="d-flex align-items-center">
                                        <h4 class="fs-4 flex-grow-1 mb-0"><span class=counter-value data-target="<?php echo e($data[0]->total_task); ?>"><?php echo e($data[0]->total_task); ?></span></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-4">
                <a href="<?php echo e(route('view-user')); ?>">
                    <div class="card card-animate">
                        <div class=card-body>
                            <div class="d-flex align-items-center">
                                <div class="avatar-sm flex-shrink-0">
                                    <span class="avatar-title bg-success-subtle text-success rounded-2 fs-2">
                                        <i class="bx bx-user-check text-success"></i>
                                    </span>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <p class="text-uppercase fw-medium text-muted">Total Users / <small>कुल उपयोगकर्ता</small></p>
                                    <div class="d-flex align-items-center">
                                        <h4 class="fs-4 flex-grow-1 mb-0"><span class=counter-value data-target="<?php echo e($data[0]->total_users); ?>"><?php echo e($data[0]->total_users); ?></span></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-4">
                <div class="card card-animate">
                    <div class=card-body>
                        <div class="d-flex align-items-center">
                            <div class="avatar-sm flex-shrink-0">
                                <span class="avatar-title bg-warning-subtle text-warning rounded-2 fs-2">
                                    <i class="bx bx-loader text-warning"></i>
                                </span>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <p class="text-uppercase fw-medium text-muted">Pending for completion / <small>पूर्ण होने हेतु लंबित</small></p>
                                <div class="d-flex align-items-center">
                                    <h4 class="fs-4 flex-grow-1 mb-0"><span class=counter-value data-target="<?php echo e($data[0]->pending_from_admin); ?>"><?php echo e($data[0]->pending_from_admin); ?></span></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class=row>
            <div class=col-xl-6>
                <div class=card>
                    <div class="card-header border-0 align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">Tasks Overview / <small> कार्य समीक्षा</small></h4>
                        <div>
                            <a href="<?php echo e(route('task_view')); ?>" class="btn btn-soft-secondary btn-sm">
                                View All
                            </a>
                        </div>
                    </div>
                    <div class="card-header p-0 border-0 bg-light-subtle">
                        <div class="row g-0 text-center">
                            <div class="col-6 col-sm-4">
                                <div class="p-2 border border-dashed border-start-0">
                                    <h5 class="mb-1 text-primary"><span class=counter-value data-target="<?php echo e($data[0]->total_task); ?>"><?php echo e($data[0]->total_task); ?></span></h5>
                                    <p class="text-muted mb-0">Active Tasks</p>
                                </div>
                            </div>
                            <div class="col-6 col-sm-4">
                                <div class="p-2 border border-dashed border-start-0">
                                    <h5 class="mb-1 text-warning"><span class=counter-value data-target="<?php echo e($data[0]->inprogress_task); ?>"><?php echo e($data[0]->inprogress_task); ?></span></h5>
                                    <p class="text-muted mb-0">In Progress Tasks</p>
                                </div>
                            </div>
                            <div class="col-6 col-sm-4">
                                <div class="p-2 border border-dashed border-start-0 border-end-0">
                                    <h5 class="mb-1 text-success"><span class=counter-value data-target="<?php echo e($data[0]->completed_task); ?>"><?php echo e($data[0]->completed_task); ?></span></h5>
                                    <p class="text-muted mb-0">Completed Tasks</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0 pb-2">
                        <div>
                            <div id=tasks-overview data-vals='["<?php echo e($data[0]->total_task); ?>","<?php echo e($data[0]->inprogress_task); ?>","<?php echo e($data[0]->completed_task); ?>"]' class=apex-charts dir=ltr></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class=card>
                    <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">TL Reviews / <small> साप्ताहिक समीक्षा</small></h4>
                        <div><a href="<?php echo e(route('tl_view')); ?>" class="btn btn-soft-secondary btn-sm">View All</a></div>
                    </div>
                    <div class="card-body min-card-height pt-1">
                        <?php $__empty_1 = true; $__currentLoopData = $tlReviews; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $review): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <a href="<?php echo e(url('tl-detail?var=' . base64_encode($review->id))); ?>">
                            <div class="mini-stats-wid d-flex align-items-center border-bottom-dashed border-1 border-default mt-4 p-1">
                                <div class="flex-shrink-0 avatar-sm">
                                    <span class="mini-stat-icon avatar-title rounded-circle text-success bg-success-subtle fs-4">
                                        <?php echo e($review->id); ?>

                                    </span>
                                </div>
                                <div class="flex-grow-1 ms-3">
                                    <h6 class="mb-1"><?php echo e($review->tl_title); ?></h6>
                                    <p class="text-muted mb-0"><?php echo e(\Carbon\Carbon::parse($review->tl_date)->format('d M, Y')); ?></p>
                                </div>
                                <div class="flex-shrink-0">
                                    <p class="text-muted mb-0"><?php echo e(\Carbon\Carbon::parse($review->tl_time)->format('h:i A')); ?></p>
                                </div>
                            </div>
                        </a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <div class="card">
                            <div class="card-body  p-0">
                                <div class="alert alert-warning border-0 rounded-0 m-0 d-flex align-items-center alert-dismissible fade show" role="alert">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-triangle text-warning me-2 icon-sm">
                                        <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
                                        <line x1="12" y1="9" x2="12" y2="13"></line>
                                        <line x1="12" y1="17" x2="12.01" y2="17"></line>
                                    </svg>
                                    <div class="flex-grow-1 text-truncate">
                                        No TL Scheduled at the moment.
                                    </div>
                                    <button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                                <div class="row align-items-end">
                                    <div class="col-sm-8">
                                        <div class="p-3">
                                            <div class="mt-3">
                                                <?php if(Session::get('level_id') == '1'): ?>
                                                <a href="<?php echo e(route('tl_new')); ?>" class="btn btn-success">Create One</a>
                                                <?php else: ?>
                                                <p> Scheduled TL will apear here</p>
                                                <?php endif; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="px-3">
                                            <img src="assets/images/user-illustarator-2.png" class="img-fluid" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
<script src="<?php echo e(asset('assets/libs/apexcharts/apexcharts.min.js')); ?>"></script>
<script>
    const chartElement = document.querySelector("#tasks-overview");
    const dataVals = JSON.parse(chartElement.getAttribute("data-vals") || '[0, 0, 0]');
    var options = {
        series: [{
            name: 'Tasks',
            data: dataVals
        }],
        chart: {
            type: 'bar',
            height: 240,
            toolbar: {
                show: false
            }
        },
        plotOptions: {
            bar: {
                horizontal: true,
                columnWidth: '70%',
                borderRadius: 5,
                borderRadiusApplication: 'end',
                distributed: true
            },
        },
        dataLabels: {
            enabled: true,
            style: {
                colors: ['#fff']
            }
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories: ['Total', 'Inprogress', 'Completed'],
        },
        yaxis: {
            title: {
                show: false
            }
        },
        fill: {
            opacity: 1,
            colors: ['#3498db', '#f1c40f', '#2ecc71']
        },
        tooltip: {
            y: {
                formatter: function(val) {
                    return val + " Tasks";
                }
            }
        },
        legend: {
            show: false
        }
    };
    var chart = new ApexCharts(chartElement, options);
    chart.render();
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/dashboard/index.blade.php ENDPATH**/ ?>