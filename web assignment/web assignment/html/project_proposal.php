<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "web_assignment_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle project proposal submission
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["submit_proposal"])) {
    $student_id = $_POST["student_id"];
    $project_title = $_POST["project_title"];
    $project_description = $_POST["project_description"];

    $sql = "INSERT INTO project_proposals (student_id, project_title, project_description) VALUES ('$student_id', '$project_title', '$project_description')";

    if ($conn->query($sql) === TRUE) {
        echo "Proposal submitted successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Handle proposal approval/rejection and adding to projects table if approved
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["update_status"])) {
    $proposal_id = $_POST["proposal_id"];
    $status = $_POST["status"];

    // Update proposal status
    $sql = "UPDATE project_proposals SET status='$status' WHERE id='$proposal_id'";

    if ($conn->query($sql) === TRUE) {
        echo "Proposal status updated successfully.";

        // If status is approved, add to projects table
        if ($status == 'approved') {
            $sql = "SELECT student_id, project_title, project_description FROM project_proposals WHERE id='$proposal_id'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $student_id = $row["student_id"];
                $project_title = $row["project_title"];
                $project_description = $row["project_description"];

                $sql = "INSERT INTO projects (student_id, title, description, status, progress) VALUES ('$student_id', '$project_title', '$project_description', 'approved', 0)";

                if ($conn->query($sql) === TRUE) {
                    echo "Project added to projects table successfully.";
                } else {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
            }
        }
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
