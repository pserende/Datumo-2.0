<?php

if(isset($_SESSION['path']))
	require_once $_SERVER["DOCUMENT_ROOT"].$_SESSION['path']."/.htconnect.php";
else {
	echo "Session was lost...";
	exit();
}
class dbConn{
	public function __construct(){
		$conn=new dbConnection();
	}
}



?>