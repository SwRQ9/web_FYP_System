<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $content = $_POST['content'];

    // Fetch an existing admin_id from the users table
    $result = $conn->query("SELECT id FROM users LIMIT 1");
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $admin_id = $row['id'];
    } else {
        die("No admin user found. Please add an admin user.");
    }

    // Insert the announcement
    $sql = "INSERT INTO announcements (title, content, admin_id) VALUES ('$title', '$content', '$admin_id')";
    if ($conn->query($sql) === TRUE) {
        echo "Announcement posted successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>
