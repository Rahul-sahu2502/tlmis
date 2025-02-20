<?php $__env->startSection('content'); ?>
    <div class=row>
        <div class=col-lg-12>
            <?php if(Session::has('success')): ?>
                <div class="alert alert-success">
                    <?php echo e(Session::get('success')); ?>

                </div>
            <?php endif; ?>

            <?php if(Session::has('error')): ?>
                <div class="alert alert-danger">
                    <?php echo e(Session::get('error')); ?>

                </div>
            <?php endif; ?>
            <form method="post" id="userInsertion" autocomplete="off">
                <?php echo csrf_field(); ?>
                <div class=card id=UsersList>
                    <div class="card-header border-0">
                        <div class="d-flex align-items-center">
                            <?php if(@$user_id): ?>
                                <h5 class="card-title mb-0 flex-grow-1"> Update / <small> अपडेट </small> </h5>
                            <?php else: ?>
                                <h5 class="card-title mb-0 flex-grow-1">Add New / <small> नया जोड़ें</small></h5>
                            <?php endif; ?>

                            <div class=flex-shrink-0>
                                <div class="d-flex flex-wrap gap-2">
                                    <a href="<?php echo e(route('view-user')); ?>" class="btn btn-danger add-btn"><i
                                            class="bx bx-list-ul me-1"></i> View List</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body border border-dashed border-end-0 border-start-0">
                        <input type="hidden" name="existing_user_id" value="<?php echo e(@$user_id); ?>">
                        <div class="row g-3">
                            <div class="col-lg-4">
                                <div>
                                    <label for="level" class="form-label">User Level / <small> उपयोगकर्ता का स्तर</small> <span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="fk_level_id" id="fk_level_id" class="form-control" required>
                                        <option value="">Select</option>
                                        <?php $__currentLoopData = $levels; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $level): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($level->level_id); ?>"
                                            <?php if(isset($users) && !empty($users)): ?>
                                                <?php echo e($level->level_id == $users->userMaps->first()->level->level_id ? 'selected' : ''); ?>

                                                <?php endif; ?>
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
                            <div class="col-lg-4">
                                <div>
                                    <label for="fk_designation_id" class="form-label">Designation / <small> पदनाम</small> <span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="text" id="designation" name="designation"
                                           class="form-control typeahead"
                                           placeholder="Search or Add Designation" value="<?php if(isset($users) && !empty($users)): ?>
    <?php echo e($users->userMaps->first()->designation->designation); ?><?php endif; ?>">
                                    <?php $__errorArgs = ['designation'];
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
                            <div class="col-lg-4">
                                <div>
                                    <label for="fk_department_id" class="form-label">Related Offices / <small> संबंधित कार्यालय</small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="fk_department_id[]" multiple id="fk_department_id" aria-label="multiple select" class="form-control select2" required>
                                        <option value="" disabled>Select</option>
                                        <?php $__currentLoopData = $departments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $department): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($department->dept_id); ?>"
                                                    <?php if(isset($users) && !empty($users)): ?>
                                                        <?php $__currentLoopData = $users->userMaps; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $userMap): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php echo e($department->dept_id == $userMap->department->dept_id ? 'selected' : ''); ?>

                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <?php endif; ?>
                                            ><?php echo e($department->department_eng . ' ('.$department->department_hin.')'); ?>

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

                            <div class="col-lg-4">
                                <label for="full_name" class="form-label">Full Name / <small> पूरा नाम</small><span
                                        style="color:red;font-size: 16px">*</span></label>
                                <input type="text" id="full_name" name="full_name" class="form-control" required=""
                                       value="<?php echo e(@$users->full_name); ?>">
                                <?php $__errorArgs = ['full_name'];
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
                            <div class="col-lg-4">
                                <label for="mobile" class="form-label">Mobile Number / <small> मोबाइल नंबर</small><span
                                        style="color:red;font-size: 16px">*</span></label>
                                <input type="text" id="mobile" name="mobile" class="form-control" required=""
                                       maxlength="10" minlength="10"
                                       pattern="^[6-9]\d{9}$" value="<?php echo e(@$users->mobile); ?>">
                                <?php $__errorArgs = ['mobile'];
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
                            <div class="col-lg-4">
                                <label for="email" class="form-label">Email-Id / <small> ईमेल आईडी</small><span
                                        style="color:red;font-size: 16px"></span></label>
                                <input type="email" id="email" name="email" class="form-control"
                                       pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                       title="Enter a valid email address." value="<?php echo e(@$users->email); ?>">
                                <?php $__errorArgs = ['email'];
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
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
    <script src="<?php echo e(asset('assets/js/typeahead.bundle.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/select2/select2.min.js')); ?>"></script>
    <script>
        $(document).ready(function () {
            $(".select2").select2();
            let designationTypeahead = $('#designation');
            designationTypeahead.typeahead({
                minLength: 3,
                highlight: true,
                hint: true
            }, {
                name: 'designations',
                display: 'designation',
                source: function (query, syncResults, asyncResults) {
                    $.ajax({
                        url: '<?php echo e(route("getDesignations")); ?>',
                        data: {query: query},
                        success: function (data) {
                            asyncResults(data);
                        }
                    });
                }
            });


            $('#userInsertion').on('submit', function (e) {
                e.preventDefault();

                let formData = $(this).serialize();
                $(':input[type="submit"]').prop('disabled', true);
                $.ajax({
                    url: '<?php echo e(route("add-user")); ?>',
                    type: 'POST',
                    data: formData,
                    success: function (response) {
                        if (response.success) {
                            //SwalWithCustomSettings.fire('Success!', response.message, 'success');
                            SwalWithCustomSettings.fire({
                                title: 'Success!',
                                text: response.message,
                                icon: 'success',
                                confirmButtonText: 'OK'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $('#userInsertion')[0].reset();
                                    window.location.href = "<?php echo e(route('view-user')); ?>";
                                    $(':input[type="submit"]').prop('disabled', false);
                                }
                            });

                        } else {
                            SwalWithCustomSettings.fire('Error!', response.message || 'An error occurred.', 'error');
                        }
                        $(':input[type="submit"]').prop('disabled', false);
                    },
                    error: function (xhr) {
                        if (xhr.status === 422) {
                            let errors = xhr.responseJSON.errors;
                            let errorMessage = '';
                            $.each(errors, function (key, value) {
                                errorMessage += value[0] + '\n';
                            });
                            SwalWithCustomSettings.fire('Validation Error!', errorMessage, 'warning');
                        } else {
                            SwalWithCustomSettings.fire('Error!', 'An unexpected error occurred.', 'error');
                        }
                        $(':input[type="submit"]').prop('disabled', false);
                    }
                });
            });
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/users/add.blade.php ENDPATH**/ ?>