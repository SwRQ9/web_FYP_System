<?php
// Include the database connection file
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $student_id = 1; // Assume the student ID is 1 for this example
    $goals = $_POST['goals'];

    // Delete existing goals for the student
    $delete_sql = "DELETE FROM goals WHERE student_id = '$student_id'";
    if ($conn->query($delete_sql) === TRUE) {
        echo "Existing goals deleted successfully.<br>";
    } else {
        echo "Error: " . $delete_sql . "<br>" . $conn->error;
    }

    // Insert new goals
    foreach ($goals as $goal) {
        $goal = $conn->real_escape_string($goal);
        $insert_sql = "INSERT INTO goals (student_id, goal) VALUES ('$student_id', '$goal')";
        if ($conn->query($insert_sql) === TRUE) {
            echo "Goal added successfully: $goal<br>";
        } else {
            echo "Error: " . $insert_sql . "<br>" . $conn->error;
        }
    }
}

$conn->close();
?>
