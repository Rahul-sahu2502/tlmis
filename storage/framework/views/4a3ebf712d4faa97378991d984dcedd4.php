<script>
    let sts=false;
    let query_params="?search=1";
    $(jQuery).ready(function () {
        if($("#filter_task_id").data('t')!=""){
            query_params="?search=1";
            $("#usage").val('A').change();
            query_params+="&task_id="+$("#filter_task_id").data('t')+"&usage=A";
            sts=true;
        }
        docs_list(query_params);
        if($('.datatable tbody tr').length > 0 && $('.datatable tbody tr td:first').html().trim()!="No documents found."){
            $('.datatable').DataTable({
                language: {
                    search: "Search:",
                },
            });
        }
        $(".select2,#fk_dept_id").select2();
    });
    $("#entry_date").change(function () {
        $("#due_date").val('');
        $("#due_date").attr('min', $(this).val());
    });
    $("#filter").click(function () {
        query_params="?search=1";
        if($("#ref_no").val()!=""){
            query_params+="&ref_no="+$("#ref_no").val();
            sts=true;
        }
        if($("#issue_date").val()!=""){
            query_params+="&issue_date="+$("#issue_date").val();
            sts=true;
        }
        if($("#file_type").val()!=""){
            query_params+="&file_type="+$("#file_type").find(":selected").val();
            sts=true;
        }
        if($("#usage").val()!=""){
            query_params+="&usage="+$("#usage").find(":selected").val();
            sts=true;
        }
        if(sts==true){
            docs_list(query_params);
        }
    });
    $("#reset").click(function(){
        docs_list(query_params);
    });
    $('#submit_form').on('submit', function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        $(':input[type="submit"]').prop('disabled', true);
        $.ajax({
            url: $(this).attr('action'),
            method: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                let response_status = response.sts;
                let response_icon = "";
                let response_msg = "";
                if (response_status == 1) {
                    response_icon = "hrtsficn.json";
                } else if (response_status == 2)
                    response_icon = "azxkyjta.json";
                else if (response_status == 3)
                    response_icon = "azxkyjta.json";
                msg = response.message;
                $(':input[type="submit"]').prop('disabled', false);
                swal_alert(response_icon, response_msg, response_status);
            },
            error: function(xhr) {
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
    function docs_list(query_params){
        $("#tBody").html("");
        $.ajax({
            url: "<?php echo e(url('get-docs-list')); ?>" + query_params,
            method: "GET",
            success: function (response) {
                $("#tBody").html(response.html);
            },
            error: function (xhr) {
                console.error("Error loading documents:", xhr.responseText);
            },
        });
    }
    function swal_alert(icon, msg, sts) {
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
        }).then((result) => {
            // Check if 'Ok' was clicked and status equals 1
            if (sts === 1 && result.dismiss === Swal.DismissReason.cancel) {
                window.location.href = "<?php echo e(route('task_view')); ?>"; // Redirect to the specified URL
            }
        });
    }
    document.querySelector('.check_all').addEventListener('click', function () {
        let isChecked = this.checked;
        let taskCheckboxes = document.querySelectorAll('.doc_check');
        taskCheckboxes.forEach(function (checkbox) {
            checkbox.checked = isChecked;
        });
    });
    let fileControl = $('#file');
    initFilePreview(fileControl);
</script>
<?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/tasks/details_js.blade.php ENDPATH**/ ?>