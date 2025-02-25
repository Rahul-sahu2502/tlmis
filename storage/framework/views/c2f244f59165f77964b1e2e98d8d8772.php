<?php $__env->startSection('styles'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>"/>
    <link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>"/>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class=row>
        <div class=col-lg-5>
            <form method="post" id="transferUserForm" autocomplete="off">
                <?php echo csrf_field(); ?>
                <div class=card id=transferUser>
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <h5 class="card-title mb-0 flex-grow-1">Transfer / <small> ट्रान्सफर</small></h5>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-lg-12">
                                <div>
                                    <label for="level" class="form-label">User Level / <small> उपयोगकर्ता का स्तर</small> <span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="fk_level_id" id="fk_level_id" class="form-control" required>
                                        <option value="">Select</option>
                                        <?php $__currentLoopData = $levels; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $level): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($level->level_id); ?>"
                                            ><?php echo e($level->level); ?>

                                            </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                    <?php $__errorArgs = ['fk_level_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <span class="text-danger"><?php echo e($message); ?></span>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <label for="name_en`" class="form-label"> Select User / <small> उपयोगकर्ता
                                        चुनें </small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                <select name="fk_user_id" id="fk_user_id" class="form-control" required>
                                    <option value="">Select User</option>
                                   
                                </select>
                                <div id="user-details" style="margin-top: 10px;">
                                    <span class="badge badge-gradient-info">Current Offices: </span>
                                    <label id="department-label" class="text-info-emphasis"> Please Select User
                                        First</label>
                                </div>
                                <input type="hidden" id="fk_designation_id" name="fk_designation_id" value="">
                            </div>
                            <div class="col-lg-12">
                                <label for="fk_department_id" class="form-label">Related Offices / <small> संबंधित
                                        कार्यालय</small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                <select name="fk_department_id[]" multiple id="fk_department_id"
                                        aria-label="multiple select" class="form-control select2" required>
                                    <option value="" disabled>Select</option>
                                    <?php $__currentLoopData = $departments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $department): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($department->dept_id); ?>">
                                            <?php echo e($department->department_eng . ' ('.$department->department_hin.')'); ?>

                                        </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                <?php $__errorArgs = ['fk_department_id'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <span class="text-danger"><?php echo e($message); ?></span>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-end">
                            <div class="ms-auto">
                                <button type="submit" id="submit" class="btn btn-success">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-7">
            <div class=card id=departmentList>

                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Transfers List / <small> ट्रान्सफर सूची</small></h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive simplebar-scrollable-y mb-4 " data-simplebar="init"
                         data-simplebar-auto-hide="false" data-simplebar-track="dark" style="max-height: 400px;">
                        <table class="table table-bordered datatable mb-0" id="usersTable" width="100%">
                            <thead class="table-dark">
                            <tr>
                                <th width="10%" class="sort" data-sort="id">S.No.</th>
                                <th width="35%" class="sort" data-sort="nameen">User</th>
                                <th width="35%" class="sort" data-sort="namehi">Current Offices</th>
                                <th width="20%" class="sort" data-sort="action">Previous Offices</th>
                            </tr>
                            </thead>
                            <tbody class="list form-check-all">
                            <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php
                                    // Current active userMaps (is_active == 1)
                                    $activeUserMaps = $user->userMaps->filter(function ($map) {
                                        return $map->is_active == 1 && !empty($map->department) && !empty($map->designation);
                                    });

                                    // Previous (inactive) userMaps (is_active == 0)
                                    $inactiveUserMaps = $user->userMaps->filter(function ($map) {
                                        return $map->is_active == 0 && !empty($map->department) && !empty($map->designation);
                                    });

                                    // Collect current department names
                                    $currentDepartmentNames = $activeUserMaps->map(function ($map) {
                                        return $map->department->department_eng . ' (' . $map->department->department_hin . ')';
                                    })->implode(', ');

                                    // Collect current department IDs
                                    $currentDepartmentIds = $activeUserMaps->map(function ($map) {
                                        return $map->department->dept_id;
                                    })->implode(',');

                                    // Collect current designation names
                                    $currentDesignationNames = $activeUserMaps->map(function ($map) {
                                        return $map->designation->designation_eng . ' (' . $map->designation->designation_hin . ')';
                                    })->implode(', ');

                                    // Collect previous department names (if any)
                                    $previousDepartmentNames = $inactiveUserMaps->map(function ($map) {
                                        return $map->department->department_eng . ' (' . $map->department->department_hin . ')';
                                    })->implode(', ');

                                    // Collect previous designation names (if any)
                                    $previousDesignationNames = $inactiveUserMaps->map(function ($map) {
                                        return $map->designation->designation_eng . ' (' . $map->designation->designation_hin . ')';
                                    })->implode(', ');

                                ?>
                                <tr>
                                    <td><?php echo e($loop->index + 1); ?></td>
                                    <td class="user_name"><?php echo e($user->full_name); ?></td>
                                    <td class="current_offices"><?php echo e($currentDepartmentNames); ?></td>
                                    <td class="previous_offices"><?php echo e($previousDepartmentNames); ?></td>
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
    <script src="<?php echo e(asset('assets/libs/datatable/jquery.dataTables.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/datatable/dataTables.buttons.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/datatable/buttons.flash.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/datatable/buttons.html5.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/datatable/buttons.print.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/datatable/jszip.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/datatable/pdfmake.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/datatable/vfs_fonts.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/select2/select2.min.js')); ?>"></script>
    <script>
        $(document).ready(function () {
            $(".select2").select2();
            $("#fk_level_id").on('change', function () {
                const levelId = this.value;
                const userDropdown = document.getElementById('fk_user_id');

                // Clear previous options
                userDropdown.innerHTML = '<option value="">Select User</option>';

                if (levelId) {
                    fetch('<?php echo e(route("get-users-by-level")); ?>', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '<?php echo e(csrf_token()); ?>',
                        },
                        body: JSON.stringify({ level_id: levelId }),
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.users) {
                                data.users.forEach(user => {
                                    const option = document.createElement('option');
                                    option.value = user.user_id;
                                    option.textContent = user.full_name;
                                    option.setAttribute('data-departments', user.departments);
                                    option.setAttribute('data-department-ids', user.department_ids);
                                    option.setAttribute('data-designation-ids', user.designation_ids);
                                    userDropdown.appendChild(option);
                                });
                            }
                        })
                        .catch(error => console.error('Error fetching users:', error));
                }
            });
            $("#fk_user_id").on('change', function () {
                const departmentLabel = document.getElementById('department-label');
                const fkDepartmentSelect = document.getElementById('fk_department_id');

                // Get the selected option
                const selectedOption = this.options[this.selectedIndex];

                // Get department names and IDs
                const departmentNames = selectedOption.getAttribute('data-departments');
                const departmentIds = selectedOption.getAttribute('data-department-ids')?.split(',');

                // Update the label
                const hiddenDesignationInput = document.getElementById('fk_designation_id');
                departmentLabel.textContent = departmentNames || 'No User Selected';
                const designationIds = selectedOption.getAttribute('data-designation-ids');
                hiddenDesignationInput.value = designationIds;
                // Clear previous selections in fk_department_id
                Array.from(fkDepartmentSelect.options).forEach(option => {
                    option.selected = false;
                });

                // Select departments in fk_department_id based on the selected user
                if (departmentIds) {
                    departmentIds.forEach(id => {
                        const option = Array.from(fkDepartmentSelect.options).find(opt => opt.value === id);
                        if (option) {
                            option.selected = true;
                        }
                    });
                }

                // Trigger a change event for select2 (if applicable)
                $(fkDepartmentSelect).trigger('change');
            })
            // Initialize DataTable
            var table = $('#usersTable').DataTable({
                dom: '<"dt-top"lfB>rtip',
                buttons: ['copy', 'excel', 'print', {
                    extend: 'pdf', customize: function (doc) {
                        pdfMake.fonts = {
                            unicode: {
                                normal: 'unicode.ttf',
                                bold: 'unicode.ttf',
                                italics: 'unicode.ttf',
                                bolditalics: 'unicode.ttf'
                            }
                        };
                        doc.defaultStyle.font = "unicode";
                    }
                }],
                language: {
                    search: "Search:",
                },
            });

            $('#transferUserForm').submit(function (e) {
                e.preventDefault();
                var formData = $(this).serialize();
                $('#submit').prop('disabled', true);
                $.ajax({
                    url: "<?php echo e(route('transfer-user')); ?>",
                    method: 'POST',
                    data: formData,
                    success: function (response) {
                        $('#transferUserForm')[0].reset();

                        showAlert(response.success, 'success');
                        $('#submit').prop('disabled', false);
                    },
                    error: function (xhr) {
                        showAlert('Something went wrong. Please check the inputs.', 'error');
                        $('#submit').prop('disabled', false);
                    }
                });
            });
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/users/transfer-user.blade.php ENDPATH**/ ?>