<?php
include 'connect.php'; // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_type = $_POST['user-type']; // 'student' or 'supervisor'
    $user_name = $_POST['user-name']; // Name of the student or supervisor
    $feedback_type = $_POST['feedback-type']; // 'project', 'supervisor', or 'system'
    $feedback_text = $_POST['feedback-text']; // The feedback content

    // Insert feedback into the database
    $sql = "INSERT INTO feedback (user_type, user_name, feedback_type, feedback_text)
            VALUES ('$user_type', '$user_name', '$feedback_type', '$feedback_text')";

    if ($conn->query($sql) === TRUE) {
        echo "Feedback submitted successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Invalid request method.";
}

$conn->close(); // Close the connection
?>