<?php

require_once "mail/class.phpmailer.php";
require_once "__dbConnect.php";

class mailClass extends PHPMailer{
	private $pdo;
	
	public function __construct(){
		$this->pdo = new dbConnection();
		//set search path to main database
		$this->pdo->dbConn();
		
		$sql = "SELECT configparams_name, configparams_value from configparams where configparams_name='host' or configparams_name='port' or configparams_name='password' or configparams_name='email' or configparams_name='smtpsecure' or configparams_name='smtpauth'";
		$sql = $this->pdo->query($sql);
		for($i=0;$arr=$sql->fetch();$i++){
			$row[$i]=$arr[1];
		}
		$this->IsSMTP(); // telling the class to use SMTP
        $this->SMTPDebug  = 1;                     // enables SMTP debug information (for testing)
        $this->SMTPAuth   = $row[5];                  // enable SMTP authentication
        $this->SMTPSecure = $row[4];                 // sets the prefix to the servier
        $this->Port       = $row[1];                   // set the SMTP port for the GMAIL server   
        $this->Host       = $row[0];      		// sets GMAIL as the SMTP server
        $this->Username   = $row[3];  			// GMAIL username
        $this->Password   = $row[2];            // GMAIL password
	}
	
	/**
 * Method to send emails
 * @param unknown_type $contact
 */
	
	public function sendMail($subject, $to, $from, $msg){
		$this->CharSet="UTF-8";
		$this->SetFrom($from, $from);
        $this->AddReplyTo($from,$from);
		$this->Subject = $subject;
        $this->Body = $msg;
        $this->AddAddress($to, "");
		if(!$this->Send()) {
            //mail error
            return "Could not send mail!";
        } else {
            //mail OK
        	return "Mail successfully sent!";   
        }
	}
}


?>