<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Find Workers</title>
    <link rel="stylesheet" href="https://cgi.luddy.indiana.edu/~kmuehlha/i308.css">
</head>
<body>

<?php
$conn = mysqli_connect("db.luddy.indiana.edu", "i308s25_team37", "flong6205ulama", "i308s25_team37");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Add your actual SQL query here — change 'your_table_name' to the real one
$sql = "SELECT ID, name, type, description, anticipated_date, anticipated_cost, status FROM your_table_name";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    echo "<table>";
    echo "<tr> <th>ID</th> <th>Name</th> <th>Type</th> <th>Description</th> <th>Anticipated Date</th> <th>Anticipated Cost</th> <th>Status</th> </tr>";
    
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr> 
                <td>{$row['ID']}</td>
                <td>{$row['name']}</td>
                <td>{$row['type']}</td>
                <td>{$row['description']}</td>
                <td>{$row['anticipated_date']}</td>
                <td>{$row['anticipated_cost']}</td>
                <td>{$row['status']}</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

mysqli_free_result($result);
mysqli_close($conn);
?>

</body>
</html>
