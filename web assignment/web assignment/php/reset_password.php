<?php

require 'connect.php';

$error = '';
// Retrieve the email parameter if it exists in the query string
$email = isset($_GET['email']) ? trim($_GET['email']) : '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and sanitize form inputs
    $email = trim($_POST['email']);
    $newPassword = trim($_POST['new_password']);
    $confirmPassword = trim($_POST['confirm_password']);

    // Validate required fields
    if (empty($email) || empty($newPassword) || empty($confirmPassword)) {
        $error = "All fields are required";
    } elseif ($newPassword !== $confirmPassword) {
        $error = "Passwords do not match";
    } else {
        // Check if the provided email is registered
        $checkStmt = $conn->prepare("SELECT email FROM users WHERE email = ?");
        $checkStmt->bind_param("s", $email);
        $checkStmt->execute();
        $checkStmt->store_result();

        if ($checkStmt->num_rows === 0) {
            $error = "Email not registered";
        } else {
            // Hash the new password for secure storage
            $hashedPassword = password_hash($newPassword, PASSWORD_BCRYPT);
            // Update the user's password in the database
            $updateStmt = $conn->prepare("UPDATE users SET password = ? WHERE email = ?");
            $updateStmt->bind_param("ss", $hashedPassword, $email);

            if ($updateStmt->execute()) {
                header("Location: ../html/login.html?success=Password+reset+successfully");
                exit();
            } else {
                $error = "Update failed: " . $conn->error;
            }
            $updateStmt->close();
        }
        $checkStmt->close();
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/reset_password.css">

    <title>Reset Password - FYP Management System</title>
</head>
<body>
    <header>
        <div class="logo">
            <h1>FYP Management System</h1>
        </div>
    </header>

    <section class="reset-password-form">
        <h2>Reset Password</h2>

        <?php if (!empty($error)): ?>
            <p style="color: red; text-align: center;"><?php echo htmlspecialchars($error); ?></p>
        <?php endif; ?>

        <form id="resetPasswordForm" method="POST">
            <input type="hidden" name="email" value="<?php echo htmlspecialchars($email); ?>">
            
            <div class="form-group">
                <label for="new_password">New Password:</label>
                <input type="password" id="new_password" name="new_password" placeholder="Enter new password" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password:</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm new password" required>
            </div>
            <button type="submit" class="submit-btn">Reset Password</button>
        </form>
    </section>
</body>
</html>
