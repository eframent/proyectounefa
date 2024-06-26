<?php 
include("../clases/cls_Confirmar_CINU.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Tip= new cls_Confirmar_CINU();
	$lobj_Tip->f_SetsForm($laForm);
}
if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Tip->f_Buscar();
	if($lb_Enc)
	{
		$laMatriz=$lobj_Tip->f_GetsMatriz();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
	$_SESSION["Campos"]=$laForm;
	$_SESSION["Matri"]=$laMatriz;
	
	header("location: ../vistas/vis_Confirmar_CINU.php");
}
if($laForm['Operacion']!="buscar")
{
	$lb_Hecho=false;
	if($laForm['Operacion']=="lista"){
		$_SESSION['matriz']=$lobj_Tip->fListar(); //le mando la pagina como parametro para resivir el arreglo lleno 
		$_SESSION["Campos"]=$laForm;
		header("location: ../vistas/vis_Confirmar_CINU.php?buscar");
	}
	else if($laForm['Operacion']!="lista")
	{
		$lb_Auxiliar=$lobj_Tip->f_Operacion();
		if($lb_Hecho)
		{
			$laForm['Hacer']="Listo";
		}
		$_SESSION["Campos"]=$laForm;
		$lb_Enc=$lobj_Tip->f_Buscar();
	if($lb_Enc)
	{
		$laMatriz=$lobj_Tip->f_GetsMatriz();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
	$_SESSION["Campos"]=$laForm;
	$_SESSION["Matri"]=$laMatriz;
		header("location: ../vistas/vis_Confirmar_CINU.php");
	}
}
?>
