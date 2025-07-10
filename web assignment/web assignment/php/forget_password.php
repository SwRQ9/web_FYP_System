<?php

require 'connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and sanitize user input
    $email = trim($_POST['email']);
    $securityAnswer = trim($_POST['security_answer']);

    // Validate that required fields are not empty
    if (empty($email) || empty($securityAnswer)) {
        header("Location: ../html/forget_password.html?error=Please+enter+your+email+and+security+answer");
        exit();
    }

    // Prepare SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT security_answer FROM users WHERE email = ?");
    if (!$stmt) {
        header("Location: ../html/forget_password.html?error=Database+error");
        exit();
    }
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    // Check if the email exists in the database
    if ($stmt->num_rows === 0) {
        header("Location: ../html/forget_password.html?error=Email+not+found");
        exit();
    }

    // Retrieve the hashed security answer from the database
    $stmt->bind_result($hashedSecurityAnswer);
    $stmt->fetch();

    // Verify the provided security answer against the stored hash
    if (!password_verify($securityAnswer, $hashedSecurityAnswer)) {
        header("Location: ../html/forget_password.html?error=Incorrect+security+answer");
        exit();
    }

    // If verified, redirect to the reset password page
    header("Location: ../php/reset_password.php?email=" . urlencode($email));
    exit();
}

$conn->close();
?>
