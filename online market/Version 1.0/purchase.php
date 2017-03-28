<?php
    session_start();
    //echo $_SESSION['user'];
?>


<!DOCTYPE html>
<html>
    <head>
        <title>Order Status</title>
    </head>
    
    <body>
    <?php
        $conn = mysqli_connect('localhost', 'root', 'root', 'onlineMarket');
    
        if (!$conn){
            echo "Error: Unable to connect to MySQL." .mysqli_connect_error();
        }
        
        if ($_POST['order'] && $_POST['product']) {
            echo $_SESSION['user']."purchases".$_POST['product'];
        }
        
    ?>
    
    
    </body>
</html>