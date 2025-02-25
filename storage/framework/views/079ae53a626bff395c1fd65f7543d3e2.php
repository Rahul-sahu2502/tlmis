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
                        <h5 class="card-title mb-0 flex-grow-1">Send back request list/अनुरोध सूची</h5>
                    </div>
                </div>
                
                <div class=card-body>
                    <div class="table-responsive mb-4">
                        <table class="table table-bordered datatable mb-0" id=usersTable>
                            <thead class="table-light text-muted">
                            <tr>
                                <th class=sort data-sort=id>S.No.</th>
                                <th class=sort data-sort=task_title>Task Title</th>

                                <th class=sort data-sort=full_name>User Details</th>
                                

                                <th class=sort data-sort=sb_req_remark>Request Remark</th>
                                <th class=sort data-sort=send_back_date>Request Date</th>
                                <th>Action Remark</th>
                                <th class=sort data-sort=action_date>Action Date</th>
                                <th class=sort data-sort=status>Status</th>
                                <th class=sort width="12%" data-sort=action>Action</th>
                            </tr>
                            </thead>
                            <tbody class="list form-check-all">
                            <?php if(isset($list) && !empty($list)): ?>
                            <?php $__currentLoopData = $list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php
                                $sts = "Pending";$color="primary";
                                if($value->send_back_status == "R"){ $sts = "Rejected";$color="danger";}
                                elseif ($value->send_back_status == "A"){ $sts = "Approved";$color="success";}
                            ?>
                                <tr>
                                    <td><?php echo e($loop->index+1); ?></td>
                                    <td class=task_title><?php echo e($value->title); ?></td>
                                    <td class=full_name>
                                        <b>Name: </b><?php echo e($value->full_name); ?><br>
                                        <b>Mobile: </b><?php echo e($value->mobile); ?><br>
                                        <b>Depatment: </b><?php echo e($value->department_eng); ?>

                                    </td>
                                    
                                    

                                    <td class=sb_req_remark><?php echo e($value->send_back_remark); ?></td>
                                    <td class=send_back_date><?php echo e($value->send_back_date); ?></td>

                                    <td><?php echo e($value->sb_action_remark); ?></td>
                                    <td><?php echo e($value->sb_action_date); ?></td>

                                    <td class=status><span class="badge bg-<?php echo e($color); ?>-subtle text-<?php echo e($color); ?> text-uppercase"><?php echo e($sts); ?></span></td>
                                    <td class=edit>
                                        <a class="btn btn-info btn-xm" title="View task details" href="<?php echo e(url('task-overview?var=').base64_encode($value->task_id)); ?>"><i class="ri-eye-line"></i></a>
                                        <?php if($value->send_back_status=="P" && Session::get('level_id')=='1'): ?>
                                        <button class="btn btn-success btn-xm change_status" type="button" id="approve" title="Approve" value="<?php echo e(base64_encode($value->task_id.'_'.$value->fk_map_id.'_'.$value->td_sb_id.'_A')); ?>"><i class=" ri-thumb-up-fill"></i></button>
                                        <button class="btn btn-danger btn-xm change_status" type="button" id="reject" title="Reject" value="<?php echo e(base64_encode($value->task_id.'_'.$value->fk_map_id.'_'.$value->td_sb_id.'_R')); ?>"><i class=" ri-thumb-down-fill"></i></button>
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
    <?php echo $__env->make('tasks.sb_request_list_js', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\tasks\sb_request_list.blade.php ENDPATH**/ ?>