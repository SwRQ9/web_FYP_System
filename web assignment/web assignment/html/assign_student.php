<?php
// Include the database connection file
include 'connect.php';

// Handle student assignment to project
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["assign_student"])) {
    $project_id = $_POST["project_id"];
    $student_id = $_POST["student_id"];

    $sql = "INSERT INTO project_assignments (project_id, student_id) VALUES ('$project_id', '$student_id')";

    if ($conn->query($sql) === TRUE) {
        echo "Student assigned to project successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>

