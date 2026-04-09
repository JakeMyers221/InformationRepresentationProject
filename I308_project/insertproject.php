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

$var_title = $_POST['form_title'];

$var_type = $_POST['form_type'];

$var_description = $_POST['form_description'];

//Insert query to insert form data into the band table

$sql = "INSERT INTO project_ideas (title, type, description) VALUES ('$var_title','$var_type', '$var_description')";

//check for error on insert

if (mysqli_query($con,$sql)) {

  echo "1 record added";

} else { die("SQL Error: " . mysqli_error($con)); }

mysqli_close($con);

?>

<a href="project_ideas.php" class="btn-inventory">Go Back</a>

</body>
</html>