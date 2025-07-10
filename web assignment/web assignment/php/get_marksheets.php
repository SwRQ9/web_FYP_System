<?php
header('Content-Type: application/json'); // Set response type to JSON
include 'connect.php'; // Include the database connection

$sql = "SELECT * FROM marksheets";
$result = $conn->query($sql);

$marksheets = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $marksheets[] = [
            'id' => $row['id'],
            'student_name' => $row['student_name'],
            'supervisor_name' => $row['supervisor_name'],
            'project_title' => $row['project_title'],
            'marks' => $row['marks'],
            'feedback' => $row['feedback'],
            'submitted_at' => $row['submitted_at']
        ];
    }
}

echo json_encode($marksheets); // Return the marksheets as JSON

$conn->close(); // Close the connection
?>