<?php
	session_start();
	$url=$_GET["url"];
	unset($_GET["url"]);
	$_SESSION['Campos']=$_GET;
	$_SESSION['Campos']['Operacion']='buscar';
	$_SESSION['Campos']['Hay']=1;
	header("location: ../../../vistas/vis_".$url.".php ");
?>