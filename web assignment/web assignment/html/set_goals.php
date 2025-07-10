<?php
// Include the database connection file
include 'connect.php';

// Handle goal setting
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["set_goal"])) {
    $student_id = $_POST["student_id"];
    $goal = $_POST["goal"];

    $sql = "INSERT INTO goals (student_id, goal) VALUES ('$student_id', '$goal')";

    if ($conn->query($sql) === TRUE) {
        echo "Goal set successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>

