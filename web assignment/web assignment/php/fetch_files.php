<?php
include 'connect.php'; // Include the database connection

$sql = "SELECT * FROM resources";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<div class='file-card'>";
        echo "<h4>" . $row['file_name'] . "</h4>";
        echo "<p><strong>Uploaded By:</strong> " . $row['uploaded_by'] . "</p>";
        echo "<p><strong>Uploaded On:</strong> " . $row['uploaded_at'] . "</p>";
        echo "<div class='actions'>";
        echo "<a href='" . $row['file_path'] . "' class='download-btn'>Download</a>";
        echo "<button class='delete-btn' data-id='" . $row['id'] . "'>Delete</button>";
        echo "</div>";
        echo "</div>";
    }
} else {
    echo "<p>No files uploaded yet.</p>";
}

$conn->close(); // Close the connection
?>