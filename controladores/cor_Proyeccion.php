<?php 
include("../clases/cls_Proyeccion.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$la_Variable=$_POST["variable"];
	unset($_POST["variable"]);
	$laForm=$_POST;
	$lobj_Proyeccion= new cls_Proyeccion();
	$lobj_Proyeccion->f_SetsForm($laForm);
	$lobj_Proyeccion->f_SetsVariable($la_Variable);
}
if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Proyeccion->f_Buscar();
	if($lb_Enc)
	{
		$laForm=$lobj_Proyeccion->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
	$_SESSION["Campos"]=$laForm;
	header("location: ../vistas/vis_Proyeccion.php");
}
if($laForm['Operacion']!="buscar")
{
	$lb_Hecho=false;
	if($laForm['Operacion']=="lista"){
		$_SESSION['matriz']=$lobj_Proyeccion->fListar(); //le mando la pagina como parametro para resivir el arreglo lleno 
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Proyeccion.php?buscar");
	}
	else if($laForm['Operacion']=="eliminar")
	{
		$lb_Hecho=$lobj_Proyeccion->f_Eliminar();
		if($lb_Hecho)
		{
			$laForm['Hacer']="Listo";
		}
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_ProyeccionSec.php");
	}
	else if($laForm['Operacion']=="cargarModificacion")
	{
		$lb_Hecho=$lobj_Proyeccion->f_CargarModificacion();
		if($lb_Hecho)
		{
			$laForm['Hacer']="Listo";
		}
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Proyeccion.php");
	}
	else if(($laForm['Operacion']!="lista")&&($laForm['Operacion']!="eliminar")&&($laForm['Operacion']!="cargarModificacion"))
	{
		$lb_Hecho=$lobj_Proyeccion->f_Guardado();
		if($lb_Hecho)
		{
			$laForm['Hacer']="Listo";
		}
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_ProyeccionSec.php");
	}
}
?>
