<?php 
include("../clases/cls_Dedicacion.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Val= new cls_Dedicacion();
	$lobj_Val->f_SetsForm($laForm);
}
if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Val->f_Buscar();
	if($lb_Enc)
	{
		$laForm=$lobj_Val->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
	$_SESSION["Campos"]=$laForm;
	header("location: ../vistas/vis_Dedicacion.php");
}
if($laForm['Operacion']!="buscar")
{
	$lb_Hecho=false;
	if($laForm['Operacion']=="lista"){
		$_SESSION['matriz']=$lobj_Val->fListar(); //le mando la pagina como parametro para resivir el arreglo lleno 
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Dedicacion.php?buscar");
	}
	else if($laForm['Operacion']!="lista")
	{
		$lb_Hecho=$lobj_Val->f_Operacion();
		if($lb_Hecho)
		{
			$laForm['Hacer']="Listo";
		}
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Dedicacion.php");
	}
}
?>