<?php
include 'connect.php'; // Include the database connection

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Delete the marksheet from the database
    $sql = "DELETE FROM marksheets WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "Marksheet deleted successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Invalid request.";
}

$conn->close(); // Close the connection
?>