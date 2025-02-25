<?php $__env->startSection('styles'); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=department>
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1">Add New / <small> नया जोड़ें</small></h5>
                        <div class=flex-shrink-0>
                            <div class="d-flex flex-wrap gap-2">
                                <a href="<?php echo e(route('docs_list')); ?>" class="btn btn-danger add-btn"><i
                                        class="bx bx-list-ul align me-1"></i> View List</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <form method="post"
                          action="<?php echo e(isset($file_mgmt) ? route('docs_update', $file_mgmt->id) : route('docs_save')); ?>"
                          id="documentForm" autocomplete="off" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <?php if(isset($file_mgmt)): ?>
                            <?php echo method_field('PUT'); ?>
                        <?php endif; ?>
                        <div class="row g-3">
                            <div class="col-lg-3 mt-4 pt-2">
                                <label for="nl" style="cursor: pointer"><input type="radio" name="doc_nature" id="nl" value="NL" <?php echo e(isset($file_mgmt) && $file_mgmt->doc_nature == "NL" ? 'checked' : ''); ?> required> Normal File / <small>सामान्य फ़ाइल</small></label>
                                <label for="tl" style="cursor: pointer"><input type="radio" name="doc_nature" id="tl" value="TL" <?php echo e(isset($file_mgmt) && $file_mgmt->doc_nature == "TL" ? 'checked' : ''); ?> required> TL File / <small>टीएल संबंधी फ़ाइल</small></label>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="file_type" class="form-label">Document Type <small>/ फ़ाइल का
                                            प्रकार </small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="file_type" id="file_type" class="form-control" required>
                                        <option value="">Select Type</option>
                                        <?php $__currentLoopData = $doc_types; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $doc_type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option
                                                value="<?php echo e($doc_type->id); ?>" <?php echo e(isset($file_mgmt) && $file_mgmt->file_type_id == $doc_type->id ? 'selected' : ''); ?>>
                                                <?php echo e($doc_type->name_en); ?> (<?php echo e($doc_type->name_hi); ?>)
                                            </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="issue_date" class="form-label">Issue Date <small>/ जारी
                                            तिथि</small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="date" id="issue_date" name="issue_date" class="form-control"
                                           value="<?php echo e(isset($file_mgmt) ? $file_mgmt->issue_date : old('issue_date')); ?>"
                                           max="<?php echo e(date('Y-m-d')); ?>"
                                           required>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="rec_date" class="form-label">Recieving Date <small>/
                                            प्राप्ति तिथि</small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="date" id="rec_date" name="rec_date" class="form-control"
                                           value="<?php echo e(isset($file_mgmt) ? $file_mgmt->receiving_date : old('rec_date')); ?>"
                                           required>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="ref_no" class="form-label">Document Ref. No. <small>/ फ़ाइल का
                                            क्रमांक</small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="text" id="ref_no" name="ref_no" class="form-control"
                                           value="<?php echo e(isset($file_mgmt) ? $file_mgmt->reference_no : old('ref_no')); ?>"
                                           required>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="ref_no" class="form-label">Document Priority <small>/ फ़ाइल वरीयता</small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="doc_priority" id="doc_priority" class="form-control" required>
                                        <option value="">Select Priority</option>
                                        <option value="Immediate" <?php echo e(isset($file_mgmt) && $file_mgmt->doc_priority == "Immediate" ? 'selected' : ''); ?>>Immediate (तत्काल)</option>
                                        <option value="2" <?php echo e(isset($file_mgmt) && $file_mgmt->doc_priority == "2" ? 'selected' : ''); ?>>Within 2 Days (2 दिन के अंदर)</option>
                                        <option value="5" <?php echo e(isset($file_mgmt) && $file_mgmt->doc_priority == "5" ? 'selected' : ''); ?>>Within 5 Days (5 दिन के अंदर)</option>
                                        <option value="7" <?php echo e(isset($file_mgmt) && $file_mgmt->doc_priority == "7" ? 'selected' : ''); ?>>Within 7 Days (7 दिन के अंदर)</option>
                                        <option value="Other" <?php echo e(isset($file_mgmt) && $file_mgmt->doc_priority == "Other" ? 'selected' : ''); ?>>Other (अन्य)</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="issuer_type" class="form-label">Issuer Type <small>/ जारीकर्ता का
                                            प्रकार </small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <select name="issuer_type" id="issuer_type" class="form-control" required>
                                        <option value="">Select Type</option>
                                        <?php $__currentLoopData = $issuer_types; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $issuer_type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option
                                                value="<?php echo e($issuer_type->id); ?>" <?php echo e(isset($file_mgmt) && $file_mgmt->issuerDetails->issuer_type_id == $issuer_type->id ? 'selected' : ''); ?>>
                                                <?php echo e($issuer_type->name_en); ?> (<?php echo e($issuer_type->name_hi); ?>)
                                            </option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="issuer" class="form-label">Issuer Name<small>/ जारीकर्ता का नाम </small><span
                                            style="color:red;font-size: 16px">*</span></label>
                                    <input type="text" name="issuer" id="issuer" class="form-control typeahead"
                                           value="<?php echo e(isset($file_mgmt) ? $file_mgmt->issuerDetails->name : old('issuer')); ?>"
                                           placeholder="Search or Add issuer name/office/section" required>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <?php if(isset($file_mgmt)): ?>
                                        <?php if($file_mgmt->uploads->isNotEmpty()): ?>
                                            <?php $__currentLoopData = $file_mgmt->uploads; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $upload): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <label for="document" class="form-label">Uploaded Document <small>/
                                                        अपलोड की गयी फ़ाइल</small></label>
                                                <?php
                                                    $file_path= asset('uploads/' . $upload->path);
                                                    if (config('app.env')=='production') {
                                                        $file_path =  config('custom.file_point').$upload->path;
                                                    }
                                                ?>
                                                <button type="button" data-file="<?php echo e($upload->filename); ?>" data-url-type="url" data-src="<?php echo e($file_path); ?>"  data-type="<?php echo e(pathinfo($upload->path, PATHINFO_EXTENSION)); ?>" class="btn btn-sm btn-outline-info file-preview-icon">
                                                    <i class="bx bx-file "></i>
                                                </button>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php else: ?>
                                            N/A
                                        <?php endif; ?>
                                    <?php else: ?>
                                        <label class="form-label">Upload Document <small>/ फ़ाइल अपलोड करें</small><span
                                                style="color:red;font-size: 16px">*</span></label>
                                        <input type="file" id="document" name="document" class="form-control"
                                               accept="image/*, application/pdf" <?php echo e(isset($file_mgmt) ? '' : 'required'); ?>>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <div id="filePreviewContainer" class="file-preview"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row border-top mt-3">
                            <div class="d-flex justify-content-end">
                                <div class="ms-auto mt-3">
                                    <button id="submit" type="submit" class="btn btn-lg btn-success">Save</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
    <script src="<?php echo e(asset('assets/js/typeahead.bundle.js')); ?>"></script>
    <script>
        $(document).ready(function () {
            let issuertypeahead = $('#issuer');
            $('#issuer_type').on('change', function () {
                issuertypeahead.val('');
                let issuerType = $(this).find(':selected').val();
                initTypeahead(issuertypeahead, "ISS",issuerType);
            })
            $('#issue_date').on('change', function () {
                var issueDate = $(this).val();
                $('#rec_date').attr('min', issueDate);
                var recDate = $('#rec_date').val();
                if (recDate && recDate > issueDate) {
                    $('#rec_date').val(issueDate);
                }
            });
            let fileControl = $('#document');
            initFilePreview(fileControl);
        });
        $('#documentForm').on('submit', function(e) {
            e.preventDefault();
            let formData = new FormData(this);
            $.ajax({
                url: $(this).attr('action'),
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function() {
                    $(':input[type="submit"]').prop('disabled', true);
                },
                success: function(response) {
                    if (response.success) {
                        SwalWithCustomSettings.fire({
                            title: 'Success!',
                            text: response.message,
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                $('#documentForm')[0].reset();
                                window.location.href = "<?php echo e(route('docs_list')); ?>";
                            }
                        });

                    } else {
                        showAlert(response.message, 'error');
                    }
                },
                error: function(xhr) {
                    if (xhr.status === 422) {
                        let errors = xhr.responseJSON.errors;
                        let errorMessage = '';
                        $.each(errors, function(key, value) {
                            errorMessage += value[0] + '\n';
                        });
                        showAlert('Validation Error!'.errorMessage, 'warning');
                    } else {
                        showAlert('An unexpected error occurred.', 'error');
                    }
                },
                complete: function() {
                    $(':input[type="submit"]').prop('disabled', false);
                }
            });
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\docs\add.blade.php ENDPATH**/ ?>