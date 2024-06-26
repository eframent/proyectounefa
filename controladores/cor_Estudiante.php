<?php 
include("../clases/cls_Estudiante.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$laForm["contrasena"]=md5($laForm["contrasena"]);
	$laForm["contrasena"]=sha1($laForm["contrasena"]);
	$lobj_Est= new cls_Estudiante();
	$lobj_Est->f_SetsForm($laForm);
}
if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Est->f_Buscar();
	if($lb_Enc)
	{
		$laForm=$lobj_Est->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
	$_SESSION["Campos"]=$laForm;
	header("location: ../vistas/vis_Estudiante.php");
}
if($laForm['Operacion']!="buscar")
{
	$lb_Hecho=false;
	if($laForm['Operacion']=="lista"){
		$_SESSION['matriz']=$lobj_Est->fListar(); //le mando la pagina como parametro para resivir el arreglo lleno 
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Estudiante.php?buscar");
	}
	else if($laForm['Operacion']!="lista")
	{
		if($laForm['Operacion']=="incluir"){
			$lb_Hecho=$lobj_Est->f_Incluir();
			if($lb_Hecho)
			{
				$laForm['Hacer']="Listo";
			}
		}else if($laForm['Operacion']=="modificar"){
			$lb_Hecho=$lobj_Est->f_Modificar();
			if($lb_Hecho)
			{
				$laForm['Hacer']="Listo";
			}
		}else if($laForm['Operacion']=="eliminar"){
			$lb_Hecho=$lobj_Est->f_Eliminar();
			if($lb_Hecho)
			{
				$laForm['Hacer']="Listo";
			}
		}
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Estudiante.php");
	}
}
?>