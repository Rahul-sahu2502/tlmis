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
                <h5 class="card-title mb-0 flex-grow-1">Task Status</h5>
            </div>
        </div>
        <div class="card-body border border-dashed border-end-0 border-start-0" <?php if($search==4): ?> style='display:none' <?php endif; ?> >
            <form>
                <div class="row g-3">
                    <div class="col-xxl-3 col-sm-12">
                        <label>Task title</label>
                        <div class=search-box>
                            <input type=text id="title" class="form-control search bg-light border-light"
                                placeholder="Search for tasks">
                            <i class="ri-search-line search-icon"></i>
                        </div>
                    </div>
                    <div class="col-xxl-3 col-sm-4" <?php if($search!=1): ?> style='display:none' <?php endif; ?>>
                        <div class=input-light>
                            <label>Task status</label>
                            <select class=form-control data-choices data-choices-search-false
                                name=choices-single-default id=idStatus>
                                <option value="" disabled selected>Select</option>
                                <option value="0">All</option>
                                <option value="I">Inprogress</option>
                                <option value="C">Completed</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xxl-3 col-sm-4" <?php if($search!=1): ?> style='display:none' <?php endif; ?>>
                        <div class=input-light>
                            <label>Priority</label>
                            <select name="priority_id" id="priority" class="form-control" required>
                                <option value=""  disabled selected>Select</option>
                                <option value="0">All</option>
                                <?php $__currentLoopData = $task_priority; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($value->task_priority_id); ?>">
                                        <?php echo e($value->priority); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-xxl-3 col-sm-4" <?php if($search!=1): ?> style='display:none' <?php endif; ?>>
                        <div class=input-light>
                            <label>Task Category</label>
                            <select name="category" id="category" required
                                    class="form-control">
                                <option value="" disabled selected>Select</option>
                                <option value="0">सभी</option>
                                <?php $__currentLoopData = $task_category; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($value->task_category_id); ?>">
                                        <?php echo e($value->category); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-xxl-2 col-sm-4">
                        <label>Due date (From)</label>
                        <input type=date class="form-control bg-light border-light" title="From Due date"
                            id=from_date data-provider=flatpickr data-date-format="d M, Y"
                            data-range-date=true placeholder="Select date range">
                    </div>
                    <div class="col-xxl-2 col-sm-4">
                        <label>Due date (To)</label>
                        <input type=date class="form-control bg-light border-light" title="To Due date"
                            id=to_date data-provider=flatpickr data-date-format="d M, Y"
                            data-range-date=true placeholder="Select date range">
                    </div>
                    <div class="col-xxl-3 col-sm-4" <?php if($search!=2): ?> style='display:none' <?php endif; ?> >
                        <div class=input-light>
                            <label>Days</label>
                            <?php
                                $current_date = date('Y-m-d');
                            ?>
                            <select class=form-control data-choices data-choices-search-false
                                name=choices-single-default id=days>
                                <option value="">Select</option>
                                <option value="7">7 Days</option>
                                <option value="15">15 Days</option>
                                <option value="30">30 days</option>
                                <option value="m30">Less 30 days</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xxl-2 col-sm-4">
                        <div class="row mt-4">
                            <div class="col-lg-6">
                                <button type=button id="filter" class="btn btn-primary m-1">
                                    <i class="ri-equalizer-fill me-1 align-bottom"></i>Filter
                                </button>
                            </div>
                            <div class="col-lg-6">
                                <button type=button id="reset" class="btn btn-info m-1">
                                    <i class="ri-refresh-fill me-1 align-bottom"></i>Reset
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class=card-body>
            <div class="table-responsive table-card mb-4">
                <table class="table align-middle table-nowrap datatable mb-0" id=tasksTable>
                    <thead class="table-light text-muted">
                        <tr>
                            <th class=sort data-sort=id>S.No.</th>
                            <th class=sort data-sort=tasks_name>Task</th>
                            <th class=sort data-sort=client_name>Offices</th>
                            <th class=sort data-sort=entry_date>Task Entry Date</th>
                            <th class=sort data-sort=due_date>Task Due Date</th>
                            <th class=sort data-sort=created_date>Task Creation Date</th>
                            <th class=sort data-sort=status>Status</th>
                            <th class=sort data-sort=priority>Priority</th>
                            <th>View</th>
                        </tr>
                    </thead>
                    <tbody id="tBody" class="list form-check-all">
                    </tbody>
                </table>
            </div>
            <div class="text-center" id="loader">
                <div class="spinner-grow text-primary" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <div class="spinner-grow text-primary" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <div class="spinner-grow text-primary" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
<script src="<?php echo e(asset('assets/libs/list.js/list.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/list.pagination.js/list.pagination.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/jquery.dataTables.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/dataTables.buttons.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.flash.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.html5.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/buttons.print.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/jszip.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/pdfmake.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/libs/datatable/vfs_fonts.js')); ?>"></script>

