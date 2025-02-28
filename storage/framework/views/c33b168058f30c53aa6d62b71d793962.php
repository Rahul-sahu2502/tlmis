<div class="dropdown topbar-head-dropdown ms-1 header-item" id="notificationDropdown">
    <button type="button" class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle"
            id="page-header-notifications-dropdown" data-bs-toggle="dropdown"
            data-bs-auto-close="outside" aria-haspopup="true" aria-expanded="false">
        <i class="bx bx-bell fs-22"></i>
        <span class="position-absolute topbar-badge fs-10 translate-middle badge rounded-pill bg-danger"
              id="unreadCount">
            <?php echo e(\App\Models\tbl_notifications::where('fk_user_id', Session::get('user_id'))
->where('is_read', false)->where('is_removed', false)->count()); ?>

        </span>
    </button>
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
         aria-labelledby="page-header-notifications-dropdown">
        <div class="dropdown-head bg-primary bg-pattern rounded-top">
            <div class="p-3">
                <div class="row align-items-center">
                    <div class="col">
                        <h6 class="m-0 fs-16 fw-semibold text-white">Notifications</h6>
                    </div>
                    <div class="col-auto">
                        <span class="badge bg-light-subtle text-body fs-13" id="totalNotifications">
                            <?php echo e(\App\Models\tbl_notifications::where('fk_user_id', Session::get('user_id'))->where('is_read', false)->where('is_removed', false)->count()); ?>

                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-content position-relative" id="notificationItemsTabContent">
            <div class="tab-pane fade show active py-2 ps-2" id="all-noti-tab" role="tabpanel">
                <div data-simplebar style="max-height: 300px;" class="pe-2">
                    <ul id="notificationsList" class="list-unstyled">
                        <!-- Existing notifications will be dynamically added here -->
                        <?php $__currentLoopData = \App\Models\tbl_notifications::where('fk_user_id', Session::get('user_id'))->where('is_removed', false)->orderBy('is_read', 'asc')->orderBy('create_datetime','desc')->get(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $notification): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="text-reset notification-item d-block dropdown-item" onclick="markAsRead(<?php echo e($notification->id); ?>)">
                                <div class="d-flex">
                                    <div class="avatar-xs me-3 flex-shrink-0">
                                        <span class="avatar-title bg-info-subtle text-info rounded-circle fs-16">
                                            <i class="bx bx-badge-check"></i>
                                        </span>
                                    </div>
                                    <div class="flex-grow-1">
                                        <a href="<?php echo e($notification->redirect_url ?? '#!'); ?>" class="stretched-link">
                                            <h6 class="mt-0 mb-2 lh-base"><?php echo e(json_decode($notification->data)->message); ?></h6>
                                            <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                                                <span><i class="mdi mdi-clock-outline"></i> <?php echo e(\Carbon\Carbon::parse($notification->create_datetime)->diffForHumans()); ?></span>
                                            </p>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <div class="d-flex align-items-center ms-2">
                                <!-- Mark as Read -->
                                <?php if(!$notification->is_read): ?>
                                <button class="btn btn-sm btn-outline-info me-2"
                                        onclick="markAsRead(<?php echo e($notification->id); ?>)">Mark as Read
                                </button>
                                <?php endif; ?>

                                <!-- Remove Notification -->
                                <button class="btn btn-sm btn-outline-danger"
                                        onclick="removeNotification(<?php echo e($notification->id); ?>)">Remove
                                </button>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="liveToast" class="toast hide bg-success" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="me-auto">Notification</strong>
            <small class="when">Just now</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            Hello, world! This is a toast message.
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/pusher-js@7.0.3/dist/web/pusher.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/laravel-echo@1.11.3/dist/echo.iife.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/dayjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/plugin/relativeTime.min.js"></script>

