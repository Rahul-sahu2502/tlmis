<?php $__env->startSection('content'); ?>
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=tasksList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1" id="userTitle"> User Task Ratings / उपयोगकर्ता कार्य रेटिंग
                        </h5>
                    </div>
                    
                    <br>
                    <span class="badge border border-secondary text-secondary w-100" id="detailsToggleDiv"
                        style="font-size: 0.8rem; text-align: left;">
                        <b>Note :</b>
                        <ol class="text-break">
                            <li class="mt-2 lh-base text-wrap">The admin can give a rating manually by clicking the action
                                button./प्रशासक
                                एक्शन बटन पर क्लिक करके मैन्युअल रूप से रेटिंग दे सकता है।</li>
                            <li class="mt-1 lh-base text-wrap">Once you rate, you can't change the rating afterward./ एक बार रेटिंग
                                देने के
                                बाद, आप उसे बदल नहीं सकते।</li>
                            <li class="mt-1 lh-base text-wrap">You can only rate those tasks that are completed with some delay./आप
                                केवल
                                उन्हीं कार्यों को रेट कर सकते हैं जो कुछ देरी से पूरे किए गए हों।</li>
                            <li class="mt-1 lh-base text-wrap">Users who send back the task will not receive a rating./
                                जो उपयोगकर्ता कार्य वापस भेजते हैं उन्हें रेटिंग प्राप्त नहीं होगी।</li>
                        </ol>
                    </span>
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
                                    <th class=sort data-sort=client_name>Rating Status</th>
                                    <th class=sort data-sort=client_name>Click for Rating</th>
                                </tr>

                            </thead>
                            <tbody id="tBody">
                            </tbody>
                        </table>

                        
                        <style>
                            .modal {
                                z-index: 1055 !important;
                                pointer-events: auto !important;
                            }

                            .modal-backdrop {
                                z-index: 1050 !important;
                            }


                            .emoji {
                                cursor: pointer;
                                font-size: 2rem;
                                transition: color 0.2s;
                            }

                            .selected,
                            .emoji:hover {
                                color: rgb(255, 34, 0) !important;
                            }
                        </style>


                        <!-- Varying modal content -->
                        <div id="myModal" class="modal fade" aria-labelledby="myModalLabel" data-bs-backdrop="static"
                            data-bs-keyboard="false">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="myModalLabel">Rate User !</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="basic-rater" dir="ltr" class="d-flex justify-content-center gap-2">
                                            <input type="hidden" id="starValue" value="0">

                                            <i class="ri ri-emotion-sad-line text-secondary fs-1 emoji" data-value="1"></i>
                                            <!-- Very Bad 😭 -->
                                            <i class="ri ri-emotion-unhappy-line text-secondary fs-1 emoji"
                                                data-value="2"></i> <!-- Bad 😢 -->
                                            <i class="ri ri-emotion-normal-line text-secondary fs-1 emoji"
                                                data-value="3"></i> <!-- Neutral 😐 -->
                                            <i class="ri ri-emotion-happy-line text-secondary fs-1 emoji"
                                                data-value="4"></i> <!-- Happy 😃 -->
                                            <i class="ri ri-emotion-laugh-line text-secondary fs-1 emoji"
                                                data-value="5"></i> <!-- Very Happy 😊 -->
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" onclick="submitRating()">Submit
                                                Rating</button>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->

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
<script src="<?php echo e(asset('assets/css/icons.min.css')); ?>"></script>



