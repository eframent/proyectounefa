<?php 
session_start();
	$laForm=$_POST;

	$_SESSION["reporte"]=$laForm['nac'].$laForm['Cedula'];
	header("location: ../vistas/pdf/PDF_ConstanciadeEst.php");
?>
