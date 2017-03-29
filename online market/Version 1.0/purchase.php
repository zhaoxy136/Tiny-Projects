<?php
    
    date_default_timezone_set('America/New_York');
    session_start();
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
            
            $order_cname=$_SESSION['user'];
            $order_product=$_POST['product'];
            
            //check if the product is available
            $check_status="SELECT pprice, pstatus FROM product WHERE pname = '$order_product'";
            $run_check=mysqli_query($conn, $check_status);
            
            
            $check_row=mysqli_fetch_array($run_check);
            //var_dump($check_row['pstatus']);
            
            if ($check_row['pstatus'] != 'available') {
                //TODO
                echo "not available";
            } else {
                $add_query="SELECT * FROM purchase WHERE cname = '$order_cname' AND pname = '$order_product'";
                // wrong expression: 
                // $add_query="SELECT * FROM purchase WHERE cname = ".$order_cname." AND pname = ".$order_product;            
                $run_add=mysqli_query($conn, $add_query);
                
                $pprice = $check_row['pprice'];
                $pdate = date('Y-m-d H:i:s');
                //if the user hasn't ordered such product
                if (mysqli_num_rows($run_add) < 1) {
                    //echo "hh";
                    $insert_query = "insert into purchase(cname, pname, putime, quantity, puprice, status) values ('$order_cname', '$order_product', '$pdate', '1', '$pprice', 'pending')";
                    $run_insert = mysqli_query($conn, $insert_query);
                    
                    
                } else {//the user had ordered the same product
                    $order_update = "UPDATE purchase SET putime='$pdate', puprice = puprice+'$pprice', quantity = quantity + 1, status = 'pending' WHERE cname = '$order_cname' AND pname = '$order_product'";
                    $run_update = mysqli_query($conn, $order_update);
                    
                }
                
                echo "<h2>Your Order has been processed.</h2>";
                echo "<a href='search.php'><button>Continue Shopping</button></a>";
                //echo "<script> window.location.href='search.php'</script>";
                
            }
            
        }
        
    ?>
    
    
    </body>
</html>