<?php 
include("../clases/cls_Municipio.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Municipio= new cls_Municipio();
	$lobj_Municipio->f_SetsForm($laForm);
}
if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Municipio->f_Buscar();
	if($lb_Enc)
	{
		$laForm=$lobj_Municipio->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
	$_SESSION["Campos"]=$laForm;
	header("location: ../vistas/vis_Municipio.php");
}
if($laForm['Operacion']!="buscar")
{
	$lb_Hecho=false;
	if($laForm['Operacion']=="lista"){
		$_SESSION['matriz']=$lobj_Municipio->fListar(); //le mando la pagina como parametro para resivir el arreglo lleno 
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Municipio.php?buscar");
	}
	else if($laForm['Operacion']!="lista")
	{
		$lb_Hecho=$lobj_Municipio->f_Operacion();
		if($lb_Hecho)
		{
			$laForm['Hacer']="Listo";
		}
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Municipio.php");
	}
}
?>
