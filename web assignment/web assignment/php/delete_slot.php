<?php
include 'connect.php'; // Include the database connection

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Delete the slot from the database
    $sql = "DELETE FROM presentation_slots WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "Slot deleted successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Invalid request.";
}

$conn->close(); // Close the connection
?>