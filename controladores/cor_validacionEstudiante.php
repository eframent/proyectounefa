<?php 
include("../clases/cls_validarEstudiante.php");
session_start();

	$laForm=$_GET;
	$lobj_Tip= new cls_validarEstudiante();
	$lobj_Tip->f_SetsForm($laForm);

if($laForm['Operacion']=="buscar")
{
	print("<meta http-equiv='content-type' content='text/html;charset=utf-8' />");
	print("entro");
	$lb_Enc=false;
	$lb_Enc=$lobj_Tip->validarMaterias();
	if($lb_Enc)
	{
		$laForm=$lobj_Tip->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=0;
	}
}

?>
