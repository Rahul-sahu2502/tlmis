<script>
    $(jQuery).ready(function() {
        let reply_confrim = false;
        let send_back = true;
        let session_user_id = {{ session('user_id') }};
        function swal_alert(icon, msg) {
            SwalWithCustomSettings.fire({
                html: `<div class="mt-3">
            <lord-icon
                src="https://cdn.lordicon.com/${icon}"
                trigger="loop"
                colors="primary:#f06548,secondary:#f7b84b"
                style="width:120px;height:120px">
            </lord-icon>
            <div class="mt-4 pt-2 fs-15">
                <h4>${msg}</h4>
            </div>
            </div>`,
                showCancelButton: true,
                showConfirmButton: false,
                customClass: {
                    cancelButton: "btn btn-primary w-xs mb-1"
                },
                cancelButtonText: "Ok",
                showCloseButton: false,
            });
        }

        function task_reply_list(task_id) {
            // console.log(task_id);
            $.ajax({
                url: "{{ url('task-reply-list') }}/" + task_id, // Route to the controller
                type: "get",
                // data: {"task_id": task_id},
                dataType: "Json",
                processData: false,
                contentType: false,
                success: function(response) {
                    let content = "";
                    if (response.length) {
                        reply_confrim = true;
                        $.each(response, function(key, value) {
                            // console.log(value['created_by']);
                            if({{ session('user_id') }}==value['created_by']){
                                $("#send_back").hide();
                            }
                            let file = "";
                            if (value['reply_file'] != null) {
                                let file_path=`"{{ asset('uploads') }}/${value['reply_file']}"`;
                                if("{{ config('app.env') }}" =="production"){
                                    file_path =  `"{{config('custom.file_point')}}${value['reply_file']}"`;
                                }
                                // file = `<a title="Download comment file" target="_blank" href=${file_path}> <i class="bx bxs-file"></i></a>`;
                                file =`<a style="font-size:16px" data-file="test.pdf" data-src=${file_path}  data-type="pdf" class="file-preview-icon">
                                        <i class="bx bx-file"></i>
                                    </a>`;
                            }
                            content += `
                                <div class="d-flex mb-4">
                                    <div class="flex-shrink-0">
                                        <img src="assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle" />
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <h5 class="fs-13">${value['full_name']} <small class="text-muted ms-2">${value['created_datetime']}</small></h5>
                                        <p class="text-muted">${value['reply']} ${file}</p>
                                    </div>
                                </div>
                            `;
                        });
                        $("#replies").html(content);
                    }
                },
                error: function(xhr) {
                    // Display validation errors
                    if (xhr.responseJSON.errors) {
                        let errors = xhr.responseJSON.errors;
                        let errorMessage = "";
                        for (let key in errors) {
                            errorMessage += errors[key][0] + "<br>";
                        }
                        console.log(errorMessage);
                    }
                },
            });
        }

        let task_id = {{ $details[0]->task_id }};
        task_reply_list(task_id);
        $('#reply_form').on('submit', function(e) {
            e.preventDefault(); // Prevent the default form submission
            var formData = new FormData(this); // Get form data
            $(':input[type="submit"]').prop('disabled', true);
            $("#reply_msg").html("");
            $.ajax({
                url: "{{ route('task_reply') }}", // Route to the controller
                method: "POST",
                data: formData,
                processData: false, // Don't process the files
                contentType: false, // Don't set content type
                success: function(response) {
                    let sts = response.sts;
                    let icon = "";
                    letmsg = "";
                    if (sts == 1) {
                        $('#reply_form')[0].reset();
                        icon = "hrtsficn.json";
                        msg = "Successfully commented";
                        $("#reply_msg").html("Successfully commented");
                        task_reply_list(task_id);
                    } else if (sts == 2) {
                        icon = "azxkyjta.json";
                        msg = "Please try again";
                        $("#reply_msg").html("Please try again");
                    } else if (sts == 3) {
                        icon = "azxkyjta.json";
                        msg =
                            "<span style='color:red;font-size: 16px'>* </span>Marked fields are mandatory";
                        $("#reply_msg").html("Marked fields are mandatory");
                    }
                    $(':input[type="submit"]').prop('disabled', false);
                    //swal_alert(icon, msg);
                },
                error: function(xhr) {
                    // Display validation errors
                    if (xhr.responseJSON.errors) {
                        let errors = xhr.responseJSON.errors;
                        let errorMessage = "";
                        for (let key in errors) {
                            errorMessage += errors[key][0] + "<br>";
                        }
                        console.log(errorMessage);
                    }
                },
            });
        });

        document.getElementById("close") && document.getElementById("close").addEventListener("click", function() {
            if (reply_confrim) {
                let id = $(this).val();
                SwalWithCustomSettings.fire({
                    title: 'Closing statement/comment',
                    input: 'textarea',
                    inputPlaceholder: 'Type your statement/comment here...',
                    // inputValue: 'Default message',
                    inputAttributes: {
                        'aria-label': 'Type your statement/comment here'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'Submit',
                    cancelButtonText: 'Cancel',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "{{ route('task_close') }}", // Route to the controller
                            type: "post",
                            headers: {
                                'X-CSRF-TOKEN': "{{ csrf_token() }}"
                            },
                            data: {
                                'task_id': id,
                                'remark': result.value
                            },
                            success: function(response) {
                                // console.log(response);
                                let sts = response.sts;
                                let icon = "";
                                let msg = "";
                                if (sts == 1) {
                                    icon = "hrtsficn.json";
                                    msg = "Successfully commented";
                                    // swal_alert(icon, msg);
                                    location.reload();
                                } else if (sts == 2) {
                                    icon = "azxkyjta.json";
                                    msg = "Please try again";
                                    swal_alert(icon, msg);
                                }
                                // $(':input[type="submit"]').prop('disabled', false);
                            },
                            error: function(xhr) {
                                console.log(xhr.responseText);
                            },
                        });
                    } else if (result.isDismissed) {
                        console.log('Closed without submission');
                    }
                });
            } else {
                icon = "azxkyjta.json";
                msg = "At least one comment/reply before close the task";
                swal_alert(icon, msg);
            }
        });

        document.getElementById("send_back") && document.getElementById("send_back").addEventListener("click", function() {
            if (send_back) {
                let id = $(this).val();
                SwalWithCustomSettings.fire({
                    title: 'Send Back',
                    input: 'textarea',
                    inputPlaceholder: 'Type your remark here...',
                    // inputValue: 'Default message',
                    inputAttributes: {
                        'aria-label': 'Type your remark here'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'Submit',
                    cancelButtonText: 'Cancel',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "{{ route('task_send_back') }}", // Route to the controller
                            type: "post",
                            headers: {
                                'X-CSRF-TOKEN': "{{ csrf_token() }}"
                            },
                            data: {
                                'ids': id,
                                'remark': result.value
                            },
                            success: function(response) {
                                // console.log(response);
                                let sts = response.sts;
                                let icon = "";
                                let msg = "";
                                if (sts == 1) {
                                    icon = "hrtsficn.json";
                                    msg = "Successful";
                                    swal_alert(icon, msg);
                                    location.reload();
                                } else if (sts == 2) {
                                    icon = "azxkyjta.json";
                                    msg = "Please try again";
                                    swal_alert(icon, msg);
                                }
                                // $(':input[type="submit"]').prop('disabled', false);
                            },
                            error: function(xhr) {
                                console.log(xhr.responseText);
                            },
                        });
                    } else if (result.isDismissed) {
                        console.log('Closed without submission');
                    }
                });
            }
            else {
                icon = "azxkyjta.json";
                msg = "Cannot be send back due to one or more comments by the logged in user";
                swal_alert(icon, msg);
            }
        });


        $('#docs_form').on('submit', function(e) {
            e.preventDefault(); // Prevent the default form submission
            var formData = new FormData(this); // Get form data
            $(':input[type="submit"]').prop('disabled', true);
            $.ajax({
                url: "{{ route('attach_supporting_docs') }}", // Route to the controller
                method: "POST",
                data: formData,
                processData: false, // Don't process the files
                contentType: false, // Don't set content type
                success: function(response) {
                    let sts = response.sts;
                    let icon = "";
                    letmsg = "";
                    if (sts == 1) {
                       location.reload();
                    } else if (sts == 2) {
                        icon = "azxkyjta.json";
                        msg = "Please try again";
                        swal_alert(icon, msg);
                    } else if (sts == 3) {
                        icon = "azxkyjta.json";
                        msg ="<span style='color:red;font-size: 16px'>* </span>Marked fields are mandatory";
                         swal_alert(icon, msg);
                    }
                    $(':input[type="submit"]').prop('disabled', false);
                },
                error: function(xhr) {
                    // Display validation errors
                    if (xhr.responseJSON.errors) {
                        let errors = xhr.responseJSON.errors;
                        let errorMessage = "";
                        for (let key in errors) {
                            errorMessage += errors[key][0] + "<br>";
                        }
                        console.log(errorMessage);
                    }
                },
            });
        });
    });
    // let fileControl = $('#reply_file');
    // initFilePreview(fileControl);
</script>
