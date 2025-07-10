<?php
header('Content-Type: application/json'); // Set response type to JSON
include 'connect.php'; // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $user_name = $_GET['user-name']; // Name of the student or supervisor
    $user_type = $_GET['user-type']; // 'student' or 'supervisor'

    // Fetch feedback for the user
    $sql = "SELECT * FROM feedback WHERE user_name = '$user_name' AND user_type = '$user_type'";
    $result = $conn->query($sql);

    $feedback = [];

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $feedback[] = [
                'id' => $row['id'],
                'feedback_type' => $row['feedback_type'],
                'feedback_text' => $row['feedback_text'],
                'feedback_date' => $row['feedback_date']
            ];
        }
    }

    echo json_encode($feedback); // Return the feedback as JSON
} else {
    echo "Invalid request method.";
}

$conn->close(); // Close the connection
?>