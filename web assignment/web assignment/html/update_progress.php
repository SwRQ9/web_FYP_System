<?php
// Include the database connection file
include 'connect.php';

// Handle project progress update
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["update_progress"])) {
    $project_id = $_POST["project_id"];
    $progress = $_POST["progress"];

    $sql = "UPDATE projects SET progress='$progress' WHERE id='$project_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Progress updated successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
