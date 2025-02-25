<?php $__env->startSection('styles'); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row" id="blockUI">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title normal-text">Manage Header</h4>
                            <hr>
                            <form class="forms-sample" id="manageForm">
                                <?php echo csrf_field(); ?>
                                <input type="hidden" id="id" name="id"
                                    value="<?php echo e(@$editItem->id && $editItem->id ? $editItem->id : 0); ?>">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="">हेडर का नाम:</label>
                                            <input type="text" name="header_name" class="form-control" id="header_name"
                                                value="<?php echo e(@$editItem->header_name); ?>">
                                            <small class="error"></small>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="address" class="normal-text">विवरण दर्ज करें:</label>
                                            <textarea name="description" id="description" cols="30" rows="10" class="form-control ckeditor"><?php echo e(@$editItem->description); ?></textarea>
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
                            <h4 class="card-title normal-text">Header List</h4>
                            <hr>
                            <div class="table-responsive">
                                <table class="table table-bordered datatable">
                                    <thead>
                                        <tr>
                                            <th width="40" class="text-center normal-text">SNo.</th>
                                            <th class="text-wrap text-center normal-text">हेडर का नाम</th>
                                            <th class="text-wrap text-center normal-text">विवरण</th>
                                            <th class="text-wrap text-center normal-text">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php if(@$headerList): ?>
                                            <?php $__currentLoopData = $headerList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td class="text-center"><?php echo e($key + 1); ?></td>
                                                    <td class="text-center normal-text"><?php echo e($value->header_name); ?></td>
                                                    <td class="text-center normal-text"><?php echo $value->description; ?></td>
                                                    <td class="text-center">
                                                        <a href="<?php echo e(url('manage-header/' . $value->id)); ?>"
                                                            class="btn btn-sm btn-primary btn-rounded edit normal-text"
                                                            data-id="<?php echo e($value->id); ?>"><i
                                                                class="mdi mdi-pencil-box-outline"></i> Edit</a>
                                                        
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
                url: "<?php echo e(url('submit-header-detail')); ?>",
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
                            location.href = '<?php echo e(url("manage-header")); ?>';
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
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\letters\manage_header.blade.php ENDPATH**/ ?>