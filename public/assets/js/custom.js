//active link for menus
document.addEventListener('DOMContentLoaded', () => {
    const currentUrl = window.location.href;
    document.querySelectorAll('a.nav-link').forEach(link => {
        if (currentUrl.includes(link.href)) {
            link.classList.add('active');
            const parentDropdown = link.closest('div.menu-dropdown');
            if (parentDropdown) {
                parentDropdown.classList.add('show');
                parentDropdown.previousElementSibling?.classList.add('active', 'aria-expanded', 'true');
            }
        }
    });
});
function showAlert(message, status) {
    var alertColor = status === 'success' ? 'bg-success' : 'bg-danger';
    var alertHTML = `
    <div class="alert ${alertColor} border-${alertColor} text-white position-fixed top-0 end-0 m-3" role="alert">
        <strong>${status === 'success' ? 'Success!' : 'Oops!'}</strong> - ${message}
    </div>`;
    $('body').append(alertHTML);
    setTimeout(function() {
        $('.alert').fadeOut(500, function() {
            $(this).remove();
        });
    }, 3000);
}
function initTypeahead(typeElem,typeKey,aParam){
    typeElem.typeahead({minLength: 3,highlight: true,hint: true}, {
    display: function(item) {return `${item.name}`;},
    source: function(query, syncResults, asyncResults) {
        $.ajax({
            url: '../init-typeahead',
            data: {query: query,key: typeKey,param:aParam},
            success: function(data) {asyncResults(data);}
        });
    }
    });
}
function initFilePreview(elem) {
    elem.change(function (event) {
        let file = event.target.files[0];
        if (file) {
            let reader = new FileReader();
            let fileType = file.type;
            let fileIcon = 'bxs-file-doc';
            let fileBtn = '';
            let fileTypeClass = '';

            if (fileType.startsWith('image/') || fileType === 'application/pdf') {
                if (fileType.startsWith('image/')) {
                    fileIcon = 'bxs-file-image';
                    fileTypeClass = 'image';
                } else if (fileType === 'application/pdf') {
                    fileIcon = 'bxs-file-pdf';
                    fileTypeClass = 'pdf';
                }
                reader.onload = function (e) {
                    fileBtn = `
                        <label for="filePreviewContainer" class="form-label">File Preview</label> <br>
                        <button type="button" class="btn btn-outline-info btn-block file-preview-icon"
                                data-file="${file.name}" data-type="${fileTypeClass}" data-src="${e.target.result}">
                            <i class="bx ${fileIcon}"></i>
                        </button>`;
                    $('#filePreviewContainer').html(fileBtn);
                };
                reader.readAsDataURL(file);
            } else {
                SwalWithCustomSettings.fire('File Type Not Allowed. Select Only Image or PDF', 'Error');
            }
        }
    });
}
function handlePreview(fileType, fileSrc, fileName) {
    let modalBody = $('#fileModalBody');
    const image_ext= ["image", "png", "jpg", "jpeg"];
    if (image_ext.includes(fileType.toLowerCase())) {
        modalBody.html(`<img src="${fileSrc}" width="100%" height="100%" alt="Preview of ${fileName}">`);
    } else if (fileType === 'pdf') {
        modalBody.html(`<iframe src="${fileSrc}" width="100%" height="500px"></iframe>`);
    } else {
        modalBody.html(`<p>Preview not available for this file type.</p>`);
    }
    $('#fileModal').fadeIn();
}
$(document).on('click', '.file-preview-icon', function () {
    let fileType = $(this).data('type');
    let fileSrc = $(this).data('src');
    let fileName = $(this).data('file');
    handlePreview(fileType, fileSrc, fileName);
});
$(document).on('click', '#closeModal', function() {
    $('#fileModal').fadeOut();
});
$(window).click(function(event) {
    if ($(event.target).is('#fileModal')) {
        $('#fileModal').fadeOut();
    }
});
