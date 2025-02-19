<script>
    $(document).ready(function() {
        $('.datatable').DataTable({
            dom: '<"dt-top"lfB>rtip',
            buttons: ['copy', 'excel', 'print',{extend: 'pdf',customize: function(doc) {pdfMake.fonts = {unicode: {normal: 'unicode.ttf',bold: 'unicode.ttf',italics: 'unicode.ttf',bolditalics: 'unicode.ttf'}};doc.defaultStyle.font = "unicode";}}],
            language: {
                search: "Search:",
            },
        });
        function change_status(sts_data){
            SwalWithCustomSettings.fire({
                title: 'Remark',
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
                        url: "{{ route('task_sb_change_status') }}", // Route to the controller
                        type: "post",
                        headers: {
                            'X-CSRF-TOKEN': "{{ csrf_token() }}"
                        },
                        data: {
                            'sts_data': sts_data,
                            'remark': result.value
                        },
                        success: function(response) {
                            // console.log(response);
                            let sts = response.sts;
                            let icon = "";
                            let msg = "";
                            if (sts==1) {
                                icon = "hrtsficn.json";
                                msg = "Successfully commented";
                                // swal_alert(icon, msg);
                                location.reload();
                            } else if (sts==2) {
                                icon = "azxkyjta.json";
                                msg = "Please try again";
                                // swal_alert(icon, msg);
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

        $(".change_status").click(function(){
            change_status($(this).val());
        });

    });
</script>
