<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $feedback_id = $_POST['feedback_id'];
    $feedback_text = $_POST['feedback_text'];

    $sql = "UPDATE supervisor_feedback SET feedback_text = ? WHERE id = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Prepare failed: " . $conn->error);
}

$stmt->bind_param("si", $feedback_text, $feedback_id);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "message" => "Error: " . $stmt->error]);
}

    $stmt->close();
    $conn->close();
}
?>
