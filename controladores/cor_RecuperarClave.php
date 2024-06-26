<?php 
include("../clases/cls_RecuperarClave.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$laForm['Nombre']=($laForm['Nombre']=="")?$laForm['Usuario']:$laForm['Nombre'];
	$lobj_Tip= new cls_RecuperarClave();
	$lobj_Tip->f_SetsForm($laForm);
}else{
	$laForm=$_GET;
	$laForm['Nombre']=($laForm['Nombre']=="")?$laForm['Usuario']:$laForm['Nombre'];
	$lobj_Tip= new cls_RecuperarClave();
	$lobj_Tip->f_SetsForm($laForm);
}

if($laForm['Operacion']=="RecuperarClave")
{
	if($lobj_Tip->comprobarEnvio()){
		$lobj_Tip->f_BuscarCorreo();
		$laForm=$lobj_Tip->f_GetsForm();
		$_SESSION['Campos']=$laForm;
		header("location: ../vistas/vis_CompCor.php");
	}else{
		$lb_Enc=$lobj_Tip->f_BuscarPreguntas();
		if($lb_Enc)
		{
			$laForm=$lobj_Tip->f_GetsForm();
			if($laForm['preguntas'][0]['Pregunta']==""){
				$_SESSION['Mensaje']="Usuario No Posee Preguntas De Seguridad Por Favor Contacte al Administrador Del Sistema";
				header("location: ../vistas/vis_Salir.php");	
			}else{
				$_SESSION['Mensaje']=($_SESSION['Mensaje']!="")?$_SESSION['Mensaje']:"Proceda a Completar el Formulario de Seguriad";
				$laForm['Hay']=1;
				$laForm['Operacion']="buscar";
				$_SESSION["Campos"]=$laForm;
				header("location: ../vistas/vis_CompPre.php");
			}
		}else{
			$_SESSION['Mensaje']="No se Puede Recuperar Contraseña, Usuario no Existe";
			header("location: ../index.php");	
		}	
	}
}
if($laForm['Operacion']=='ValidarCorreo'){	
	if($lobj_Tip->f_BuscarCorreo()){

	    //Se define una cadena de caractares. Te recomiendo que uses esta.
	    $cadena = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
	    //Obtenemos la longitud de la cadena de caracteres
	    $longitudCadena=strlen($cadena);
	     
	    //Se define la variable que va a contener la contraseña
	    $pass = "";
	    //Se define la longitud de la contraseña, en mi caso 10, pero puedes poner la longitud que quieras
	    $longitudPass=6;
	     
	    //Creamos la contraseña
	    for($i=1 ; $i<=$longitudPass ; $i++){
			//Definimos numero aleatorio entre 0 y la longitud de la cadena de caracteres-1
			$pos=rand(0,$longitudCadena-1);
			     
			//Vamos formando la contraseña en cada iteraccion del bucle, añadiendo a la cadena $pass la letra correspondiente a la posicion $pos en la cadena de caracteres definida.
			$pass .= substr($cadena,$pos,1);
		}
		if($lobj_Tip->EnvioCodigo($pass)){
			$_SESSION['Mensaje']="No se pudo enviar";
		}
		$_SESSION['Campos']=$laForm;
		$_SESSION['Verificacion']=$pass;
		header("location: ../vistas/vis_Comprobacion.php");
	}else{
		if($lobj_Tip->bloquearUsuario()){
			$_SESSION['Mensaje']="Usuario Bloqueado";
			header("location: ../index.php");	
		}else{
			$laForm=$lobj_Tip->f_GetsForm();
			$_SESSION['Campos']=$laForm;
			$_SESSION['Mensaje']='Correo Invalido';
			header("location: ../vistas/vis_CompCor.php");
		}
	}
}
if($laForm['Operacion']=='ValidarCodigo'){
	if($laForm['Verificacion']==$_SESSION['Verificacion']){
		$laForm['Mensaje']="Proceda a Modificar su Clave";
		$_SESSION['Campos']=$laForm;
		header("location: ../vistas/vis_ActualizarClave.php");
	}else{
		if($lobj_Tip->bloquearUsuario()){
			unset($_SESSION['Verificacion']);
			$_SESSION['Mensaje']="Usuario Bloqueado";
			header("location: ../index.php");	
		}else{
			$laForm=$lobj_Tip->f_GetsForm();
			$_SESSION['Campos']=$laForm;
			$_SESSION['Mensaje']='Codigo Invalido';
			header("location: ../vistas/vis_Comprobacion.php");
		}
	}
}
if($laForm['Operacion']=="ValidarPreguntas"){
	$lb_Enc=$lobj_Tip->f_BuscarPreguntas();
	if($lb_Enc){		
		$laForm['Mensaje']="Proceda a Modificar su Clave";
		$_SESSION['Campos']=$laForm;
		$_SESSION['Verificacion']="paso";
		header("location: ../vistas/vis_ActualizarClave.php");
	}else{
		if($lobj_Tip->bloquearUsuario()){
			$_SESSION['Mensaje']="Usuario Bloqueado";
			header("location: ../index.php");	
		}else{
			$_SESSION['Mensaje']="Respuestas Incorrectas";
			$laForm=$lobj_Tip->f_GetsForm();
			$laForm['Hay']=1;
			$laForm['Operacion']="buscar";
			$_SESSION["Campos"]=$laForm;
			header("location: ../vistas/vis_CompPre.php");
		}
	}
}

?>
