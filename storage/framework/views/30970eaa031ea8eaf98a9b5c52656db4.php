<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-12">
            <div class="card mt-n4 mx-n4">
                <div class="bg-warning-subtle">
                    <div class="card-body pb-0 px-4">
                        <div class="row mb-3">
                            <div class="col-md">
                                <div class="row align-items-center g-3">
                                    <div class="col-md">
                                        <?php
                                            $sts = "Inprogress";$color="primary";
                                            if($details[0]->status == "P"){ $sts = "Pending";$color="secondary";}
                                            elseif ($details[0]->status == "C"){ $sts = "Completed";$color="success";}
                                            elseif ($details[0]->status == "O"){ $sts = "Reopened";$color="warning";}
                                        ?>
                                        <div>
                                            <h4 class="fw-bold"><?php echo e($details[0]->title); ?></h4>
                                            <div class="hstack gap-3 flex-wrap">
                                                <div>
                                                    <i class="ri-building-line align-bottom me-1"></i>Offices:<br>
                                                    <?php $__currentLoopData = explode(',', $details[0]->department_eng); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <?php echo e($loop->index+1 .". ". $val); ?><br>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </div>
                                                <div class="vr"></div>
                                                <div>
                                                    <i class="ri-calendar-todo-line align-bottom me-1"></i>Task Entry Date : <span
                                                        class="fw-medium"><?php echo e(date('d M, Y', strtotime($details[0]->entry_date))); ?></span>
                                                    <br>
                                                    <i class="ri-calendar-todo-line align-bottom me-1"></i> Task Due Date : <span
                                                        class="fw-medium"><?php echo e(date('d M, Y', strtotime($details[0]->due_date))); ?></span>
                                                </div>
                                                <div class="vr"></div>
                                                <div>
                                                    <i class="ri-mail-line align-bottom me-1"></i>Category:
                                                    <div><?php echo e($details[0]->category); ?></div>
                                                </div>
                                                <div class="vr"></div>
                                                <div title="Current Status"
                                                     class="badge rounded-pill bg-<?php echo e($color); ?> fs-12"><?php echo e($sts); ?></div>
                                                <div title="Priority"
                                                     class="badge rounded-pill bg-<?php echo e($details[0]->fk_task_priority_id==1?"success":"danger"); ?> fs-12"><?php echo e($details[0]->priority); ?></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-auto">
                                <div class="hstack gap-1 flex-wrap">
                                    <?php if($details[0]->status == "C"): ?>
                                        <button type="button" disabled class="btn btn-sm btn-primary"> Task closed</button>
                                        
                                    <?php elseif(Session::get('level_id')=='1'): ?>
                                        <button type="button" id="close" value="<?php echo e($details[0]->task_id); ?>"
                                                title="At least one comment/reply before close the task"
                                                class="btn btn-sm btn-primary"> Close Task
                                        </button>
                                    <?php endif; ?>

                                    
                                    <?php if(Session::get('level_id')!='1' && $details[0]->status!="C"): ?>
                                        <?php if($details[0]->send_back_by==session('user_id') && $details[0]->send_back_status != "R"): ?>
                                            <?php
                                                $sts = "Send Back Requested";$color="primary";
                                                if($details[0]->send_back_status == "R"){ $sts = "Send Back Rejected";$color="danger";}
                                                elseif ($details[0]->send_back_status == "A"){ $sts = "Send Back Approved";$color="success";}
                                            ?>
                                            <button type="button" disabled class="btn btn-sm btn-<?php echo e($color); ?>"><?php echo e($sts); ?>

                                            </button>
                                        <?php else: ?>
                                            <button type="button" id="send_back" value="<?php echo e($details[0]->task_id); ?>_<?php echo e($details[0]->map_id); ?>"
                                                title="At least one comment/reply before close the task"
                                                class="btn btn-sm btn-primary"> Send Back
                                            </button>
                                        <?php endif; ?>
                                    <?php endif; ?>
                                    <a href="<?php echo e(route("task-history", ['task_id'=>urlencode(base64_encode($details[0]->task_id))])); ?>">
                                        <button type="button" id="history" class="btn btn-sm btn-warning">Log
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-7 col-lg-7">
            <?php if($details['dept_section_officer']): ?>
            <div class="card">
                <div class="card-body">
                    <div class="text-muted">
                        <h6 class="mb-3 text-uppercase">Task Assigned user / कार्य आवंटित उपयोगकर्ता</h6>
                        <div class="pt-2 border-top border-top-dashed mt-1">
                            <table class="table table-bordered">
                                <thead style="line-height:3px">
                                    <tr>
                                        <th>S.No.</th>
                                        <th>Name</th>
                                        <th>Office</th>
                                        <th>Task Viewed</th>
                                    </tr>
                                </thead>
                           <?php $__currentLoopData = $details['dept_section_officer']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $officer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php
                                    $cls= "text-danger";
                                    $sts_v = "No";
                                    if($officer->is_viewed==1){
                                        $cls= "text-success";
                                        $sts_v = "Yes";
                                    }
                                ?>
                                <tr style="line-height:1px">
                                    <td><?php echo e($loop->index+1); ?></td>
                                    <td><?php echo e($officer->full_name); ?></td>
                                    <td><?php echo e($officer->department_eng); ?></td>
                                    <td class="<?php echo e($cls); ?>"><b><?php echo e($sts_v); ?></b></td>
                                </tr>
                           <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-body">
                    <div class="text-muted">
                        <h6 class="mb-3 text-uppercase">Description / विवरण</h6>
                        <div class="pt-2 border-top border-top-dashed mt-1">
                            <p><?php echo e($details[0]->description); ?></p>
                        </div>
                    </div>
                </div>
            </div>

            <?php if($details[0]->ref_docs!=NULL): ?>
                <div class="card">
                    <div class="card-body">
                        <div class="text-muted">
                            <h6 class="mb-3 text-uppercase">Reference Document <small>/ संबन्धित फ़ाइल</small></h6>
                            <div class="pt-2 border-top border-top-dashed mt-1">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>S.No.</th>
                                            <th>Type</th>
                                            <th>Reference No.<br>/Issue Date/Recei. Date</th>
                                            
                                            <th>Issuer</th>
                                            <th>File</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php $__empty_1 = true; $__currentLoopData = $details['ref_docs']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $file): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                            <tr>
                                                <td><?php echo e($index + 1); ?> </td>
                                                <td><?php echo e($file->name_en); ?> <br>(<?php echo e($file->name_hi); ?>)</td>
                                                <td><?php echo e($file->reference_no); ?>

                                                    <small><br>Issue
                                                        Date: <?php echo e(date('d M,Y',strtotime($file->issue_date))); ?>

                                                        <br> Receiving
                                                        Date: <?php echo e(date('d M,Y',strtotime($file->receiving_date))); ?>

                                                    </small>
                                                </td>
                                                <td><?php echo e($file->issuer_name ?? 'N/A'); ?></td>
                                                <td>
                                                    <?php
                                                        $file_path= asset('uploads/' . $file->path);
                                                        if (config('app.env')=='production') {
                                                            $file_path =  config('custom.file_point').$file->path;
                                                        }
                                                    ?>
                                                    <button type="button" data-file="<?php echo e(basename($file->filename)); ?>" data-src="<?php echo e($file_path); ?>"  data-type="<?php echo e(pathinfo($file->path, PATHINFO_EXTENSION)); ?>" class="btn btn-sm btn-outline-info file-preview-icon">
                                                        <i class="bx bx-file"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                            <tr>
                                                <td colspan="8" class="text-center">No documents found.</td>
                                            </tr>
                                        <?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if($details[0]->has_file=="Y"): ?>
                <div class="card">
                    <div class="card-body">
                        <div class="text-muted">
                            <h6 class="mb-3 text-uppercase">Supporting Document / सहायक दस्तावेज़</h6>
                            <div class="row">
                            <?php $__currentLoopData = $details['files']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="col-xxl-2 col-lg-4">
                                    <div class="border rounded border-dashed mt-1 p-2">
                                        <div class="d-flex align-items-center">
                                            <div class="flex-grow-1 overflow-hidden">
                                                <h5 class="fs-13 mb-1">
                                                    <?php
                                                        $file_path= asset('uploads/' . $value->file);
                                                        if (config('app.env')=='production') {
                                                            $file_path =  config('custom.file_point').$value->file;
                                                        }
                                                    ?>
                                                    <button type="button" data-file="<?php echo e(basename($value->file_name)); ?>" data-src="<?php echo e($file_path); ?>"  data-type="<?php echo e(pathinfo($value->file, PATHINFO_EXTENSION)); ?>" class="btn btn-sm btn-outline-info file-preview-icon">
                                                        <i class="bx bx-file"></i>
                                                    </button>
                                                </h5>
                                                <div><?php echo e(number_format(($value->file_size/1024)/1024,2)); ?>MB
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <!-- end col -->
                            </div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
            <?php if($details[0]->status=="C"): ?>
                <div class="card">
                    <div class="card-body">
                        <div class="text-muted">
                            <h6 class="mb-3 text-uppercase">Closing Statement / समापन </h6>
                            <div class="pt-2 border-top border-top-dashed mt-1">
                                <p><?php echo e($details[0]->closed_remark); ?></p>
                                <p>Closing Date: <?php echo e($details[0]->closed_date); ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(Session::get('level_id')=='1' && $details[0]->status!="C"): ?>
            <div class="card" >
                <div class="card-body">
                    <div class="text-muted">
                        <h6 class="mb-3 text-uppercase">Attach More Supporting Document / सहायक दस्तावेज़ जोड़े <span style='color:red;font-size: 16px'>* </span></h6>
                        <form class="mt-4" id="docs_form" enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <input type="hidden" id="task_id" name="task_id" value="<?php echo e($details[0]->task_id); ?>">
                            <div class="row mt-4">
                                <div class="col-8">
                                    <input type="file" name="task_file" id="task_file" required accept="image/*, application/pdf" class="form-control">
                                </div>
                                <div class="col-lg-4 col-md-4">
                                </div>
                                <div>
                                    <?php if(session()->has('success')): ?>
                                        <p style="position: absolute;color:green">  <?php echo e(session('success')); ?></p>
                                    <?php endif; ?>
                                </div>
                                <div class="col-4 mt-4">
                                    <button type="submit" class="btn btn-success">Add</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <?php endif; ?>
        </div>
        <div class="col-xl-5 col-lg-5">
            <div class="card">
                <div class="card-header align-items-center d-flex">
                    <h4 class="card-title mb-0 flex-grow-1 text-uppercase">Comments / टिप्पणियाँ</h4>
                    <div class="flex-shrink-0">
                        <div class="dropdown card-header-dropdown">
                            <a class="text-reset dropdown-btn" href="#" data-bs-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">
                                <span class="text-muted">Recent<i class="mdi mdi-chevron-down ms-1"></i></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="#">Recent</a>
                                <a class="dropdown-item" href="#">Top Rated</a>
                                <a class="dropdown-item" href="#">Previous</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div data-simplebar style="height: 300px; overflow-y: auto" id="replies" class="px-3 mx-n3 mb-2">
                        <div class="d-flex mb-4">
                            
                        </div>
                    </div>
                    <?php if($details[0]->status!="C"): ?>
                        <?php if($details[0]->send_back_by==session('user_id') && $details[0]->send_back_status != "R"): ?>
                        <?php else: ?>
                        <form class="mt-4" id="reply_form" enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <div class="row g-3">
                                <div class="col-12">
                                    <label for="exampleFormC""ontrolTextarea1" class="form-label text-body">Add
                                    Comment</label>
                                    <input type="hidden" id="task_id" name="fk_task_id"
                                           value="<?php echo e($details[0]->task_id); ?>">
                                    <textarea class="form-control bg-light border-light" name="reply" required
                                              id="exampleFormControlTextarea1" rows="3"
                                              placeholder="Enter your comment here..."></textarea>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-8">
                                    <input type="file" name="reply_file" id="reply_file"
                                            accept="image/*, application/pdf" class="form-control">
                                    <p id="reply_msg" style="position: absolute;color:green"></p>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="form-group">
                                        <div id="filePreviewContainer" class="file-preview"></div>
                                    </div>
                                </div>
                                <div class="col-4 mt-4">
                                    
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                        </form>
                        <?php endif; ?>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
    <script src="<?php echo e(asset('assets/libs/list.js/list.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/libs/list.pagination.js/list.pagination.min.js')); ?>"></script>
    <?php echo $__env->make('tasks.overview_js', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/tasks/overview.blade.php ENDPATH**/ ?>