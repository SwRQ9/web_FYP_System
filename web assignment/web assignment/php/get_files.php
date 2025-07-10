<?php
header('Content-Type: application/json'); // Set response type to JSON

// Start output buffering to prevent extra output
ob_start();

include 'connect.php'; // Include the database connection

$sql = "SELECT * FROM resources";
$result = $conn->query($sql);

$files = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $files[] = [
            'id' => $row['id'],
            'file_name' => $row['file_name'],
            'file_path' => $row['file_path'],
            'uploaded_by' => $row['uploaded_by'],
            'uploaded_at' => $row['uploaded_at']
        ];
    }
}

// Clear the output buffer and return JSON
ob_end_clean();
echo json_encode($files);

$conn->close(); // Close the connection
?>