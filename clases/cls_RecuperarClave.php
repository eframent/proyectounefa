<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_RecuperarClave extends  cls_Bitacora{
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

	/************************ Funcion Buscar Preguntas ********************************************************************/
	/* 	Se encarga de Buscar en la Base de Datos las Preguntas Secretas Cargadas Por el usuario							  */
	/**********************************************************************************************************************/
	/**/public function f_BuscarPreguntas(){																			/**/
	/**/	$ls_Sql="SELECT * FROM servidor WHERE idconfiguracion='1'";													/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['CantPre']=$la_Tupla["cantidad_preguntas"];												/**/
	/**/		$this->aa_Form['CantResp']=$la_Tupla["cantidad_respuestas"];											/**/
	/**/	}																											/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$liI=0;																										/**/
	/**/	$ls_Sql="SELECT u.nombre,p.pregunta,p.respuesta FROM usuario AS u ";										/**/
	/**/	$ls_Sql.="LEFT OUTER JOIN usuario_pregunta AS p ON(u.nombre=p.usuario) ";									/**/
	/**/	$ls_Sql.="WHERE nombre='".$this->aa_Form['Nombre']."'";														/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre"];															/**/
	/**/		$preguntas[$liI]['Pregunta']=$la_Tupla["pregunta"];														/**/
	/**/		$preguntas[$liI]['Respuesta']=$la_Tupla["respuesta"];													/**/
	/**/		$liI++;																									/**/
	/**/		$lb_Enc=true;																							/**/
	/**/	}																											/**/
	/**/	unset($this->aa_Form["Contrasena"]);																		/**/
	/**/	if($this->aa_Form['Operacion']=="ValidarPreguntas"){														/**/
	/**/		$cont=0;																								/**/
	/**/		for($x=0;$x<count($preguntas);$x++){																	/**/
	/**/			if($preguntas[$x]['Respuesta']==$this->aa_Form['respuesta-'.$x]){									/**/
	/**/				$cont++;																						/**/
	/**/			}																									/**/
	/**/		}																										/**/
	/**/		$lb_Enc=false;																							/**/
	/**/		if($cont>=$this->aa_Form['CantResp']){																	/**/
	/**/			$lb_Enc=true;																						/**/
	/**/		}																										/**/
	/**/	}																											/**/
	/**/	$this->aa_Form["preguntas"]=$preguntas;																		/**/
	/**/	$this->aa_Form["Columnas"]=$liI;																			/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
	/************************ Funcion Buscar correo 	*******************************************************************/
	/* 	Se encarga de Buscar en la Base de Datos el correo electronico Cargado Por el usuario							  */
	/**********************************************************************************************************************/
	/**/public function f_BuscarCorreo(){																				/**/
	/**/	$ls_Sql="SELECT p.c_electronico,u.nombre FROM persona AS p ";												/**/
	/**/	$ls_Sql.="INNER JOIN usuario AS u ON(u.cedula=p.cedula) ";													/**/
	/**/	$ls_Sql.="WHERE u.nombre='".$this->aa_Form['Nombre']."'";													/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre"];															/**/
	/**/		if($this->aa_Form['Operacion']=='ValidarCorreo'){														/**/
	/**/			if($la_Tupla['c_electronico']==$this->aa_Form['Correo']){											/**/
	/**/				$lb_Enc=true;																					/**/
	/**/			}																									/**/
	/**/		}																										/**/
	/**/		$this->aa_Form['Correo']=$la_Tupla["c_electronico"];													/**/
	/**/	}																											/**/
	/**/	unset($this->aa_Form["Contrasena"]);																		/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	$cadenaRemplazo=substr($this->aa_Form['Correo'], 4,8);														/**/
	/**/	$this->aa_Form['Correo']=str_replace($cadenaRemplazo, "****", $this->aa_Form['Correo']);					/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
	/************************ Funcion Bloquear Usuario ********************************************************************/
	/* 	Se encarga de bloquear el usuario una vez acaba sus intentos fallidos											  */
	/**********************************************************************************************************************/
	/**/public function bloquearUsuario(){																				/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	$subQuery="SELECT (intentos_fallidos+1) FROM usuario WHERE nombre='".$this->aa_Form['Nombre']."'";			/**/
	/**/	$ls_Sql="UPDATE usuario SET intentos_fallidos=($subQuery) WHERE nombre='".$this->aa_Form['Nombre']."'";		/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lb_Hecho=$this->f_Ejecutar($ls_Sql);																		/**/
	/**/	$this->f_Des();																								/**/
	/**/	$subQuery="SELECT intentos_fallidos_usuario FROM servidor WHERE idconfiguracion='1'";						/**/
	/**/	$ls_Sql="SELECT intentos_fallidos FROM usuario WHERE intentos_fallidos>=($subQuery)  ";						/**/
	/**/	$ls_Sql.=" AND nombre='".$this->aa_Form['Nombre']."'";														/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$lb_Enc=true;																							/**/
	/**/	}																											/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	if($lb_Enc){																								/**/
	/**/		$ls_Sql="UPDATE usuario SET estatus='B' WHERE nombre='".$this->aa_Form['Nombre']."'";					/**/
	/**/		$this->f_Con();																							/**/
	/**/		$this->f_Acceso($ip,"Usuario Bloqueado",$this->aa_Form['Nombre']);										/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion EnvioCodigo   ***********************************************************************/
	/* esta funcion Envia el codigo de verificacion al correo Electronico 												  */
	/**********************************************************************************************************************/
	/**/	public function EnvioCodigo($codigo){																		/**/
	/**/		$envio=false;																							/**/
	/**/		require_once("../modulos/MAILS/clases/cls_Correos.php");												/**/
	/**/		$lobjCorreo=new cls_Correos;																			/**/
	/**/		$ls_Sql="SELECT * FROM persona WHERE cedula=(SELECT cedula FROM usuario WHERE nombre='".$this->aa_Form['Nombre']."')";/**/
	/**/		$laParametros=array();																					/**/
	/**/																												/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$laParametros['Para']=$la_Tupla['c_electronico'];													/**/
	/**/			$laParametros['ParaNombre']=$la_Tupla['nombre1']." ".$la_Tupla['nombre2']." ";						/**/
	/**/			$laParametros['ParaNombre'].=$la_Tupla['apellido1']." ".$la_Tupla['apellido2'];						/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		$this->f_Des();																							/**/
	/**/		$laParametros['Asunto']="Codigo de Verificacion UNEFA Portuguesa";														/**/
	/**/		$laParametros['AltContenido']="Su Codigo de verificacion es: ".$codigo.". Introduzca este codigo de verificación en el sistema UNEFA Portuguesa.";								/**/
	/**/		$laParametros['Contenido']='<html>
                        <head>
                          <meta charset="utf-8">
                          <style type="text/css">
                            *{
                              padding: 0;
                              margin: 0;
                            }
                            div#cabecera, div#pie{
                              width: 100%;
                              background-color: rgb(41, 56, 140);
                              padding: 10px 0px
                            }

                            div#cabecera p{
                              color: white;
                              font-size: 30px;
                              text-indent: 10%;
                            }

                            div#pie{
                              bottom: 0px;
                              left: 0px;
                              position: absolute;
                              right: 0px;
                            }

                            div#pie p{
                              color: white;
                              font-size: 16px;
                              text-indent: 10%;
                            }

                            div#contenido#{
                              height: auto;
                              min-height: 300px;
                              width: 80%;
                              margin:5px auto;
                            }

                            h1{
                              color: rgb(52, 152, 219);
                              height: auto;
                              font-size: 25px;
                              margin-top: 30px;
                            }

                            a{
                              color: rgb(41, 56, 140);
                            }


                          </style>
                        </head>
                        <body >
                          <div id="cabecera">
                            <p>UNEFA Portuguesa.</p>
                          </div>
                          <div id="contenido">
                            <h1>Su codigo de Verificacion es: '.$codigo.'.</h1><br>
                            <p>Introduzca este codigo de verificacion en el sistema UNEFA Portuguesa.</p>
                            
                          </div>
                          <div id="pie">
                            <p>Carretera Nacional Via Payara Sector Piedritas Blancas Edificio Pozo Blanco, Acarigua - Portuguesa.</p>
                          </div>
                        </body>
                      </html>';																	/**/
	/**/		//print("<pre>");																							/**/
	/**/		$lobjCorreo->setParametros($laParametros);																/**/
	/**/		if($lobjCorreo->enviarCorreo()){																		/**/
	/**/			//print "Envio el correo";																			/**/
	/**/		}else{																									/**/
	/**/			//print "No Envio";																					/**/
	/**/		}																										/**/
	/**/		return	$envio;																							/**/
	/**/	}																											/**/
	/**********************************************************************************************************************/
}
?>
