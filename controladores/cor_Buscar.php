<?php 
include("../clases/cls_Docente.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_buscar= new cls_Docente();
	$lobj_buscar->f_SetsForm($laForm);
}
if($laForm['Operacion']=="Listar")
{
		$_SESSION['matriz']=$lobj_buscar->fListarTrans(); //le mando la pagina como parametro para resivir el arreglo lleno 
		$_SESSION["Campos"]=$laForm;
	header("location: ../vistas/vis_Buscar.php");
}

?>