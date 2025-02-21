<?php $__env->startSection('styles'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>" />
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>"/>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class=row>
    <div class=col-lg-12>
        <div class=card id=tasksList>
            <div class="card-header border-0">
                <div class="d-flex align-items-center">
                    <h5 class="card-title mb-0 flex-grow-1">Scheduled Reviews / <small> समीक्षा की सूची</small></h5>
                    <div class=flex-shrink-0>
                        <div class="d-flex flex-wrap gap-1">
                            <div class="d-flex align-items-center gap-1">
                                <div class=form-group>
                                    <label for="status_filter">Filter By Status</label>
                                    <select id="status_filter" name="status_filter" class="form-control select2">
                                        <option value="ALL">All</option>
                                        <option value="SCH">Scheduled</option>
                                        <option value="CMP">Completed</option>
                                        <option value="PST">Postponed</option>
                                        <option value="CNC">Cancelled</option>
                                    </select>
                                </div>
                                <?php if(Session::get('level_id') == '1'): ?>
                                    <a href="<?php echo e(route('tl_new')); ?>" class="btn btn-danger add-btn mt-4"><i
                                        class="ri-add-line align-bottom me-1"></i>Add New </a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=card-body>
                <div class="table-responsive table-card mb-4">
                    <table class="table table-bordered align-middle table-nowrap mb-0 w-100" id=reviews_table width="100%">
                        <thead>
                            <tr>
                                <th width="10%">ID</th>
                                <th width="15%">TL Date</th>
                                <th width="10%">TL Time</th>
                                <th width="55%">TL Title</th>
                                <th width="15%" class="text-center">TL Status</th>
                                <th width="15%" class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="list form-check-all">
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
        var table = $('#reviews_table').DataTable({
            processing: true,
            serverSide: true,
            deferRender: true,
            dom: '<"dt-top"lfB>rtip',
            buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
            language: {
                search: "Search:",
            },
            ajax: {
                url: 'tl-list',
                type: 'GET',
                cache:true,
                data: function(d) {
                    d.status = $('#status_filter').val();
                }
            },
            columns: [{
                    data: 'id'
                },{
                    data: 'tl_date'
                },{
                    data: 'tl_time'
                },{
                    data: 'tl_title'
                },{
                    data: 'tl_status'
                },{
                    data: 'actions',
                    orderable: false,
                    searchable: false
                }
            ],
            columnDefs: [{
                targets: [-2, -1],
                createdCell: function(td, cellData, rowData, row, col) {
                    $(td).css('text-align', 'center');
                }
            }]
        });
        $('#status_filter').change(function() {
            table.ajax.reload();
        });
    });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/review/list.blade.php ENDPATH**/ ?>