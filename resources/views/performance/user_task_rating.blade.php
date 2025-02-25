@extends('layouts.layout_admin')


@section('content')
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
                                        <!-- Star Rating System -->
                                        <div id="basic-rater" dir="ltr" class="d-flex justify-content-center gap-2">
                                            <input type="hidden" id="starValue" value="0">
                                            <i class="ri ri-star-fill text-secondary fs-1" data-value="1"></i>
                                            <i class="ri ri-star-fill text-secondary fs-1" data-value="2"></i>
                                            <i class="ri ri-star-fill text-secondary fs-1" data-value="3"></i>
                                            <i class="ri ri-star-fill text-secondary fs-1" data-value="4"></i>
                                            <i class="ri ri-star-fill text-secondary fs-1" data-value="5"></i>
                                        </div>
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
        $(document).ready(function () {
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
                success: function (user_task_list) {
                    console.log('user_task_list = ', user_task_list);
                    $('#tBody').html('');

                    if (user_task_list.length > 0) {
                        user_task_list.forEach((value, index) => {
                            console.log('user_task_list_after condtion = ', value);
                            console.log(Date(value.submit_date));

                            const modalButton = `
                                                <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModal"> <i class="ri-eye-line"></i></button>
                                                `;


                            var rating_view = 'Incomplete task';
                            if (value.status === 'C') {

                                if (value.replied_status === 'no' && value.sendback_status === 'no') {
                                    rating_view = "No Rating";
                                } else if (value.replied_status === 'no' && value.sendback_status === 'yes') {
                                    rating_view = "Send Back";
                                }

                                else if (value.replied_status === 'yes' || value.sendback_status === 'yes') {

                                    if (new Date(value.submit_date) > new Date(value.due_date)) {
                                        rating_view = 'click_for_rating'; //late submission && Manual_rating


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
                                if (value.replied_status === 'no' && value.sendback_status === 'yes') {
                                    rating_view = "Send Back";
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
                                                             <td > ${rating_view}</td>
                                                             <td>${modalButton}</td>
                                                          </tr>`;


                            $('#tBody').append(row);
                        });
                    } else {
                        $('#tBody').append('<tr><td colspan="5">No tasks found</td></tr>');
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error:', xhr.responseText);
                    $('#tBody').html('<tr><td colspan="5">Error loading tasks</td></tr>');
                }
            });
        });
    </script>
@endsection