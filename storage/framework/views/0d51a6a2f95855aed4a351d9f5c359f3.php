    <?php $__env->startSection('styles'); ?>
        <style>
            #printableDiv {
                padding: 30px 6rem 30px 6rem;
            }

            .signatory {
                margin-top: 2rem;
            }

            p {
                line-height: 1.5;
            }

            .lh {
                line-height: 1.5;
            }

            .sandarbh ol {
                padding-left: 5rem;
            }

            #printableDiv hr {
                margin-top: 0px;
                border-top: 4px solid #000000;
            }

            @media print {
                body {
                    padding: 30px 6rem 30px 6rem !important;
                }

                .header-text * {
                    font-size: 17px;
                }

                .body-text * {
                    font-size: 16px;
                }

                #printableDiv hr {
                    margin-top: 0px;
                    border-top: 4px solid #000000;
                }
            }

            hr {
                margin-bottom: 0px;
            }

            #printableDiv #address {
                float: right;
                margin-right: 7rem;
            }

            .header-text * {
                font-size: 17px;
            }

            .body-text * {
                font-size: 16px;
            }

            @media(max-width: 767px) {
                #printableDiv {
                    padding: 0px;
                }

                #printableDiv h3 {
                    font-size: 10px;
                }

                #printableDiv h4 {
                    font-size: 9px;
                }

                #printableDiv h6 {
                    font-size: 8px;
                }

                #printableDiv small {
                    font-size: 4px;
                }

                #printableDiv hr {
                    margin-top: 0px;
                    border-top: 2px solid #000000;
                }

                #printableDiv span {
                    font-size: 4px;
                }

                #printableDiv #address {
                    float: right;
                    margin-right: 1rem;
                    margin-top: 13px;
                }

                #printableDiv .mt-3 {
                    margin-top: -5px !important;
                }

                #printableDiv p,
                #printableDiv div.fw-bold,
                #printableDiv .sandarbh ol li,
                #printableDiv .lh div {
                    font-size: 5px;
                }

                #printableDiv h3,
                #printableDiv h4,
                #printableDiv h6 {
                    line-height: 0.5;
                }

                #printableDiv h6 {
                    margin-bottom: -7px !important;
                }

                #printableDiv .header {
                    margin-top: -10px !important;
                }

                #printableDiv #prati {
                    margin-top: -15px !important;
                }

                #printableDiv .ml-5 {
                    margin-left: 10px !important;
                }

                #printableDiv .mt-3#subject {
                    margin-top: -5px !important;
                }

                #printableDiv .sandarbh ol {
                    padding-left: 20px !important;
                }

                #printableDiv .signatory {
                    margin-top: 0rem;
                }
            }
        </style>
