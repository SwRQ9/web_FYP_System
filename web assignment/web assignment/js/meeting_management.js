// Fetch and display upcoming meetings
fetch('php/get_upcoming_meetings.php')
    .then(response => response.json())
    .then(data => {
        const meetingContainer = document.getElementById('meetings-list');
        data.forEach(meeting => {
            const div = document.createElement('div');
            div.className = 'meeting-card';
            div.innerHTML = `
                <h3>${meeting.title}</h3>
                <p><strong>Date:</strong> ${meeting.date}</p>
                <p><strong>Time:</strong> ${meeting.time}</p>
                <p><strong>Agenda:</strong> ${meeting.agenda}</p>
            `;
            meetingContainer.appendChild(div);
        });
    });

// Validate meeting scheduling form
document.getElementById('scheduleMeetingForm').addEventListener('submit', function (e) {
    const meetingDate = new Date(document.getElementById('meeting-date').value);
    const currentDate = new Date();

    if (meetingDate <= currentDate) {
        e.preventDefault();
        alert('Meeting date must be in the future.');
    }

    
});

// Set meeting_id in hidden input from URL query string
document.addEventListener('DOMContentLoaded', function() {
    // Get the meeting_id from the URL query string
    var urlParams = new URLSearchParams(window.location.search);
    var meetingId = urlParams.get('meeting_id');

    // Set the value of the hidden meeting_id field
    if (meetingId) {
        document.getElementById('meeting_id').value = meetingId;
    }
});
