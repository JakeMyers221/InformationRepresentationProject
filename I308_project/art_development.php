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
                <a class="nav-item nav-link active" href="art_development.php">Art Development</a>
                <a class="nav-item nav-link" href="previous_art.php">Previous Art</a>
                <a class="nav-item nav-link" href="client_list.php">Client List</a>
                <a class="nav-item nav-link" href="project_ideas.php">Project Ideas</a>
            </div>
        </div>
    </nav>

    <div class="inventory-page">
        <header>
            <h1>Art Development</h1>
            <p>Explore our ongoing projects and creative processes behind each piece of art we develop.</p>
        </header>
    </div>


    <div class="container mt-5">
        <?php
            $conn = mysqli_connect("db.luddy.indiana.edu", "i308s25_team37", "flong6205ulama", "i308s25_team37");
    
            if (!$conn) {
                die("Connection failed: " . mysqli_connect_error());
            }
    
            $sql = "SELECT ID, name, type, description, anticipated_date, anticipated_cost, status FROM artwork WHERE anticipated_date IS NOT NULL ORDER BY anticipated_date ";
            $result = mysqli_query($conn, $sql);
    
            if (mysqli_num_rows($result) > 0) {
                echo "<table class='table table-striped table-bordered mt-5'>";
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
        </div>


    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>