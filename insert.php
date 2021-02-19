<?php
require_once('dbconfig.php');

// $empname ="karr";
// $empaddress = "kal";

$insertemp = "INSERT INTO `emp`(`empname`, `empaddress`) VALUES ('ak','hyd')";
$qry  = mysqli_query($dbconfig,$insertemp) or die(mysqli_error($dbconfig));

if($qry)

{
    // $response['status'] = true;
    // $response['message'] = 'insert successfully';

    echo "success";
}

else
{
    echo "failed";

    /* $response['status'] = false;
    $response['message'] = 'insert failed';

    header('content-type:application/json; charset=UTF-8');
    echo json_decode($response); */
}
?>