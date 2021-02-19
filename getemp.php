<?php

require_once ('dbconfig.php');

$qry = "SELECT * FROM `emp` WHERE 1";
$sqlexec =mysqli_query ($dbcon, $qry) or die (mysqli_error($dbcon));

if(mysqli_num_rows($sqlexec)>'0')
{
    $i=0;
    while ($val=mysqli_fetch_assoc($sqlexec))
    {
        $emp[$i]['id'] = $val['empid'];
        
        $emp[$i]['name'] = $val['empname'];
        $emp[$i]['nmpname'] = $val['nmp_name'];
        $emp[$i]['address'] = $val['empaddress'];
        $i=$i+1;
    }

    $response['status']=true;
    $response['message']="success";
    $response['data']=$emp;
}
else
{
    $response['status']=false;
    $response['message']="failed";
    $response[]=$emp;
}

header('content-type:application/json; charset=UTF-8');
echo json_encode($response);

?>
