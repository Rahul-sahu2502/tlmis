<?php $__env->startSection('content'); ?>
<div class="row">
    <div class=col-lg-5>
        <?php if(Session::has('success') || Session::has('success_message')): ?>
        <div class="alert alert-success">
            <?php echo e(Session::get('success') ?? Session::get('success_message')); ?>

        </div>
        <?php endif; ?>
        <?php if(Session::has('error') || Session::has('error_message')): ?>
        <div class="alert alert-danger">
            <?php echo e(Session::get('error') ?? Session::get('error_message')); ?>

        </div>
        <?php endif; ?>
        <form method="post" id="chnagePasswordForm" autocomplete="off">
            <?php echo csrf_field(); ?>
            <div class="card" id="password">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Update Your Current Password</h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <!-- Current Password -->
                        <div class="col-lg-12">
                            <label for="current_password" class="form-label">Current Password<span
                                    style="color:red;font-size: 16px">*</span></label>
                            <div class="position-relative auth-pass-inputgroup mb-3">
                                <input type="password" id="current_password" name="current_password" class="form-control password-input" required>
                                <?php $__errorArgs = ['current_password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <span class="text-danger"><?php echo e($message); ?></span>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                <button
                                    class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                                    type=button id=password-addon><i
                                        class="ri-eye-fill align-middle"></i></button>
                            </div>
                        </div>

                        <!-- New Password -->
                        <div class="col-lg-12">
                            <label for="new_password" class="form-label">New Password<span
                                    style="color:red;font-size: 16px">*</span></label>
                            <div class="position-relative auth-pass-inputgroup mb-3">
                                <input type="password" id="new_password" name="new_password" class="form-control password-input" required
                                    pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}" minlength="8"
                                    title="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.">
                                <small id="passwordHelp" class="form-text text-muted">
                                    Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.
                                </small>
                                <?php $__errorArgs = ['new_password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <span class="text-danger"><?php echo e($message); ?></span>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                <button
                                    class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                                    type=button id=password-addon1><i
                                        class="ri-eye-fill align-middle"></i></button>
                            </div>
                        </div>

                        <!-- Confirm New Password -->
                        <div class="col-lg-12">
                            <label for="confirm_new_password" class="form-label">Confirm New Password<span
                                    style="color:red;font-size: 16px">*</span></label>
                            <div class="position-relative auth-pass-inputgroup mb-3">
                                <input type="password" id="confirm_new_password" name="confirm_new_password" class="form-control password-input" required
                                    pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}" minlength="8"
                                    title="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.">
                                <span class="text-danger" id="passwordMismatch" style="display: none;">Passwords do not match</span>
                                <?php $__errorArgs = ['confirm_new_password'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                <span class="text-danger"><?php echo e($message); ?></span>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                <button
                                    class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                                    type=button id=password-addon2><i
                                        class="ri-eye-fill align-middle"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-end">
                        <div class="ms-auto">
                            <button type="submit" class="btn btn-success" id="saveButton">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
<script src="<?php echo e(asset('assets/js/pages/password-addon.init.js')); ?>"></script>
<script src="<?php echo e(asset('assets/js/typeahead.bundle.js')); ?>"></script>
<script src="<?php echo e(asset('assets/js/custom/sha512.js')); ?>"></script>
<script>
    $(document).ready(function() {
        const currPassword = document.getElementById("current_password");
        const newPassword = document.getElementById("new_password");
        const confirmNewPassword = document.getElementById("confirm_new_password");
        const passwordMismatch = document.getElementById("passwordMismatch");
        const saveButton = document.getElementById("saveButton");
        const encryptionKey = '<?php echo e(Config::get('salt.STATIC_SALT')); ?>';

        function hashPassword(password) {
            let securePwd = encryptionKey + password + encryptionKey;
            let shaObj = new jsSHA("SHA-512", "TEXT");
            shaObj.update(securePwd);
            return shaObj.getHash("HEX");
        }

        function validatePasswords() {
            if (newPassword.value !== confirmNewPassword.value) {
                passwordMismatch.style.display = "block";
                saveButton.disabled = true;
            } else {
                passwordMismatch.style.display = "none";
                saveButton.disabled = false;
            }
        }

        newPassword.addEventListener("input", validatePasswords);
        confirmNewPassword.addEventListener("input", validatePasswords);
        $('#chnagePasswordForm').on('submit', function(e) {
            e.preventDefault();
            currPassword.value = hashPassword(currPassword.value);
            newPassword.value = hashPassword(newPassword.value);
            confirmNewPassword.value = hashPassword(confirmNewPassword.value);
            let formData = $(this).serialize();
            $.ajax({
                url: '<?php echo e(route("change-password")); ?>',
                type: 'POST',
                data: formData,
                success: function(response) {
                    console.log(response);
                    if (response.success) {
                        //SwalWithCustomSettings.fire('Success!', response.message, 'success');
                        SwalWithCustomSettings.fire({
                            title: 'Success!',
                            text: response.message,
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $('#chnagePasswordForm')[0].reset();
                                window.location.href = "<?php echo e(route('logout')); ?>";
                            }
                        });

                    } else {
                        SwalWithCustomSettings.fire('Error!', response.message || 'An error occurred.', 'error');
                    }
                },
                error: function(xhr) {
                    console.log(xhr);
                    if (xhr.status === 422) {
                        let errors = xhr.responseJSON.errors;
                        let errorMessage = '';
                        $.each(errors, function(key, value) {
                            errorMessage += value[0] + '\n';
                        });
                        SwalWithCustomSettings.fire('Validation Error!', errorMessage, 'warning');
                    } else {
                        SwalWithCustomSettings.fire('Error!', 'An unexpected error occurred.', 'error');
                    }
                }
            });
        });
    });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/auth/change_password.blade.php ENDPATH**/ ?>