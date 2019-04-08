<?php
ini_set('memory_limit', '-1');
set_time_limit(28800);   // 8 hours
date_default_timezone_set('America/Chicago');

$db_user="bretbaue_remind";
$db_password="aspen2006";
$db_database="bretbaue_remind";
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

$fname="wes.csv";
$file = fopen($fname,"r");
$temp=fgetcsv($file);  // pull off header
$tick=0;
while(! feof($file)) {
	$temp=fgetcsv($file);
	// create blank record in table
	$sql="INSERT INTO sg_data (Tags) VALUES ('tag')";
	$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
	$rec_id=$db->insert_id;
	// update table values
	$db_fields = array();
	$flds=array();
	$sql="SHOW COLUMNS FROM sg_data";
	$check=$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
	while ($x = $check->fetch_assoc()){
		$db_fields[] = $x;
	}
	$fcnt=0;
	foreach ($db_fields as $f) {
		$fn=$f['Field'];
		if($fn !="id") { $flds[$fn]=$temp[$fcnt]; $fcnt++; }
		
	}
	$sql="UPDATE sg_data SET ";
	foreach($flds as $key=>$value) {
		$sql.="`".$key."`='".MQ($value)."',";
	}
	$sql=rtrim($sql,',');
	$sql.=" WHERE id = ".$rec_id;
	
	// echo $sql."<br><br>";
	
	$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);

	$tick++;
	echo $tick." - ";
}
fclose($file);
		
?>