<script type="module">
    dayjs.extend(dayjs_plugin_relativeTime);

    // Assuming `data.create_datetime` is the date string you're passing from your backend

    // Initialize Pusher and Echo
    window.Pusher = Pusher;

    window.Echo = new Echo({
        broadcaster: 'pusher',
        key: '<?php echo e(env("PUSHER_APP_KEY")); ?>',
        cluster: '<?php echo e(env("PUSHER_APP_CLUSTER")); ?>',
        forceTLS: false,
        auth: {
            headers: {
                'X-CSRF-TOKEN': '<?php echo e(csrf_token()); ?>',  // Include CSRF token in the headers
            },
        },
        debug: true,  // Enable detailed logging for debugging
    });

    const userId = <?php echo e(Session::get('user_id')); ?>;
    console.log('Listening for notifications for user:', userId);

    // Bind the error event to capture connection errors
    Echo.connector.pusher.connection.bind('error', function (error) {
        console.error('Connection Error:', error);
    });

    // Check the connection state
    Echo.connector.pusher.connection.bind('state_change', function (states) {
        console.log('Connection State:', states.current);
    });
    const notificationsList = document.getElementById('notificationsList');
    const unreadCountElement = document.getElementById('unreadCount');
    const totalNotificationsElement = document.getElementById('totalNotifications');
    // Listen for notifications
    Echo.private(`notifications.${userId}`)
        .listen('NotificationSent', (data) => {
            console.log('Notification received:', data);
            if (data && data.message) {
                console.log('Message:', data.message);
            } else {
                console.log('No message field in data:', data);
            }

            // Example code to update notifications list dynamically
            const liWrapper = document.createElement('div'); // Parent wrapper for li and buttons
            liWrapper.className = 'notification-wrapper';

            const li = document.createElement('li');
            li.className = "text-reset notification-item d-block dropdown-item";
            li.innerHTML = `
    <div class="d-flex">
        <div class="avatar-xs me-3 flex-shrink-0">
            <span class="avatar-title bg-info-subtle text-info rounded-circle fs-16">
                <i class="bx bx-badge-check"></i>
            </span>
        </div>
        <div class="flex-grow-1">
            <a href="${data.redirect_url}" class="stretched-link">
                <h6 class="mt-0 mb-2 lh-base">${data.message}</h6>
                <p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
                    <span><i class="mdi mdi-clock-outline"></i> Just now</span>
                </p>
            </a>
        </div>
    </div>
`;

// Create the buttons div
            const buttonsDiv = document.createElement('div');
            buttonsDiv.className = "d-flex align-items-center ms-2";
            buttonsDiv.innerHTML = `
    <button class="btn btn-sm btn-outline-info me-2" onclick="markAsRead(${data.id})">Mark as Read</button>
    <button class="btn btn-sm btn-outline-danger" onclick="removeNotification(${data.id})">Remove</button>
`;

// Append the `li` and the buttons div to the wrapper
            liWrapper.appendChild(li);
            liWrapper.appendChild(buttonsDiv);

// Prepend the wrapper to the list
            notificationsList.prepend(liWrapper);


            // Update unread count
            let unreadCount = parseInt(unreadCountElement.textContent) || 0;
            unreadCountElement.textContent = ++unreadCount;

            // Update total notifications
            let totalNotifications = parseInt(totalNotificationsElement.textContent) || 0;
            totalNotificationsElement.textContent = ++totalNotifications;
            // Show the toast notification
            const toastElement = document.getElementById('liveToast');
            const toast = new bootstrap.Toast(toastElement);
            const formattedDate = dayjs(data.created_at).fromNow();

            // Update the toast message dynamically with the received message
            document.querySelector('#liveToast .toast-body').textContent = data.message;
            document.querySelector("#liveToast .me-auto ").textContent = data.type;
            document.querySelector("#liveToast .when ").textContent = formattedDate;

            // Show the toast
            toast.show();
        }).on('pusher:subscription_succeeded', function (data) {
        console.log('Successfully subscribed to the private channel:', data);
    }).error((error) => {
        console.error('Error listening for events:', error);
    });

</script>
<script>
    function markAsRead(notificationId) {
        const unreadCountElement = document.getElementById('unreadCount');
        const totalNotificationsElement = document.getElementById('totalNotifications');
        const url = `<?php echo e(route('notifications.markAsRead', ['id' => '__ID__'])); ?>`.replace('__ID__', notificationId); // Replace placeholder with actual ID
        $.ajax({
            url: url,
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN':'<?php echo e(csrf_token()); ?>'
            },
            success: function (response) {
                if (response.success) {
                        $('#notificationsList').load(location.href + ' #notificationsList > *');
                    let unreadCount = parseInt(unreadCountElement.textContent);
                    if (unreadCount > 0) {
                        unreadCountElement.textContent = --unreadCount;
                    }

                    let totalNotifications = parseInt(totalNotificationsElement.textContent) || 0;
                    if (totalNotifications > 0) {
                        totalNotificationsElement.textContent = --totalNotifications;
                    }

                } else {
                    SwalWithCustomSettings.fire('Error!', response.message || 'An error occurred.', 'error');
                }
            },
            error: function (xhr) {
                SwalWithCustomSettings.fire('Error!', 'An unexpected error occurred.', 'error');
            }
        });
    }

    // Function to remove a single notification
    function removeNotification(notificationId) {
        const unreadCountElement = document.getElementById('unreadCount');
        const totalNotificationsElement = document.getElementById('totalNotifications');
        const url = `<?php echo e(route('notifications.remove', ['id' => '__ID__'])); ?>`.replace('__ID__', notificationId); // Replace placeholder with actual ID
        $.ajax({
            url: url,
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN':'<?php echo e(csrf_token()); ?>'
            },
            success: function (response) {
                if (response.success) {
                    $('#notificationsList').load(location.href + ' #notificationsList > *');
                    let unreadCount = parseInt(unreadCountElement.textContent);
                    if (unreadCount > 0) {
                        unreadCountElement.textContent = --unreadCount;
                    }

                    let totalNotifications = parseInt(totalNotificationsElement.textContent) || 0;
                    if (totalNotifications > 0) {
                        totalNotificationsElement.textContent = --totalNotifications;
                    }

                } else {
                    SwalWithCustomSettings.fire('Error!', response.message || 'An error occurred.', 'error');
                }
            },
            error: function (xhr) {
                SwalWithCustomSettings.fire('Error!', 'An unexpected error occurred.', 'error');
            }
        });
    }

    // Function to mark all notifications as read
    function markAllAsRead() {
        console.log("All notifications marked as read.");
    }
</script>
<?php /**PATH C:\xampp\htdocs\laravel_projects\TLMIS original code\TLMIS\resources\views/layouts/partials/notifications.blade.php ENDPATH**/ ?>