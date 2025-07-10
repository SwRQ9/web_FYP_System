<?php
header('Content-Type: application/json');
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $supervisor_name = mysqli_real_escape_string($conn, $_GET['supervisor_name']);

    $stmt = $conn->prepare("SELECT * FROM supervisor_feedback WHERE supervisor_name = ?");
    $stmt->bind_param("s", $supervisor_name);
    $stmt->execute();
    $result = $stmt->get_result();

    $feedback = [];
    while ($row = $result->fetch_assoc()) {
        $feedback[] = $row;
    }

    echo json_encode($feedback);
    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Invalid request method"]);
}

$conn->close();
?>