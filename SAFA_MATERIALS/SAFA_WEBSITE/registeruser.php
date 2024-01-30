<?php

// Connect to the database

$conn = mysqli_connect("localhost", "root", "", "cheeseshop");

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get the form data
$username = $_POST["username"];
$password = $_POST["password"];
$email = $_POST["email"];
$address = $_POST["address"];

// Construct the INSERT statement
$sql = "INSERT INTO users (Username, Password, Email, Address) VALUES ('$username', '$password', '$email', '$address')";

// Attempt to execute the query
if (mysqli_query($conn, $sql)) {
    echo "Registration successful!";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

// Close the connection
mysqli_close($conn);

$redirect_url = 'index.php';
header('Location: ' . $redirect_url, true, 301);

?>
