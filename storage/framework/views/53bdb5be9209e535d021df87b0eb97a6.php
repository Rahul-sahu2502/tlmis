<?php $__env->startSection('styles'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>" />
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>"/>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class=row>
        <div class=col-lg-5>
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
            <form method="post" id="departmentForm" autocomplete="off">
                <?php echo csrf_field(); ?>
                <input type="hidden" name="existing_dept_id" value="<?php echo e(@$dept_id); ?>">
                <div class=card id=department>
                    <div class="card-header">
                        <div class="d-flex align-items-center">
                            <h5 class="card-title mb-0 flex-grow-1">Add New / <small> नया जोड़ें</small></h5>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="issuer_type" class="form-label">Issuer Type <small>/ जारीकर्ता का
                                            प्रकार </small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="issuer_type" id="issuer_type" class="form-control" required>
                                        <option value="">Select Type</option>
                                        <?php $__currentLoopData = $issuer_types; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $issuer_type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option <?php if(isset($department->fk_issuer_type) && $issuer_type->id == $department->fk_issuer_type): ?> <?php echo e("selected"); ?> <?php endif; ?>
                                                value="<?php echo e($issuer_type->id); ?>" <?php echo e(isset($file_mgmt) && $file_mgmt->issuerDetails->issuer_type_id == $issuer_type->id ? 'selected' : ''); ?>>
                                                <?php echo e($issuer_type->name_en); ?> (<?php echo e($issuer_type->name_hi); ?>)
                                            </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <label for="department_eng" class="form-label">Department Name In English / <small> विभाग का नाम इंगलिश में</small><span
                                        style="color:red;font-size: 16px">*</span></label>
                                <input type="text" id="department_eng" name="department_eng"  pattern="^[a-zA-Z\s]+$"  title="Please enter only English letters and spaces." class="form-control" required=""
                                       value="<?php echo e(@$department->department_eng); ?>">
                                <?php $__errorArgs = ['department_eng'];
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
                            <div class="col-lg-12">
                                <label for="department_hin" class="form-label">Department Name In Hindi  / <small> विभाग का नाम हिन्दी में</small><span
                                        style="color:red;font-size: 16px">*</span></label>
                                <input type="text" id="department_hin"  pattern="^[\p{Devanagari}\s]+$"  title="Please enter only Hindi letters and spaces." name="department_hin" class="form-control" required=""
                                       value="<?php echo e(@$department->department_hin); ?>">
                                <?php $__errorArgs = ['department_hin'];
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
                                <button type="submit" class="btn btn-success">Save</button>
                                
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
                        <h5 class="card-title mb-0 flex-grow-1">Existing List  / <small> उपलब्ध सूची</small></h5>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive simplebar-scrollable-y mb-4" data-simplebar="init" data-simplebar-auto-hide="false" data-simplebar-track="dark" style="max-height: 400px;">
                        <table class="table table-bordered datatable mb-0" id=usersTable width="100%">
                            <thead class="table-dark">
                            <tr>
                                <th width="10%" class=sort data-sort=id>S.No.</th>
                                <th width="40%" class=sort data-sort=type>Type</th>
                                <th width="40%" class=sort data-sort=deptEng>Name In English</th>
                                <th width="40%" class=sort data-sort=deptHin>Name In Hindi</th>
                                <th width="10%" class=sort data-sort=action>Action</th>
                            </tr>
                            </thead>
                            <tbody class="list form-check-all">
                                <?php $__currentLoopData = $departments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dept): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($loop->index+1); ?></td>


                                        <td class=full_name>
                                            <?php if($dept->issuerType->isNotEmpty()&&isset($dept->issuerType)&&!empty($dept->issuerType)): ?>
                                            <?php echo e($dept->issuerType->first()->name_en .' ('.$dept->issuerType->first()->name_hi .')'); ?>

                                            <?php endif; ?>
                                        </td>
                                        <td class=full_name><?php echo e($dept->department_eng); ?></td>
                                        <td class=mobile><?php echo e($dept->department_hin); ?></td>
                                        <td class=edit>
                                            <a class="btn btn-info btn-sm" href="<?php echo e(route('department',['id'=>urlencode(base64_encode($dept->dept_id))])); ?>">Update</a>
                                        </td>
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
    <script src="<?php echo e(asset('assets/js/typeahead.bundle.js')); ?>"></script>
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
            $('#departmentForm').on('submit', function (e) {
                e.preventDefault();
                let formData = $(this).serialize();
                $(':input[type="submit"]').prop('disabled', true);
                $.ajax({
                    url: '<?php echo e(route("department")); ?>',
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
                                    $('#departmentForm')[0].reset();
                                    window.location.href = "<?php echo e(route('department')); ?>";
                                    $(':input[type="submit"]').prop('disabled', false);
                                }
                            });

                        } else {
                            SwalWithCustomSettings.fire('Error!', response.message || 'An error occurred.', 'error');
                        }
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

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\department\department.blade.php ENDPATH**/ ?>