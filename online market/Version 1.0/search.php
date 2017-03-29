<?php  
    session_start();
    $_SESSION['user'] = $_POST['username'];
    /*
    if (isset($_POST['username'])) {
        $_SESSION['user'] = $_POST['username'];
        $_SESSION['keyword'] = $_POST['keyword'];
        header("Location: search.php");
    }
    */
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Search Results</title>
    </head>
    
    <body>
<?php
    
    //connect to database
    $conn = mysqli_connect('localhost', 'root', 'root', 'onlineMarket');
    
    if (!$conn){
        echo "Error: Unable to connect to MySQL." .mysqli_connect_error();
    }
    
        
    if (isset($_POST['submit'])) {
        
        $input_username = mysqli_real_escape_string($conn, $_POST['username']);
        $input_keyword = mysqli_real_escape_string($conn, $_POST['keyword']);
        
        //check the user
        if (empty($_POST['username'])) {
            echo "<script>alert('Please fill your username')</script>";
            echo "<script>location.href='HW3.html'</script>";
        }
        $check_user = mysqli_query($conn, "SELECT * FROM customer WHERE cname = '$input_username'");
        if (mysqli_num_rows($check_user) < 1) {
            echo "<script>alert('Sorry! you are not in our database.')</script>";
            echo "<script>location.href='HW3.html'</script>";
        }
        
        $search_query = "SELECT * FROM product WHERE pdescription like '%$input_keyword%'";
        $search_res = mysqli_query($conn, $search_query);
        //var_dump(mysqli_num_rows($search_res));
        
        //check if there is any result
        if(mysqli_num_rows($search_res) < 1) {
            echo "<script>alert('Sorry! We didn\'t find what you want.')</script>";
            echo "<script>location.href='HW3.html'</script>";
        }

        //create the search results
        echo "<div class = 'search_rst'>
            <table border='1'>
                <tr>
                    <td>Product Name</td>
                    <td>Description</td>
                    <td>Price</td>
                    <td>Status</td>
                    <td></td>
                </tr>";
        
        while ($row = mysqli_fetch_array($search_res)) {
            $row_pname = $row['pname'];
            echo "<tr><td>".$row_pname."</td>";
            echo "<td>".$row['pdescription']."</td>";
            echo "<td>".$row['pprice']."</td>";
            echo "<td>".$row['pstatus']."</td>";
            echo "<td><form method='post' action='purchase.php'>";
            echo "<input type='submit' name='order' value='Order'>";
            echo "<input type='hidden' name='product' value='".$row_pname."'></form></td></tr>";
            
        }
        echo "</table></div>";
        
        echo "<a href='history.php'><button>View History</button></a>";
        
    }
    
?>
    </body>
</html>