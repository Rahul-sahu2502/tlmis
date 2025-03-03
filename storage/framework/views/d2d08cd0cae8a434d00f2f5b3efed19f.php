<header id=page-topbar>
    <div class=layout-width>
        <div class=navbar-header>
            <div class=d-flex>
                <div class="navbar-brand-box horizontal-logo">
                    <a href="<?php echo e(url('/dashboard')); ?>" class="logo logo-dark">
                        <span class=logo-sm>
                            <img src="<?php echo e(asset('assets/images/logo-sm.png')); ?>" height=30>
                        </span>
                        <span class=logo-lg>
                            <img src="<?php echo e(asset('assets/images/logo-dark.png')); ?>" height=30>
                        </span>
                    </a>
                    <a href="<?php echo e(route('dashboard')); ?>" class="logo logo-light">
                        <span class=logo-sm>
                            <img src="<?php echo e(asset('assets/images/logo-sm.png')); ?>" height=30>
                        </span>
                        <span class=logo-lg>
                            <img src="<?php echo e(asset('assets/images/logo-light.png')); ?>" height=30>
                        </span>
                    </a>
                </div>
                <button type=button class="btn btn-sm px-3 fs-16 header-item vertical-menu-btn topnav-hamburger"
                    id=topnav-hamburger-icon>
                    <span class=hamburger-icon>
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
                </button>
                <h2 class="header-title py-3">
                    Welcome to TLMiS
                </h2>
            </div>
            <div class="d-flex align-items-center">
                <?php echo $__env->make('components.language-switcher', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <div class="ms-1 header-item d-none d-sm-flex">
                    <button type=button class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
                        data-toggle=fullscreen>
                        <i class='bx bx-fullscreen fs-22'></i>
                    </button>
                </div>
                <div class="ms-1 header-item d-none d-sm-flex">
                    <button type=button
                        class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle light-dark-mode">
                        <i class='bx bx-moon fs-22'></i>
                    </button>
                </div>
                <?php echo $__env->make('layouts.partials.notifications', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <div class="dropdown ms-sm-3 header-item topbar-user">
                    <button type=button class=btn id=page-header-user-dropdown data-bs-toggle=dropdown
                        aria-haspopup=true aria-expanded=false>
                        <span class="d-flex align-items-center">
                            <img class="rounded-circle header-profile-user" src="<?php echo e(asset('assets/images/users/avatar-1.jpg')); ?>"
                                alt="Header Avatar">
                            <span class="text-start ms-xl-2">
                                <span
                                    class="d-none d-xl-inline-block ms-1 fw-medium user-name-text"><?php echo e(Session::get('fullname') ?? ''); ?></span>
                                <span
                                    class="d-none d-xl-block ms-1 fs-12 user-name-sub-text"><?php echo e(Session::get('designation') . ' (' . Session::get('level') . ')'); ?></span>
                            </span>
                        </span>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <h6 class=dropdown-header>Welcome <?php echo e(Session::get('username') ?? ''); ?>!</h6>
                        <a class=dropdown-item href="<?php echo e(route('change-password')); ?>"><i
                                class="mdi mdi-form-textbox-password text-muted fs-16 align-middle me-1"></i> <span
                                class=align-middle>Change Password</span></a>
                        <a class=dropdown-item href="<?php echo e(route('logout')); ?>"><i
                                class="mdi mdi-logout text-muted fs-16 align-middle me-1"></i> <span class=align-middle
                                data-key=t-logout>Logout</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<div class="app-menu navbar-menu">
    <div class=navbar-brand-box>
        <a href="<?php echo e(url('/dashboard')); ?>" class="logo logo-dark">
            <span class=logo-sm>
                <img src="<?php echo e(asset('assets/images/logo-sm.png')); ?>" alt height=22>
            </span>
            <span class=logo-lg>
                <img src="<?php echo e(asset('assets/images/logo-dark.png')); ?>" alt height=30>
            </span>
        </a>
        <a href="<?php echo e(url('/dashboard')); ?>" class="logo logo-light">
            <span class=logo-sm>
                <img src="<?php echo e(asset('assets/images/logo-sm.png')); ?>" alt height=22>
            </span>
            <span class=logo-lg>
                <img src="<?php echo e(asset('assets/images/logo-light.png')); ?>" alt height=30>
            </span>
        </a>
        <button type=button class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id=vertical-hover>
            <i class=ri-record-circle-line></i>
        </button>
    </div>
    <div id=scrollbar>
        <div class=container-fluid>
            <div id=two-column-menu>
            </div>
            <?php if(Session::get('role_id') != 3): ?>
                <ul class=navbar-nav id=navbar-nav>
                    <li class=nav-item>
                        <a class="nav-link menu-link" href="<?php echo e(route('dashboard')); ?>">
                        <i class="bx bxs-dashboard"></i> <span data-key=t-dashboard> <?php echo e(__('word.dashboard')); ?></span>
                        </a>
                    </li>
                    <li class=nav-item>
                        <a class="nav-link menu-link" href=#sidebarUsers data-bs-toggle=collapse role=button
                           aria-expanded=false aria-controls=sidebarUsers>
                            <i class="bx bx-user-check"></i> <span data-key=t-users><?php echo e(__('word.users')); ?></span>
                        </a>
                        <div class="collapse menu-dropdown" id=sidebarUsers>
                            <ul class="nav nav-sm flex-column">
                                <li class=nav-item>
                                    <a href="<?php echo e(route('add-user')); ?>" class=nav-link data-key=t-crm> <?php echo e(__('word.add')); ?> </a>
                                </li>
                                <li class=nav-item>
                                    <a href="<?php echo e(route('view-user')); ?>" class=nav-link data-key=t-analytics> <?php echo e(__('word.view')); ?></a>
                                </li>
                                <?php if(Session::get('level_id') == '1'): ?>
                                <li class=nav-item>
                                    <a href="<?php echo e(route('login-log')); ?>" class=nav-link data-key=t-log> <?php echo e(__('word.login_log')); ?></a>
                                </li>
                                <?php endif; ?>
                                <li class=nav-item>
                                    <a href="<?php echo e(route('transfer-user')); ?>" class=nav-link data-key=t-log> <?php echo e(__('word.transfer_user')); ?></a>
                                </li>
                                <li class=nav-item>
                                    <a href="<?php echo e(route('user_hierarchy')); ?>" class=nav-link data-key=t-log> <?php echo e(__('word.user_hierarchy')); ?></a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <?php if(Session::get('level_id') > 1): ?>
                        <li class=nav-item>
                            <a class="nav-link menu-link" href=#sidebarDashboards data-bs-toggle=collapse role=button
                                aria-expanded=false aria-controls=sidebarDashboards>
                                <i class="bx bx-task"></i> <span data-key=t-dashboards> <?php echo e(__('word.tasks')); ?></span>
                            </a>
                            <div class="collapse menu-dropdown" id=sidebarDashboards>
                                <ul class="nav nav-sm flex-column">
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('task_view')); ?>" class=nav-link active data-key=t-analytics> <?php echo e(__('word.view')); ?></a>
                                    </li>
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('task_allocate_list')); ?>" class=nav-link active data-key=t-analytics> <?php echo e(__('word.task_allocate')); ?></a>
                                    </li>
                                    <li class=nav-item>
                                        <a class="nav-link menu-link" href="<?php echo e(route('sb_request_list')); ?>">
                                            <span data-key=t-sb_request><?php echo e(__('word.send_back_req')); ?></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class=nav-item>
                            <a href="<?php echo e(route('tl_view')); ?>" class=nav-link active data-key=t-analytics> <i class="bx bx-briefcase"></i>  <?php echo e(__('word.tl_review')); ?></a>
                        </li>
                        <li class=nav-item>
                            <a class="nav-link menu-link" href=#letters data-bs-toggle=collapse role=button
                               aria-expanded=false aria-controls=letters>
                                <i class="bx bx-file"></i> <span data-key=t-letters> <?php echo e(__('word.letters')); ?></span>
                            </a>
                            <div class="collapse menu-dropdown" id=letters>
                                <ul class="nav nav-sm flex-column">
                                    <li class=nav-item>
                                        <a href="<?php echo e(url('create-letter')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.add')); ?></a>
                                    </li>
                                    <li class=nav-item>
                                        <a href="<?php echo e(url('created-letters')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.view')); ?></a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class=menu-title><i class=ri-more-fill></i> <span data-key=t-components><?php echo e(__('word.masters')); ?></span></li>
                        <li class="nav-item"> <a class="nav-link" href="<?php echo e(url('manage-header')); ?>"><i class=" bx bxs-file-doc"></i> <span data-key=t-users><?php echo e(__('word.manage_header')); ?></span></a></li>
                        <li class="nav-item"> <a class="nav-link" href="<?php echo e(url('manage-signatory')); ?>"><i class=" bx bxs-file-doc"></i> <span data-key=t-users><?php echo e(__('word.manage_signatory')); ?></span></a></li>
                    <?php endif; ?>
                    <?php if(Session::get('level_id') == '1'): ?>
                        <li class=nav-item>
                            <a class="nav-link menu-link" href=#docs data-bs-toggle=collapse role=button
                                aria-expanded=false aria-controls=docs>
                                <i class="bx bx-folder"></i> <span data-key=t-documents> <?php echo e(__('word.documents')); ?></span>
                            </a>
                            <div class="collapse menu-dropdown" id=docs>
                                <ul class="nav nav-sm flex-column">
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('docs_add')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.add')); ?></a>
                                    </li>
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('docs_list')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.view')); ?></a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class=nav-item>
                            <a class="nav-link menu-link" href=#sidebarDashboards data-bs-toggle=collapse role=button
                                aria-expanded=false aria-controls=sidebarDashboards>
                                <i class="bx bx-task"></i> <span data-key=t-dashboards> <?php echo e(__('word.tasks')); ?></span>
                            </a>
                            <div class="collapse menu-dropdown" id=sidebarDashboards>
                                <ul class="nav nav-sm flex-column">
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('task_add')); ?>" class=nav-link data-key=t-crm> <?php echo e(__('word.add')); ?> </a>
                                    </li>
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('task_view')); ?>" class=nav-link active data-key=t-analytics> <?php echo e(__('word.view')); ?></a>
                                    </li>
                                    <li class=nav-item>
                                        <a class="nav-link menu-link" href="<?php echo e(route('sb_request_list')); ?>">
                                            <span data-key=t-sb_request><?php echo e(__('word.send_back_req')); ?></span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class=nav-item>
                            <a class="nav-link menu-link" href=#sidebarTL data-bs-toggle=collapse role=button
                                aria-expanded=false aria-controls=sidebarTL>
                                <i class="bx bx-briefcase"></i> <span data-key=t-dashboards><?php echo e(__('word.tl_review')); ?></span>
                            </a>
                            <div class="collapse menu-dropdown" id=sidebarTL>
                                <ul class="nav nav-sm flex-column">
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('tl_new')); ?>" class=nav-link active data-key=t-analytics> <?php echo e(__('word.add')); ?></a>
                                    </li>
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('tl_view')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.view')); ?></a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class=nav-item>
                            <a class="nav-link menu-link" href=#sidebarReports data-bs-toggle=collapse role=button
                                aria-expanded=false aria-controls=sidebarReports>
                                <i class="bx bx-file"></i> <span data-key=t-users><?php echo e(__('word.reports')); ?></span>
                            </a>
                            <div class="collapse menu-dropdown" id=sidebarReports>
                                <ul class="nav nav-sm flex-column">
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('task_status')); ?>?search=1" class=nav-link data-key=t-crm> <?php echo e(__('word.task_status')); ?> </a>
                                    </li>
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('task_status')); ?>?search=2&sts=I" class=nav-link data-key=t-crm> <?php echo e(__('word.task_inprogress')); ?> </a>
                                    </li>
                                    <li class=nav-item>
                                        <a href="<?php echo e(route('task_status')); ?>?search=3&sts=C" class=nav-link data-key=t-crm> <?php echo e(__('word.task_completed')); ?> </a>
                                    </li>
                                    <li class=nav-item>
                                        <a class="nav-link" href="<?php echo e(route('offices_task_report')); ?>">
                                            <span data-key=t-users><?php echo e(__('word.office_wise')); ?></span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#sidebarAccount" class="nav-link" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarAccount" data-key="t-level-1.2"><?php echo e(__('word.review_report')); ?>

                                        </a>
                                        <div class="collapse menu-dropdown" id="sidebarAccount">
                                            <ul class="nav nav-sm flex-column">
                                                <li class=nav-item>
                                                    <a class="nav-link" href="<?php echo e(route('dept_analysis')); ?>">
                                                        <span data-key=t-users><?php echo e(__('word.review_report_dept')); ?></span>
                                                    </a>
                                                </li>
                                                <li class=nav-item>
                                                    <a class="nav-link" href="<?php echo e(route('tl_report')); ?>">
                                                        <span data-key=t-users><?php echo e(__('word.review_report_tl')); ?></span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class=nav-item>
                            <a class="nav-link menu-link" href=#letters data-bs-toggle=collapse role=button
                               aria-expanded=false aria-controls=letters>
                                <i class="bx bx-file"></i> <span data-key=t-letters> <?php echo e(__('word.letters')); ?></span>
                            </a>
                            <div class="collapse menu-dropdown" id=letters>
                                <ul class="nav nav-sm flex-column">
                                    <li class=nav-item>
                                        <a href="<?php echo e(url('create-letter')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.add')); ?></a>
                                    </li>
                                    <li class=nav-item>
                                        <a href="<?php echo e(url('created-letters')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.view')); ?></a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        
                                                <li class=nav-item>
                                                    <a class="nav-link menu-link" href=#ptms data-bs-toggle=collapse role=button aria-expanded=false
                                                        aria-controls=ptms>
                                                        <i class="bx bx-line-chart"></i> <span data-key=t-letters> <?php echo e(__('word.performance')); ?></span>
                                                    </a>
                                                    <div class="collapse menu-dropdown" id=ptms>
                                                        <ul class="nav nav-sm flex-column">
                                                            <li class=nav-item>
                                                                <a href="<?php echo e(route('delay')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.delay')); ?></a>
                                                            </li>
                                                            <li class=nav-item>
                                                                <a href="<?php echo e(route('count_tasks')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.no_of_tasks')); ?></a>
                                                            </li>
                                                            <li class=nav-item>
                                                                <a href="<?php echo e(route('rating_page')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.rating')); ?></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                        

                        <li class=menu-title><i class=ri-more-fill></i> <span data-key=t-components><?php echo e(__('word.masters')); ?></span></li>
                        <li class=nav-item><a class="nav-link" href="<?php echo e(route('department')); ?>"><i class="bx bx-buildings"></i> <span data-key=t-users><?php echo e(__('word.departments')); ?></span></a></li>
                        <li class=nav-item><a class="nav-link" href="<?php echo e(route('master_view', ['key' => 'ISS'])); ?>"><i class=" bx bxs-store-alt"></i> <span data-key=t-users><?php echo e(__('word.issuer_type')); ?></span></a></li>
                        <li class=nav-item><a class="nav-link" href="<?php echo e(route('master_view', ['key' => 'DOC'])); ?>"><i class=" bx bxs-file-doc"></i> <span data-key=t-users><?php echo e(__('word.document_type')); ?></span></a></li>
                        <li class="nav-item"> <a class="nav-link" href="<?php echo e(url('manage-header')); ?>"><i class=" bx bxs-file-doc"></i> <span data-key=t-users><?php echo e(__('word.manage_header')); ?></span></a></li>
                        <li class="nav-item"> <a class="nav-link" href="<?php echo e(url('manage-signatory')); ?>"><i class=" bx bxs-file-doc"></i> <span data-key=t-users><?php echo e(__('word.manage_signatory')); ?></span></a></li>
                    <?php endif; ?>
                </ul>

            <?php elseif(Session::get('role_id') == 3): ?>
            <ul class=navbar-nav id=navbar-nav>
                <li class=nav-item>
                    <a class="nav-link menu-link" href=#docs data-bs-toggle=collapse role=button
                        aria-expanded=false aria-controls=docs>
                        <i class="bx bx-folder"></i> <span data-key=t-documents> <?php echo e(__('word.documents')); ?></span>
                    </a>
                    <div class="collapse menu-dropdown" id=docs>
                        <ul class="nav nav-sm flex-column">
                            <li class=nav-item>
                                <a href="<?php echo e(route('docs_add')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.add')); ?></a>
                            </li>
                            <li class=nav-item>
                                <a href="<?php echo e(route('docs_list')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.view')); ?></a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class=nav-item>
                    <a class="nav-link menu-link" href=#letters data-bs-toggle=collapse role=button
                       aria-expanded=false aria-controls=letters>
                        <i class="bx bx-file"></i> <span data-key=t-letters> <?php echo e(__('word.letters')); ?></span>
                    </a>
                    <div class="collapse menu-dropdown" id=letters>
                        <ul class="nav nav-sm flex-column">
                            <li class=nav-item>
                                <a href="<?php echo e(url('create-letter')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.add')); ?></a>
                            </li>
                            <li class=nav-item>
                                <a href="<?php echo e(url('created-letters')); ?>" class=nav-link active data-key=t-analytics><?php echo e(__('word.view')); ?></a>
                            </li>
                        </ul>
                    </div>
                </li>

            </ul>
            <?php endif; ?>

        </div>
    </div>
    <div class=sidebar-background></div>
</div>
<div class=vertical-overlay></div>
<?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views/layouts/partials/menu.blade.php ENDPATH**/ ?>