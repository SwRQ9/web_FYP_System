<?php
include 'connect.php'; // Include the database connection

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $student_name = $_POST['student-name'];
    $project_title = $_POST['project-title'];
    $slot_date = $_POST['slot-date'];
    $slot_time = $_POST['slot-time'];

    // Validate the slot date
    $selected_date = new DateTime($slot_date);
    $current_date = new DateTime();

    if ($selected_date < $current_date) {
        echo "Error: The selected date is in the past. Please choose a future date.";
        $conn->close();
        exit();
    }

    // Validate the slot time (optional)
    $selected_time = new DateTime($slot_time);
    $start_time = new DateTime('09:00:00'); // Example: 9:00 AM
    $end_time = new DateTime('17:00:00'); // Example: 5:00 PM

    if ($selected_time < $start_time || $selected_time > $end_time) {
        echo "Error: The selected time is outside working hours (9:00 AM - 5:00 PM).";
        $conn->close();
        exit();
    }

    // Insert booking details into the database
    $sql = "INSERT INTO presentation_slots (student_name, project_title, slot_date, slot_time)
            VALUES ('$student_name', '$project_title', '$slot_date', '$slot_time')";

    if ($conn->query($sql) === TRUE) {
        echo "Slot booked successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Invalid request method.";
}

$conn->close(); // Close the connection
?>