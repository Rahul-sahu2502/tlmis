
var tStatus = 'C';
var tId = 1;
var rep = true;
var sendback = true;
var delay = 0;
var max_delay = 5;

if (tStatus != 'C') {
    // task not completed, pls complete the task.
}
else {
    // task completed, pls proceed with the next condition.
    if (!(rep || !sendback)) {
        // if no reply means no one work on this task can't give the rating
    }
    else {
        // if there is a reply means someone work on this task can give the rating
        if (delay < 0) {
            rating = 5;
            // if there is no delay means need to give full rating
        }
        else {
            // need to give rating based on delay
            if (delay > max_delay) {
                rating = 0;
                // if delay is more than 5 days means need to give zero rating
            }
            else {
                rating = Math.max(max_delay - Math.ceil(delay / 2), 0);
                // need to give rating based on delay
            }
        }
    }
}