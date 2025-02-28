<?php
$currentLocale = app()->getLocale();
$sessionLocale = session()->get('locale');
$configLocale = config('app.locale');
?>

<div class="language-switcher">
    <!-- Debug Info -->
    

    <a href="<?php echo e(url('language/en')); ?>"
       style="<?php echo e($currentLocale === 'en' ? 'font-weight: bold;' : ''); ?>">
        English
    </a>
    |
    <a href="<?php echo e(url('language/hi')); ?>"
       style="<?php echo e($currentLocale === 'hi' ? 'font-weight: bold;' : ''); ?>">
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
<?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/components/language-switcher.blade.php ENDPATH**/ ?>