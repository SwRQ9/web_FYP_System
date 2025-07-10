<?php
require 'connect.php';

$name = "supervisor";
$email = "supervisor@gmail.com";
$role = "supervisor";
$plainPassword = "supervisor";
$securityQuestion = "What city were you born in?";
$securityAnswer = "New York";

// Ensure the role is either 'admin' or 'supervisor'
if (!in_array($role, ['admin', 'supervisor'])) {
    die("Invalid role. Use 'admin' or 'supervisor'.");
}

// Hash the plain text password for secure storage
$hashedPassword = password_hash($plainPassword, PASSWORD_BCRYPT);
// Hash the security answer for secure storage
$hashedSecurityAnswer = password_hash($securityAnswer, PASSWORD_BCRYPT);

// Prepare the SQL statement to protect against SQL injection
$stmt = $conn->prepare("
    INSERT INTO users 
    (name, student_id, email, password, role, security_question, security_answer, created_at) 
    VALUES (?, NULL, ?, ?, ?, ?, ?, NOW())
");

// Check if statement preparation was successful
if (!$stmt) {
    die("Prepare failed: " . $conn->error);
}

// Bind parameters to the prepared statement
$stmt->bind_param(
    "ssssss",
    $name,
    $email,
    $hashedPassword,
    $role,
    $securityQuestion,
    $hashedSecurityAnswer
);

if ($stmt->execute()) {
    echo "User ($role) added successfully!";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
