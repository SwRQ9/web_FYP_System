<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require 'connect.php';

$query = "SELECT * FROM meetings WHERE date >= CURDATE() ORDER BY date, time";
$result = $conn->query($query);

$meetings = [];
while ($row = $result->fetch_assoc()) {
    $meetings[] = $row;
}

echo json_encode($meetings);
?>