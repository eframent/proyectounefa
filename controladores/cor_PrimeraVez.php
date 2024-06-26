<?php 
include("../clases/cls_PrimeraVez.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Tip= new cls_PrimeraVez();
	$lobj_Tip->f_SetsForm($laForm);
}else{
	$laForm=$_GET;
	$lobj_Tip= new cls_PrimeraVez();
	$lobj_Tip->f_SetsForm($laForm);
}
if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Tip->f_Buscar();
	if($lb_Enc)
	{
		$laForm=$lobj_Tip->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
	unset($laForm['Contrasena']);
	$laForm['Operacion']="buscar";
	$_SESSION["Campos"]=$laForm;
	header("location: ../vistas/vis_Actualizar.php");
}
?>