<?php 
include("../clases/cls_Solicitud.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Solicitud= new cls_Solicitud();
	$lobj_Solicitud->f_SetsForm($laForm);
}
if($laForm['Operacion']!="buscar")
{
	$lb_Hecho=$lobj_Solicitud->f_Operacion();
	if($lb_Hecho)
	{
		$laForm=array();
		
		if($laForm['Solicitudes']=="RMS"){
			header("location: ../vistas/pdf/PDF_Retiro-RMS.php");
		}else if($laForm['Solicitudes']=="RPS"){
			header("location: ../vistas/pdf/PDF_Retiro-RPS.php");
		}else if($laForm['Solicitudes']=="RPV"){
			header("location: ../vistas/pdf/PDF_Retiro-RPV.php");
		}else if($laForm['Solicitudes']=="R"){
			header("location: ../vistas/pdf/PDF_Reinrgeso.php");
		}
		$laForm['Mensaje']="Solicitud Realizada con Exito";
	}
	$_SESSION["Campos"]=$laForm;
	header("location: ../vistas/vis_Solicitudes.php");
}
?>
