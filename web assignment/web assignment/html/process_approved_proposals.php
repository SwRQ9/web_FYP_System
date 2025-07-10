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

// Fetch approved project proposals that are not already in the projects table
$sql = "
    SELECT pp.id, pp.project_title, pp.project_description 
    FROM project_proposals pp 
    LEFT JOIN projects p ON pp.project_title = p.title 
    WHERE pp.status = 'approved' AND p.title IS NULL
";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $projects_added = false;  // Flag to track if any projects were added
    while($row = $result->fetch_assoc()) {
        $project_title = $row["project_title"];
        $project_description = $row["project_description"];
        
        // Insert approved proposals into projects table
        $sql_insert = "INSERT INTO projects (title, description, progress) VALUES ('$project_title', '$project_description', 0)";

        if ($conn->query($sql_insert) === TRUE) {
            $projects_added = true;  // Set the flag to true if a project was added
        } else {
            echo "Error: " . $sql_insert . "<br>" . $conn->error;
        }
    }
    if ($projects_added) {
        echo "Project(s) added to projects table successfully.";
    }
} else {
    echo "No approved project proposals found.";
}

$conn->close();
?>
