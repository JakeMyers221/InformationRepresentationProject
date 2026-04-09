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
                <a class="nav-item nav-link" href="previous_art.php">Previous Art</a>
                <a class="nav-item nav-link" href="client_list.php">Client List</a>
                <a class="nav-item nav-link active" href="project_ideas.php">Project Ideas</a>
            </div>
        </div>
    </nav>


    <div class="inventory-page">
        <header>
            <h1>Our Project Ideas</h1>
            <p>Explore our collection of creative project ideas, designed to inspire your next artistic venture or collaboration.<p>
        </header>
    </div>

    <div style="display: flex; justify-content: space-between; align-items: flex-start;">
        <div class='available-artwork'>
        <h2>Project Ideas</h2>
        <p>Explore some of our current project ideas! Each concept is designed to inspire creativity and collaboration. If you have an idea you'd like to see brought to life, we'd love to hear from you. Simply fill out the form below to suggest a new project!</p>

            <form action="insertproject.php" method="post" style="padding-top: 80px">
            New Project 
            <br>
            Title: <input type="text" name= "form_title" required><br>
            <br>
            Type: <input type="text" name= "form_type" required><br>
            <br>
            Description: <input type="text" name= "form_description" required><br>
            <br>
            <input type="submit" value ="Insert Project" ><br>
        </div>  
        <div class='available-table'>
            <?php
                $conn = mysqli_connect("db.luddy.indiana.edu", "i308s25_team37", "flong6205ulama", "i308s25_team37");

                if (!$conn) {
                    die("Connection failed: " . mysqli_connect_error());
                }

                $sql = "SELECT ID, title, type, description FROM project_ideas";
                $result = mysqli_query($conn, $sql);

                if (mysqli_num_rows($result) > 0) {
                    echo "<table class='table table-striped table-bordered mt-5'>";
                    echo "<tr> <th>ID</th> <th>Title</th> <th>Type</th> <th>Description</th> </tr>";
                    
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr> 
                                <td>{$row['ID']}</td>
                                <td>{$row['title']}</td>
                                <td>{$row['type']}</td>
                                <td>{$row['description']}</td>
                                <td>{$row['anticipated_cost']}</td>
                            </tr>";
                    }
                    echo "</table>";
                } else {
                    echo "0 results";
                }
            ?>
        </div>
    </div>
    <div style="display: flex; justify-content: space-between; align-items: flex-start;">
        <div class='available-artwork'>
            <h2>Discover Artwork Inspired by Project Ideas</h2>
            <p>Explore our curated collection of artwork that originated from client-submitted project ideas. Each piece reflects unique visions brought to life through creativity and collaboration.</p>
            <br>
            <p>If you're interested in any of these inspiring works or have questions about how project ideas are transformed into art, feel free to reach out. Our team would love to share more details with you!</p>
        </div>
        <div class="available-table">
        <?php
            $sql = "SELECT artwork.ID, artwork.name, artwork.type, artwork.description, artwork.anticipated_date FROM artwork WHERE artwork.ID IN (SELECT artid FROM comes_from) ORDER BY artwork.name";
            $result = mysqli_query($conn, $sql);

            if (mysqli_num_rows($result) > 0) {
                echo "<table class='table table-striped table-bordered mt-5'>";
                echo "<tr> <th>ID</th> <th>Name</th> <th>Type</th> <th>Description</th> <th>Anticipated Date</th> </tr>";
                
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr> 
                            <td>{$row['ID']}</td>
                            <td>{$row['name']}</td>
                            <td>{$row['type']}</td>
                            <td>{$row['description']}</td>
                            <td>{$row['anticipated_date']}</td>
                        </tr>";
                }
                echo "</table>";
            } else {
                echo "0 results";
            }
        ?>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>