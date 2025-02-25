<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-12">
            <div class="card mt-n4 mx-n4">
                <div class="bg-warning-subtle">
                    <div class="card-body pb-0 px-4">
                        <div class="row mb-3">
                            <div class="col-md">
                                <div class="row align-items-center g-3">
                                    <?php if(empty(@$task_details)): ?>
                                        <h5>No History Available</h5>
                                    <?php else: ?>
                                        <div class="col-md">
                                        <?php
                                            $sts = "Inprogress";
                                            $color = "primary";
                                            if (@$task_details[0]->status == "P") {
                                                $sts = "Pending";
                                                $color = "secondary";
                                            } elseif (@$task_details[0]->status == "C") {
                                                $sts = "Completed";
                                                $color = "success";
                                            }
                                        ?>
                                        <div>
                                            <h4 class="fw-bold"><?php echo e(@$task_details[0]->title); ?></h4>
                                            <div class="hstack gap-3 flex-wrap">
                                                <div>
                                                    <i class="ri-building-line align-bottom me-1"></i>Departments:<br>
                                                    <?php $__currentLoopData = explode(',', @$task_details[0]->department_eng); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <?php echo e($loop->index + 1); ?>. <?php echo e($val); ?><br>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </div>
                                                <div class="vr"></div>
                                                <div><i class="ri-calendar-todo-line align-bottom me-1"></i> Task Entry
                                                    Date: <span
                                                        class="fw-medium"><?php echo e(date('d M, Y', strtotime(@$task_details[0]->entry_date))); ?></span>
                                                </div>
                                                <div class="vr"></div>
                                                <div><i class="ri-calendar-todo-line align-bottom me-1"></i> Task Due
                                                    Date: <span
                                                        class="fw-medium"><?php echo e(date('d M, Y', strtotime(@$task_details[0]->due_date))); ?></span>
                                                </div>
                                                <div class="vr"></div>
                                                <div title="Current Status"
                                                     class="badge rounded-pill bg-<?php echo e($color); ?> fs-12"><?php echo e($sts); ?></div>
                                                <div title="Priority"
                                                     class="badge rounded-pill bg-<?php echo e(@$task_details[0]->fk_task_priority_id == 1 ? 'success' : 'danger'); ?> fs-12"><?php echo e(@$task_history[0]->priority); ?></div>
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
        </div>
    </div>

    
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Task History Timeline</h4>
                </div>
                <div class="card-body">
                    <?php
                        $groupedHistory = collect($task_history)->groupBy(function ($item) {
                            return date('d M, Y', strtotime($item->log_creation));
                        });
                    ?>
                    <?php if(empty($groupedHistory)): ?>
                        <h6>No History Available</h6>
                    <?php else: ?>
                    <?php $__currentLoopData = $groupedHistory; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $date => $records): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <ul class="list-group mb-4">
                            <?php $__currentLoopData = $records; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $record): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <h5 class="fw-bold mb-3"><?php echo e($record->log_creation); ?></h5>
                                <li class="list-group-item">
                                    <h6 class="mb-2">Title: <?php echo e($record->title); ?></h6>
                                    <p class="mb-1">Description: <?php echo e($record->description); ?></p>
                                    <p class="mb-1">Priority: <?php echo e($record->priority); ?></p>
                                    <p class="mb-1">Category: <?php echo e($record->category); ?></p>
                                    <p class="mb-1">Entry Date: <?php echo e($record->entry_date); ?></p>
                                    <p class="mb-1">Due Date: <?php echo e($record->due_date); ?></p>
                                    <p class="mb-1">Department: <?php echo e($record->department_eng); ?></p>
                                    <?php if(!empty($record->name_en)): ?>
                                    <p class="mb-1">Section: <?php echo e($record->name_en); ?></p>
                                    <?php endif; ?>

                                    <div class="d-flex justify-content-between">
                                        <span>

                                            File:   <?php if(!empty($record->file) && !empty($record->file_id)): ?>
                                                <span> <a
                                                        href="<?php echo e(asset('uploads/'.$record->file)); ?>" target="_blank"
                                                        class="btn btn-primary btn-sm">
                                                View File
                                            </a></span>
                                            <?php else: ?>
                                                <span class="badge bg-warning">No file available.</span>
                                            <?php endif; ?>
                                        </span>
                                        <span>Status: <span
                                                class="badge bg-<?php echo e($record->status == 'C' ? 'success' : ($record->status == 'P' ? 'secondary' : 'primary')); ?>"><?php echo e($record->status == 'C' ? 'Completed' : ($record->status == 'P' ? 'Pending' : 'In Progress')); ?></span></span>
                                        <span>Priority: <span
                                                class="badge bg-<?php echo e($record->fk_task_priority_id == 1 ? 'success' : 'danger'); ?>"><?php echo e($record->priority); ?></span></span>
                                    </div>
                                </li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\tasks\task_history.blade.php ENDPATH**/ ?>