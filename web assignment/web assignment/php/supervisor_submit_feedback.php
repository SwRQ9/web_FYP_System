<?php
header('Content-Type: application/json');
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize inputs
    $supervisor_name = mysqli_real_escape_string($conn, $_POST['supervisor_name']);
    $student_name = mysqli_real_escape_string($conn, $_POST['student_name']);
    $feedback_type = mysqli_real_escape_string($conn, $_POST['feedback_type']);
    $feedback_text = mysqli_real_escape_string($conn, $_POST['feedback_text']);

    // Insert using prepared statement
    $stmt = $conn->prepare("INSERT INTO supervisor_feedback (supervisor_name, student_name, feedback_type, feedback_text) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $supervisor_name, $student_name, $feedback_type, $feedback_text);
    
    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Feedback submitted successfully"]);
    } else {
        echo json_encode(["success" => false, "message" => "Error: " . $stmt->error]);
    }
    
    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}

$conn->close();
?>