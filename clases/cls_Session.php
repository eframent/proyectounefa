<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Session extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}
	/********* Funcion Obtener Formulario *************************************************/
	/**/public function f_SetsForm($pa_Form){											/**/
	/**/	$this->aa_Form=$pa_Form;													/**/
	/**/	$this->aa_Form["Contrasena"]=hash('whirlpool',$this->aa_Form["Contrasena"]);/**/
	/**/}																				/**/
	/**************************************************************************************/

	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsForm(){			/**/
	/**/	return $this->aa_Form;				/**/
	/**/}										/**/
	/**********************************************/

	/************************ Funcion Buscar   ********************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos											  */
	/**************************************************************************************************************************/
	/**/public function f_Buscar(){																							/**/
	/**/	$la_Cedula=Array();																								/**/
	/**/	$lb_Enc=false;																									/**/
	/**/	$ls_Sql="SELECT * FROM usuario WHERE nombre='".$this->aa_Form["Nombre"]."'";									/**/
	/**/	$this->f_Con();																									/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																				/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		/**/
	/**/		if(($la_Tupla['estatus']=='B')||($la_Tupla['sesion_abierta']=='1')){										/**/
	/**/			//Cuando el usuario esta bloqueado o la session ya se encuentra abierta									/**/
	/**/			if($la_Tupla['estatus']=='B'){																			/**/
	/**/				$this->aa_Form["Mensaje"]="Usuario Se Encuentra Bloqueado";											/**/
	/**/			}else if(($la_Tupla['sesion_abierta']=='1')&&($la_Tupla['estatus']!='B')){								/**/
	/**/				$this->aa_Form["Mensaje"]="Sesion Ya se Encuentra Abierta";											/**/
	/**/																													/**/
	/**/			}																										/**/
	/**/		}else{																										/**/
	/**/			$ls_Sql="SELECT u.*,p.*,c.*,u.estatus AS estado ";														/**/
	/**/			$ls_Sql.="FROM usuario AS u INNER JOIN persona AS p ON(u.cedula=p.cedula) ";							/**/
	/**/			$ls_Sql.="LEFT JOIN detalle_cargo_usuario AS dcu ON(u.nombre=dcu.fk_usu_nombre) ";						/**/
	/**/			$ls_Sql.="LEFT JOIN cargo AS c ON(dcu.fk_car_codigo=c.car_codigo) ";									/**/
	/**/			$ls_Sql.="WHERE u.nombre='".$this->aa_Form["Nombre"]."' AND u.contrasena='";							/**/
	/**/			$ls_Sql.=$this->aa_Form["Contrasena"]."'";																/**/
	/**/			$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/			if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/				unset($this->aa_Form["Nombre"]);																	/**/
	/**/				unset($this->aa_Form["Contrasena"]);																/**/
	/**/				$this->aa_Form["Mensaje"]="Acceso Realizado con Exito";												/**/
	/**/				$this->aa_Form["Nombre"]=$la_Tupla["nombre"];														/**/
	/**/				$this->aa_Form["Cedula"]=$la_Tupla["cedula"];														/**/
	/**/				$this->aa_Form["Tipo"]=$la_Tupla["tipo_usu"];														/**/
	/**/				$this->aa_Form["Nombres"]=$la_Tupla["nombre1"]." ".$la_Tupla["apellido1"];							/**/
	/**/				$this->aa_Form["Cargo"]=$la_Tupla["car_nombre"];													/**/
	/**/				$this->aa_Form["Estado"]=$la_Tupla["estado"];														/**/
	/**/				$ip=$this->obtenerIP();																				/**/
	/**/				//Modifico el Campo de sesion abierta																/**/
	/**/				$ls_Sql="UPDATE usuario SET sesion_abierta='1',intentos_fallidos='0'";								/**/
	/**/				$ls_Sql.=" WHERE nombre='".$this->aa_Form["Nombre"]."'";											/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/				//COMPARO LA FECHA DE LA ULTIMA CLAVE DEL USUARIO PARA VER SI CADUCO								/**/
	/**/				$ls_Sql="SELECT fecha FROM historial_clave WHERE usuario='".$this->aa_Form["Nombre"]."' ";			/**/
	/**/				$ls_Sql.=" ORDER BY fecha DESC LIMIT 1";															/**/
	/**/				$lr_Tabla=$this->f_Filtro($ls_Sql);																	/**/
	/**/				if($la_Tupla=$this->f_Arreglo($lr_Tabla)){															/**/
	/**/					$fecha=strtotime($la_Tupla["fecha"]);															/**/
	/**/				}																									/**/
	/**/				$ls_Sql="SELECT caducidad_clave FROM servidor WHERE idconfiguracion='1'";							/**/
	/**/				$lr_Tabla=$this->f_Filtro($ls_Sql);																	/**/
	/**/				if($la_Tupla=$this->f_Arreglo($lr_Tabla)){															/**/
	/**/					$fecha=($la_Tupla["caducidad_clave"]*(86400))+$fecha;											/**/
	/**/				}																									/**/
	/**/				$hoy=strtotime('now');		 																		/**/
	/**/				if(($fecha<=$hoy)&&($this->aa_Form["Estado"]!='P')){												/**/
	/**/					$this->aa_Form["Estado"]='C';																	/**/
	/**/				}							 																		/**/
	/**/				//Guardo en bitacora de acceso 																		/**/
	/**/				$this->f_Acceso($ip,"Acceso Realizado con Exito",$this->aa_Form["Nombre"]);							/**/
	/**/				$lb_Enc=true;																						/**/
	/**/			}else{																									/**/
	/**/				//clave erronea																						/**/
	/**/				$this->aa_Form["Mensaje"]="Usuario/Clave Erroneo";													/**/
	/**/				$ls_Sql="SELECT intentos_fallidos AS i_f FROM usuario WHERE nombre='".$this->aa_Form["Nombre"]."'";	/**/
	/**/				$lr_Tabla=$this->f_Filtro($ls_Sql);																	/**/
	/**/				if($la_Tupla=$this->f_Arreglo($lr_Tabla)){															/**/
	/**/					$int=$la_Tupla["i_f"];																			/**/
	/**/				}																									/**/
	/**/				$ls_Sql="SELECT intentos_fallidos_usuario AS ifu FROM servidor WHERE idconfiguracion='1'";			/**/
	/**/				$lr_Tabla=$this->f_Filtro($ls_Sql);																	/**/
	/**/				if($la_Tupla=$this->f_Arreglo($lr_Tabla)){															/**/
	/**/					$intser=$la_Tupla["ifu"];																		/**/
	/**/				}																									/**/
	/**/				$int++;																								/**/
	/**/				//comparo si la cantidad de intentos fallidos es igual al maximo premitido							/**/
	/**/				if($int==$intser){																					/**/
	/**/					$ls_Sql="UPDATE usuario SET estatus='B', intentos_fallidos='0'";								/**/
	/**/					$ls_Sql.=" WHERE nombre='".$this->aa_Form["Nombre"]."'";										/**/
	/**/					$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/					$ip=$this->obtenerIP();																			/**/
	/**/					//guardo en la bitacora de acceso																/**/
	/**/					$this->f_Acceso($ip,"Usuario Bloqueado",$this->aa_Form["Nombre"]);								/**/
	/**/					$this->aa_Form["Mensaje"]="Usuario Bloqueado";													/**/
	/**/				}else{																								/**/
	/**/					$ls_Sql="UPDATE usuario SET intentos_fallidos='$int' WHERE nombre='".$this->aa_Form["Nombre"]."'";/**/
	/**/					$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				}																									/**/
	/**/			}																										/**/
	/**/		}																											/**/
	/**/	}else{																											/**/
	/**/		//usuario no existe																							/**/
	/**/		$this->aa_Form["Mensaje"]="Usuario/Clave Erroneo";															/**/
	/**/		if(!isset($_SESSION['fallidos'])){																			/**/
	/**/			$_SESSION['fallidos']=1;																				/**/
	/**/		}else{																										/**/
	/**/			if($_SESSION['fallidos']<3){																			/**/
	/**/				$_SESSION['fallidos']++;																			/**/
	/**/			}else{																									/**/
	/**/				$ip=$this->obtenerIP();																				/**/
	/**/				$_SESSION['BLOQUEADO'][count($_SESSION['BLOQUEADO'])]=$ip;											/**/
	/**/			}																										/**/
	/**/		}																											/**/
	/**/	}																												/**/
	/**/	$this->f_Cierra($lr_Tabla);																						/**/
	/**/	$this->f_Des();																									/**/
	/**/	return $lb_Enc;																									/**/
	/**/}																													/**/
	/**************************************************************************************************************************/

	/************************ Funcion GetPeraca   *************************************************************************/
	/* Busca en la base de datos el periodo academico activo y lo devuelve												  */
	/**********************************************************************************************************************/
	/**/public function f_GetPeraca(){																					/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$ls_Sql="SELECT peraca FROM peraca WHERE (estatus='A')";													/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$laperaca=$la_Tupla['peraca'];																			/**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $laperaca;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion ValidarIP   *************************************************************************/
	/* Se verifica que la ip accesante no este entre las bloqueadas														  */
	/**********************************************************************************************************************/
	/**/public function f_ValidarIp(){																					/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	if(isset($_SESSION['BLOQUEADO'])){																			/**/
	/**/		for($x=0;$x<count($_SESSION['BLOQUEADO']);$x++){														/**/
	/**/			$ip=$this->obtenerIP();																				/**/
	/**/			if($ip==$_SESSION['BLOQUEADO'][$x]){																/**/
	/**/				$lb_Enc=true;																					/**/
	/**/			}																									/**/
	/**/		}																										/**/
	/**/	}																											/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
	/************************ Funcion Cerrar Session **********************************************************************/
	/* cierra la session y ademas guarda en bitacora de acceso															  */
	/**********************************************************************************************************************/
	/**/public function f_CerrarSession($ruta){																			/**/
	/**/	$ls_Sql="UPDATE usuario SET sesion_abierta='0' WHERE nombre='".$_SESSION['usuario']['Nombre']."'";			/**/
	/**/	$contenido="Session Cerrada con Exito";																		/**/
	/**/	if($ruta!=""){																								/**/
	/**/		$contenido="Session Cerrada por Entrar en zona no permitida: $ruta";									/**/
	/**/	}																											/**/
	/**/	$ip=$this->obtenerIP();																						/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lb_Hecho=$this->f_Ejecutar($ls_Sql);																		/**/
	/**/	$this->f_Acceso($ip,$contenido,$_SESSION['usuario']['Nombre']);												/**/
	/**/	$this->f_Des();																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/


	/************************ Funcion ValidarRepre ************************************************************************/
	/* si el usuario esta seleccionado para ser respresentante del departamento de evaluacion docente este peraca		  */
	/**********************************************************************************************************************/
	/**/public function f_ValidarRepre(){																				/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$ls_Sql="SELECT peraca FROM peraca WHERE (estatus='A')";													/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$laperaca=$la_Tupla['peraca'];																			/**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $laperaca;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
}
?>
