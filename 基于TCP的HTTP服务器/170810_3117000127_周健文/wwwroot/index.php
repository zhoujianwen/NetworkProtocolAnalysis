<meta http-equiv="Content-Type" Content="text/html;charset=utf-8">
<?php
	echo "您好，五邑大学！";
	
	if($_GET["id"] !="")
		echo "id=".$_GET["id"];
	if($_GET["name"] !="")
		echo "#name=".$_GET["name"];
	phpinfo();
?>