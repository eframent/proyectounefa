<?php 
include("../clases/cls_FrameInscrip.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_buscar= new cls_FrameInscrip();
}
if($laForm['Operacion']=="Listar")
{
	$_SESSION["secciones"]=$lobj_buscar->fSecciones();
	header("location: ../vistas/vis_FrameInscrip.php");
}

?>