<?php $__env->stopSection(); ?>

    <?php $__env->startSection('content'); ?>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row" id="blockUI">
                    <div class="col-md-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <?php if(@$letterDetail && $letterDetail): ?>
                                    <div id="printableDiv">
                                        <div class="text-center header-text">
                                            <?php echo $letterDetail->header; ?>

                                        </div>
                                        <hr style="">
                                        <div class="mt-0 header body-text">
                                            <span class="normal-text">क्रमांक / <?php echo $letterDetail->aavak_no
                                                ? $letterDetail->aavak_no
                                                : '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?> / मबावि / सा.वि. /
                                                2024-25</span>

                                            <span id="address" class="normal-text">नवा रायपुर, अटल नगर, दिनांक
                                                <?php echo strtotime($letterDetail->aavak_date) > 0 ? date('d-m-Y', strtotime($letterDetail->aavak_date)) : ''; ?></span>
                                        </div>

                                        <div class="mt-3 body-text" id="prati">
                                            <span class="normal-text">प्रति,</span>
                                            <div class="ml-5 normal-text"><?php echo $letterDetail->letter_for; ?></div>
                                        </div>

                                        <div class="mt-3 body-text" id="#subject">
                                            <div class="fw-bold normal-text">विषय:- <?php echo $letterDetail->subject; ?></div>
                                        </div>

                                        <?php if($letterDetail->sandarbh): ?>
                                            <div class="mt-3 sandarbh body-text">
                                                <span class="normal-text">सन्दर्भ:-</span>
                                                <span><?php echo $letterDetail->sandarbh; ?></span>
                                            </div>
                                        <?php endif; ?>

                                        <div class="mt-3 body-text">
                                            <div class="text-justify"><?php echo $letterDetail->main_content; ?></div>
                                        </div>

                                        <table width="100%" class="signatory body-text">
                                            <tbody>
                                                <tr>
                                                    <td colspan="3" width="75%"></td>
                                                    <td width="25%" class="text-center">
                                                        <div class="fw-bold normal-text">(<?php echo e($letterDetail->officer_name); ?>)
                                                            <br>
                                                            <?php echo e($letterDetail->signatory_name); ?>

                                                        </div>
                                                        <span class="normal-text">महिला एवं बाल विकास विभाग <br>नवा रायपुर,
                                                            छत्तीसगढ़</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <div class="mt-3 body-text">
                                            <span class="normal-text">क्रमांक / <?php echo $letterDetail->prishthiy_no
                                                ? $letterDetail->prishthiy_no
                                                : '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; ?> / मबावि / सा.वि. /
                                                2024-25 नवा
                                                रायपुर,
                                                अटल
                                                नगर, दिनांक
                                                <?php echo e(strtotime($letterDetail->prishthiy_date) > 0 ? date('d-m-Y', strtotime($letterDetail->prishthiy_date)) : ''); ?></span>
                                        </div>

                                        <?php if($letterDetail->pratilipi): ?>
                                            <div class="mt-3 lh body-text">
                                                <div class="fw-bold normal-text">प्रतिलिपि:-</div>
                                                <div class="ml-5"><?php echo $letterDetail->pratilipi; ?></div>
                                            </div>
                                        <?php endif; ?>

                                        <table width="100%" class="signatory body-text">
                                            <tbody>
                                                <tr>
                                                    <td colspan="3" width="75%"></td>
                                                    <td width="25%" class="text-center">
                                                        <div class="fw-bold normal-text"><?php echo e($letterDetail->signatory_name); ?>

                                                        </div>
                                                        <span class="normal-text">महिला एवं बाल विकास विभाग <br>नवा रायपुर,
                                                            छत्तीसगढ़</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="text-center">
                                        <a href="<?php echo e(url('create-letter/'.$letterDetail->id.'?from=invoice')); ?>" class=" btn btn-info btn-sm mt-3 text-center normal-text mr-3"><i class="mdi mdi-pencil"></i>
                                            Edit</a>

                                        <button type="button" class=" btn btn-primary btn-sm mt-3 text-center normal-text"
                                            onclick="printDiv('printableDiv')"><i class="mdi mdi-printer"></i>
                                            Print</button>

                                        <button type="button"
                                            class="btn btn-success btn-sm mt-3 ml-3 text-center normal-text"
                                            onclick="exportToWord('printableDiv')">
                                            <i class="mdi mdi-file-document"></i> Export to Word
                                        </button>
                                    </div>
                                <?php else: ?>
                                    <h4 class="normal-text">कोई जानकारी प्राप्त नहीं हुई</h4>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->

        </div>
        <!-- main-panel ends -->
    <?php $__env->stopSection(); ?>

    <?php $__env->startSection('scripts'); ?>
        <script src="<?php echo e(asset('assets/libs/ckeditor/ckeditor.js')); ?>"></script>
        <script src="<?php echo e(asset('assets/js/jquery.blockUI.js')); ?>"></script>
        <script>
            function printDiv(divName) {
                // document.getElementById("head-lines").style.visibility = "visible";
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;
                document.body.innerHTML = printContents;
                window.print();
                document.body.innerHTML = originalContents;

            }


            function exportToWord(divName) {
                var html = document.getElementById(divName).innerHTML;
                var blob = new Blob(['\uFEFF',
                    '<html xmlns:w="urn:schemas-microsoft-com:office:word">' +
                    '<head>' +
                    '<meta charset="UTF-8">' +
                    '<style>' +
                    'body { font-family: "KrutiDev", Arial, sans-serif; }' +
                    'h3, h4, h6 { text-align:center; }' +
                    'p { font-size: 16px; }' +
                    '.normal-text { font-size: 14px; }' +
                    '@font-face {' +
                    'font-family: "KrutiDev";' +
                    'src: url("/assets/fonts/KRDEV010.TTF") format("truetype");' +
                    '}' +
                    '</style>' +
                    '</head>' +
                    '<body>' + html + '</body></html>'
                ], {
                    type: 'application/msword'
                });
                saveAs(blob, 'document.doc');
            }
        </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.layout_admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\wamp64\www\php\vectreProjects\tlmis\resources\views\letters\view_letter.blade.php ENDPATH**/ ?>