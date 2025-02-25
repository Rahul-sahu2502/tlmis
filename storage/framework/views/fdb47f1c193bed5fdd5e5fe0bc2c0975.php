<!doctype html>
<html lang=en data-layout=horizontal data-topbar=dark data-sidebar-size=lg data-sidebar=light data-sidebar-image=none
    data-preloader=disable>
<head>
    <?php echo $__env->make('layouts.partials.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <link href="<?php echo e(asset('assets/libs/sweetalert2/sweetalert2.min.css')); ?>" rel="stylesheet" type="text/css" />
    <style>
        .bg-primary{
           background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%)
        }
        .instruction-list li {
            background: transparent;
            color: #fff;
        }
    </style>
    <?php echo $__env->yieldContent('styles'); ?>
</head>

<body>
<div class="auth-page-wrapper auth-bg-cover py-5 d-flex justify-content-center align-items-center min-vh-100">
<div class="bg-overlay"></div>
        <div style="width: auto; position: absolute; top: 10px; right: 10px;z-index: 999">
                <?php echo $__env->make('components.language-switcher', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            </div>
            <div class="auth-page-content overflow-hidden pt-lg-5">
            <div class=container>
                <div class=row>
                    <div class=col-lg-12>
                    <div class="card overflow-hidden">
                            <div class="row g-0">
                                <div class="col-lg-6 d-none d-lg-block">
                                    <div class="p-lg-5 p-4 auth-one-bg h-100">
                                        <div class="bg-overlay"></div>
                                        <div class="position-relative h-100 d-flex flex-column">
                                            <div class="mb-4 text-center mt-sm-2 mb-4 text-white-50">
                                                <div>
                                                    <a href="/" class="d-inline-block auth-logo">
                                                        <img src="<?php echo e(asset('assets/images/logo-light.png')); ?>" height=30>
                                                    </a>
                                                </div>
                                                <p class="mt-3 fs-15 fw-medium"><?php echo e(__('word.subtitle')); ?></p>
                                            </div>
                                            <div class="mt-auto">
                                                <h4 class="card-title text-white fw-medium text-center"><?php echo e(__('word.ins_title')); ?></h4>
                                                <ul class="list-group instruction-list">
                                                    <li class="list-group-item"> <i class="mdi mdi-check-bold align-middle lh-1 me-2"></i> <?php echo e(__('word.ins_1')); ?></li>
                                                    <li class="list-group-item"> <i class="mdi mdi-check-bold align-middle lh-1 me-2"></i> <?php echo e(__('word.ins_2')); ?> <a href="https://microsoft.com/cms/api/am/binary/RE56Fox" class="text-warning" target="_blank"> <?php echo e(__('word.link')); ?>  <i class="mdi mdi-launch align-middle lh-1 me-2"></i></a></li>
                                                </ul>
                                                <div id="qoutescarouselIndicators" class="carousel slide m-2" data-bs-ride="carousel">
                                                    <div class="carousel-indicators">
                                                        <button type="button" data-bs-target="#qoutescarouselIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                                        <button type="button" data-bs-target="#qoutescarouselIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                                    </div>
                                                    <div class="carousel-inner text-center text-white pb-5">
                                                        <div class="carousel-item active">
                                                            <p class="fs-15 fst-italic"><?php echo e(__('word.ins_3')); ?>&nbsp;<a href="mailto:contact@vectre.in" target="_blank" class="text-black"> <i class="mdi mdi-email align-middle lh-1"></i> contact@vectre.in</a></p>
                                                        </div>
                                                        <div class="carousel-item">
                                                            <p class="fs-15 fst-italic"><?php echo e(__('word.ins_4')); ?>&nbsp;<a href="tel:+919752386699" target="_blank" class="text-black"> <i class="mdi mdi-phone align-middle lh-1"></i> +91 97523 86699</a></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php echo $__env->yieldContent('content'); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php echo $__env->make('layouts.partials.footer_auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->yieldContent('scripts'); ?>
</body>

</html>
<?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\layouts\layout_auth.blade.php ENDPATH**/ ?>