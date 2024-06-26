<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Solicitud extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}

	/********* Funcion Obtener Formulario *********/
	/**/public function f_SetsForm($pa_Form){	/**/
	/**/	$this->aa_Form=$pa_Form;			/**/
	/**/}										/**/
	/**********************************************/

	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsForm(){			/**/
	/**/	return $this->aa_Form;				/**/
	/**/}										/**/
	/**********************************************/

	/************************ Funcion Operacion   *************************************************************************/
	/* esta funcion seleciona el SQL correcto dependiendo de la operacion sugerida por el usuario y lo ejecuta segun la	  */
	/* situacion																										  */
	/**********************************************************************************************************************/
	/**/public function f_Operacion(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	print(strlen($this->aa_Form["Solicitudes"])."---".$this->aa_Form["Solicitudes"]);							/**/
	/**/	if(strlen($this->aa_Form["Solicitudes"])>=3){																/**/
	/**/		$idtipo="("."SELECT idtipo FROM tipo_solicitud WHERE nombre ='".$this->aa_Form['Solicitudes']."')";		/**/
	/**/		$campos="Null,Null";																					/**/
	/**/	}else if(strlen($this->aa_Form["Solicitudes"]<3)){															/**/
	/**/		if($this->aa_Form["Regimen"]!="-"){																		/**/
	/**/			$campos="'".$this->aa_Form["Regimen"]."',";															/**/
	/**/		}else{																									/**/
	/**/			$campos="Null,";																					/**/
	/**/		}																										/**/
	/**/		if($this->aa_Form["Carrera"]!="-"){																		/**/
	/**/			$campos.="'".$this->aa_Form["Carrera"]."'";															/**/
	/**/		}else{																									/**/
	/**/			$campos.="Null";																					/**/
	/**/		}																										/**/
	/**/		if(substr($this->aa_Form["Solicitudes"],0,1)=="R"){														/**/
	/**/			$idtipo="'1'";																						/**/
	/**/		}else if(substr($this->aa_Form["Solicitudes"],0,1)=="T"){												/**/
	/**/			$idtipo="'2'";																						/**/
	/**/		}else if(substr($this->aa_Form["Solicitudes"],0,1)=="C"){												/**/
	/**/			$idtipo="'3'";																						/**/
	/**/		}																										/**/
	/**/	}																											/**/
	/**/	if($this->aa_Form['Operacion']=="incluir"){																	/**/
	/**/		$ls_Sql="INSERT INTO solicitud (solicitante,idtipo,observacion,estatus,motivo,regimen,codesp,fecha)VALUES ";/**/
	/**/		$ls_Sql.="('".$_SESSION["usuario"]['Cedula']."',$idtipo,'','P','".$this->aa_Form["Motivo"]."";			/**/
	/**/		$ls_Sql.="',$campos,'".date("Y-m-d")."')";																/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Solicitud",$ls_Sql,"Usuario en session")){											/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	if($lb_Hecho){																								/**/
	/**/		require_once("../modulos/MAILS/clases/cls_Correos.php");												/**/
	/**/		$lobjCorreo=new cls_Correos;																			/**/
	/**/		$ls_Sql="SELECT * FROM persona WHERE cedula='".$_SESSION["usuario"]['Cedula']."'";						/**/
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
	/**/		$laParametros['Asunto']="Control De Solicitud";															
					$laParametros['AltContenido']="La solicitud realizada en <a href='http://www.testing-case.com.ve/'>UNEFA Portuguesa</a> a sido realizada exitosamente. Cuando su solisitu sea atendida recibira un correo de notificacion.";	
	/**/		$laParametros['Contenido']='<html>
												<head>
													<meta charset="utf-8">
													<style type="text/css">
														*{
															padding: 0;
															margin: 0;
														}
														div[cabecera], div[pie]{
															width: 100%;
															background-color: rgb(41, 56, 140);
															padding: 10px 0px
														}

														div[cabecera] p{
															color: white;
															font-size: 30px;
															text-indent: 10%;
														}

														div[pie]{
															bottom: 0px;
															left: 0px;
															position: absolute;
															right: 0px;
														}

														div[pie] p{
															color: white;
															font-size: 16px;
															text-indent: 10%;
														}

														div[contenido]{
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
												<body>
													<div cabecera>
														<p>UNEFA Portuguesa.</p>
													</div>
													<div contenido>
														<h1>La solicitud realizada en <a href="http://www.testing-case.com.ve/">UNEFA Portuguesa</a> a sido realizada exitosamente.</h1><br>
														<br>
														<p>Cuando su solisitu sea atendida recibira un correo de notificacion.</p>
														<br>
														
													</div>
													<div pie>
														<p>Carretera Nacional Vía Payara Sector Piedritas Blancas Edificio Pozo Blanco, Acarigua - Portuguesa.</p>
													</div>
												</body>
											</html>';																	/**/
	/**/		print("<pre>");																							/**/
	/**/		$lobjCorreo->setParametros($laParametros);																/**/
	/**/		if($lobjCorreo->enviarCorreo()){																		/**/
	/**/			print "Envio el correo";																			/**/
	/**/		}else{																									/**/
	/**/			print "No Envio";																					/**/
	/**/		}																										/**/
	/**/																												/**/
	/**/	}																											/**/
	/**/																												/**/
	/**/	return $lb_Hecho;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	
}
?>
