<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>I308</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<?php

$con = mysqli_connect("db.luddy.indiana.edu", "i308s25_team37", "flong6205ulama", "i308s25_team37");

// Check connection

if (mysqli_connect_errno())

   { die("Failed to connect to MySQL: " . mysqli_connect_error()); }

else

   { echo "Established Database Connection";}

//escape variables for security sql injection

$var_firstname = $_POST['name_first'];

$var_lastname = $_POST['name_last'];

$var_street = $_POST['address_street'];

$var_city = $_POST['address_city'];

$var_state = $_POST['address_state'];

$var_zip = $_POST['address_zip'];

$var_email = $_POST['email'];

$var_phone = $_POST['phone'];

$var_art_preference = $_POST['art_preference'];

$var_project_purchased = $_POST['project_purchased'];

$var_client_ideas = $_POST['client_ideas'];
//Insert query to insert form data into the band table

$sql = "INSERT INTO client (name_first, name_last, address_street, address_city, address_state, address_zip, email, phone, art_preference, project_purchased, client_ideas) VALUES ('$var_firstname','$var_lastname', '$var_street', '$var_city', '$var_state', '$var_zip', '$var_email', '$var_phone', '$var_art_preference', '$var_project_purchased', '$var_client_ideas')";

//check for error on insert

if (mysqli_query($con,$sql)) {

  echo "1 record added";

} else { die("SQL Error: " . mysqli_error($con)); }

mysqli_close($con);

?>

<a href="client_list.php" class="btn-inventory">Go Back</a>

</body>
</html>