<script>
    $(jQuery).ready(function() {
        $('.datatable').DataTable({
            dom: '<"dt-top"lfB>rtip',
            buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
            language: {
                search: "Search:",
            },
        });

        let search={'sts':'<?php echo e($sts); ?>','d':'<?php echo e($dept); ?>'};
        $('#filter').click(function(){
            let sts=false;
            search={'sts':'<?php echo e($sts); ?>','d':'<?php echo e($dept); ?>'};
            if($("#idStatus").val()!=""){
                search['sts'] = $("#idStatus").val();
                sts=true;
            }
            if($("#title").val()!=""){
                search['var'] = $("#title").val();
                sts=true;
            }
            if($("#days").val()!=""){
                search['days']=$("#days").val()
                sts=true;
            }else{
                if($("#from_date").val()!=""){
                    search['fdate'] = $("#from_date").val();
                    sts=true;
                }
                if($("#to_date").val()!=""){
                    search['tdate'] = $("#to_date").val();
                    sts=true;
                }
            }

            if($("#priority").val()!=""){
                search['priority'] = $("#priority").val();
                sts=true;
            }
            if($("#category").val()!=""){
                search['category'] = $("#category").val();
                sts=true;
            }

            if(sts){
                get_task_list(search);
            }
        });
        $("#reset").click(function(){
            if($("#idStatus").val()!=""||$("#title").val()!=""|| $("#from_date").val()!=""
            ||$("#to_date").val()!="" ||$("#days").val()!=""||$("#priority").val()!="" || $("#category").val()!=""){
                $('select').val('');
                $("input").val('');
                get_task_list();
            }
        });
        $("#from_date").change(function () {
            $("#to_date").val('');
            $("#to_date").attr('min', $(this).val());
        });
        get_task_list(search);
        const level_id = <?php echo e(Session::get('level_id')); ?>;
        function get_task_list(sData={}){
            $('.datatable').DataTable().destroy();
            $.ajax({
                url: "<?php echo e(route('task_view_status_ajax')); ?>",
                type: "POST",
                data:sData,
                headers: {
                    'X-CSRF-TOKEN': "<?php echo e(csrf_token()); ?>"
                },
                dataType:'json',
                beforeSend: function(){
                    $('#loader').show();
                },
                success: function(response) {
                    $('#loader').hide();
                    $('#tBody').html('');
                    response.forEach((value, index) => {
                        let sts = "Inprogress";
                        let color = "primary";

                        if (value.status === "P") {
                            sts = "Pending";
                            color = "secondary";
                        } else if (value.status === "C") {
                            sts = "Completed";
                            color = "success";
                        }
                        else if (value.status === "O") {
                            sts = "Reopened";
                            color = "warning";
                        }

                        const departments = value.department_eng.split(',').map((val, i) => `${i + 1}. ${val}`).join('<br>');

                        const statusBadge = `<span class="badge bg-${color}-subtle text-${color} text-uppercase">${sts}</span>`;
                        const priorityBadge = `<span class="badge bg-${value.fk_task_priority_id === 1 ? "success" : "danger"} text-uppercase">${value.priority}</span>`;

                        const viewButton = `<a class="btn btn-info btn-xm" title="View" href="/task-overview?var=${btoa(value.task_id)}"><i class="ri-eye-line"></i></a>`;

                        // const editButton = level_id == '1' && value.status !== "C" && value.is_replied == "N"?`<a class="btn btn-primary btn-xm" title="Edit" href="/task-details?var=${btoa(value.task_id)}"><i class="ri-edit-2-fill"></i></a>`: '';

                        const row = `
                            <tr>
                                <td>${index + 1}</td>
                                <td class="tasks_name">${value.title}</td>
                                <td class="client_name">${departments}</td>
                                <td class="entry_date">${new Date(value.entry_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</td>
                                <td class="due_date">${new Date(value.due_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</td>
                                <td class="created_date"> ${value.created_date}</td>
                                <td class="status">${statusBadge}</td>
                                <td class="priority">${priorityBadge}</td>
                                <td>${viewButton}</td>
                            </tr>
                        `;

                        $('#tBody').append(row); // Assuming your table body has the ID `task-table-body`.
                        // console.log(row);
                    });
                    $('.datatable').DataTable({
                        dom: '<"dt-top"lfB>rtip',
                        buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
                        language: {
                            search: "Search:",
                        },
                    });
                },
                complete: function(){
                    $('#loader').hide();
                },
                error: function(xhr) {
                    console.log(xhr.responseText);
                },
            });
        }
    });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\tasks\reports\task_status.blade.php ENDPATH**/ ?>