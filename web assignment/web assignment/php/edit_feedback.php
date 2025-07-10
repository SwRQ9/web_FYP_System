<?php
include 'connect.php'; // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id']; // Feedback ID
    $feedback_text = $_POST['feedback-text']; // Updated feedback content

    // Update the feedback in the database
    $sql = "UPDATE feedback SET feedback_text = '$feedback_text' WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "Feedback updated successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Invalid request method.";
}

$conn->close(); // Close the connection
?>