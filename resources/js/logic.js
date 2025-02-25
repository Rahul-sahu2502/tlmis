


// ############## New Logic ###########################################################################


if (value.status === 'C') {

    if (value.replied_status === 'no' && value.sendback_status === 'no') {
        return rating_view = 'No Rating';
    } else if (value.replied_status === 'yes' && value.sendback_status === 'no') {

        if (new Date(value.submit_date) > new Date(value.due_date)) {
            return rating_view = 'click_for_rating'; //late submission && Manual_rating


        } else if (new Date(value.submit_date) <= new Date(value.due_date)) {
            return rating_view = '⭐⭐⭐⭐⭐'; // On-time or early submission

        } else if (value.status === 'I') {
            return value.submit_date = 'In Process', // No rating for 'In Process'
                value.replied_status = 'In Process', // No rating for 'In Process'
                rating_view = 'In Process'; // No rating for 'In Process'

        } else {
            return 'Not Submitted/Incomplete';
        }
    }
}


const row = `
          <tr>
             <td>${index + 1}</td>
             <td class="tasks_name">${value.title}</td>
             <td class="tasks_name">${value.status}</td>  
              <td class="total text-center"><b>${new Date(value.due_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>
              <td class="total text-center"><b>${new Date(value.submit_date).toLocaleDateString('en-US', { day: '2-digit', month: 'short', year: 'numeric' })}</b></td>
             <td class="tasks_name">${value.replied_status}</td> 
             <td class="tasks_name">${rating_view} </td>
          </tr>`;
