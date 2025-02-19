<!doctype html>
<html lang=en data-layout=vertical data-topbar=light data-sidebar-size=lg data-sidebar=dark data-sidebar-image=none
    data-bs-theme=light data-layout-width=fluid data-layout-position=fixed data-layout-style=default
    data-sidebar-visibility=show>

<head>
    @include('layouts.partials.header')
    @yield('styles')
</head>

<body>
    <div id=layout-wrapper>
        @include('layouts.partials.menu')
        <div class=main-content>
            <div class=page-content>
                <div class=container-fluid>
                    <div class=row>
                        <div class=col-12>
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class=mb-sm-0><a href="{{ route('dashboard') }}"
                                        class="btn btn-outline-primary btn-xs"> <i class="ri-home-3-fill"></i> </a>
                                    {{ __('word.' . strtolower($page_title)) }}</h4>
                                <div class=page-title-right>
                                    <ol class="breadcrumb m-0">
                                        @if ($page_title != 'Dashboard')
                                            <li class="breadcrumb-item active"><a href="{{ URL::previous() }}"
                                                    class="btn btn-outline-primary btn-xs"><i
                                                        class="ri-arrow-left-line"></i> {{ __('word.back') }}</a></li>
                                        @endif
                                    </ol>
                                </div>
                            </div>
                        </div>
                        @yield('content')
                    </div>
                </div>
                <footer class=footer>
                    <div class=container-fluid>
                        <div class=row>
                            @include('layouts.partials.copy')
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        @include('layouts.partials.footer_admin')
        @yield('scripts')
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
