<?php $__env->startSection('styles'); ?>
<style>
    .departments>li:first-child{
        border-bottom: none;
    }
    .department{
        width: 14.25%;
    }
    .sitemap-horizontal ul a{
        flex-direction: column;
    }
    .department ul li a{
        height: auto;
    }
    .department ul li{
        margin-bottom: 60px;
    }
    .departments::after{
        top: 30px;
    }
    .administration .subdirector::after{
        height: 30px;
    }
    .departments>li:first-child{
        padding: 0;
        height: 0;
        margin:0 auto 54px auto;
    }
    .text-muted{
        font-weight: normal;
        font-size: .9em;
    }
    .sitemap-horizontal ul a span{
        text-align: center;
    }
</style>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="sitemap-content">
                    <?php
                        $groupedUsers = $users->groupBy(function($user) {
                            return optional($user->userMaps->first())->department->department_eng ?? 'Unknown Deptartment';
                        })->sortKeys();
                        if ($groupedUsers->has('Unknown Deptartment')) {
                            $unknownLevelUsers = $groupedUsers->pull('Unknown Deptartment');
                            $groupedUsers->put('Unknown Deptartment', $unknownLevelUsers);
                        }
                    ?>
                    <figure class="sitemap-horizontal">
                        <ul class="administration">
                            <li>
                                <ul class="director">
                                    <li>
                                        <a href="javascript:void(0);" class="fw-semibold"><span>Application User Hierarchy</span></a>
                                        <ul class="subdirector"></ul>
                                        <ul class="departments">
                                            <li></li>
                                            <?php $__currentLoopData = $groupedUsers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dept => $usersIndept): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <li class="department">
                                                <a href="javascript:void(0);" class="fw-semibold"><span><?php echo e($dept); ?></span></a>
                                                <ul>
                                                <?php $__currentLoopData = $usersIndept; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <li><a href="javascript:void(0);"><strong><?php echo e($user->userMaps->first()->level->level); ?></strong> <span><?php echo e($user->full_name); ?></span>
                                                        <?php if($user->userMaps->where('is_active', 1)->count() > 0): ?>
                                                        <dd>
                                                            <?php $__currentLoopData = $user->userMaps; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $map): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <dt class="text-muted"><?php echo e(optional($map->designation)->designation ?? 'No Designation'); ?></dt>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        </dd>
                                                        <?php endif; ?>
                                                        </a>
                                                    </li>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                            </li>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </figure>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/users/hierarchy.blade.php ENDPATH**/ ?>