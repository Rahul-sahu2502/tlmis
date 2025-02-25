<?php $__env->startSection('content'); ?>
<div class=row>
    <div class=col-lg-12>
        <div class=card id=tasksList>
            <div class="card-header border-0">
                <div class="d-flex align-items-center">
                    <h5 class="card-title mb-0 flex-grow-1" title="Date After task Due Date Count As Delay Days "> Task Delay Count / कार्य विलंब गणना</h5>
                </div>
                <br> 
                <span class="badge border border-secondary text-secondary" style="font-size: 12px;">
                    <b>Note :</b> If a task is completed after its due date, the extra days are calculated as a delay.
                    / यदि कोई कार्य अपनी नियत तारीख के बाद पूरा होता है, तो अतिरिक्त दिन देरी के रूप में गणना किए जाते हैं।</span>
            </div>
            <div class=card-body>
                <div class="table-responsive table-card mb-4">
                    <table class="table align-middle table-nowrap datatable mb-0" id=tasksTable>
                        <thead class="table-light text-muted">
                            <tr>
                                <th class=sort data-sort=id>S.No.</th>
                                <th class=sort data-sort=client_name>Task</th>
                                <th class=sort data-sort=entry_date>Task Entry Date</th>
                                <th class=sort data-sort=due_date>Task Due Date</th>
                                <th class=sort data-sort=submit_date>Submit Date</th>
                                <th class=sort data-sort=delay_date>Total Delay (days)</th>
                                <th>Action</th>

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

<script>
    $(document).ready(function() {
        $.ajax({
            url: "<?php echo e(route('task_delay_date')); ?>",
            type: "POST",
            headers: {
                'X-CSRF-TOKEN': "<?php echo e(csrf_token()); ?>"
            },
            success: function(response) {
                let delay_data = response;


                console.log('dealy data = ', delay_data);
                $('#tBody').html('');
                delay_data.forEach((value, index) => {

                    var new_submitted_date = '';

                    if (!isNaN(Date.parse(value.submitted_date))) {
                        new_submitted_date = `${new Date(value.submitted_date).toLocaleDateString('en-US', { 
                                  day: '2-digit', 
                                  month: 'short', 
                                  year: 'numeric' 
                              })}`;

                    } else {
                        new_submitted_date = value.submitted_date;
                    }

                    const viewButton = `<a class="btn btn-info btn-xm" title="View" href="/task-overview?var=${btoa(value.task_id)}">
                    <i class="ri-eye-line"></i></a>`;

                    const row = `
                        <tr>
                                    <td>${index + 1}</td>
                                    <td class="tasks_name">${value.title}</td>
                                    <td class="total text-center"><b>${new Date(value.entry_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>
                                    <td class="total text-center"><b>${new Date(value.due_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>                                                        
                                    <td class="total text-center"><b>${new_submitted_date}</b></td>
                                    <td class="total text-center"><b>${value.difference_in_days}</b></td>
                                    <td>${viewButton}</td>
                        </tr>
                            `;
                    $('#tBody').append(row);
                });
            }
        })
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/performance/delay.blade.php ENDPATH**/ ?>