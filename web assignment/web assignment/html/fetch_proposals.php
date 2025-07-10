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

// Fetch project proposals from the database
$sql = "SELECT * FROM project_proposals";
$result = $conn->query($sql);

$proposals = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $proposals[] = $row;
    }
} else {
    $proposals = null;
}

$conn->close();

// Output data as JSON
header('Content-Type: application/json');
echo json_encode($proposals);
?>
