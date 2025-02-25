<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-12">
            <div class="card mt-n4 mx-n4">
                <div class="bg-warning-subtle">
                    <div class="card-body pb-0 px-4">
                        <div class="row mb-3">
                            <div class="col-md">
                                <div class="row align-items-center g-3">
                                    <div class="col-md">
                                        <?php
                                            $sts = "Inprogress";$color="primary";
                                            if($details[0]->status == "P"){ $sts = "Pending";$color="secondary";}
                                            elseif ($details[0]->status == "C"){ $sts = "Completed";$color="success";}
                                        ?>
                                        <div>
                                            <h4 class="fw-bold"><?php echo e($details[0]->title); ?></h4>
                                            <div class="hstack gap-3 flex-wrap">
                                                <div>
                                                    <i class="ri-building-line align-bottom me-1"></i>Departments:<br>
                                                    <?php $__currentLoopData = explode(',', $details[0]->department_eng); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <?php echo e($loop->index+1 .". ". $val); ?><br>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </div>
                                                <div class="vr"></div>
                                                <div><i class="ri-calendar-todo-line align-bottom me-1"></i> Task Entry
                                                    Date : <span
                                                        class="fw-medium"><?php echo e(date('d M, Y', strtotime($details[0]->entry_date))); ?></span>
                                                </div>
                                                <div class="vr"></div>
                                                <div><i class="ri-calendar-todo-line align-bottom me-1"></i> Task Due
                                                    Date : <span
                                                        class="fw-medium"><?php echo e(date('d M, Y', strtotime($details[0]->due_date))); ?></span>
                                                </div>
                                                <div class="vr"></div>
                                                <div title="Current Status"
                                                     class="badge rounded-pill bg-<?php echo e($color); ?> fs-12"><?php echo e($sts); ?></div>
                                                <div title="Priority"
                                                     class="badge rounded-pill bg-<?php echo e($details[0]->fk_task_priority_id==1?"success":"danger"); ?> fs-12"><?php echo e($details[0]->priority); ?></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-auto">
                                <div class="hstack gap-1 flex-wrap">
                                    <?php if($details[0]->status == "C"): ?>
                                        <button type="button" disabled class="btn btn-sm btn-primary"> Task closed</button>
                                    <?php endif; ?>
                                    <a href="<?php echo e(route("task-history", ['task_id'=>urlencode(base64_encode($details[0]->task_id))])); ?>">
                                        <button type="button" id="history" class="btn btn-sm btn-warning">Log
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <style>
                    input[type="checkbox"] {
                        width: 20px;
                        height: 20px;
                        outline: 1px solid darkblue;
                    }
                </style>
                <?php
                    $dept_section_officer = [];
                    $disabled="disabled";
                ?>
                <?php $__currentLoopData = $details['dept_section_officer']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                        array_push($dept_section_officer, $value->user_dept);
                    ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <div class=card-body>
                    <form method="post" id="submit_form" autocomplete="off">
                        <?php echo csrf_field(); ?>
                        <input type="hidden" name="task_id" value="<?php echo e($task_id); ?>">
                        <input type="hidden" name="old_dept_section_officer" value="<?php echo e(json_encode($dept_section_officer)); ?>">
                        <div class="table-responsive mb-4">
                            <table class="table table-bordered datatable mb-0" id=usersTable>
                                <thead class="table-light text-muted">
                                <tr>
                                    <th># </th>
                                    <th class=sort data-sort=id>S.No.</th>
                                    <th class=sort data-sort=full_name>Name</th>
                                    <th class=sort data-sort=mobile>Mobile Number</th>
                                    <th class=sort data-sort=Email_Id>Office</th>
                                    <th>Level</th>
                                </tr>
                                </thead>
                                <tbody class="list">
                                    <?php if($officer_list): ?>
                                    <?php $__currentLoopData = $officer_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php
                                            $disabled="";
                                            $u_dept = $value->fk_user_id.'_'.$value->fk_department_id;
                                        ?>
                                        <tr>
                                            <td><input style="cursor: pointer" <?php if(in_array($u_dept, $dept_section_officer)): ?> checked <?php endif; ?> class="form-check-input doc_check" type="checkbox" name="dept_section_officer[]" value="<?php echo e($u_dept); ?>"></td>
                                            <td><?php echo e($loop->index+1); ?></td>
                                            <td class=full_name><?php echo e($value->full_name); ?></td>
                                            <td class=mobile><?php echo e($value->mobile); ?></td>
                                            <td class=email_id><?php echo e($value->department_eng); ?></td>
                                            <td> Level <?php echo e($value->fk_level_id); ?></td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php else: ?>
                                    <tr>
                                        <td colspan="6" class="text-center">No user available</td>
                                    </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            
                            <button type="submit" <?php echo e($disabled); ?> class="btn btn-success">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
    <script src="<?php echo e(asset('assets/libs/list.js/list.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/list.pagination.js/list.pagination.min.js')); ?>"></script>
    <script>
        $(document).ready(function() {

            $('#submit_form').on('submit', function (e) {
                e.preventDefault();
                var formData = new FormData(this);
                $(':input[type="submit"]').prop('disabled', true);
                $.ajax({
                    url: "<?php echo e(route('user_task_allocate')); ?>", // Route to the controller
                    method: "POST",
                    data: formData,
                    processData: false, // Don't process the files
                    contentType: false, // Don't set content type
                    success: function (response) {
                        let sts = response.sts;
                        let icon = "";
                        let msg = "";
                        if (sts == 1) {
                            icon = "hrtsficn.json";
                        } else if (sts == 2)
                            icon = "azxkyjta.json";
                        else if (sts == 3)
                            icon = "azxkyjta.json";
                        msg = response.message;
                        $(':input[type="submit"]').prop('disabled', false);
                        swal_alert(icon, msg, sts);
                    },
                    error: function (xhr) {
                        if (xhr.responseJSON.errors) {
                            let errors = xhr.responseJSON.errors;
                            let errorMessage = "";
                            for (let key in errors) {
                                errorMessage += errors[key][0] + "<br>";
                            }
                            console.log(errorMessage);
                        }
                    },
                });
            });
            function swal_alert(icon, msg, sts) {
                SwalWithCustomSettings.fire({
                    html: `<div class="mt-3">
                <lord-icon
                    src="https://cdn.lordicon.com/${icon}"
                    trigger="loop"
                    colors="primary:#f06548,secondary:#f7b84b"
                    style="width:120px;height:120px">
                </lord-icon>
                <div class="mt-4 pt-2 fs-15">
                    <h4>${msg}</h4>
                </div>
                </div>`,
                    showCancelButton: true,
                    showConfirmButton: false,
                    customClass: {
                        cancelButton: "btn btn-primary w-xs mb-1"
                    },
                    cancelButtonText: "Ok",
                    showCloseButton: false,
                }).then((result) => {
                    // Check if 'Ok' was clicked and status equals 1
                    if (sts === 1 && result.dismiss === Swal.DismissReason.cancel) {
                        location.reload();
                        // window.location.href = "<?php echo e(route('task_view')); ?>"; // Redirect to the specified URL
                    }
                });
            }
            document.querySelector('.check_all').addEventListener('click', function () {
                let isChecked = this.checked;
                let taskCheckboxes = document.querySelectorAll('.doc_check');
                taskCheckboxes.forEach(function (checkbox) {
                    checkbox.checked = isChecked;
                });
            });
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/tasks/task_allocate.blade.php ENDPATH**/ ?>