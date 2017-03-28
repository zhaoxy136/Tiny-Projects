<?php
    $conn = mysqli_connect("localhost", "root", "123cc123", "onlineMarket");

    if (!$conn){
        echo "Error: Unable to connect to MySQL." .$conn->connect_error;
    }
?>    