<?php
session_start();
require_once 'db.php';

header('Content-Type: application/json');

// Retrieve event ID from POST request
$event_id = isset($_POST['event_id']) ? intval($_POST['event_id']) : 0;

$response = ['message' => 'An error occurred.'];

// Check if event ID is valid
if ($event_id > 0) {
    // Example registration logic (replace with actual logic)
    $user_id = 1; // Example user ID, ideally fetched from session or other source

    // Prepare SQL query
    $register_sql = "INSERT INTO registrations (user_id, event_id) VALUES (?, ?)";
    if ($stmt = $conn->prepare($register_sql)) {
        $stmt->bind_param('ii', $user_id, $event_id);

        if ($stmt->execute()) {
            $response['message'] = 'Registration successful!';
        } else {
            $response['message'] = 'Failed to register.';
        }

        $stmt->close();
    } else {
        $response['message'] = 'Failed to prepare the statement.';
    }
} else {
    $response['message'] = 'Invalid event ID.';
}

$conn->close();

// Return JSON response
echo json_encode($response);
?>
      




      session_start();
require_once 'db.php';

// Assume $user_id and $event_id are defined and valid integers
$user_id = 8; // Example value
$event_id = 3; // Example value

// Prepare a statement for checking registration
$stmt = $conn->prepare("SELECT * FROM registrations WHERE member_id = ? AND event_id = ?");
if ($stmt === false) {
    die("Prepare failed: " . $conn->error);
}

$stmt->bind_param("ii", $user_id, $event_id); // Bind parameters as integers
$stmt->execute();

// Check for errors during execution
if ($stmt->errno) {
    die("Execute failed: " . $stmt->error);
}

$check_registration_result = $stmt->get_result();

if ($check_registration_result === false) {
    die("Get result failed: " . $stmt->error);
}

if ($check_registration_result->num_rows == 0) {
    // Prepare a statement for registering the user
    $stmt = $conn->prepare("INSERT INTO registrations (member_id, event_id) VALUES (?, ?)");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param("ii", $user_id, $event_id); // Bind parameters as integers
    if ($stmt->execute()) {
        $success_message = "You have successfully registered for the event!";
    } else {
        $error_message = "Error: " . $stmt->error;
    }
} else {
    $error_message = "You are already registered for this event!";
}