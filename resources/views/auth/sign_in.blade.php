@extends('layouts.layout_auth')
@section('styles')
@endsection
@section('content')
<div class="col-lg-6">
    <div class="card mt-4">
        <div class="card-body p-4">
            <div class="text-center mt-2">
                <h5 class=text-primary>{{ __('word.login_title') }}!</h5>
                <p class=text-muted>{{ __('word.login_sub_title') }}</p>
            </div>
            <div class="p-2 mt-4">
                @if (Session::has('success_message'))
                <div class="alert alert-success">
                    {{ Session::get('success_message') }}
                </div>
                @endif

                @if (Session::has('error_message'))
                <div class="alert alert-danger">
                    {{ Session::get('error_message') }}
                </div>
                @endif
                <form action="{{ route('validate-login') }}" id="frm_signin" method=post>
                    @csrf
                    @if ($errors->any())
                    <div class="alert alert-danger alert-dismissible fade show d-flex align-items-center mb-2"
                        role="alert">
                        <i data-feather="alert-octagon" class="w-6 h-6 me-2">
                        </i> {!! implode('', $errors->all('<div>:message</div>')) !!}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
                            <i data-feather="x" class="w-4 h-4"></i>
                        </button>
                    </div>
                    @endif
                    <div class=mb-3>
                        <label for=username class=form-label>{{ __('word.username') }}</label>
                        <input type=text class=form-control name="username" id=username placeholder="{{ __('word.enter_username') }}"
                            required="" autofocus>
                        <span class="error"></span>
                    </div>
                    <div class=mb-3>
                        <div class=float-end>
                            <a href="{{ route('forgot-password') }}" class=text-muted>{{ __('word.forgot_password') }}</a>
                        </div>
                        <label class=form-label for=password-input>{{ __('word.password') }}</label>
                        <div class="position-relative auth-pass-inputgroup mb-3">
                            <input type=password class="form-control pe-5 password-input" placeholder="{{ __('word.enter_password') }}"
                                name="password" id=password-input required="">
                            <button
                                class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon"
                                type=button id=password-addon><i class="ri-eye-fill align-middle"></i></button>
                            <span class="error"></span>
                        </div>
                    </div>
                    <div class=mb-3>
                        <label class=form-label for=captcha-input>Captcha</label>
                        <div class="d-flex align-items-center justify-content-center cap-pass-input-group mb-3">
                            <p class="svg-img captcha m-0">
                                <span>
                                    <img src="{{ route('generate-captcha', ['length' => 4]) }}"
                                        style="border-radius:7px" alt="CAPTCHA" id="captcha-image">

                                </span>
                            </p>
                            <span class="btn btn-md btn-primary reload-captcha m-1" onclick="refreshCaptcha()"
                                style="cursor: pointer;">
                                <i class="ri-refresh-line align-middle"></i>
                            </span>
                            <input type="text" id="captcha-input" name="captcha"
                                class="form-control flex-grow-1 float-end" placeholder="Enter CAPTCHA" minlength="4"
                                maxlength="4" required="">
                            <span class="error"></span>
                        </div>
                    </div>
                    <div class=form-check>
                        <input class=form-check-input type=checkbox name="remember" id=auth-remember-check>
                        <label class=form-check-label for=auth-remember-check>{{ __('word.remember_me') }}</label>
                    </div>
                    {{-- <span id="error_msg"></span> --}}
                    <div class=mt-4>
                        <button class="btn btn-success w-100" type=button id="btn_signin">{{ __('word.login_button') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="alert alert-warning alert-border-left alert-dismissible fade" role="alert">
        <i class="ri-alert-line me-3 align-middle"></i>
        <strong>Warning</strong> - <span id="error_msg"></span>
        {{-- <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button> --}}
    </div>
    <div class="m-4 text-center">
        <p class=mb-0>Don't have an account ? <a href="{{ route('sign-up') }}"
                class="fw-semibold text-primary text-decoration-underline">
                Signup </a></p>
    </div>
</div>
@endsection
@section('scripts')
<script src="{{ asset('assets/js/custom/sha512.js') }}"></script>
<script>
    function validateInputs() {
        $(".alert").removeClass("show");
        $("#error_msg").html('');
        const username = $('#username').val().trim();
        const password = $('#password-input').val().trim();
        const captcha = $('#captcha-input').val().trim();
        if (!username) {
            // fireAlert('Username is required', 'username');
            $("#error_msg").html('Username is required');
            $(".alert").addClass("show");
            return false;
        }
        if (!password) {
            // fireAlert('Password is required', 'password');
            $("#error_msg").html('Password is required');
            $(".alert").addClass("show");
            return false;
        }
        if (!captcha) {
            // fireAlert('Captcha is required', 'captcha');
            $("#error_msg").html('Captcha is required');
            $(".alert").addClass("show");
            return false;
        }
        return true;
    }

    function fireAlert(message, inputId) {
        SwalWithCustomSettings.fire({
            html: `<div class="mt-3">
                <lord-icon src="https://cdn.lordicon.com/tdrtiskw.json"
                           trigger="loop"
                           colors="primary:#f06548,secondary:#f7b84b"
                           style="width:120px;height:120px"></lord-icon>
                <div class="mt-4 pt-2 fs-15">
                    <h4>Oops...! Something went Wrong!</h4>
                    <p class="text-muted mx-4 mb-0">${message}</p>
                </div>
               </div>`,
            showCancelButton: true,
            showConfirmButton: false,
            customClass: {
                cancelButton: "btn btn-primary w-xs mb-1"
            },
            cancelButtonText: "Dismiss",
            buttonsStyling: false,
            showCloseButton: true,
        });

        const inputElement = document.getElementById(inputId);
        if (inputElement) {
            inputElement.classList.add('input-error'); // Add a CSS class to style the error
            inputElement.focus(); // Focus on the empty input
        } else {
            SwalWithCustomSettings.fire({
                html: '<div class="mt-3"><lord-icon src="https://cdn.lordicon.com/lupuorrc.json" trigger="loop" colors="primary:#0ab39c,secondary:#405189" style="width:120px;height:120px"></lord-icon><div class="mt-4 pt-2 fs-15"><h4>Well done !</h4><p class="text-muted mx-4 mb-0">Aww yeah, you successfully read this important message.</p></div></div>',
                showCancelButton: !0,
                showConfirmButton: !1,
                customClass: {
                    cancelButton: "btn btn-primary w-xs mb-1"
                },
                cancelButtonText: "Back",
                buttonsStyling: !1,
                showCloseButton: !0,
            });
        }
    }

    function refreshCaptcha() {
        const captchaImage = document.getElementById('captcha-image');
        fetch("{{ route('generate-captcha', ['length' => 4]) }}")
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.blob(); // Return the response as a blob
            })
            .then(blob => {
                const url = URL.createObjectURL(blob); // Create an object URL for the image
                captchaImage.src = url; // Set the image source to the blob URL
            })
            .catch(error => console.error('Error refreshing CAPTCHA:', error));
    }

    $(jQuery).ready(function() {

        function login_submit() {
            if (validateInputs()) {
                let password = $('#password-input').val();
                if (password) {
                    const encryptionKey = '{{ Config::get('
                    salt.STATIC_SALT ') }}';
                    let securePwd = encryptionKey + password + encryptionKey;
                    let shaObj = new jsSHA("SHA-512", "TEXT");
                    shaObj.update(securePwd);
                    let hash = shaObj.getHash("HEX");
                    $('#password-input').val(hash);
                    $("#frm_signin").submit();
                }
            }
        }
        $('#btn_signin').click(function(e) {
            e.preventDefault();
            login_submit();
        });
        $('#frm_signin').keypress((e) => {
            // Enter key corresponds to number 13
            if (e.which === 13) {
                login_submit();
                console.log('form submitted');
            }
        });
    });
</script>
@endsection