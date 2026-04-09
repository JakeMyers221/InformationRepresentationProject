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
    <nav class="navbar navbar-expand-lg navbar-dark bg-secondary fixed-top">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-item nav-link" href="index.html">Home</a>
                <a class="nav-item nav-link" href="art_inventory.php">Art Inventory</a>
                <a class="nav-item nav-link" href="art_development.php">Art Development</a>
                <a class="nav-item nav-link active" href="previous_art.php">Previous Art</a>
                <a class="nav-item nav-link" href="client_list.php">Client List</a>
                <a class="nav-item nav-link" href="project_ideas.php">Project Ideas</a>
            </div>
        </div>
    </nav>

    <div class="inventory-page">
        <h1>Previously Sold Artwork</h1>
        <p>Take a look at the artwork that has already found a home! Each piece showcased here represents a completed creative journey, highlighting the imagination and craftsmanship of our artists.</p>
    </div>
    <div class="table-wrapper">
    <?php
        $conn = mysqli_connect("db.luddy.indiana.edu", "i308s25_team37", "flong6205ulama", "i308s25_team37");
    
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        $sql = "SELECT ID, name, type, description, status FROM artwork WHERE status = 'S' ORDER BY name ASC";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            echo "<table class='table table-striped table-bordered mt-5'>";
            echo "<tr> <th>ID</th> <th>Name</th> <th>Type</th> <th>Description</th> <th>Status</th> </tr>";
            
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr> 
                        <td>{$row['ID']}</td>
                        <td>{$row['name']}</td>
                        <td>{$row['type']}</td>
                        <td>{$row['description']}</td>
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
    </div>


    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>