<?php
// Include the database connection file
include 'connect.php';

// Handle proposal approval/rejection
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["update_status"])) {
    $proposal_id = $_POST["proposal_id"];
    $status = $_POST["status"];

    $sql = "UPDATE project_proposals SET status='$status' WHERE id='$proposal_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Proposal status updated successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>