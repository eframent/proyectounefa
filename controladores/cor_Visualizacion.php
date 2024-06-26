<?php 
include("../clases/cls_Visualizacion.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_buscar= new cls_Visualizacion();
	$lobj_buscar->f_SetForm($laForm);
}
if($laForm['Operacion']=="Listar")
{
	$_SESSION["horasD"]['existentes']=$lobj_buscar->fHorasD();
	$_SESSION["horasD"]['tope']=$lobj_buscar->fTopeHorasD();
	$_SESSION["horas"]=$lobj_buscar->fHoras();
	$_SESSION['Ambientes']=$lobj_buscar->fAmbientes(); 
	$_SESSION["Bloques"]=$lobj_buscar->fBloques();
	$_SESSION["BloquesOcupados"]=$lobj_buscar->fBloquesOcupados();
	$_SESSION["tipoAmbientes"]=$lobj_buscar->fTipoAmbientes();
	header("location: ../vistas/vis_Visualizacion.php");
}

?>