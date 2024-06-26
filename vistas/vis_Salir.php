<?php 
	session_start();
	include_once("../clases/cls_Session.php");
	$lobjSession=new cls_Session;
	if(isset($_GET['ruta'])){
		$ruta=$_GET['ruta'];
	}else{
		$ruta;
	}
	if(isset($_SESSION['usuario'])){
		$lobjSession->f_CerrarSession($ruta);
	}
	session_destroy();
	header("location: ../index.php");
?>
