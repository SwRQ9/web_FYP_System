<?php
include 'connect.php'; // Include the database connection

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Fetch file path from the database
    $sql = "SELECT file_path FROM resources WHERE id = $id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $file_path = $row['file_path'];

        // Delete the file from the server
        if (unlink($file_path)) {
            // Delete the record from the database
            $sql = "DELETE FROM resources WHERE id = $id";
            if ($conn->query($sql) === TRUE) {
                echo "File deleted successfully.";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        } else {
            echo "Error deleting file.";
        }
    } else {
        echo "File not found.";
    }
}

$conn->close(); // Close the connection
?>