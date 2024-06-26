<?php 
include("../clases/reportes/cls_Rep_Bit_Acceso.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Bitacora= new cls_Listado();
	$lobj_Bitacora->f_SetsForm($laForm);
}

if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	$lb_Enc=$lobj_Bitacora->f_Buscar();
	if($lb_Enc)
	{
		$laForm=$lobj_Bitacora->f_GetsForm();
		$laForm['Hay']=1;	
	}
	else
	{
		$laForm['Hay']=2;
	}
	$_SESSION["matris"]=$laForm;
	header("location: ../vistas/vis_Rep_Bit_Acceso.php");

}

?>
