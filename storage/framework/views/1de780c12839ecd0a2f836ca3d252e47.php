<?php $__env->startSection('styles'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>" />
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>"/>
<style>
    .filters{
        width: 160px;
    }
</style>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class=row>
    <div class=col-lg-12>
        <div class=card id=tasksList>
            <div class="card-header">
                <div class="d-flex flex-wrap align-items-center">
                    <h5 class="card-title flex-grow-1">Available Documents / <small> उपलब्ध दस्तावेज</small> </h5>
                    <div class="d-flex flex-wrap gap-1 ms-auto justify-content-end">
                        <div class="d-flex align-items-center gap-1">
                            <div class="form-group">
                                <label for="filter-nature">Filter By  :Nature</label>
                                <select id="filter-nature" class="form-control select2 filters">
                                    <option value="">All</option>
                                    <option value="Normal File">Normal File (सामान्य फ़ाइल)</option>
                                    <option value="TL File">TL File (टीएल संबंधी फ़ाइल)</option>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex align-items-center gap-1">
                            <div class="form-group">
                                <label for="filter-type">Filter By : Type</label>
                                <select id="filter-type" class="form-control select2 filters">
                                    <option value="">All</option>
                                    <?php $__currentLoopData = $doc_types; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($type->name_en); ?> (<?php echo e($type->name_hi); ?>)"><?php echo e($type->name_en); ?> (<?php echo e($type->name_hi); ?>)</option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        </div>
                        <div class="d-flex align-items-center gap-1">
                            <div class="form-group">
                                <label for="filter-priority">Filter By : Priority</label>
                                <select id="filter-priority" class="form-control select2 filters">
                                    <option value="">All</option>
                                    <option value="Immediate (तत्काल)">Immediate (तत्काल)</option>
                                    <option value="Within 2 Days (2 दिन के अंदर)">Within 2 Days (2 दिन के अंदर)</option>
                                    <option value="Within 5 Days (5 दिन के अंदर)">Within 5 Days (5 दिन के अंदर)</option>
                                    <option value="Within 7 Days (7 दिन के अंदर)">Within 7 Days (7 दिन के अंदर)</option>
                                    <option value="Other (अन्य)">Other (अन्य)</option>
                                </select>
                            </div>
                        </div>
                        <div class="flex-shrink-0 mt-4">
                            <a href="<?php echo e(route('docs_add')); ?>" class="btn btn-danger add-btn">
                                <i class="ri-add-line align-bottom me-1"></i> Add New
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class=card-body>
                
                <div class="table-responsive table-card mt-2">
                    <table class="table table-bordered align-middle table-nowrap datatable mb-0 w-100" id=reviews_table width="100%">
                        <thead>
                            <tr>
                                <th width="5%">#</th>
                                <th width="10%">Nature</th>
                                <th width="10%">Type</th>
                                <th width="15%">Reference No.</th>
                                <th width="10%">Issue Date</th>
                                <th width="10%">Receiving Date</th>
                                <th width="10%">Issuer</th>
                                <th width="10%">Priority</th>
                                <th width="5%" class="text-center">File </th>
                                <th width="15%" class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__empty_1 = true; $__currentLoopData = $files; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $file): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                            <tr id="<?php echo e($file->id); ?>">
                                <td width="5%">
                                <?php echo e($index + 1); ?>

                                </td>
                                <td width="10%"><?php echo e($file->doc_nature=='NL' ? 'Normal File' : 'TL File'); ?></td>
                                <td width="10%"><?php echo e($file->fileTypeDetails->name_en); ?> (<?php echo e($file->fileTypeDetails->name_hi); ?>)</td>
                                <td width="15%"><?php echo e($file->reference_no); ?></td>
                                <td width="10%"><?php echo e(date('d M,Y',strtotime($file->issue_date))); ?></td>
                                <td width="10%"><?php echo e(date('d M,Y',strtotime($file->receiving_date))); ?></td>
                                <td width="5%"><?php echo e($file->issuerDetails->name); ?></td>
                                <td width="15%"><?php echo e($file->doc_priority_label); ?>

                                </td>
                                <td class="text-center">
                                    <?php if($file->uploads->isNotEmpty()): ?>
                                    <?php $__currentLoopData = $file->uploads; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $upload): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php
                                        $file_path= asset('uploads/' . $upload->path);
                                        if (config('app.env')=='production') {
                                            $file_path =  config('custom.file_point').$upload->path;
                                        }
                                    ?>
                                    <button data-file="<?php echo e(basename($upload->filename)); ?>" data-src="<?php echo e($file_path); ?>"  data-type="<?php echo e(pathinfo($upload->path, PATHINFO_EXTENSION)); ?>" class="btn btn-xs btn-outline-info file-preview-icon">
                                        <i class="bx bx-file"></i>
                                    </button>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php else: ?>
                                    N/A
                                    <?php endif; ?>
                                </td>
                                <td class="text-center">
                                    <a href="<?php echo e(route('docs_add', ['id' => $file->id])); ?>" class="btn btn-sm btn-primary"><i class="bx bx-pencil"></i> </a>
                                    <button type="button" class="btn btn-sm btn-danger delete"><i class="bx bx-trash"></i> </button>
                                </td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                            <tr>
                                <td colspan="10" class="text-center">No documents found.</td>
                            </tr>
                            <?php endif; ?>
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
<script>
    $(document).ready(function() {
        var table = $('.datatable').DataTable({
            dom: '<"dt-top"lfB>rtip',
            buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
            language: {
                search: "Search:",
            },
        });
        $('#status_filter').on('change', function () {
            var selectedValue = $(this).val();
            table.column(2).search(selectedValue).draw();
        });
        $('#filter-nature').on('change', function () {
            var selectedValue = $(this).val();
            table.column(1).search(selectedValue).draw();
        });

        $('#filter-type').on('change', function () {
            var selectedValue = $(this).val();
            table.column(2).search(selectedValue).draw();
        });

        $('#filter-priority').on('change', function () {
            var selectedValue = $(this).val();
            table.column(7).search(selectedValue).draw();
        });
    });
    $('.delete').click(function() {
        let tr =$(this).closest('tr');
        let docId = tr.attr('id');
        SwalWithCustomSettings.fire({
            title: 'Are you sure?',
            text: "This action cannot be undone!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: `/docs-delete/${docId}`,
                    type: 'DELETE',
                    headers: {
                        'X-CSRF-TOKEN': "<?php echo e(csrf_token()); ?>"
                    },
                    success: function(response) {
                        if (response.success) {
                            showAlert(response.message, 'success');
                            tr.remove();
                        } else {
                            showAlert(response.message, 'error');
                        }
                    },
                    error: function(xhr) {
                        if (xhr.responseJSON && xhr.responseJSON.message) {
                            showAlert(xhr.responseJSON.message, 'error');
                        } else {
                            showAlert('An error occurred while deleting the document.', 'error');
                        }
                    }
                });
            }
        });
    });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/docs/list.blade.php ENDPATH**/ ?>