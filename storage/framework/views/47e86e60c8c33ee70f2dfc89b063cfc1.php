<?php $__env->startSection('styles'); ?>
<style>
    textarea:disabled {
        background-color: #fff!important;
        opacity: 1;
        color: #6c757d;
        cursor: not-allowed;
        border: none;
    }
</style>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
    <div class="col-xl-12">
        <div class="card ribbon-box ribbon-fill ribbon-sm">
            <div id="status_ribbon" class="ribbon ribbon-info"><i class="ri-flashlight-fill"></i></div>
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="flex-grow-1">
                        <h4> #<?php echo e($review->id); ?>-<?php echo e($review->tl_title); ?></h4>
                        <div class="hstack gap-3 flex-wrap">
                            <div class="text-muted">Date : <span class="text-body fw-medium"><?php echo e($review->tl_status === 'PST'?date('d M,Y', strtotime($review->postponed_date)):date('d M,Y', strtotime($review->tl_date))); ?></span>
                            </div>
                            <div class="vr"></div>
                            <div class="text-muted">Time : <span class="text-body fw-medium"><?php echo e($review->tl_status === 'PST'?date('h:i A', strtotime($review->postponed_time)):date('h:i A', strtotime($review->tl_time))); ?></span>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex hastck gap-2 flex-wrap align-items-center actn">
                        <div class="form-group m-1">
                            <label for="postponed_date">Current Status</label>
                            <select name="tl_status" id="tl_status" class="form-control me-2">
                                <?php $__currentLoopData = $statuses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($key); ?>" <?php if($key==$review->tl_status): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div id="postponed-fields">
                            <div class="d-flex hastck flex-wrap">
                                <div class="form-group m-1">
                                    <label for="postponed_date">New Date</label>
                                    <input type="date" name="postponed_date" id="postponed_date" class="form-control">
                                </div>
                                <div class="form-group m-1">
                                    <label for="postponed_time">New Time</label>
                                    <input type="time" name="postponed_time" id="postponed_time" class="form-control">
                                </div>
                            </div>
                        </div>
                        <a id="update_status" class="btn btn-primary mt-4">Update</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class=" text-muted">
                    <p><strong>Description : </strong><?php echo e($review->tl_desc); ?></p>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Task Title</th>
                                <th>Departments</th>
                                <th>Due Date</th>
                                <th class="text-center">Status</th>
                                <th>Remarks</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $review->tasks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $task): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php
                                $sts = $task->status == "REVIEWED" ? "Reviewed" : "Not Reviewed";
                                $color = $task->status == "REVIEWED" ? "success" : "secondary";
                            ?>
                            <tr data-task-id="<?php echo e($task->task_id); ?>">
                                <td><?php echo e($index + 1); ?></td>
                                <td><a href="<?php echo e(url('task-overview?var=' . base64_encode($task->task_id))); ?>" target="_blank"><?php echo e($task->title); ?></a></td>
                                <td>
                                    <?php $__currentLoopData = $task->taskDepartments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $taskDept): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php echo e($taskDept->department->department_eng); ?> (<?php echo e($taskDept->department->department_hin); ?>) <?php if(!$loop->last): ?>, <br><?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </td>
                                <td><?php echo e(date('d M,Y', strtotime($task->due_date))); ?></td>
                                <td class="text-center">
                                    <div class="d-flex flex-column align-items-center justify-content-between">
                                        <label class="badge bg-<?php echo e($color); ?>-subtle text-success text-uppercase"><?php echo e($sts); ?></label>
                                        <input type="checkbox" name="task_check[12]" class="form-check m-1 task_check actn" data-status="<?php echo e($task->status); ?>" <?php echo e($task->status == "REVIEWED" ? "checked" : ""); ?> <?php echo e($review->tl_status=="CMP"?"disabled":""); ?>>
                                    </div>
                                </td>
                                <td>
                                    <textarea type="text" name="task_remark[<?php echo e($task->task_id); ?>]" class="form-control task_remark" placeholder="Add remark" rows="1" <?php echo e($review->tl_status=="CMP"?"disabled":""); ?>><?php echo e($task->remarks); ?></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6"><strong>Description:</strong> <?php echo e($task->description); ?></td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
