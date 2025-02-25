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
                                    <?php $__currentLoopData = $reportData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $report): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php
                                    $totalTasks = $reviewedTasks = $notReviewedTasks = 0;
                                        $totalTasks += $report['total_tasks'];
                                        $reviewedTasks += $report['reviewed_tasks'];
                                        $notReviewedTasks += $report['not_reviewed_tasks'];
                                    ?>
                                        <tr>
                                            <td><?php echo e($report['review_date']); ?> -<?php echo e($report['review_time']); ?> <br> <?php echo e($report['review_title']); ?></td>
                                            <td class="text-center"><?php echo e($report['total_tasks']); ?></td>
                                            <td class="text-center"><?php echo e($report['reviewed_tasks']); ?></td>
                                            <td class="text-center"><?php echo e($report['not_reviewed_tasks']); ?></td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>TOTAL</th>
                                        <th class="text-center"><?php echo e($totalTasks); ?></th>
                                        <th class="text-center"><?php echo e($reviewedTasks); ?></th>
                                        <th class="text-center"><?php echo e($notReviewedTasks); ?></th>
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
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\review\report-review.blade.php ENDPATH**/ ?>