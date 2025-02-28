<!doctype html>
<html lang=en data-layout=vertical data-topbar=light data-sidebar-size=lg data-sidebar=dark data-sidebar-image=none
    data-bs-theme=light data-layout-width=fluid data-layout-position=fixed data-layout-style=default
    data-sidebar-visibility=show>

<head>
    <?php echo $__env->make('layouts.partials.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->yieldContent('styles'); ?>
</head>

<body>
    <div id=layout-wrapper>
        <?php echo $__env->make('layouts.partials.menu', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <div class=main-content>
            <div class=page-content>
                <div class=container-fluid>
                    <div class=row>
                        <div class=col-12>
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class=mb-sm-0><a href="<?php echo e(route('dashboard')); ?>"
                                        class="btn btn-outline-primary btn-xs"> <i class="ri-home-3-fill"></i> </a>
                                    <?php echo e(__('word.' . strtolower($page_title))); ?></h4>
                                <div class=page-title-right>
                                    <ol class="breadcrumb m-0">
                                        <?php if($page_title != 'Dashboard'): ?>
                                            <li class="breadcrumb-item active"><a href="<?php echo e(URL::previous()); ?>"
                                                    class="btn btn-outline-primary btn-xs"><i
                                                        class="ri-arrow-left-line"></i> <?php echo e(__('word.back')); ?></a></li>
                                        <?php endif; ?>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <?php echo $__env->yieldContent('content'); ?>
                    </div>
                </div>
                <footer class=footer>
                    <div class=container-fluid>
                        <div class=row>
                            <?php echo $__env->make('layouts.partials.copy', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <?php echo $__env->make('layouts.partials.footer_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php echo $__env->yieldContent('scripts'); ?>
        <div id="fileModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <button id="closeModal" type="button"
                        class="btn btn-lg btn-info btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center" id="fileModalBody">
                </div>
            </div>
        </div>
</body>

</html>
<?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/layouts/layout_admin.blade.php ENDPATH**/ ?>