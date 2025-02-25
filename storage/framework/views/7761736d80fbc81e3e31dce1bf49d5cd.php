<?php $__env->startSection('content'); ?>
    <div class="col-md-6">
        <div class="card mt-4">
            <div class="card-body p-4">
                <div class="text-center mt-2">
                    <h5 class="text-primary"><?php echo e(__('word.create_new_account')); ?></h5>
                    <p class="text-muted"><?php echo e(__('word.get_free_ac')); ?></p>
                </div>
                <div class="p-2 mt-4">
                    <form class="needs-validation" novalidate action="#">

                        <div class="mb-3">
                            <label for="useremail" class="form-label"><?php echo e(__('word.email')); ?> <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="useremail" placeholder="<?php echo e(__('word.enter_email')); ?>" required>
                            <div class="invalid-feedback">
                                Please enter email
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label"><?php echo e(__('word.username')); ?>  <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="username" placeholder="<?php echo e(__('word.enter_username')); ?> " required>
                            <div class="invalid-feedback">
                                Please enter username
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label" for="password-input"><?php echo e(__('word.password')); ?> </label>
                            <div class="position-relative auth-pass-inputgroup">
                                <input type="password" class="form-control pe-5 password-input" onpaste="return false" placeholder="<?php echo e(__('word.enter_password')); ?> " id="password-input" aria-describedby="passwordInput" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon" type="button" id="password-addon"><i class="ri-eye-fill align-middle"></i></button>
                                <div class="invalid-feedback">
                                    Please enter password
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <p class="mb-0 fs-12 text-muted fst-italic">By registering you agree to the TLMIS <a href="#" class="text-primary text-decoration-underline fst-normal fw-medium">Terms of Use</a></p>
                        </div>

                        <div id="password-contain" class="p-3 bg-light mb-2 rounded">
                            <h5 class="fs-13">Password must contain:</h5>
                            <p id="pass-length" class="invalid fs-12 mb-2">Minimum <b>8 characters</b></p>
                            <p id="pass-lower" class="invalid fs-12 mb-2">At <b>lowercase</b> letter (a-z)</p>
                            <p id="pass-upper" class="invalid fs-12 mb-2">At least <b>uppercase</b> letter (A-Z)</p>
                            <p id="pass-number" class="invalid fs-12 mb-0">A least <b>number</b> (0-9)</p>
                        </div>

                        <div class="mt-4">
                            <button class="btn btn-success w-100" type="submit">Sign Up</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="m-4 text-center">
            <p class="mb-0">Already have an account ? <a href="<?php echo e(route('sign-in')); ?>" class="fw-semibold text-primary text-decoration-underline"> Signin </a> </p>
        </div>

    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\auth\sign_up.blade.php ENDPATH**/ ?>