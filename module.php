<?php 

class module{
	private $pdo;
	
	public function __construct($objName){
		$this->pdo=new dbConnection();
		//check if there are any modules available for this table
		$sql="SELECT module_name, module_desc FROM module WHERE module_table='$objName'";
		//loop through all results ... if any
		foreach ($this->pdo->query($sql) as $row){
			echo "<td>";
			echo "<input type=button name=$row[0] id=$row[0] value='$row[1]'>";
			echo "<div id='div_$row[0]' class=regular>";
			$this->$row[0]();
			echo "</div>";
			echo "</td>";
		}
	}
	
	
	public function tables(){
		//set search path to information schema
		$this->pdo->dbInfo();
		$sql="SELECT table_name FROM tables WHERE table_schema='".$this->pdo->getDatabase()."'";
		echo "<table>";
		$i=0; //initialize counter
		foreach ($this->pdo->query($sql) as $row){ //loop through all tables
			$i++; //increment counter to handle row display 
			//initialize row
			if($i==1)	echo "<tr>";
			echo "<td width=100px>$row[0]</td>";
			//end row
			if($i==4){	echo "</tr>";$i=0;}
		}
		echo "</table>";
	}
	
	
}







?>