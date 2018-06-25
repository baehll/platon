<?php
	$sql_host="localhost:4000";
	$sql_user="root";
	$sql_password="ciscocisco";
	$sql_database="platon";
	
	$name = $_POST["name"];
	$leiterid = $_POST["leiterid"]
	$start = $_POST["start"]
	$ende = $_POST["ende"]
	
	$con=mysqli_connect($sql_host, $sql_user, $sql_password,$sql_database);

	$sqlquery = "INSERT INTO `projekte` (name, leiterid, start, ende) values ($name, $leiterid, $start, $ende)";

	mysqli_query($con,$sqlquery);

	
?>