<script>
    let userName = '';
    $(document).ready(function() {
        //get user_id from url
        let params = new URLSearchParams(window.location.search);
        let user_id = params.get("var"); // Replace 'key' with the actual parameter name
        console.log('this is get user_id = ', user_id);

        // if user_id in null then redirect to back page which is show ratings of all users
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
            success: function(user_task_list_details) {
                // console.log('user_task_list = ', user_task_list);
                $('#tBody').html('');

                let user_task_list = user_task_list_details[0];
                userName = user_task_list_details[1][0].full_name;
                document.getElementById("userTitle").innerHTML += " (" + userName + ")";


                if (user_task_list.length > 0) {
                    user_task_list.forEach((value, index) => {

                        var userTaskRating = '';
                        var modalButton = '';
                        var taskStatus = '';
                        let color = '';

                        // this is for check that if task is completed so what about the rating status
                        if (value.status === 'C') {
                            taskStatus = "Completed";
                            color = "success";
                            if (value.replied_status === 'No' && value.sendback_status === 'No') {
                                userTaskRating = "Done by another User";
                            } else if (value.replied_status === 'No' && value.sendback_status === 'Yes') {
                                userTaskRating = "Send Back";
                            } else if (value.replied_status === 'Yes' || value.sendback_status === 'Yes') {

                                if (new Date(value.submit_date) > new Date(value.due_date) && !value.task_rating) {
                                    userTaskRating = 'click_for_rating'; //late submission && Manual_rating
                                    modalButton = ` <button type="button" class="btn btn-warning rate-model-btn " data-bs-toggle="modal" data-bs-target="#myModal"> <i class="ri-star-fill"></i></button>
                                                                                            `;

                                } else if (new Date(value.submit_date) <= new Date(value.due_date) || Number(value.task_rating) != null) {
                                    if (Number(value.task_rating) > 0 && Number(value.task_rating) < 6) {
                                        let stars = '';
                                        userTaskRating = Number(value.task_rating)
                                        for (let i = 0; i < userTaskRating; i++) {
                                            stars += '⭐ '; // Append stars
                                        }

                                        userTaskRating = stars.trim(); // Assign stars as the final display value
                                    } else {
                                        userTaskRating = "Partially Contributed";
                                    }

                                } else if (value.status === 'I') {
                                    value.submit_date = 'In Process'; // No rating for 'In Process'
                                    value.replied_status = 'In Process'; // No rating for 'In Process'
                                    rating_view = 'In Process'; // No rating for 'In Process'

                                } else {
                                    console.log(value.title + "Not Submitted/Incomplete");

                                }
                            } else if (value.replied_status === 'Yes' && value.sendback_status === 'No') {
                                userTaskRating = "Partially Contributed";
                            }
                        } else if (value.status === 'I') {
                            taskStatus = "Inprogress";
                            color = "warning";
                            userTaskRating = "Inprogress";

                        } else if (value.status === 'O') {
                            taskStatus = "Reopen";
                            color = "info";
                            userTaskRating = "Reopen";

                        }

                        var new_submit_date = '';
                        if (value.submit_date === '0' && value.status === 'C') {
                            new_submit_date = 'Submitted by others';
                        } else if (value.submit_date === '0') {
                            new_submit_date = 'Inprocess';
                        } else if (!isNaN(Date.parse(value.submit_date))) {
                            new_submit_date = `${new Date(value.submit_date).toLocaleDateString('en-US', {
                                        day: '2-digit',
                                        month: 'short',
                                        year: 'numeric'
                                    })}`;
                        }
                        const statusBadge = `<span class="badge bg-${color}-subtle text-${color} text-uppercase">${taskStatus}</span>`;
                        const row = `
                                                                                                      <tr>
                                                                                                         <td>${index + 1}</td>
                                                                                                         <td class="tasks_name">${value.title}</td>
                                                                                                         <td class="tasks_name">${statusBadge}</td>  
                                                                                                          <td class="total text-center"><b>${new Date(value.due_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>
                                                                                                         <td class="tasks_name"><b>${new_submit_date}</b></td> 
                                                                                                         <td class="tasks_name">${value.replied_status}</td> 
                                                                                                         <td > ${userTaskRating}</td>
                                                                                                         <td data-map-id="${value.map_id}">${modalButton}</td>
                                                                                                      </tr>`;

                        $('#tBody').append(row);
                    });
                    $('#tasksTable').DataTable({
                        paginate: true,
                        language: {
                            search: "Search:",
                        },
                    });

                    $('#Tasktable').datatable({
                        pagination: true,
                        language: {
                            search: "Search"
                        }

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


<script>
    const emojis = document.querySelectorAll(".emoji");
    let selectedRating = 0;
    let selectedMapId = null;

    emojis.forEach(emoji => {
        emoji.addEventListener("click", function() {
            selectedRating = this.getAttribute("data-value");
            document.getElementById("starValue").value = selectedRating;

            // Remove 'selected' class from all emojis
            emojis.forEach(e => e.classList.remove("selected"));

            // Highlight clicked emoji
            this.classList.add("selected");
        });
    });

    // pass the data to model before opening the model
    $(document).on("click", ".rate-model-btn", function() {
        selectedMapId = $(this).closest("td").data("map-id");
        console.log(selectedMapId);

    })

    // Modal Close Event: Reset Selection
    myModal.addEventListener("hidden.bs.modal", function() {
        // Remove selected class from emojis
        emojis.forEach(e => e.classList.remove("selected"));

        // Reset hidden input value
        starValue.value = "0";
    });

    function submitRating() {
        const ratingValue = document.getElementById("starValue").value;
        if (ratingValue === "0") {
            // alert("Please select a rating before submitting!");
            Swal.fire({
                // title: "The Internet?",
                text: "Please select a rating before submitting!",
                icon: "warning"
            });
            return;
        }
        console.log("Selected Rating:", ratingValue);

        document.querySelector('[data-bs-dismiss="modal"]').click();
        var rating = '';


        $.ajax({
            url: "<?php echo e(route('insert_rating')); ?>",
            method: "POST",
            data: {
                'final_rating': ratingValue,
                'user_map_id': selectedMapId,
                _token: "<?php echo e(csrf_token()); ?>"
            },
            success: function(response) {
                if (response.status === "success") {
                    Swal.fire({
                        title: "Thank You!",
                        text: "Thank you for rating to " + userName,
                        icon: "success",
                        confirmButtonText: "OK",
                        allowOutsideClick: false,
                        timer: 2000
                    }).then((result) => {
                        // if (result.isConfirmed) 
                        {
                            location.reload(); // Reloads the page only after clicking "OK"
                        }
                    })
                    // alert(response.message);  // Display success message
                    // $('#ratingModal').modal('hide'); // Hide modal after success
                    // location.reload(); // Reload the page to show updated ratings
                }
            },
            error: function(xhr, status, error) {
                // $('#submitRatingBtn').prop('disabled', false).text('Submit Rating');

                if (xhr.status === 422) {
                    let errors = xhr.responseJSON.errors;
                    let errorMessage = "Validation failed:\n";
                    $.each(errors, function(key, value) {
                        errorMessage += `- ${value[0]}\n`; // Extract first error message
                    });
                    alert(errorMessage);
                } else {
                    alert("An error occurred. Please try again." + xhr.status);
                    console.log("Error details:", xhr.responseText);
                }
            }
        });

    }
</script>



<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/performance/user_task_rating.blade.php ENDPATH**/ ?>