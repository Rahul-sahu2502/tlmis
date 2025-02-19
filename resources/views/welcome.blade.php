<!doctype html>
<html lang=en data-layout=horizontal data-topbar=dark data-sidebar-size=lg data-sidebar=light data-sidebar-image=none data-preloader=disable>

<head>
    <meta charset=utf-8 />
    <title>TLMIS - Task and Review Management Sytem for Government Offices</title>
    <meta name=viewport content="width=device-width, initial-scale=1.0">
    <meta content="Task Management and Review System" name=description />
    <meta content=Vectre name=author />
    <link rel="shortcut icon" href="{{asset('assets/images/favicon.ico')}}">
    <link href="{{asset('assets/libs/swiper/swiper-bundle.min.css')}}" rel="stylesheet" type="text/css" />
    <script src="{{asset('assets/js/layout.js')}}"></script>
    <link href="{{asset('assets/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/css/icons.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/css/app.min.css')}}" rel="stylesheet" type="text/css" />
    <style>
        .txt-color{
            color: rgb(244 255 0)!important;
        }
        .btn-primary,.bg-primary{
           background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%)
        }
        .auth-one-bg-position{
            top: 70px;
        }
        .hero-section{
            background:none;
        }
        .auth-one-bg .bg-overlay{
            background: linear-gradient(to top, #6815cd, #538eff);
            opacity: .9;
        }
        #features{
            padding: 20px;
        }
    </style>
</head>

