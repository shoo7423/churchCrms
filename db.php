<?php
// db.php

$servername = "localhost";  // Change this to your server's name if it's different
$username = "root";         // Your database username
$password = "";             // Your database password
$dbname = "crms1";      // Your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
