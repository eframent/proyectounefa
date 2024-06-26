<?php 
include("../clases/cls_ActualizarClave.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Tip= new cls_ActualizarClave();
	$lobj_Tip->f_SetsForm($laForm);
}

if($laForm['Operacion']=="actualizar")
{
	$lb_Hecho=$lobj_Tip->f_Operacion();
	if($lb_Hecho)
	{
		$laForm['Mensaje']="Contraseña Actualizada con exito";
		if(isset($_SESSION['usuario']['Nombre'])){
			$_SESSION["usuario"]['Mensaje']=$laForm['Mensaje'];
			header("location: ../vistas/vis_Inicio.php");		
		}else{
			$_SESSION['Mensaje']=$laForm['Mensaje'];
			header("location: ../index.php");
		}
	}else{
		$_SESSION['Verificacion']='paso';		
		$_SESSION['Campos']['Usuario']=$laForm['Usuario'];
		header("location: ../vistas/vis_ActualizarClave.php");
	}
}
?>
