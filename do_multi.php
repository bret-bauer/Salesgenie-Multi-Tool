<?php
ini_set('memory_limit', '-1');
set_time_limit(28800);   // 8 hours
date_default_timezone_set('America/Chicago');

$db_user="root";
$db_password="stip8wod7ye6ov6";
$db_database="salesgenie";
// Connect to Database
$db = new mysqli("localhost", $db_user, $db_password, $db_database);
if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}
$db->autocommit(true);
// clean string function
function MQ($s) {
	global $db;
    return $db->real_escape_string($s);
}

$sql="SELECT sg_thin_no_span.Company_Name,sg_thin_no_span.id
FROM sg_thin_no_span
   INNER JOIN (SELECT Company_Name
               FROM   sg_thin_no_span
               GROUP  BY Company_Name
               HAVING COUNT(id) > 1) dup
           ON sg_thin_no_span.Company_Name = dup.Company_Name
           ORDER BY Company_Name";
$check=$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
$click=0;
while ($x = $check->fetch_assoc()) {
	$click++;
	echo $click." - ";
	$sql="UPDATE sg_thin_no_span SET multi=1 WHERE id=".$x['id'];
	$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
}

?>