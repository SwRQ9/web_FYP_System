document.addEventListener('DOMContentLoaded', function () {
    fetchAnnouncements(); // Fetch announcements on page load

    // Handle form submission via JavaScript
    document.querySelector('.announcement-form form').addEventListener('submit', function (event) {
        event.preventDefault();
        const formData = new FormData(this);

        fetch('../php/post_announcement.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Announcement posted successfully!');
                this.reset();
                fetchAnnouncements(); // Refresh list after posting
            } else {
                alert('Error: ' + data.message);
            }
        })
        .catch(error => console.error('Error:', error));
    });

    // Function to fetch and display announcements
    function fetchAnnouncements() {
        fetch('../php/get_announcements.php')
        .then(response => response.json())
        .then(announcements => {
            const announcementContainer = document.querySelector('.announcements-list');
            announcementContainer.innerHTML = '<h3>Recent Announcements</h3>';

            if (announcements.length === 0) {
                announcementContainer.innerHTML += '<p>No announcements posted yet.</p>';
                return;
            }

            announcements.forEach(announcement => {
                const div = document.createElement('div');
                div.className = 'announcement-card';
                div.innerHTML = `
                    <h3>${announcement.title}</h3>
                    <p><strong>Date:</strong> ${announcement.date}</p>
                    <p>${announcement.content}</p>
                    <div class="actions">
                        <button class="edit-btn" data-id="${announcement.id}">Edit</button>
                        <button class="delete-btn" data-id="${announcement.id}">Delete</button>
                    </div>
                `;
                announcementContainer.appendChild(div);
            });

            // Add event listeners to edit and delete buttons
            document.querySelectorAll('.edit-btn').forEach(button => {
                button.addEventListener('click', function () {
                    const announcementId = this.getAttribute('data-id');
                    const newContent = prompt('Edit announcement content:');

                    if (newContent) {
                        editAnnouncement(announcementId, newContent);
                    }
                });
            });

            document.querySelectorAll('.delete-btn').forEach(button => {
                button.addEventListener('click', function () {
                    const announcementId = this.getAttribute('data-id');

                    if (confirm('Are you sure you want to delete this announcement?')) {
                        deleteAnnouncement(announcementId);
                    }
                });
            });
        })
        .catch(error => console.error('Error fetching announcements:', error));
    }

    // Function to edit an announcement
    function editAnnouncement(announcementId, newContent) {
        fetch('../php/edit_announcement.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `id=${announcementId}&content=${encodeURIComponent(newContent)}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Announcement updated successfully!');
                fetchAnnouncements(); // Refresh list after editing
            } else {
                alert('Error: ' + data.message);
            }
        })
        .catch(error => console.error('Error updating announcement:', error));
    }

    // Function to delete an announcement
    function deleteAnnouncement(announcementId) {
        fetch('../php/delete_announcement.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `id=${announcementId}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Announcement deleted successfully!');
                fetchAnnouncements(); // Refresh list after deletion
            } else {
                alert('Error: ' + data.message);
            }
        })
        .catch(error => console.error('Error deleting announcement:', error));
    }
});
