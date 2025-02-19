@extends('layouts.layout_admin')
@section('styles')
@endsection
@section('content')
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row" id="blockUI">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title normal-text">Create Letter</h4>
                            <hr>
                            <form class="forms-sample" id="letterForm">
                                @csrf
                                <input type="hidden" id="id" name="id"
                                       value="{{ @$editItem->id && $editItem->id ? $editItem->id : 0 }}">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="" class="normal-text">आवक/जावक क्र.</label>
                                            <input type="text" class="form-control" id="aavak_no" name="aavak_no"
                                                   value="{{ @$editItem->aavak_no }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="" class="normal-text">आवक/जावक दिनांक</label>
                                            <input type="date" class="form-control normal-text" id="aavak_date"
                                                   name="aavak_date"
                                                   value="{{ @$editItem->aavak_date && strtotime($editItem->aavak_date) ? @$editItem->aavak_date : '' }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="" class="normal-text">पृष्ठीय क्र.</label>
                                            <input type="text" class="form-control" id="prishthiy_no"
                                                   name="prishthiy_no"
                                                   value="{{ @$editItem->prishthiy_no }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="" class="normal-text">पृष्ठीय दिनांक</label>
                                            <input type="date" class="form-control normal-text" id="prishthiy_date"
                                                   name="prishthiy_date"
                                                   value="{{ @$editItem->prishthiy_date && strtotime($editItem->prishthiy_date) ? @$editItem->prishthiy_date : '' }}">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="bank_name" class="normal-text">हेडर:</label>
                                            <select name="header_id" id="header_id" class="form-control">
                                                <option value="">-- चुने --</option>
                                                @if (@$headerList)
                                                    @foreach ($headerList as $value)
                                                        @php
                                                            $sel = (@$editItem->header_id == $value->id) ? 'selected' : '';
                                                        @endphp
                                                        <option
                                                            value="{{ $value->id }}" {{ $sel }}>{{ $value->header_name }}
                                                        </option>
                                                    @endforeach
                                                @endif
                                            </select>
                                            <textarea name="header" id="header" rows="5"
                                                      class="form-control ckeditor">{{ @$editItem->header }}</textarea>
                                            <small class="error"></small>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="bank_name" class="normal-text">प्रति:</label>
                                            <select name="prati_id" id="prati_id" class="form-control">
                                                <option value="">-- चुने --</option>
                                                @if (@$masterPratiList)
                                                    @foreach ($masterPratiList as $value)
                                                        <option value="{{ $value->id }}">{{ $value->designation }}
                                                        </option>
                                                    @endforeach
                                                @endif
                                            </select>
                                            <textarea name="letter_for" id="letter_for" rows="5"
                                                      class="form-control ckeditor">{{ @$editItem->letter_for }}</textarea>
                                            <small class="error"></small>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="subject" class="normal-text">विषय:</label>
                                            <input type="text" class="form-control" id="subject" name="subject"
                                                   placeholder="विषय दर्ज करें" value="{{ @$editItem->subject }}">
                                            <small class="error"></small>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="ifsc_code" class="normal-text">सन्दर्भ:</label>
                                            <textarea name="sandarbh" id="sandarbh" rows="5"
                                                      class="form-control ckeditor normal-text"
                                                      placeholder="सन्दर्भ दर्ज करें">{{ @$editItem->sandarbh }}</textarea>
                                            <small class="error"></small>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="" class="normal-text">मुख्य सामग्री:</label>
                                            <textarea name="main_content" rows="10" id="main_content" cols="6"
                                                      class="form-control ckeditor normal-text"
                                                      placeholder="मुख्य सामग्री दर्ज करें">{{ @$editItem->main_content }}</textarea>
                                            <small class="error"></small>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="" class="normal-text">प्रतिलिपि:</label>
                                            <select name="" id="pratilipi_id" class="form-control">
                                                <option value="">-- चुने --</option>
                                                @if (@$masterPratiList)
                                                    @foreach ($masterPratiList as $value)
                                                        <option value="{{ $value->id }}">{{ $value->designation }}
                                                        </option>
                                                    @endforeach
                                                @endif
                                            </select>
                                            <textarea name="pratilipi" rows="10" id="pratilipi" cols="6"
                                                      class="form-control ckeditor normal-text"
                                                      placeholder="प्रतिलिपि">{{ @$editItem->pratilipi }}</textarea>
                                            <small class="error"></small>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="" class="normal-text">हस्ताक्षरकर्ता:</label>
                                            <select name="signatory" id="signatory" class="form-control normal-text">
                                                <option value="">-- चुनें --</option>
                                                @if (@$signatoryList)
                                                    @foreach ($signatoryList as $value)
                                                        @php
                                                            $sel =
                                                                @$editItem->signatory == $value->id ? 'selected' : '';
                                                        @endphp
                                                        <option value="{{ $value->id }}" {{ $sel }}>
                                                            {{ $value->signatory . ' (' . $value->officer_name . ')' }}
                                                        </option>
                                                    @endforeach
                                                @endif
                                            </select>
                                            <small class="error"></small>
                                        </div>
                                    </div>
                                </div>
                                <button id="startSpeechBtn" class="btn btn-sm btn-primary" type="button"><i
                                        class="bx bx-microphone"></i></button>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="" class="normal-text">Content</label>
                                        <textarea name="complete_content" rows="10" id="complete_content" cols="6"
                                                  class="form-control ckeditor normal-text"
                                                  placeholder=""></textarea>
                                        <small class="error"></small>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-warning mt-4 normal-text" id="unicodetokruti">
                                    Unicode to KrutiDev
                                </button>
                                <button type="button" class="btn btn-info mt-4 normal-text" id="krutitounicode">KrutiDev
                                    to Unicode
                                </button>
                                <button type="submit" class="btn btn-primary mt-4 normal-text">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
    <script src="{{ asset('assets/libs/ckeditor/ckeditor.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.blockUI.js') }}"></script>
    <script src="{{ asset('assets/js/custom/textconvertor.js') }}"></script>
    <script>
        CKEDITOR.replace('complete_content', {
            contentsCss: '/assets/css/custom/ckeditor.css',
            font_names: 'Øqfrnso/krutidev;sans-serif;Arial;Verdana;Trebuchet MS;Apple Color Emoji;Segoe UI Emoji;Segoe UI Symbol',
        })

        $(document).on('submit', '#letterForm', function (e) {
            e.preventDefault();
            $('.is-invalid').removeClass('is-invalid');
            $('.invalid-feedback').removeClass('invalid-feedback').text('');
            var form = new FormData(this);
            $.ajax({
                url: '{{ url("submit-letter-detail") }}',
                type: "POST",
                data: form,
                contentType: false,
                cache: false,
                processData: false,
                dataType: 'json',
                beforeSend: function () {
                    $('#blockUI').block({
                        message: '<h6>Processing...</h6>',
                        css: {
                            border: '1px solid #000'
                        }
                    });
                },
                success: function (response) {
                    if (response.status == 'success') {
                        Swal.fire("Great!", response.msg, "success").then(function () {
                            let from = getQueryParam('from');
                            if (from == 'invoice') {
                                location.href = '{{ url("view-letter/") }}' + response.id;
                            } else {
                                location.href = '{{ url("create-letter") }}';
                            }
                        });
                    } else if (response.status == 'failed') {
                        if (response.msg && $.isEmptyObject(response.errors) == true) {
                            Swal.fire("Sorry!", response.msg, "error");
                        } else {
                            $.each(response.errors, function (index, value) {
                                $('#' + index).addClass('is-invalid');
                                $('#' + index + '~small.error').addClass('invalid-feedback')
                                    .text(value);
                            });
                        }
                    }
                },
                complete: function () {
                    $('#blockUI').unblock();
                },
                error: function (xhr) {
                    console.log(xhr);
                    $('#blockUI').unblock();
                }
            });
        });

        $(document).on('change', '#prati_id', function () {
            let prati_id = $(this).val();
            $.ajax({
                url: '{{ url("get-prati-detail") }}',
                type: "GET",
                data: {
                    prati_id: prati_id
                },
                contentType: false,
                cache: false,
                dataType: 'json',
                beforeSend: function () {
                    $('#blockUI').block({
                        message: '<h6>Processing...</h6>',
                        css: {
                            border: '1px solid #000'
                        }
                    });
                },
                success: function (response) {
                    let html = CKEDITOR.instances['letter_for'].getData();
                    if (response) {
                        html += response.details;
                    }
                    CKEDITOR.instances['letter_for'].setData(html);
                    // $('#letter_for').setData(response.details);
                },
                complete: function () {
                    $('#blockUI').unblock();
                },
                error: function (xhr) {
                    console.log(xhr);
                    $('#blockUI').unblock();
                }
            });
        });

        $(document).on('change', '#header_id', function () {
            let header_id = $(this).val();
            $.ajax({
                url: '{{ url("get-header-detail") }}',
                type: "GET",
                data: {
                    header_id: header_id
                },
                contentType: false,
                cache: false,
                dataType: 'json',
                beforeSend: function () {
                    $('#blockUI').block({
                        message: '<h6>Processing...</h6>',
                        css: {
                            border: '1px solid #000'
                        }
                    });
                },
                success: function (response) {
                    let html = '';
                    if (response) {
                        html = '<strong>' + response.description + '</strong>';
                    }
                    CKEDITOR.instances['header'].setData(html);
                    // $('#letter_for').setData(response.details);
                },
                complete: function () {
                    $('#blockUI').unblock();
                },
                error: function (xhr) {
                    console.log(xhr);
                    $('#blockUI').unblock();
                }
            });
        });

        $(document).on('change', '#pratilipi_id', function () {
            let pratilipi_txt = ($(this).val() != '') ? $(this).find('option:selected').text() : '';

            if (pratilipi_txt) {
                let html = CKEDITOR.instances['pratilipi'].getData();
                if (pratilipi_txt) {
                    html += pratilipi_txt;
                }
                CKEDITOR.instances['pratilipi'].setData(html);
            }


        });

        $(document).on('click', '#unicodetokruti', function () {
            let header = CKEDITOR.instances['header'].getData();
            header = processHtmlUnicodeToKrutiDev(header);
            console.log(header);
        });

        $(document).on('click', '#krutitounicode', function () {
            let header = CKEDITOR.instances['header'].getData();
            header = processHtmlKrutiDevToUnicode(header);
            console.log(header);
        });

        $(document).on("click", "#startSpeechBtn", function () {
            // Check if SpeechRecognition is supported in the browser
            const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;

            if (SpeechRecognition) {
                const recognition = new SpeechRecognition();

                recognition.lang = 'hi-IN'; // Set language for speech recognition
                recognition.interimResults = true; // Show intermediate results while speaking
                recognition.maxAlternatives = 1; // Get the best matching result
                recognition.start();

                // Event when speech is recognized
                recognition.onresult = function (event) {
                    const transcript = event.results[0][0].transcript;
                    let oldData = CKEDITOR.instances['complete_content'].getData()
                    CKEDITOR.instances['complete_content'].setData(oldData + transcript);
                };

                // Event when speech recognition ends
                recognition.onend = function () {
                    console.log('Speech recognition ended');
                };

                // Error handling
                recognition.onerror = function (event) {
                    console.error('Speech recognition error', event.error);
                };
            } else {
                alert('Speech Recognition API is not supported in your browser.');
            }
        });
    </script>
@endsection
