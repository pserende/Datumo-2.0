<?php 
require_once "session.php";
$user_id=startSession();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/tipTip.css" rel="stylesheet" type="text/css">
<link href="css/redmond/jquery-ui-1.8.9.custom.css" rel="stylesheet" type="text/css">
<link href="js/src/css/ui.jqgrid.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.4.4.js"></script>
<script type="text/javascript" src="js/src/grid.loader.js"></script>
<script type="text/javascript" src="js/jquery.reports.js"></script>
<script type="text/javascript" src="js/jquery.tipTip.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="js/jquery.print.js"></script>
<style>

div.grouping{
	font-family:Verdana, Geneva, sans-serif; 
	font-size:12px; 
	line-height:20px; 
}


</style>

</head>
<?php 

require_once "__dbConnect.php";
require_once "resClass.php";
require_once "reportClass.php";

//call database class
$conn=new dbConnection();
$res=new restrictClass();
$report=new reportClass();
$database=$conn->getDatabase();//set database name

//url variables
if(isset($_GET['report']))	$report_id=$_GET['report'];

//get report information 
$report->reportInfo($report_id);
$reportName=$report->getReportName();
$reportDesc=$report->getReportDesc();
echo "<title>$reportName</title>";
echo "<div class=grouping>";
$query="SELECT reprop_attribute, reprop_mask FROM reprop WHERE reprop_report=$report_id";
$sql=$conn->query($query);
echo "Name: <b>$reportName</b><br>";
echo "Description: <b>$reportDesc</b><br><br>";
echo "Group results by:  ";
echo "<select id=grouping name=grouping>";
echo "<option value=clear>No grouping</option>";
for($i=0;$row=$sql->fetch();$i++){
	echo "<option value=$row[0]>$row[1]</option>";
}
echo "</select>";
echo "</div>";
echo "<br>";
echo "<body onload=\$(document).createGrid({report_id:$report_id});>";
echo "<table id=list></table>";
echo "<div id=pager></div>"; 



?>
<form method="post" action="csvExport.php">
    <input type="hidden" name="csvBuffer" id="csvBuffer" value="" />
</form>
