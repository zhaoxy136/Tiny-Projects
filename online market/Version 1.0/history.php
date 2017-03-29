<?php
    session_start();
    $user_name = $_SESSION['user'];
    
    $conn=mysqli_connect('localhost', 'root', 'root', 'onlinemarket');
    if (!$conn){
        echo "Error: Unable to connect to MySQL." .mysqli_connect_error();
    }

    $hist_query="SELECT * FROM purchase WHERE cname = '$user_name'";
    $run_hist=mysqli_query($conn, $hist_query);
    
    echo "<div class='history'><table border='1'><tr>";
    echo "<td>Cuntomer</td>";
    echo "<td>Product</td>";
    echo "<td>Order Time</td>";
    echo "<td>Quantity</td>";
    echo "<td>Price</td>";
    echo "<td>Status</td></tr>";
    while($row=mysqli_fetch_array($run_hist)) {
        echo "<tr><td>".$row['cname']."</td>";
        echo "<td>".$row['pname']."</td>";
        echo "<td>".$row['putime']."</td>";
        echo "<td>".$row['quantity']."</td>";
        echo "<td>".$row['puprice']."</td>";
        echo "<td>".$row['status']."</td></tr>";
        
    }

    echo "</table></div>";
    

?>