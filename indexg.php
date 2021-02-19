<?php
require_once('dbconfig.php');

$empname = $_GET['n'];
$empaddress = $_GET['a'];

// $insertemp = "INSERT INTO 'emp'('empname','empaddress') VALUES ('$empname', '$empaddress')";
$insertEmp = "INSERT INTO `emp`(empname, empaddress) VALUES ('$empname','$empaddress')";
$qry  = mysqli_query($dbcon, $insertEmp) or die(mysqli_error($dbconfig));

if($qry) {
    $response['status'] = true;
    $response['message'] = "insert successfully";
}

else
{
    $response['status'] = false;
    $response['message'] = "insert failed";
}
header('Content-type:application/json; charset=utf-8');
echo json_encode($response);

// header('Content-Type:application/JSON charset=UTF-8');
// echo json_encode($response, true);

?>