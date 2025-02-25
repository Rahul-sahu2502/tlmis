<?php $__env->startSection('styles'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>" />
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>" />
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class=row>
    <div class=col-lg-12>
        <div class=card>
            <div class="card-header border-0">
                <div class="d-flex align-items-center">
                    <h5 class="card-title mb-0 flex-grow-1"> Office Wise TL Task Status  / <small> निकायवार समीक्षा हेतु लिए गए कार्यों की स्थिति </small></h5>
                </div>
            </div>
            <div class=card-body>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-bordered datatable" id="tasksList">
                                <thead>
                                    <tr>
                                        <th class="text-center">S.No.</th>
                                        <th>Office</th>
                                        <th class="text-center">Included in TL</th>
                                        <th class="text-center">Tasks Included in TL</th>
                                        <th class="text-center">Reviewed Tasks in TL</th>
                                        <th class="text-center">Not Reviewed Tasks in TL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php 
                                $totalTasks = $reviewedTasks = $notReviewedTasks = 0;
                                ?>
                                <?php $__currentLoopData = $reportData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $department => $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php
                                    $totalTasks += $data['total_tasks'];
                                    $reviewedTasks += $data['reviewed_tasks'];
                                    $notReviewedTasks += $data['not_reviewed_tasks'];
                                ?>
                                    <tr>
                                        <td class="text-center"><?php echo e($loop->iteration); ?>.</td>
                                        <td><?php echo e($department); ?></td>
                                        <td class="text-center"><?php echo e($data['scheduled_tl']); ?></td>
                                        <td class="text-center"><?php echo e($data['total_tasks']); ?></td>
                                        <td class="text-center"><?php echo e($data['reviewed_tasks']); ?></td>
                                        <td class="text-center"><?php echo e($data['not_reviewed_tasks']); ?></td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3" class="text-center">TOTAL</th>
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
<script>
    $(document).ready(function() {
        if ($('.datatable tbody tr').length > 0) {
            $('.datatable').DataTable({
                dom: '<"dt-top"lfB>rtip',
                "bPaginate": false,
                buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
                language: {
                    search: "Search:",
                },
            });
        }
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\review\report-dept.blade.php ENDPATH**/ ?>