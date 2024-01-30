<?php

// Database connection details
$conn = mysqli_connect("localhost", "root", "", "cheeseshop");


// Get the username and password from the form
$username = $_POST['username'];
$password = $_POST['password'];

// Build the SQL query
$query = "SELECT * FROM users WHERE Username = '$username' AND Password = '$password'";

// Execute the query
$result = mysqli_query($conn, $query);

// Check if there is a matching record
if (mysqli_num_rows($result) >= 1) {
// Login was successful
// Start a session and store the user's information
session_start();
$_SESSION['username'] = $username;
$_SESSION['logged_in'] = true;

// Redirect to the protected page
header('Location: index.php');
exit;
} else {
// Login failed
//var_dump($query);
header('Location: index.php?error=wrong_user_or_pass');
}


?>
