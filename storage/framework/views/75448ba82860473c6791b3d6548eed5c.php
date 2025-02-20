<?php $__env->startSection('styles'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>"/>
    <link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>"/>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=usersList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Users Login/Log-out Details / <small> उपयोगकर्ताओं लॉग इन एवं लॉग आउट की जानकारी</small></h5>
                       
                    </div>
                </div>
                <div class="card-body border border-dashed border-end-0 border-start-0">
                    <?php if(Session::has('success')): ?>
                        <div class="alert alert-success">
                            <?php echo e(Session::get('success')); ?>

                        </div>
                    <?php endif; ?>

                    <?php if(Session::has("error")): ?>
                        <div class="alert alert-danger">
                            <?php echo e(Session::get('error')); ?>

                        </div>
                    <?php endif; ?>
                    
                </div>
                <div class=card-body>
                    <div class="table-responsive mb-4">
                        <table class="table table-bordered datatable mb-0" id=usersTable>
                            <thead class="table-light text-muted">
                            <tr>
                                <th class=sort data-sort=id>S.No.</th>
                                <th class=sort data-sort=user_name>UserId</th>
                                <th class=sort data-sort=full_name>Name</th>
                                <th class=sort data-sort=current_status>Status</th>
                                <th class=sort data-sort=timedate>Login/Logout Datetime</th>
                                <th class=sort data-sort=Level>Level</th>
                                <th class=sort data-sort=designation>Designation</th>
                                <th class=sort data-sort=department>Offices</th>
                            </tr>
                            </thead>
                            <tbody class="list form-check-all">
                            <?php if(isset($loginRecords) && !empty($loginRecords)): ?>
                                <?php $__currentLoopData = $loginRecords; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $login): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($loop->index+1); ?></td>
                                        <td class=user_name><?php echo e($login->relatedUser->username); ?></td>
                                        <td class=full_name><?php echo e($login->relatedUser->full_name); ?></td>
                                        <td class=status><?php if($login->current_status=="IN"): ?>
                                                            <span class="badge badge-gradient-success"> <?php echo e("Logged In"); ?> </span>
                                            <?php elseif($login->current_status=="OUT"): ?>
                                                <span class="badge badge-gradient-danger"> <?php echo e("Logged Out"); ?> </span>
                                            <?php endif; ?>
                                        </td>
                                        <td class=status> <?php echo e($login->current_status === 'IN'
                                                ? \Carbon\Carbon::parse($login->login_datetime)->format('d-m-Y H:i:s')
                                                : (
                                                    $login->current_status === 'OUT'
                                                    ? \Carbon\Carbon::parse($login->logged_out_datetime)->format('d-m-Y H:i:s')
                                                    : 'N/A'
                                                )); ?>

                                        </td>
                                        <td class=level>
                                            <?php if($login->relatedUser->levels->isNotEmpty()): ?>
                                                <?php echo e($login->relatedUser->levels->first()->level); ?>

                                            <?php endif; ?>
                                        </td>
                                        <td class=designation>
                                            <?php $__currentLoopData = $login->relatedUser->designations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $designation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php echo e($designation->designation); ?>

                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </td>
                                        <td class=department>
                                            <?php
                                                $offices = [];
                                                if($login != null && $login->relatedUser->userMaps != null){
                                                    $offices = $login->relatedUser->userMaps->filter(function ($map) {
                                                        return !empty($map->department);
                                                    })->map(function ($map) {
                                                        return $map->department->department_eng . ' (' . $map->department->department_hin . ')';
                                                    });
                                                }

                                            ?>

                                            <?php if(sizeof($offices) > 1): ?>
                                                <?php echo e($offices->implode(', ')); ?>

                                            <?php elseif(!empty($offices)): ?>
                                                <?php echo e($offices->first()); ?>

                                            <?php endif; ?>

                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
    <script src="<?php echo e(asset('assets/libs/list.js/list.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/list.pagination.js/list.pagination.min.js')); ?>"></script>
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
    <script>
        $(document).ready(function () {
            $('.datatable').DataTable({
                dom: '<"dt-top"lfB>rtip',
                buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
                language: {
                    search: "Search:",
                },
            });
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/users/login-log.blade.php ENDPATH**/ ?>