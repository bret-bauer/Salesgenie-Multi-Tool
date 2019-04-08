<?php
ini_set('memory_limit', '-1');
set_time_limit(28800*2);   // 16 hours
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

// clear sg_city table
$sql="TRUNCATE sg_city";
// $db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);

// set all local to 0
$sql="UPDATE sg_thin_no_span SET local=0";
// $db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
// sleep(10);

// get CSV header from table
$db_fields=array();
$sql="SHOW COLUMNS FROM sg_thin_no_span";
$check=$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
while ($x = $check->fetch_assoc()){
	$db_fields[] = $x;
}
unset($db_fields[0]);
$csv_header="";
foreach($db_fields as $fld) {
	$csv_header.=chr(34).$fld['Field'].chr(34).",";
}
$csv_header=rtrim($csv_header,",");

// big loop of all businesses
$sql="SELECT Latitude,Longitude,local,`Location City` FROM sg_thin_no_span WHERE `Location City` > 'Kingsport' ORDER BY `Location City`";
$check=$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
while ($info = $check->fetch_assoc()) {
	if($info['local']==0) {
		// now find everyone local to this business
		$radius=3;
		$lat=$info['Latitude'];
		$lng=$info['Longitude'];
		$measure=3959;  // earth radius: 3959 miles   6371 kilometers
		$sql="SELECT ROUND(( $measure * acos( cos( radians($lat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude )-radians($lng) ) + sin( radians($lat) ) * sin( radians( Latitude ) ) ) ),(2) ) AS distance FROM sg_thin_no_span WHERE local=0 HAVING distance < $radius";
		$hyper_check=$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
		if($hyper_check->num_rows > 10) {
			mysqli_free_result($hyper_check);
			// select full record with name sort
			$sql="SELECT *, ROUND(( $measure * acos( cos( radians($lat) ) * cos( radians( Latitude ) ) * cos( radians( Longitude )-radians($lng) ) + sin( radians($lat) ) * sin( radians( Latitude ) ) ) ),(2) ) AS distance FROM sg_thin_no_span WHERE local=0 HAVING distance < $radius ORDER BY Company_Name";
			$hyper_check=$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
			// get city count
			$sql="SELECT * FROM sg_city WHERE city='".MQ(strtoupper($info['Location City']))."'";
			$city_check=$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
			if($city_check->num_rows) {
				$city_info = $city_check->fetch_assoc();
				$city_cnt=$city_info['cnt']+1;
				$sql="UPDATE sg_city SET cnt=$city_cnt WHERE id=".$city_info['id'];
				$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
			}
			else
			{
				$sql="INSERT INTO sg_city (city,cnt) VALUES ('".MQ(strtoupper($info['Location City']))."',1)";
				$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
				$city_cnt=1;
			}
			echo "Working on ".strtoupper($info['Location City'])."_$city_cnt - ".$hyper_check->num_rows." neighbors<br>";
			flush();
    		ob_flush();
			// create file
			$fname=strtoupper($info['Location City'])."_".$city_cnt.".csv";
			$fname=str_replace(" ","_",$fname);
			$csv_file = fopen($fname,"w");
			// add header
			fwrite($csv_file,$csv_header.chr(13).chr(10));
			$click=0;
			while ($x = $hyper_check->fetch_assoc()) {
				$rec_id=$x['id'];
				unset($x['id']);
				$line="";
				foreach($x as $f) {
					$line.=chr(34).$f.chr(34).",";
				}
				$line=rtrim($line,",");
				fwrite($csv_file,$line.chr(13).chr(10));
				$sql="UPDATE sg_thin_no_span SET local=1 WHERE id=".$rec_id;
				$db->query($sql) or trigger_error("$sql - Error: ".mysqli_error($db), E_USER_ERROR);
			}
			fclose($csv_file);
		}
	}
}

?>