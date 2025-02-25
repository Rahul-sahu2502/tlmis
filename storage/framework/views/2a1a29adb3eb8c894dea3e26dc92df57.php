<?php $__env->startSection('styles'); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row" id="blockUI">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title normal-text">Manage Signatory</h4>
                            <hr>
                            <form class="forms-sample" id="manageForm">
                                <?php echo csrf_field(); ?>
                                <input type="hidden" id="id" name="id"
                                    value="<?php echo e(@$editItem->id && $editItem->id ? $editItem->id : 0); ?>">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="">पद:</label>
                                            <select name="signatory_id" id="signatory_id" class="form-control">
                                                <option value="">-- चुनें --</option>
                                                <?php if(@$signatoryList): ?>
                                                    <?php $__currentLoopData = $signatoryList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <?php
                                                            $sel =
                                                                @$editItem->signatory_id == $value->id
                                                                    ? 'selected'
                                                                    : '';
                                                        ?>
                                                        <option value="<?php echo e($value->id); ?>" <?php echo e($sel); ?>>
                                                            <?php echo e($value->signatory); ?></option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <?php endif; ?>
                                            </select>
                                            <small class="error"></small>
                                        </div>
                                    </div>

                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <label for="">अधिकारी का नाम:</label>
                                            <input type="text" name="officer_name" class="form-control" id="officer_name"
                                                value="<?php echo e(@$editItem->officer_name); ?>">
                                            <small class="error"></small>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary mt-4 normal-text">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title normal-text">Signatory List</h4>
                            <hr>
                            <div class="table-responsive">
                                <table class="table table-bordered datatable">
                                    <thead>
                                        <tr>
                                            <th width="40" class="text-center normal-text">SNo.</th>
                                            <th class="text-wrap text-center normal-text">पद</th>
                                            <th class="text-wrap text-center normal-text">अधिकारी</th>
                                            <th class="text-wrap text-center normal-text">Status</th>
                                            <th class="text-wrap text-center normal-text">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if(@$signatoryData): ?>
                                            <?php $__currentLoopData = $signatoryData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td class="text-center"><?php echo e($key + 1); ?></td>
                                                    <td class="text-center normal-text"><?php echo e($value->signatory); ?></td>
                                                    <td class="text-center normal-text"><?php echo $value->officer_name; ?></td>
                                                    <td class="text-center normal-text status-td">
                                                        <?php if($value->status == 'Y'): ?>
                                                            <span class="text-success fw-bold">Active</span>
                                                        <?php else: ?>
                                                            <span class="text-danger fw-bold">Inactive</span>
                                                        <?php endif; ?>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="<?php echo e(url('manage-signatory/' . $value->officer_id)); ?>"
                                                            class="btn btn-sm btn-primary btn-rounded edit normal-text"
                                                            data-id="<?php echo e($value->officer_id); ?>"><i
                                                                class="mdi mdi-pencil-box-outline"></i> Edit</a>
                                                        
                                                        <button
                                                            class="btn btn-sm btn-info btn-rounded edit normal-text change-status"
                                                            data-id="<?php echo e($value->officer_id); ?>"><i
                                                                class="mdi mdi-swap-horizontal"></i> Change Status</button>
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
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
    <script src="<?php echo e(asset('assets/libs/ckeditor/ckeditor.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/jquery.blockUI.js')); ?>"></script>
    <script>
        $(document).on('submit', '#manageForm', function(e) {
            e.preventDefault();
            $('.is-invalid').removeClass('is-invalid');
            $('.invalid-feedback').removeClass('invalid-feedback').text('');
            var form = new FormData(this);
            $.ajax({
                url: '<?php echo e(url("submit-signatory-detail")); ?>',
                type: "POST",
                data: form,
                contentType: false,
                cache: false,
                processData: false,
                dataType: 'json',
                beforeSend: function() {
                    $('#blockUI').block({
                        message: '<h6>Processing...</h6>',
                        css: {
                            border: '1px solid #000'
                        }
                    });
                },
                success: function(response) {
                    if (response.status == 'success') {
                        Swal.fire("Great!", response.msg, "success").then(function() {
                            location.href = '<?php echo e(url("manage-signatory")); ?>';
                        });
                    } else if (response.status == 'failed') {
                        if (response.msg && $.isEmptyObject(response.errors) == true) {
                            Swal.fire("Sorry!", response.msg, "error");
                        } else {
                            $.each(response.errors, function(index, value) {
                                $('#' + index).addClass('is-invalid');
                                $('#' + index + '~small.error').addClass('invalid-feedback')
                                    .text(value);
                            });
                        }
                    }
                },
                complete: function() {
                    $('#blockUI').unblock();
                },
                error: function(xhr) {
                    console.log(xhr);
                    $('#blockUI').unblock();
                }
            });
        });

        $(document).on('click', '.change-status', function(e) {
            e.preventDefault();
            var officer_id = $(this).data('id');
            $.ajax({
                url: '<?php echo e(url("change-signatory-status")); ?>',
                type: "GET",
                data: {
                    officer_id: officer_id
                },
                contentType: false,
                cache: false,
                dataType: 'json',
                context: this,
                beforeSend: function() {
                    $('#blockUI').block({
                        message: '<h6>Processing...</h6>',
                        css: {
                            border: '1px solid #000'
                        }
                    });
                },
                success: function(response) {
                    if (response.status == 'success') {
                        let td_status = (response.new_status == 'Y') ?
                            '<span class="text-success fw-bold">Active</span>' :
                            '<span class="text-danger fw-bold">Inactive</span>';

                        $(this).closest('tr').find('.status-td').html(td_status);
                        Swal.fire("Great!", response.msg, "success");
                    } else if (response.status == 'failed') {
                        if (response.msg && $.isEmptyObject(response.errors) == true) {
                            Swal.fire("Sorry!", response.msg, "error");
                        } else {
                            $.each(response.errors, function(index, value) {
                                $('#' + index).addClass('is-invalid');
                                $('#' + index + '~small.error').addClass('invalid-feedback')
                                    .text(value);
                            });
                        }
                    }
                },
                complete: function() {
                    $('#blockUI').unblock();
                },
                error: function(xhr) {
                    console.log(xhr);
                    $('#blockUI').unblock();
                }
            });
        });
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\letters\manage_signatory.blade.php ENDPATH**/ ?>