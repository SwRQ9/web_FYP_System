<?php
include 'connect.php'; // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $student_name = $_POST['student-name'];
    $supervisor_name = $_POST['supervisor-name'];
    $project_title = $_POST['project-title'];
    $marks = $_POST['marks'];
    $feedback = $_POST['feedback'];

    // Insert marksheet details into the database
    $sql = "INSERT INTO marksheets (student_name, supervisor_name, project_title, marks, feedback)
            VALUES ('$student_name', '$supervisor_name', '$project_title', '$marks', '$feedback')";

    if ($conn->query($sql) === TRUE) {
        echo "Marksheet submitted successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Invalid request method.";
}

$conn->close(); // Close the connection
?>