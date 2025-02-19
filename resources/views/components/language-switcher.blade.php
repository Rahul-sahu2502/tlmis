@php
$currentLocale = app()->getLocale();
$sessionLocale = session()->get('locale');
$configLocale = config('app.locale');
@endphp

<div class="language-switcher">
    <!-- Debug Info -->
    {{-- <div style="font-size: 12px; margin-bottom: 5px; color: #666;">
        App Locale: {{ $currentLocale }}<br>
        Session Locale: {{ $sessionLocale }}<br>
        Config Locale: {{ $configLocale }}
    </div> --}}

    <a href="{{ url('language/en') }}"
       style="{{ $currentLocale === 'en' ? 'font-weight: bold;' : '' }}">
        English
    </a>
    |
    <a href="{{ url('language/hi') }}"
       style="{{ $currentLocale === 'hi' ? 'font-weight: bold;' : '' }}">
        हिंदी
    </a>
</div>

<style>
.language-switcher {
    /* position: fixed; */
    /* top: 20px;
    right: 20px; */
    /* background: white; */
    padding: 10px;
    border-radius: 4px;
    /* box-shadow: 0 2px 4px rgba(0,0,0,0.1); */
    z-index: 1000;
}
.language-switcher a {
    text-decoration: none;
    padding: 5px;
    color: #4a5568;
}
</style>
