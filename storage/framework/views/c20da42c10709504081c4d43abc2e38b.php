


<?php $__env->startSection('content'); ?>
<div class=row>
    <div class=col-lg-12>
        <div class=card id=tasksList>
            <div class="card-header border-0">
                <div class="d-flex align-items-center">
                    <h5 class="card-title mb-0 flex-grow-1"> User Task Ratings / उपयोगकर्ता कार्य रेटिंग</h5>
                </div>
            </div>
            <div class=card-body>
                <div class="table-responsive table-card mb-4">
                    <table class="table align-middle table-nowrap datatable mb-0" id=tasksTable>
                        <thead class="table-light text-muted">
                            <tr>
                                <th class=sort data-sort=id>S.No.</th>
                                <th class=sort data-sort=client_name>Task Title</th>
                                <th class=sort data-sort=client_name>Task Status</th>
                                <th class=sort data-sort=due_date>Task Due Date</th>
                                <th class=sort data-sort=submit_date>Task Submit Date</th>
                                <th class=sort data-sort=client_name>Reply Status</th>
                                <th class=sort data-sort=client_name>Click for Rating</th>
                            </tr>

                        </thead>
                        <tbody id="tBody">
                        </tbody>
                    </table>



                    <!-- Varying modal content -->
                    <div class="modal fade" id="exampleModalgrid" tabindex="-1" aria-labelledby="exampleModalgridLabel">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalgridLabel">Grid Modals</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="javascript:void(0);">
                                        <div class="row g-3">
                                            <div class="col-xxl-6">
                                                <div>
                                                    <label for="firstName" class="form-label">First Name</label>
                                                    <input type="text" class="form-control" id="firstName" placeholder="Enter firstname">
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xxl-6">
                                                <div>
                                                    <label for="lastName" class="form-label">Last Name</label>
                                                    <input type="text" class="form-control" id="lastName" placeholder="Enter lastname">
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-lg-12">
                                                <label class="form-label">Gender</label>
                                                <div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                        <label class="form-check-label" for="inlineRadio1">Male</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                        <label class="form-check-label" for="inlineRadio2">Female</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                                        <label class="form-check-label" for="inlineRadio3">Others</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end col-->
                                            <div class="col-xxl-6">
                                                <label for="emailInput" class="form-label">Email</label>
                                                <input type="email" class="form-control" id="emailInput" placeholder="Enter your email">
                                            </div>
                                            <!--end col-->
                                            <div class="col-xxl-6">
                                                <label for="passwordInput" class="form-label">Password</label>
                                                <input type="password" class="form-control" id="passwordInput" value="451326546" placeholder="Enter password">
                                            </div>
                                            <!--end col-->
                                            <div class="col-lg-12">
                                                <div class="hstack gap-2 justify-content-end">
                                                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                </div>
                                            </div>
                                            <!--end col-->
                                        </div>
                                        <!--end row-->
                                    </form>
                                </div>
                            </div>
                        </div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
    integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>
    $(document).ready(function() {
        //get user_id from url
        let params = new URLSearchParams(window.location.search);
        let user_id = params.get("var"); // Replace 'key' with the actual parameter name
        console.log('this is get user_id = ', user_id);

        if (user_id == null) {
            window.location.href = "<?php echo e(route('rating_page')); ?>";
        }
        $.ajax({
            url: "<?php echo e(route('user_task_rating')); ?>",
            type: "POST",
            headers: {
                'X-CSRF-TOKEN': "<?php echo e(csrf_token()); ?>"
            },
            data: {

                id: user_id
            },
            success: function(user_task_list) {
                console.log('user_task_list = ', user_task_list);
                $('#tBody').html('');

                if ( user_task_list.length > 0) {
                    user_task_list.forEach((value, index) => {
                        console.log('user_task_list_after condtion = ', value);
                        // const modalButton = `
                        // <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModalgrid">
                        //     <i class="ri-eye-line"></i>
                        // </button>`;
                        // <td>${modalButton}</td>

                        var rating_view = '';
                        if (value.status === 'C') {

                            if (value.replied_status === 'no' && value.sendback_status === 'no') {
                                return rating_view = 'No Rating';
                            } else if (value.replied_status === 'yes' && value.sendback_status === 'no') {

                                if (new Date(value.submit_date) > new Date(value.due_date)) {
                                    return rating_view = 'click_for_rating'; //late submission && Manual_rating


                                } else if (new Date(value.submit_date) <= new Date(value.due_date)) {
                                    return rating_view = '⭐⭐⭐⭐⭐'; // On-time or early submission

                                } else if (value.status === 'I') {
                                    return // No rating for 'In Process'
                                        value.replied_status = 'In Process', // No rating for 'In Process'
                                        rating_view = 'In Process'; // No rating for 'In Process'

                                } else {
                                    return 'Not Submitted/Incomplete';
                                }
                            }
                        }


                        const row = `
                                  <tr>
                                     <td>${index + 1}</td>
                                     <td class="tasks_name">${value.title}</td>
                                     <td class="tasks_name">${value.status}</td>  
                                      <td class="total text-center"><b>${new Date(value.due_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>
                                      <td class="total text-center"><b>${new Date(value.submit_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>
                                     <td class="tasks_name">${value.replied_status}</td> 
                                     <td class="tasks_name"> </td>
                                  </tr>`;


                        $('#tBody').append(row);
                    });
                } else {
                    $('#tBody').append('<tr><td colspan="5">No tasks found</td></tr>');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', xhr.responseText);
                $('#tBody').html('<tr><td colspan="5">Error loading tasks</td></tr>');
            }
        });
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/performance/user_task_rating.blade.php ENDPATH**/ ?>