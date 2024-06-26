<?php 
include("../clases/cls_Session.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Sesion= new cls_Session();
	$lobj_Sesion->f_SetsForm($laForm);
}
if($laForm['Operacion']=="buscar")
{
	$lb_Enc=false;
	if(!$lobj_Sesion->f_ValidarIP()){
		$lb_Enc=$lobj_Sesion->f_Buscar();
		if($lb_Enc)
		{
			$laForm=$lobj_Sesion->f_GetsForm();
			$_SESSION["usuario"]=$laForm;
			unset($_SESSION['usuario']['Operacion']);
			unset($_SESSION['usuario']['Hacer']);
			unset($_SESSION['usuario']['Hay']);
			$_SESSION["peraca"]=$lobj_Sesion->f_GetPeraca();
			if($laForm['Estado']=='P'){
				header("location: cor_PrimeraVez.php?Operacion=buscar");
			}else if($laForm['Estado']=='C'){
				$_SESSION['Mensaje']="Por favor Complete este formlario de seguridad, para proceder a actualizar su clave que se encuentra caducada";
				$_SESSION['Campos']['Usuario']=$laForm['Nombre'];
				header("location: cor_RecuperarClave.php?Operacion=RecuperarClave&Nombre=".$laForm['Nombre']);	
			}else if($laForm['Estado']=='A'){
				header("location: ../vistas/vis_Inicio.php");	
			}
		}
		else
		{
			$laForm=$lobj_Sesion->f_GetsForm();
			$_SESSION["Mensaje"]=$laForm["Mensaje"];
			header("location: ../index.php");
		}
	}else{
		$_SESSION["Mensaje"]="Acceso Bloqueado Por exceso de intentos fallidos";
	}
}
?>