<?php
// Start session for authentication and role management
session_start();

require 'connect.php';

$error = ''; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and sanitize user input
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    // Validate required fields
    if (empty($email) || empty($password)) {
        $error = "Both email and password are required.";
    } else {
        // Prepare SQL statement to protect against SQL injection
        $stmt = $conn->prepare("SELECT id, password, role FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();

        // Check if the user exists
        if ($stmt->num_rows > 0) {
            $stmt->bind_result($id, $hashedPassword, $role);
            $stmt->fetch();

            // Verify the submitted password against the stored hashed password
            if (password_verify($password, $hashedPassword)) {
                // Store user data in the session
                $_SESSION['user_id'] = $id;
                $_SESSION['role'] = $role;

                // Redirect based on user role
                if ($role === 'admin') {
                    header("Location: ../html/admin_dashboard.html");
                } elseif ($role === 'supervisor') {
                    header("Location: ../html/supervisor_dashboard.html");
                } elseif ($role === 'student') {
                    header("Location: ../html/student_dashboard.html");
                } else {
                    $error = "Invalid role assigned.";
                }
            } else {
                $error = "Invalid password.";
            }
        } else {
            $error = "Email not found.";
        }

        $stmt->close();
    }

    // If there is an error, include the login page and display the error message
    if (!empty($error)) {
        include '../html/login.html';
        echo "<script>document.querySelector('.error-message').textContent = '" . htmlspecialchars($error, ENT_QUOTES, 'UTF-8') . "';</script>";
        exit();
    }
}

$conn->close();
?>
