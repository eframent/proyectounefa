<?php 
include("../clases/reportes/cls_Rep_Listado_Inc_Car_Sem.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Ciudad= new cls_Listado();
	$lobj_Ciudad->f_SetsForm($laForm);
}

if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Ciudad->f_Buscar();
	if($lb_Enc)
	{
		$laForm=$lobj_Ciudad->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=2;
	}
	$_SESSION["matris"]=$laForm;
	header("location: ../vistas/vis_Rep_Listado_Inc_Car_Sem.php");

}

?>
