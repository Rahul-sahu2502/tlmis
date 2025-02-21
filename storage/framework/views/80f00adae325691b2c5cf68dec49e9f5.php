<?php $__env->startSection('styles'); ?>
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/dataTables.bootstrap5.min.css')); ?>" />
<link rel="stylesheet" href="<?php echo e(asset('assets/libs/datatable/buttons.dataTables.min.css')); ?>" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class=row>
    <div class=col-lg-12>
        <div class=card id=tasksList>
            <div class="card-header border-0">
                <div class="d-flex align-items-center">
                    <h5 class="card-title mb-0 flex-grow-1">User Task Status / उपयोगकर्ता कार्य स्थिति</h5>
                </div>
            </div>
            <div class=card-body>
                <div class="table-responsive table-card mb-4">
                    <table class="table align-middle table-nowrap datatable mb-0" id=tasksTable>
                        <thead class="table-light text-muted">
                            <tr>
                                <th class=sort data-sort=id>S.No.</th>
                                <th class=sort data-sort=client_name>User Name</th>
                                <th class="sort text-center" data-sort=total><span class="badge bg-info"
                                        style="font-size: 12px">Total Task</span></th>
                                <th class="sort text-center" data-sort=total><span class="badge bg-success"
                                        style="font-size: 12px">Completed Task</span></th>
                                <th class="sort text-center" data-sort=total><span class="badge bg-warning"
                                        style="font-size: 12px">In-progress Task </span></th>
                                <th class="sort text-center" data-sort=total><span class="badge bg-danger"
                                        style="font-size: 12px">Pending Task</span></th>

                            </tr>
                        </thead>
                        <tbody id="tBody">
                        </tbody>
                    </table>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
    integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- <div>
    <h1>Hello Count </h1>
</div> -->

<script>
    $(document).ready(function() {
        $.ajax({
            url: "<?php echo e(route('user_count_task')); ?>",
            type: "POST",
            headers: {
                'X-CSRF-TOKEN': "<?php echo e(csrf_token()); ?>"
            },
            success: function(data) {
                console.log(data);
                $('#tBody').html('');
                data.forEach((value, index) => {
                    // console.log();
                    let inprogress = value.distinct_replies;
                    let pending =value.total_count - ( Number(value.completed) + Number(inprogress));
                    const row = `
                        <tr>
                                    <td>${index + 1}</td>
                                    <td class="tasks_name">${value.full_name}</td>
                                    <td class="total text-center"><b>${value.total_count}</b></td>
                                    <td class="total text-center"><b>${value.completed}</b></td>
                                    <td class="total text-center"><b>${inprogress}</b></td>
                                    <td class="total text-center"><b>${pending}</b></td>
                                    
                        </tr>
                            `;
                    $('#tBody').append(row);
                });
            }
        })
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/performance/count_task.blade.php ENDPATH**/ ?>