<?php
header('Content-Type: application/json'); // Set response type to JSON
include 'connect.php'; // Include the database connection

$sql = "SELECT * FROM presentation_slots";
$result = $conn->query($sql);

$slots = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $slots[] = [
            'id' => $row['id'],
            'student_name' => $row['student_name'],
            'project_title' => $row['project_title'],
            'slot_date' => $row['slot_date'],
            'slot_time' => $row['slot_time'],
            'booked_at' => $row['booked_at']
        ];
    }
}

echo json_encode($slots); // Return the slots as JSON

$conn->close(); // Close the connection
?>