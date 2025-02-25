@extends('layouts.layout_admin')


@section('content')
    <div class=row>
        <div class=col-lg-12>
            <div class=card id=tasksList>
                <div class="card-header border-0">
                    <div class="d-flex align-items-center">
                        <h5 class="card-title mb-0 flex-grow-1"> User Task Ratings / उपयोगकर्ता कार्य रेटिंग</h5>
                    </div>
                    <a class="mt-2" type="button" data-bs-toggle="collapse" data-bs-target="#detailsToggleDiv" aria-expanded="false"
                        aria-controls="toggleDiv">See Details./ विवरण देखें</a>
                    <br>
                    <span class="badge border border-secondary text-secondary collapse  w-100" id="detailsToggleDiv"
                        style="font-size: 0.8rem; text-align: left;">
                        <b>Note :</b>
                        <ol class="text-break">
                            <li class="mt-2">The admin can give a rating manually by clicking the action button./प्रशासक एक्शन बटन पर क्लिक करके मैन्युअल रूप से रेटिंग दे सकता है।</li>
                            <li class="mt-1">Once you rate, you can't change the rating afterward./ एक बार रेटिंग देने के बाद, आप उसे बदल नहीं सकते।</li>
                            <li class="mt-1">You can only rate those tasks that are completed with some delay./आप केवल उन्हीं कार्यों को रेट कर सकते हैं जो कुछ देरी से पूरे किए गए हों।</li>
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

                    {{-- bootstrap default behaviour change, reason : model interation was disable --}}
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

                        .selected {
                            color: yellow !important;
                        }
                    </style>


                    <!-- Varying modal content -->
                    <div id="myModal" class="modal fade" aria-labelledby="myModalLabel">
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

                                        <i class="ri ri-emotion-sad-line text-secondary fs-1 emoji" data-value="1"></i> <!-- Very Bad 😭 -->
                                        <i class="ri ri-emotion-unhappy-line text-secondary fs-1 emoji" data-value="2"></i> <!-- Bad 😢 -->
                                        <i class="ri ri-emotion-normal-line text-secondary fs-1 emoji" data-value="3"></i> <!-- Neutral 😐 -->
                                        <i class="ri ri-emotion-happy-line text-secondary fs-1 emoji" data-value="4"></i> <!-- Happy 😃 -->
                                        <i class="ri ri-emotion-laugh-line text-secondary fs-1 emoji" data-value="5"></i> <!-- Very Happy 😊 -->
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" onclick="submitRating()">Submit Rating</button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- /.modal -->

                    </div>
                </div>
            </div>
        </div>
    </div>
    @endsection
    @section('scripts')
    <script src="{{asset('assets/libs/list.js/list.min.js')}}"></script>
    <script src="{{asset('assets/libs/list.pagination.js/list.pagination.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.flash.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.html5.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/buttons.print.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/jszip.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/pdfmake.min.js')}}"></script>
    <script src="{{asset('assets/libs/datatable/vfs_fonts.js')}}"></script>
    <script src="{{asset('assets/css/icons.min.css')}}"></script>
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
                window.location.href = "{{ route('rating_page') }}";
            }
            $.ajax({
                url: "{{ route('user_task_rating') }}",
                type: "POST",
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}"
                },
                data: {

                    id: user_id
                },
                success: function(user_task_list) {
                    console.log('user_task_list = ', user_task_list);
                    $('#tBody').html('');

                    if (user_task_list.length > 0) {
                        user_task_list.forEach((value, index) => {

                            var modalButton = '';


                            var rating_view = 'Incomplete task';
                            // this is for check that if task is completed so what about the rating status
                            if (value.status === 'C') {

                                if (value.replied_status === 'No' && value.sendback_status === 'No') {
                                    rating_view = "No Rating";
                                } else if (value.replied_status === 'No' && value.sendback_status === 'Yes') {
                                    rating_view = "Send Back";
                                } else if (value.replied_status === 'Yes' || value.sendback_status === 'Yes') {

                                    if (new Date(value.submit_date) > new Date(value.due_date)) {
                                        rating_view = 'click_for_rating'; //late submission && Manual_rating
                                        modalButton = `
                                                <button type="button" class="btn btn-warning " data-bs-toggle="modal" data-bs-target="#myModal"> <i class="ri-star-fill"></i></button>
                                                `;

                                    } else if (new Date(value.submit_date) <= new Date(value.due_date)) {
                                        console.log("true");

                                        rating_view = '⭐⭐⭐⭐⭐'; // On-time or early submission

                                    } else if (value.status === 'I') {
                                        value.submit_date = 'In Process'; // No rating for 'In Process'
                                        value.replied_status = 'In Process'; // No rating for 'In Process'
                                        rating_view = 'In Process'; // No rating for 'In Process'

                                    } else {
                                        console.log(value.title + "Not Submitted/Incomplete");

                                    }
                                }
                            } else if (value.status === 'I') {
                                if (value.replied_status === 'No' && value.sendback_status === 'Yes') {
                                    rating_view = "Send Back";
                                }
                            }

                            // // this is for manually rating system #myModal
                            // if (rating_view === 'click_for_rating') {
                            //     modalButton = `
                            //                     <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModal"> <i class="ri-eye-line"></i></button>
                            //                     `;
                            // }else{
                            //     modalButton = "Done";
                            // }

                            var new_submit_date = '';

                            if (value.submit_date === '0') {
                                new_submit_date = '0'; 
                            } else if (!isNaN(Date.parse(value.submit_date))) {
                                new_submit_date = `${new Date(value.submit_date).toLocaleDateString('en-US', { 
                                             day: '2-digit', 
                                             month: 'short', 
                                             year: 'numeric' 
                                         })}`;
                            }

                            const row = `
                                                          <tr>
                                                             <td>${index + 1}</td>
                                                             <td class="tasks_name">${value.title}</td>
                                                             <td class="tasks_name">${value.status}</td>  
                                                              <td class="total text-center"><b>${new Date(value.due_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>
                                                             <td class="tasks_name">${new_submit_date}</td> 
                                                             <td class="tasks_name">${value.replied_status}</td> 
                                                             <td > ${rating_view}</td>
                                                             <td>${modalButton}</td>
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


    <script>
        const emojis = document.querySelectorAll(".emoji");
        let selectedRating = 0;

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
            // alert("You rated: " + ratingValue);
            // window.location.href = "";

            // Close modal if it's open
            document.querySelector('[data-bs-dismiss="modal"]').click();

            // $.ajax({
            //     url: "{{ route('user_take_rating') }}",
            //     method: "POST",
            //     data: {
            //         final_rating: ratingValue
            //     },
            //     success: function(data) {
            //         console.log(data);
            //     },
            //     error: function(xhr, status, error) {
            //         console.error('Error:', xhr.responseText);
            //     }

            // })

        }
    </script>


    <!-- <script>
        const emojis = document.querySelectorAll(".emoji");
        let selectedRating = 0;

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

            //Send Rating for submit in database through ajax

        }
    </script> -->

    @endsection