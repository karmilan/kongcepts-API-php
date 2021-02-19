<?php
$dbcon = mysqli_connect('localhost','root','','kongcepts_emp');
if($dbcon)
{
    //echo "connected successfully";
}

else{
    die("connection failed:".mysqli_connect_error());
}
?>
