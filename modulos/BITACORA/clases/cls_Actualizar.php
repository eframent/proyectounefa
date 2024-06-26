<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Actualizar extends  cls_Bitacora{
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


	/************************ Funcion Operacion   *****************************************************************************/
	/* esta funcion seleciona el SQL correcto dependiendo de la operacion sugerida por el usuario y lo ejecuta segun la	  	  */
	/* situacion																										  	  */
	/**************************************************************************************************************************/
	/**/public function f_Operacion(){																						/**/
	/**/	$lb_Hecho=false;																								/**/
	/**/	$this->aa_Form['Fecha_Nac']=$this->fFechaBD($this->aa_Form['Fecha_Nac']);									/**//**/																									/**/
	/**/	if($this->compararPass($_SESSION['usuario']['Nombre'],$this->aa_Form['Contrasena'])){							/**/
	/**/		$this->f_Con();																								/**/
	/**/		$this->	f_Begin();																							/**/
	/**/		if($this->aa_Form['Operacion']=="modificar"){																/**/
	/**/			$ls_Sql="UPDATE persona SET ";																			/**/
	/**/			$ls_Sql.=" nombre1='".$this->aa_Form["Nombre1"]."', nombre2='".$this->aa_Form["Nombre2"]."',";			/**/
	/**/			$ls_Sql.=" apellido1='".$this->aa_Form["Apellido1"]."', apellido2='".$this->aa_Form["Apellido2"]."',";	/**/
	/**/			$ls_Sql.=" fecha_nac='".$this->aa_Form["Fecha_Nac"]."', lugar_naci='".$this->aa_Form["Lugar_Nac"]."',";	/**/
	/**/			$ls_Sql.=" edociv='".$this->aa_Form["Estado_civ"]."', sexo='".$this->aa_Form["Sexo"]."',";				/**/
	/**/			$ls_Sql.=" telefono='".$this->aa_Form["Telefono"]."', c_electronico='".$this->aa_Form["Correo"]."',";	/**/
	/**/			$ls_Sql.=" idciudad='".$this->aa_Form["Ciudad"]."', direccionesp='".$this->aa_Form["Direccion"]."'";	/**/
	/**/			$ls_Sql.=" WHERE (cedula='".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."')";					/**/
	/**/			if($this->f_SupervisarTransaccion("Persona",$ls_Sql,"Usuario en session")){								/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			}																										/**/
	/**/			if($lb_Hecho){																							/**/
	/**/				//MODIFICO LA CLAVE EN USUARIO																		/**/
	/**/				$lb_Hecho=false;																					/**/
	/**/				$ls_Sql="UPDATE usuario SET contrasena='".$this->aa_Form['Contrasena']."', estatus='A' ";			/**/
	/**/				$ls_Sql.="WHERE nombre='".$_SESSION['usuario']['Nombre']."'";										/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/				if($lb_Hecho){																						/**/
	/**/					//INSERTO DENTRO DEL HISTORIAL DE CLAVES														/**/
	/**/					$lb_Hecho=false;																				/**/
	/**/					$fecha=date("Y/m/d");																			/**/
	/**/					$ls_Sql="INSERT INTO historial_clave (usuario,clave,fecha) VALUES";								/**/
	/**/					$ls_Sql.="('".$_SESSION['usuario']['Nombre']."','".$this->aa_Form['Contrasena']."','$fecha')";	/**/
	/**/					$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/					$ip=$this->obtenerIP();																			/**/
	/**/					$this->f_Acceso($ip,"Cambio De Clave Primera Vez",$_SESSION['usuario']['Nombre']);				/**/
	/**/				}else{																								/**/
	/**/					$this->f_RollBack();																			/**/
	/**/				}																									/**/
	/**/				//INSERTO PREGUNTAS SECRETAS																		/**/
	/**/				if($lb_Hecho){																						/**/
	/**/					$lb_Hecho=false;																				/**/
	/**/					$ls_Sql="DELETE FROM usuario_pregunta WHERE usuario='".$_SESSION['usuario']['Nombre']."'";		/**/
	/**/					if($this->f_SupervisarTransaccion("usuario_pregunta",$ls_Sql,"Usuario en session")){			/**/
	/**/						$lb_Hecho=$this->f_Ejecutar($ls_Sql);														/**/
	/**/					}																								/**/
	/**/					if($lb_Hecho){																					/**/
	/**/						$lb_Hecho=false;																			/**/
	/**/						$ls_Sql="DELETE FROM usuario_pregunta WHERE usuario='".$_SESSION['usuario']['Nombre']."'";	/**/
	/**/						$lb_Hecho=$this->f_Ejecutar($ls_Sql);														/**/
	/**/					}else{																							/**/
	/**/						$this->f_RollBack();																		/**/
	/**/						break;																						/**/
	/**/					}																								/**/
	/**/					for($x=0;$x<$this->aa_Form['Columnas'];$x++){													/**/
	/**/						if($lb_Hecho){																				/**/
	/**/							$lb_Hecho=false;																		/**/
	/**/							$ls_Sql="INSERT INTO usuario_pregunta (usuario,pregunta,respuesta) VALUES";				/**/
	/**/							$ls_Sql.="('".$_SESSION['usuario']['Nombre']."','".$this->aa_Form['newCamp0-'.$x]."',";	/**/
	/**/							$ls_Sql.="'".$this->aa_Form['newCamp1-'.$x]."')";										/**/
	/**/							if($this->f_SupervisarTransaccion("usuario_pregunta",$ls_Sql,"Usuario en session")){	/**/
	/**/								$lb_Hecho=$this->f_Ejecutar($ls_Sql);												/**/
	/**/							}																						/**/
	/**/						}else{																						/**/
	/**/							$this->f_RollBack();																	/**/
	/**/							break;																					/**/
	/**/						}																							/**/
	/**/					}																								/**/
	/**/				}else{																								/**/
	/**/					$this->f_RollBack();																			/**/
	/**/				}																									/**/
	/**/																													/**/
	/**/			}else{																									/**/
	/**/				$this->f_RollBack();																				/**/
	/**/			}																										/**/
	/**/			if($lb_Hecho){																							/**/
	/**/				$this->f_Commit();																					/**/
	/**/			}else{																									/**/
	/**/				$this->f_RollBack();																				/**/
	/**/			}																										/**/
	/**/			$this->f_Des();																							/**/
	/**/		}																											/**/
	/**/	}else{																											/**/
	/**/		$ls_Sql="SELECT historial_clave FROM servidor";																/**/ 
	/**/		$this->f_Con();																								/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/			$cantidad=$la_Tupla["historial_clave"];																	/**/
	/**/		}																											/**/
	/**/		$this->f_Cierra($lr_Tabla);																					/**/
	/**/		$this->f_Des();																								/**/
	/**/		$_SESSION['Mensaje']="La clave no puede ser igual a las $cantidad anteriores";								/**/
	/**/	}																												/**/
	/**/	return $lb_Hecho;																								/**/
	/**/}																													/**/
	/**************************************************************************************************************************/

}
?>
