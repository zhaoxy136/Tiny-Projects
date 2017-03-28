<?php
    
    
    if (isset($_POST['submit'])) {
        
        var_dump(isset($_POST['username']));
        echo "<br/>";
        var_dump(empty($_POST['username']));
        echo "<br/>";
        echo "<br/>";
        echo "<br/>";
        
        //unset($_POST['username']);
        $a = NULL;
        var_dump(isset($a));
        
    }
?>