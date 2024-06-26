<?php 
session_start();
include("../clases/cls_ImportFin.php");
$data=$_SESSION['DATA'];
unset($_SESSION['DATA']);
$lobjImport= new cls_ImportFin($data);
$lobjImport->f_Guardar();
if(!isset($_SESSION['Error'])){
	header("location: ../vistas/vis_Importar.php?listo");
}else{
	header("location: ../vistas/vis_Importar.php?fallo");
}
?>