<script>
    $(document).ready(function() {
        let tl_status = '<?php echo e($review->tl_status); ?>';
        let us_level = '<?php echo e(Session::get("level_id")); ?>';
        $("#tl_status").val(tl_status).trigger('change');
        if(us_level!=1){
            $(".actn").each(function() {this.style.setProperty('display', 'none', 'important');});
            $(".task_remark").prop('disabled', true);
        }
        if(tl_status=="CMP"){
            $("#update_status,#tl_status").attr('disabled', true);
        }
        updateStatusRibbon(tl_status);
    });
    $("#tl_status").change(function() {
        if (this.value === 'PST') {
            $("#postponed-fields").show();
        } else {
            $("#postponed-fields").hide();
        }
    })
    $('#update_status').on('click', function () {
        if($(this).attr('disabled')) return;
        const newStatus = $("#tl_status").find(":selected").val();
        const requestData = {
            id: `<?php echo e($review->id); ?>`,
            tl_status: newStatus,
            _token: "<?php echo e(csrf_token()); ?>"
        };
        if (newStatus === 'PST') {
            const postponedDate = $('#postponed_date').val();
            const postponedTime = $('#postponed_time').val();
            if (!postponedDate || !postponedTime) {
                showAlert('Please provide postponed date and time', 'warning');
                return;
            }
            requestData.postponed_date = postponedDate;
            requestData.postponed_time = postponedTime;
        }
        $.ajax({
            url: 'update-status',
            type: 'POST',
            data: requestData,
            success: function (response) {
                if (response.success) {
                    updateStatusRibbon(newStatus);
                    showAlert('Status updated successfully!', 'success');
                } else {
                    showAlert('Failed to update status.', 'error');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
                showAlert('An error occurred while updating the status.', 'error');
            },complete: function() {
                if (newStatus === 'PST' || newStatus === 'CMP') {
                    window.location.reload();
                }
            }
        });
    });

    $('.task_check, .task_remark').on('change blur', function () {
        const row = $(this).closest('tr');
        const taskId = row.data('task-id');
        const newStatus = row.find('.task_check').prop('checked') ? 'REVIEWED' : 'NOT-REVIEWED';
        const newRemark = row.find('.task_remark').val();

        $.ajax({
            url: 'update-task',
            type: 'POST',
            data: {
                review_id: `<?php echo e($review->id); ?>`,
                task_id: taskId,
                status: newStatus,
                remark: newRemark,
                _token: "<?php echo e(csrf_token()); ?>"
            },
            success: function (response) {
                if (response.success) {
                    const badge = row.find('.badge');
                    if (newStatus === 'REVIEWED') {
                        badge.text('Reviewed')
                            .removeClass('bg-secondary bg-secondary-subtle text-secondary')
                            .addClass('bg-success-subtle text-success');
                    } else {
                        badge.text('Not Reviewed')
                            .removeClass('bg-success-subtle text-success')
                            .addClass('bg-secondary-subtle text-secondary');
                    }
                    showAlert('Task updated successfully!', 'success');
                } else {
                    showAlert('Failed to update task.', 'error');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
                showAlert('An error occurred while updating the task.', 'error');
            }
        });
    });
    function updateStatusRibbon(status) {
        $("#postponed-fields").hide();
        const ribbon = $('#status_ribbon');
        ribbon
            .attr('class', `ribbon ${{SCH: 'ribbon-info',CMP: 'ribbon-success',PST: 'ribbon-warning',CNC: 'ribbon-danger'}[status]}`).find('i')
            .attr('class', {SCH: 'ri-flashlight-fill',CMP: 'ri-checkbox-circle-fill',PST: 'ri-time-line',CNC: 'ri-close-circle-fill'} [status]);
    }
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\review\detail.blade.php ENDPATH**/ ?>