<?php
include 'connect.php'; // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['id'])) {
    $id = $_GET['id']; // Feedback ID

    // Delete the feedback from the database
    $sql = "DELETE FROM feedback WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "Feedback deleted successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Invalid request.";
}

$conn->close(); // Close the connection
?>