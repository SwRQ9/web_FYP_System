<?php

require 'connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and sanitize input
    $name = trim($_POST['name']);
    $studentId = trim($_POST['studentId']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirmPassword'];
    $securityQuestion = trim($_POST['security_question']);
    $securityAnswer = trim($_POST['security_answer']);

    // Validate required fields
    if (empty($name) || empty($studentId) || empty($email) || empty($password) || empty($confirmPassword) || empty($securityQuestion) || empty($securityAnswer)) {
        header("Location: ../html/registration.html?error=All+fields+are+required");
        exit();
    }

    // Check if passwords match
    if ($password !== $confirmPassword) {
        header("Location: ../html/registration.html?error=Passwords+do+not+match");
        exit();
    }

    // Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        header("Location: ../html/registration.html?error=Invalid+email+format");
        exit();
    }

    // Hash the password and security answer before storing
    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
    $hashedSecurityAnswer = password_hash($securityAnswer, PASSWORD_BCRYPT);

    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("INSERT INTO users (name, student_id, email, password, security_question, security_answer) VALUES (?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
        header("Location: ../html/registration.html?error=Statement+preparation+failed");
        exit();
    }

    $stmt->bind_param("ssssss", $name, $studentId, $email, $hashedPassword, $securityQuestion, $hashedSecurityAnswer);

    // Execute and check for successful registration
    if ($stmt->execute()) {
        header("Location: ../html/login.html");
        $stmt->close();
        exit();
    } else {
        $stmt->close();
        $error = urlencode("Registration failed: " . $stmt->error);
        header("Location: ../html/registration.html?error=$error");
        exit();
    }
}

$conn->close();
?>
