<?php 
include("../clases/cls_Asignar.php");
session_start();
if(array_key_exists(registros,$_POST))
{
	$laForm=explode("/",$_POST['registros']);
	$laForm['Cargo']=$_POST['Cargo'];
	$laForm['Operacion']=$_POST['Operacion'];
	$lobj_Asignar= new cls_Asignar();
	$lobj_Asignar->f_SetsForm($laForm);
}
if($laForm['Operacion']!="buscar")
{
	$lb_Hecho=false;
	$lb_Hecho=$lobj_Asignar->f_Operacion();
	if($lb_Hecho)
	{
		$laForm['Hacer']="Listo";
	}else{
		$laForm['Hacer']="No";
	}
	$_SESSION["campos"]["Hacer"]=$laForm['Hacer'];
	header("location: ../vistas/vis_Asignar.php?Nombre=".$laForm['Cargo']);
}
?>
