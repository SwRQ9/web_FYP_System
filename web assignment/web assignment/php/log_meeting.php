<?php
include 'connect.php'; // Assuming this file connects to the database

$meeting_id = $_POST['meeting_id'];
$notes = $_POST['notes'];
$action_items = $_POST['action_items'];

if (empty($meeting_id)) {
    die('Error: Meeting ID is missing.');
}

if (empty($notes) || empty($action_items)) {
    die('Error: Notes or action items are missing.');
}

// Debug: Check if meeting_id exists in meetings table
$query = "SELECT * FROM meetings WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $meeting_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die('Error: Meeting ID does not exist in the meetings table.');
}

// Proceed with inserting the log
$query = "INSERT INTO meeting_logs (meeting_id, notes, action_items) VALUES (?, ?, ?)";
$stmt = $conn->prepare($query);
$stmt->bind_param("iss", $meeting_id, $notes, $action_items);

if ($stmt->execute()) {
    echo "Meeting log added successfully.";
} else {
    echo "Error: " . $stmt->error;
}
?>