<body data-bs-spy=scroll data-bs-target=#navbar-example>
    <div class="layout-wrapper landing">
        <nav class="navbar navbar-expand-lg navbar-landing fixed-top" id=navbar>
            <div class=container>
                <a class=navbar-brand href="/">
                    <img src=assets/images/logo-dark.png class="card-logo card-logo-dark" alt="TLMIS logo dark" height=30>
                    <img src=assets/images/logo-light.png class="card-logo card-logo-light" alt="TLMIS logo light" height=30>
                </a>
                <button class="navbar-toggler py-0 fs-20 text-body" type=button data-bs-toggle=collapse data-bs-target=#navbarSupportedContent aria-controls=navbarSupportedContent aria-expanded=false aria-label="Toggle navigation">
                    <i class="mdi mdi-menu"></i>
                </button>
                <div class="collapse navbar-collapse" id=navbarSupportedContent>
                    <ul class="navbar-nav ms-auto mt-2 mt-lg-0" id=navbar-example>
                        <li class=nav-item>
                            <a class="nav-link fs-15 fw-semibold active" href=#hero>Home</a>
                        </li>
                        <li class=nav-item>
                            <a class="nav-link fs-15 fw-semibold" href=#features>Features</a>
                        </li>
                    </ul>
                    <div class="ms-lg-3">
                        <a href="{{ route('sign-in') }}" class="btn btn-primary">Sign in</a>
                    </div>
                </div>
            </div>
        </nav>
        <div class=vertical-overlay data-bs-toggle=collapse data-bs-target=#navbarSupportedContent.show></div>
        <div class="auth-one-bg-position auth-one-bg pt-lg-5" id=auth-particles>
            <div class=bg-overlay></div>
            <div class=shape>
                <svg xmlns=http://www.w3.org/2000/svg version=1.1 xmlns:xlink=http://www.w3.org/1999/xlink
                    viewBox="0 0 1440 120">
                    <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                </svg>
            </div>
        </div>
        <section class="section pb-5 hero-section" id=hero>
            <div class=container>
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-sm-10">
                        <div class="text-center mt-lg-5 pt-5">
                            <h1 class="display-6 fw-bold mb-3 lh-base text-white">The better way to manage your office <span class="text-black txt-color">Files</span> and <span class="text-black txt-color">Tasks </span></h1>
                            <p class="lead text-white">TLMIS is a fully user friendly web application designed keeping government offices workflow in mind that helps you manage files and review tasks.</p>
                            {{-- <div class="d-flex gap-2 justify-content-center mt-4">
                                <a href=auth-signup-basic.html class="btn btn-primary">Get Started <i class="ri-arrow-right-line align-middle ms-1"></i></a>
                            </div> --}}
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class=section id=features>
            <div class=container>
                <div class="row justify-content-center">
                    <div class=col-lg-8>
                        <div class="text-center mb-5">
                            <h1 class="mb-3 ff-secondary fw-bold lh-base">Powerful Features</h1>
                            <p class=text-muted>Manage Tasks and Reviews with Ease</p>
                        </div>
                    </div>
                </div>
                <div class="row g-3">
                <div class=col-lg-4>
                        <div class="d-flex p-3">
                            <div class="flex-shrink-0 me-3">

                            <animated-icons
                                src="{{asset('assets/images/icon-1.json')}}"
                                trigger="loop"
                                attributes='{"variationThumbColour":"#536DFE","variationName":"Two Tone","variationNumber":2,"numberOfGroups":2,"backgroundIsGroup":false,"strokeWidth":1,"defaultColours":{"group-1":"#000000","group-2":"#536DFE","background":"#FFFFFF"}}'
                                height="100"
                                width="100"
                                ></animated-icons>
                            </div>
                            <div class=flex-grow-1>
                                <h5 class=fs-18>File Management</h5>
                                <p class="text-muted my-3">All your work files organized in one place with ease of access, categorised with linked tasks and departments</p>
                            </div>
                        </div>
                    </div>
                    <div class=col-lg-4>
                        <div class="d-flex p-3">
                            <div class="flex-shrink-0 me-3">
                            <animated-icons
                                src="{{asset('assets/images/icon-2.json')}}"
                                trigger="loop"
                                attributes='{"variationThumbColour":"#536DFE","variationName":"Two Tone","variationNumber":2,"numberOfGroups":2,"backgroundIsGroup":false,"strokeWidth":1,"defaultColours":{"group-1":"#000000","group-2":"#536DFE","background":"#FFFFFF"}}'
                                height="100"
                                width="100"
                                ></animated-icons>
                            </div>
                            <div class=flex-grow-1>
                                <h5 class=fs-18>Task Management</h5>
                                <p class="text-muted my-3">Assign and Manage tasks with a single click of multiple offices at once.</p>
                            </div>
                        </div>
                    </div>
                    <div class=col-lg-4>
                        <div class="d-flex p-3">
                            <div class="flex-shrink-0 me-3">
                            <animated-icons
                                src="{{asset('assets/images/icon-3.json')}}"
                                trigger="loop"
                                attributes='{"variationThumbColour":"#536DFE","variationName":"Two Tone","variationNumber":2,"numberOfGroups":2,"backgroundIsGroup":false,"strokeWidth":1.5,"defaultColours":{"group-1":"#000000","group-2":"#536DFE","background":"#FFFFFF"}}'
                                height="100"
                                width="100"
                                ></animated-icons>
                            </div>
                            <div class=flex-grow-1>
                                <h5 class=fs-18>Review Management</h5>
                                <p class="text-muted my-3">Manage your weekly reviews with tasks status and their progress.</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <section class="py-5 position-relative bg-light">
            <div class=container>
                <div class="row text-center gy-4">
                    <div class="col-lg-3 col-6">
                        <div>
                            <h2 class=mb-2><span class=counter-value data-target=10>0</span>+</h2>
                            <div class=text-muted>Onboarded Offices</div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div>
                            <h2 class=mb-2><span class=counter-value data-target=24>0</span>K</h2>
                            <div class=text-muted>Files Managed</div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div>
                            <h2 class=mb-2><span class=counter-value data-target=1000>0</span></h2>
                            <div class=text-muted>Tasks per Week</div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div>
                            <h2 class=mb-2><span class=counter-value data-target=300>0</span>+</h2>
                            <div class=text-muted>Hours Saved</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="py-5 bg-primary position-relative">
            <div class=container>
                <div class="row align-items-center gy-4">
                    <div class=col-sm>
                        <div>
                            <h4 class="text-white mb-0 fw-semibold">Automate your office workflow today</h4>
                        </div>
                    </div>
                    <div class=col-sm-auto>
                        <div>
                            <a href="mailto:contact@vectre.in" target=_blank class="btn btn-lg bg-gradient btn-danger"><i class="ri-phone-line align-middle me-1"></i> Enquire For Demo</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="custom-footer bg-dark py-1 position-relative" id="contact">
            <div class=container>
                <div class="row text-center text-sm-start align-items-center mt-1">
                    <div class=col-sm-6>
                        <div>
                            <p class="copy-rights mb-0">
                                <script>
                                    document.write(new Date().getFullYear());
                                </script> © TLMIS
                            </p>
                        </div>
                    </div>
                    <div class=col-sm-6>
                        <div class="text-sm-end mt-3 mt-sm-0">
                            <ul class="list-inline mb-0 footer-social-link">
                                <li class=list-inline-item>
                                    Design & Developed by <a href=https://vectre.in target=_blank class=text-white>Vectre Consultancy Pvt Ltd</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <button onclick=topFunction() class="btn btn-danger btn-icon landing-back-top" id=back-to-top>
            <i class=ri-arrow-up-line></i>
        </button>
    </div>
    <script src="{{asset('assets/libs/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{asset('assets/libs/simplebar/simplebar.min.js')}}"></script>
    <script src="{{asset('assets/libs/node-waves/waves.min.js')}}"></script>
    <script src="{{asset('assets/libs/feather-icons/feather.min.js')}}"></script>
    <script src="{{asset('assets/js/pages/plugins/lord-icon-2.1.0.js')}}"></script>
    <script src="{{asset('assets/libs/swiper/swiper-bundle.min.js')}}"></script>
    <script src="{{asset('assets/js/pages/landing.init.js')}}"></script>
    <script src="https://animatedicons.co/scripts/embed-animated-icons.js"></script>
</body>

</html>
