<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require 'connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $date = $_POST['date'];
    $time = $_POST['time'];
    $agenda = $_POST['agenda'];
    $supervisor_id = $_POST['supervisor_id'];
    $student_id = $_POST['student_id'];

    $stmt = $conn->prepare("INSERT INTO meetings (title, date, time, agenda, supervisor_id, student_id) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssii", $title, $date, $time, $agenda, $supervisor_id, $student_id);
    
    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Meeting scheduled successfully."]);
    } else {
        echo json_encode(["success" => false, "message" => "Error scheduling meeting: " . $stmt->error]);
    }
    $stmt->close();
}
?>
