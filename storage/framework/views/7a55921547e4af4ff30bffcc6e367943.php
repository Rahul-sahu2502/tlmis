<?php $__env->startSection('styles'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>" />
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>"/>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=usersList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Available Users List / <small> उपलब्ध उपयोगकर्ताओं की सूची</small></h5>
                        <div class=flex-shrink-0>
                            <div class="d-flex flex-wrap gap-2">
                                <a href="<?php echo e(route('add-user')); ?>" class="btn btn-danger add-btn"><i
                                        class="ri-add-line align-bottom me-1"></i> Add New </a>
                            </div>
                        </div>
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
                                <th class=sort data-sort=mobile>Mobile Number</th>
                                <th class=sort data-sort=Email_Id>Email Id</th>
                                <th class=sort data-sort=Level>Level</th>
                                <th class=sort data-sort=designation>Designation</th>
                                <th class=sort data-sort=department>Offices</th>
                                <th class=sort data-sort=action>Action</th>
                            </tr>
                            </thead>
                            <tbody class="list form-check-all">
                            <?php if(isset($users) && !empty($users)): ?>
                            <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($loop->index+1); ?></td>
                                    <td class=user_name><?php echo e($user->username); ?></td>
                                    <td class=full_name><?php echo e($user->full_name); ?></td>
                                    <td class=mobile><?php echo e($user->mobile); ?></td>
                                    <td class="Email_Id"><?php echo e($user->email==""?"-":$user->email); ?></td>
                                    <td class=level><?php echo e(!empty($user->userMaps->first()->level)?$user->userMaps->first()->level->level:''); ?></td>
                                    <td class=designation>
                                        <?php echo e(!empty($user->userMaps->first()->designation)?$user->userMaps->first()->designation->designation:''); ?></td>
                                    <td class=department>
                                        <?php
                                            $departments = $user->userMaps->filter(function ($map) {
                                                return !empty($map->department);
                                            })->map(function ($map) {
                                                return $map->department->department_eng . ' (' . $map->department->department_hin . ')';
                                            });
                                        ?>

                                        <?php if($departments->count() > 1): ?>
                                            <?php echo e($departments->implode(', ')); ?>

                                        <?php else: ?>
                                            <?php echo e($departments->first()); ?>

                                        <?php endif; ?>

                                    </td>
                                    <td class=edit>
                                        <a class="btn btn-info btn-xm" href="<?php echo e(route('add-user',['id'=>urlencode(base64_encode($user->user_id))])); ?>"> <i class="ri-eye-line"></i> Edit</a>
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
        $(document).ready(function() {
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

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\users\list.blade.php ENDPATH**/ ?>