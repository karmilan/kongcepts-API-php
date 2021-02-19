<?php

require_once('dbconfig.php');

$qry = "SELECT * FROM `employee`";
$sqlexec = mysqli_query( $dbcon, $qry) or die (mysqli_error($dbcon)); 

if (mysqli_num_rows($sqlexec)>0)
{
    $i=0;
    while($val = mysqli_fetch_assoc($sqlexec))
    {
        $emoloyee[$i] ['emp_id'] = $val['emp_id'];
        $emoloyee[$i] ['emp_name'] = $val['emp_name'];
        $emoloyee[$i] ['emp_email'] = $val['emp_email'];
        $emoloyee[$i] ['emp_photo'] = $val['emp_photo'];
        $emoloyee[$i] ['branch_name'] = $val['branch_name'];
        $emoloyee[$i] ['bank_name'] = $val['bank_name'];
        $i=$i+1;
    }

    $response ['status'] = true;
    $response['message'] = "success";
    $response['data'] = $emoloyee;
}

else
{
    $response ['status'] = false;
    $response['message'] = "failed";
    $response[] = $emoloyee;
}

header('content-type:application/json; charset=UTF-8');
echo json_encode($response);

?>