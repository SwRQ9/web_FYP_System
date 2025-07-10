<?php
include 'connect.php'; // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $uploaded_by = $_POST['uploaded_by']; // Name of the user uploading the file
    $file_name = $_FILES['file']['name']; // Name of the file
    $file_tmp = $_FILES['file']['tmp_name']; // Temporary file path
    $file_path = "../uploads/" . basename($file_name); // Destination path

    // Check if the uploads directory exists
    if (!is_dir('../uploads')) {
        mkdir('../uploads', 0777, true); // Create the directory if it doesn't exist
    }

    // Move the file to the uploads directory
    if (move_uploaded_file($file_tmp, $file_path)) {
        // Insert file details into the database
        $sql = "INSERT INTO resources (file_name, file_path, uploaded_by)
                VALUES ('$file_name', '$file_path', '$uploaded_by')";

        if ($conn->query($sql) === TRUE) {
            echo "File uploaded successfully.";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Error uploading file. Check file permissions or directory path.";
    }
} else {
    echo "Invalid request method.";
}

$conn->close(); // Close the connection
?>