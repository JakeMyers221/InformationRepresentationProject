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
                <a class="nav-item nav-link active" href="client_list.php">Client List</a>
                <a class="nav-item nav-link" href="project_ideas.php">Project Ideas</a>
            </div>
        </div>
    </nav>

    
    <div class="inventory-page">
        <header>
            <h1>Client List</h1>
            <p>Browse through our list of clients and discover the pieces they've purchased, with full details and history.</p>
        </header>
    </div>
    <div style="display: flex; justify-content: space-between; align-items: flex-start;">
        <div class='available-artwork'>
        <h2>Our Client List</h2>
        <p>Explore our list of clients below, including their contact information, project preferences, and ideas. We’re proud to work with such a creative and inspiring community!</p>
        <br>
        <p>If you would like to add a new client, please fill out the form. Our team looks forward to connecting with you!</p>

        <form action="insertclient.php" method="post" style="padding-top: 50px">
            New Client 
            <br>
            First Name: <input type="text" name="name_first" required><br><br>
            Last Name: <input type="text" name="name_last" required><br><br>
            Street Address: <input type="text" name="address_street" required><br><br>
            City: <input type="text" name="address_city" required><br><br>
            State (2 letters): <input type="text" name="address_state" maxlength="2" required><br><br>
            Zip Code (5 digits): <input type="text" name="address_zip" maxlength="5" required><br><br>
            Email: <input type="email" name="email" required><br><br>
            Phone: <input type="text" name="phone" required><br><br>
            Art Preference: <input type="text" name="art_preference"><br><br>
            Project Purchased (Y/N): <input type="text" name="project_purchased" maxlength="1" required><br><br>
            Client Ideas:<br>
            <textarea name="client_ideas" rows="5" cols="40"></textarea><br><br>

            <input type="submit" value="Insert Client">
        </div>  
        <div class='available-table'>
            <?php
                $conn = mysqli_connect("db.luddy.indiana.edu", "i308s25_team37", "flong6205ulama", "i308s25_team37");

                if (!$conn) {
                    die("Connection failed: " . mysqli_connect_error());
                }

                $sql = "SELECT ID, CONCAT(name_first, ' ', name_last) AS full_name, CONCAT(address_street, ', ', address_city, ', ', address_state, ' ', address_zip) AS full_address, email, phone, art_preference, project_purchased, client_ideas FROM client ORDER BY ID";
                $result = mysqli_query($conn, $sql);

                if (mysqli_num_rows($result) > 0) {
                    echo "<table class='table table-striped table-bordered mt-5'>";
                    echo "<tr> <th>ID</th> <th>Name</th> <th>Address</th> <th>Email</th> <th>Phone</th> <th>Art Preference</th> <th>Projects Purchased</th> <th>Client Ideas</th> </tr>";
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<tr> 
                                <td>{$row['ID']}</td>
                                <td>{$row['full_name']}</td>
                                <td>{$row['full_address']}</td>
                                <td>{$row['email']}</td>
                                <td>{$row['phone']}</td>
                                <td>{$row['art_preference']}</td>
                                <td>{$row['project_purchased']}</td>
                                <td>{$row['client_ideas']}</td>
                            </tr>";
                    }
                    echo "</table>";
                } else {
                    echo "0 results";
                }
            ?>
        </div>
    </div>
    <div class="inventory-page">
        <h1>Client Purchases</h1>
        <p>Explore our list of clients and see how many purchases each one has made. Each purchase supports unique, handcrafted artwork. Use the form to add new clients or update existing records!</p>
    </div>
    <div class="table-wrapper">
    <?php

        $sql = "SELECT CONCAT(client.name_first, ' ', client.name_last) AS full_name, COUNT(sale.artid) AS total_purchases FROM sale JOIN client ON sale.clientid = client.ID GROUP BY client.ID, client.name_first, client.name_last ORDER BY client.ID";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            echo "<table class='table table-striped table-bordered mt-5'>";
            echo "<tr> <th>Name</th> <th>Total Purchases</th> </tr>";
            
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr> 
                        <td>{$row['full_name']}</td>
                        <td>{$row['total_purchases']}</td>
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