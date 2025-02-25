<h5 for="ref_docs" class="form-label">Reference Document <small>/ संबन्धित फ़ाइल चुनें </small></h5>
<span class="display-none" name="filter_task_id" id="filter_task_id" data-t="<?php echo e($task_id); ?>">
<div class="row bg-body">
    <div class="col-lg-10">
        <div class="row mt-2">
            <div class="col-lg-6">
                <input type="text" id="ref_no" class="form-control form-control-sm" placeholder="Reference no.">
            </div>
            <div class="col-lg-6">
                <input type="date" id="issue_date" title="Issue Date" max="<?php echo e(date('Y-m')); ?>" class="form-control form-control-sm" placeholder="Issue date">
            </div>
        </div>
        <div class="row mt-2">
            <div class="col-lg-6">
                <select id="file_type" class="form-select">
                    <option value="" selected disabled>Document Type</option>
                    <option value="A">All</option>
                    <?php $__currentLoopData = $doc_types ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $doc_type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($doc_type->id); ?>"> <?php echo e($doc_type->name_en); ?> (<?php echo e($doc_type->name_hi); ?>)</option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
            </div>
            <div class="col-lg-6">
                <select id="usage" required class="form-select">
                    <option value="" disabled>Select</option>
                    <option value="A">All</option>
                    <option value="Y">Attached</option>
                    <option value="N" selected>Not Attached</option>
                </select>
            </div>
        </div>
    </div>
    <div class="col-lg-2 text-center mt-2">
        <button type="button" id="filter" class="btn btn-primary btn-sm w-40 m-1">Filter</button>
        <button type="button" id="reset" class="btn btn-warning btn-sm w-40 m-1">Reset</button>
    </div>
</div>
<div class="table-responsive mt-2 min-card-height">
    <table class="table table-bordered datatable mb-0">
        <thead>
        <tr>
            <th width="15%" class="text-center"><input type="checkbox" class="form-check check_all"></th>
            <th width="10%">Type</th>
            <th width="50%">Reference No./Issue Date</th>
            <th width="15%">Issuer</th>
            <th width="10%">File</th>
        </tr>
        </thead>
        <tbody id="tBody">
        </tbody>
    </table>
</div>
<?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\tasks\_partial_files.blade.php ENDPATH**/ ?>