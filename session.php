<?php 

/**
 * @author Jo�o Lagarto
 * @abstract Script that enclosures several methods to handle $_SESSION variables
 * 
 * 
 */

//includes
require_once (".htconnect.php");
require_once ("dispClass.php");

//http variables
if(isset($_GET['login'])){	login();}
if(isset($_GET['logout'])){	logout();}
if(isset($_GET['pwd'])){	recoverPwd();}

function login(){
	//includes
	require_once ("genObjClass.php");
	//call classes
	$db = new dbConnection();
	$genObj = new genObjClass();
	$database=$db->getDatabase();
	
	//posted variables
	if(isset($_POST['login'])){ $user_login = $_POST['login'];}
	if(isset($_POST['pass'])){ $user_passwd = $_POST['pass'];}
	
	//crypt password
	$user_passwd = $genObj->cryptPass($user_passwd);
	$sql = $db->prepare("SELECT user_id FROM ".$db->getDatabase().".user WHERE user_login='$user_login' AND user_passwd='$user_passwd'");
	$sql->execute();
	//is there any match for this key??
	if($sql->rowCount()>0){
		$row = $sql->fetch();
		initSession($row[0],$database);
	} else {
		echo "Wrong login";
	}
}


function initSession($user_id,$database){
	session_start();
	$_SESSION['user_id']=$user_id;
	$_SESSION['database']=$database;	
}

function startSession(){
	session_start();
	$db = new dbConnection();
	$database=$db->getDatabase();
	$_SESSION['user_id']=1;			//comment this line when not debugging
	$_SESSION['database']="datumo"; //comment this line when not debugging
	if(isset($_SESSION['user_id']) and $_SESSION['database']==$database){
		$user = $_SESSION['user_id'];
		return $user; 
	} else {
		notlogged();
	}
}

function logout(){
	session_start(); //start session if it has not been started
	session_destroy();
	echo "<meta HTTP-EQUIV='REFRESH' content='0; url=./'>";
}

function notlogged(){
	session_destroy();
	echo "We are watching you!! Return to <a href=./>homepage</a>";
	//echo "<meta HTTP-EQUIV='REFRESH' content='0; url=./'>";
	exit();
}

function recoverPwd(){
	//includes
	require_once ("mailClass.php");
	require_once ("genObjClass.php");
	//call class
	$mail = new mailClass();
	$db = new dbConnection();
	$genObj = new genObjClass();

	//http variables
	if(isset($_GET['email'])){ $user_email = $_GET['email'];}
	if(isset($_GET['user'])){ $user_login = $_GET['user'];}
	
	
	$sql=$db->prepare("SELECT user_login FROM ".$db->getDatabase().".user WHERE user_email='$user_email' AND user_login='$user_login'");
	$sql->execute();
	//is there any user with this email?
	if($sql->rowCount()>0){
		$newpass=createPwd();
		$newpass_crypt=$genObj->cryptPass($newpass);
		$row = $sql->fetch();
		$login = $row[0];
		$sql=$db->prepare("UPDATE ".$db->getDatabase().".user SET user_passwd='$newpass_crypt' WHERE user_login='$login'");
		try{
			$sql->execute();
			$subject = "Datumo: ".$db->getDescription();
			$to = $user_email;
			$from=$db->getAdmin();
			$msg = "Username: $login\n";
			$msg.= "Password: $newpass\n\n";
			$msg.= "This is an automatic message. Do not reply";
			$mail->sendMail($subject, $to, $from, $msg);
		}catch(Exception $e){
			echo "Could not update password. Please contact the software administator";
		}
	} else {
		echo "Incorrect email. Please try again";
	}
		
	
	
}


function createPwd(){
	$length = 10;
	$characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	$str = "";    
	//random password creation
	for ($p = 0; $p < $length; $p++) {
		$str .= $characters[mt_rand(0, strlen($characters))];
	}
	return $str;
}


?>