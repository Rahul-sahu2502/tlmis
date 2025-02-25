<?php $__env->startSection('styles'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>" />
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>" />
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
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
                                <?php $rowIndex = 0; ?>
                                <?php $__currentLoopData = $reviews; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $review): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php $firstRowIndex = ++$rowIndex; ?>
                                    <tr>
                                        <td rowspan="<?php echo e(count($review['tasks'])); ?>" class="align-middle text-center"><?php echo e($firstRowIndex); ?></td>
                                        <td rowspan="<?php echo e(count($review['tasks'])); ?>" class="align-middle">
                                            <?php echo e($review['review_date']); ?> -<?php echo e($review['review_time']); ?> <br> <?php echo e($review['review_title']); ?>

                                        </td>
                                        <td><?php echo e($review['tasks'][0]['task_title']); ?></td>
                                        <td><?php echo e($review['tasks'][0]['department_name']); ?></td>
                                        <?php
                                            $color = $review['tasks'][0]['status'] == 'REVIEWED' ? 'success' : 'warning';
                                        ?>
                                        <td class="text-center">
                                            <span class="badge bg-<?php echo e($color); ?>-subtle text-<?php echo e($color); ?> text-uppercase">
                                                <?php echo e($review['tasks'][0]['status']); ?>

                                            </span>
                                        </td>
                                    </tr>
                                    <?php for($i = 1; $i < count($review['tasks']); $i++): ?>
                                        <tr>
                                            <td><?php echo e($review['tasks'][$i]['task_title']); ?></td>
                                            <td><?php echo e($review['tasks'][$i]['department_name']); ?></td>
                                            <?php
                                                $color = $review['tasks'][$i]['status'] == 'REVIEWED' ? 'success' : 'warning';
                                            ?>
                                            <td class="text-center">
                                                <span class="badge bg-<?php echo e($color); ?>-subtle text-<?php echo e($color); ?> text-uppercase">
                                                    <?php echo e($review['tasks'][$i]['status']); ?>

                                                </span>
                                            </td>
                                        </tr>
                                    <?php endfor; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
<script src="<?php echo e(asset('assets/libs/datatable/jquery.dataTables.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/dataTables.buttons.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.flash.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.html5.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.print.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/jszip.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/pdfmake.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/vfs_fonts.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/apexcharts/apexcharts.min.js')); ?>"></script>
<script>
            let reviews = <?php echo json_encode($reviews, 15, 512) ?>;
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
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\review\report.blade.php ENDPATH**/ ?>