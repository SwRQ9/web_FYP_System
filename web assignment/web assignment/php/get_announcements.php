<?php
require 'connect.php';

$query = "SELECT * FROM announcements ORDER BY date_posted DESC LIMIT 10";
$result = $conn->query($query);

$announcements = [];
while ($row = $result->fetch_assoc()) {
    $announcements[] = $row;
}

echo json_encode($announcements);
?>
