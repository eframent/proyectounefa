<?php 
include("../clases/cls_Proceso.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Pro= new cls_Proceso();
	$lobj_Pro->f_SetsForm($laForm);
}
if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Pro->f_Buscar();
	if($lb_Enc)
	{
		$laForm=$lobj_Pro->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
	$_SESSION["Campos"]=$laForm;
	header("location: ../vistas/vis_Proceso.php");
}
if($laForm['Operacion']!="buscar")
{
	$lb_Hecho=false;
	if($laForm['Operacion']=="lista"){
		$_SESSION['matriz']=$lobj_Pro->fListar(); //le mando la pagina como parametro para resivir el arreglo lleno 
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Proceso.php?buscar");
	}
	else if(($laForm['Operacion']=="verificarPadre")){
		header('Content-Type: text/xml');
		$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
		$xml.="<cuerpo>\n";
		$lb_Enc=false;
		$lb_Enc=$lobj_Pro->f_VerificarPadre();
		$laForm=$lobj_Pro->f_GetsForm();
		if($lb_Enc)
		{
			$xml.="<FechaPeraca>".$laForm['FechaPeraca']."</FechaPeraca>";
			$xml.="<NombrePadre>".$laForm['NombrePadre']."</NombrePadre>";
			$xml.="<FechaPadre>".$laForm['FechaPadre']."</FechaPadre>";
			$xml.="<Holgura>".$laForm['Holgura']."</Holgura>";
			$xml.="<padre>1</padre>";
		}
		else
		{	
			$xml.="<NombrePadre>".$laForm['NombrePadre']."</NombrePadre>";
			$xml.="<FechaPeraca>".$laForm['FechaPeraca']."</FechaPeraca>";
			$xml.="<Holgura>".$laForm['Holgura']."</Holgura>";
			$xml.="<padre>0</padre>";
		}
		echo $xml."</cuerpo>";
	}
	else if(($laForm['Operacion']!="lista")&&($laForm['Operacion']!="verificarPadre"))
	{
		$lb_Hecho=$lobj_Pro->f_Operacion();
		if($lb_Hecho)
		{
			$laForm['Hacer']="Listo";
		}
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Proceso.php");
	}
}
?>