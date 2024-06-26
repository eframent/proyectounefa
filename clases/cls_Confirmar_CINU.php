<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Confirmar_CINU extends  cls_Bitacora{
		private $aa_Form;
		private $aa_Matriz;
		private $aa_Auxiliar;
		private $ab_Retornar;

		public function __construct(){
			$this->aa_Form=Array();
			$this->aa_Matriz=Array();
			$this->aa_Auxiliar=Array();
			$this->ab_Retornar=Array();
		}

	/********* Funcion Obtener Formulario *********/
	/**/public function f_SetsForm($pa_Form){	/**/
	/**/	$this->aa_Form=$pa_Form;			/**/
	/**/}										/**/
	/**********************************************/
	
	/********* Funcion Obtener Formulario *********/
	/**/public function f_SetsMatriz($pa_Matriz){/**/
	/**/	$this->aa_Matriz=$pa_Matriz;		/**/
	/**/}										/**/
	/**********************************************/

	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsForm(){			/**/
	/**/	return $this->aa_Form;				/**/
	/**/}										/**/
	/**********************************************/
	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsMatriz(){			/**/
	/**/	return $this->aa_Matriz;			/**/
	/**/}										/**/
	/**********************************************/
	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsAuxiliar(){		/**/
	/**/	return $this->aa_Auxiliar;			/**/
	/**/}										/**/
	/**********************************************/

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	/**/public function f_Buscar(){																						/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$lix=0;																										/**/
	/**/	$ls_Sql="SELECT *FROM \"CINU\" ORDER BY cedula DESC LIMIT 35 ";												/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	While($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/		$this->aa_Matriz[$lix]['0']=$la_Tupla["cedula"];														/**/
	/**/		$nombres=explode(" ",$la_Tupla["nombres"]);																/**/
	/**/		$this->aa_Matriz[$lix]['1']=$nombres[0];																/**/
	/**/		$this->aa_Matriz[$lix]['2']=$nombres[1];																/**/
	/**/		$this->aa_Matriz[$lix]['3']=$nombres[2];																/**/
	/**/		$this->aa_Matriz[$lix]['4']=$nombres[3];																/**/
	/**/		$lb_Enc=true;																							/**/
	/**/		$lix++;																									/**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Operacion   *************************************************************************/
	/* esta funcion seleciona el SQL correcto dependiendo de la operacion sugerida por el usuario y lo ejecuta segun la	  */
	/* situacion																										  */
	/**********************************************************************************************************************/
	/**/public function f_Operacion(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	$liAuxx=-1;																									/**/
	/**/	$lb_Auxiliar=false;																							/**/
	/**/	$lb_Planificacion=true;																						/**/
	/**/	$hora=date('H:i:s');																						/**/
	/**/	$this->f_Con();																								/**/
	/**/	$this->f_Begin();																							/**/
	/**/	for($liX=0;$liX<35;$liX++){//inicio for																	    /**/
	/**/		$ls_Sql="SELECT *FROM persona WHERE(cedula='V-".$this->aa_Form['cedula'.$liX]."') ";					/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){//inicio if de guardar los estudiantes que ya estan en persona/**/
	/**/			$this->aa_Auxiliar[][]=$la_Tupla['cedula'];															/**/
	/**/			$nombres=explode(" ",$la_Tupla["nombres"]);															/**/
	/**/			$this->aa_Auxiliar[][]=$nombres[0];																	/**/
	/**/			$this->aa_Auxiliar[][]=$nombres[2];																	/**/
	/**/			$lb_Auxiliar=true;																					/**/
	/**/		}//fin if donde se guardan los estudiantes ya registrados en persona									/**/
	/**/		else																									/**/
	/**/		{//camino donde guarda en todas las tablas en ciclo normal												/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		if($this->aa_Form['Confirmacion'.$liX]!='R'){															/**/
	/**/		$cont=count($this->aa_Form['cedula'.$liX]);		echo($cont.'  '.$this->aa_Form['cedula'.$liX]);			/**/
	/**/		if(($this->aa_Form['cedula'.$liX]!=' ')&&($cont>0)){//if donde no se permiten pasar datos en blanco		/**/
	/**/		$ls_Sql0="SELECT *FROM \"CINU\" WHERE(cedula='".$this->aa_Form['cedula'.$liX]."') ORDER BY nombres ASC";/**/
	/**/			$lr_Tabla=$this->f_Filtro($ls_Sql0);																/**/
	/**/			While($la_Tupla=$this->f_Arreglo($lr_Tabla)){//ciclo necesario para conseguir dantos para  persona	/**/
	/**/				$this->aa_Matriz['telefono']=$la_Tupla["telefono"];												/**/
	/**/				$this->aa_Matriz['correo']=$la_Tupla['correo'];													/**/
	/**/				$this->aa_Matriz['rusnies']=$la_Tupla['rusnies'];												/**/
	/**/				$this->aa_Matriz['codesp']=$la_Tupla['POS'];													/**/
	/**/				$this->aa_Matriz['lugar_est']=$la_Tupla['PROM'];												/**/
	/**/			}//fin ciclo while de persona																		/**/
	/**/			$this->f_Cierra($lr_Tabla);																			/**/
	/**/			$ls_Sql1="INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,telefono,c_electronico)";	/**/
	/**/			$ls_Sql1.="VALUES ('V-".$this->aa_Form['cedula'.$liX]."','".$this->aa_Form['nombre1'.$liX]."',";	/**/
	/**/			$ls_Sql1.="'".$this->aa_Form['nombre2'.$liX]."','".$this->aa_Form['apellido1'.$liX]."',";			/**/
	/**/			$ls_Sql1.="'".$this->aa_Form['apellido2'.$liX]."','".$this->aa_Matriz['telefono']."',";				/**/
	/**/			$ls_Sql1.="'".$this->aa_Matriz['correo']."')";														/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql1);																/**/
	/**/			if($lb_Hecho==true){//inicio if para guardar en alumno												/**/
	/**/				$lb_Hecho=false;																				/**/
	/**/				$Fecha_ini=date('Y/m/d');																		/**/
	/**/				$subquery="(SELECT codesp FROM carrera WHERE nombre LIKE '%".$this->aa_Matriz['codesp']."%')";	/**/
	/**/				$pensum="(SELECT MAX(p.idpensum) FROM pensum_pre AS p  INNER JOIN carrera AS c ON(c.codesp=p.codesp)";/**/
	/**/				$pensum.=" WHERE c.nombre LIKE '%".$this->aa_Matriz['codesp']."%')";							/**/
	/**/				$ls_Sql2="INSERT INTO alumno ";																	/**/
	/**/				$ls_Sql2.="(cedula_est_pre,codigo_rusnies,tipo_persona,lugar_est,codesp,fecing,estatus,borrado,idpensum) VALUES";/**/
	/**/				$ls_Sql2.="('V-".$this->aa_Form['cedula'.$liX]."','".$this->aa_Matriz['rusnies']."','CIVIL',";	/**/
	/**/				$ls_Sql2.="'".$this->aa_Matriz['rusnies']."',".$subquery.",'$Fecha_ini','A','I',$pensum) ";		/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql2);															/**/
	/**/				if($lb_Hecho==true){//inicio if para guardar usuario											/**/
	/**/					$lb_Hecho=false;																			/**/
	/**/					//verifico en la Base de Datos que el envio de emails este Activo							/**/
	/**/					if($this->comprobarEnvio()){																/**/
	/**/						//si el envio esta autorizado se envia un correo al estudiante con una contraseña		/**/
	/**/						//generada automaticamente de 8 caracteres												/**/
	/**/						$nombres=$this->aa_Form['nombre1'.$liX]." ".$this->aa_Form['nombre1'.$liX]." ";			/**/
	/**/						$nombres.=$this->aa_Form['apellido1'.$liX]." ".$this->aa_Form["apellido2".$liX]." ";	/**/
	/**/						$contrasena=$f_EnvioContrasena($nombres,$this->aa_Matriz['correo']);					/**/
	/**/					}else{																						/**/
	/**/						//Si el envio de correo no esta autorizado le coloco la cedula del estudiante como		/**/
	/**/						//su contraseña asignada																/**/
	/**/						$contrasena=$this->aa_Form['cedula'.$liX];												/**/
	/**/					}																							/**/
	/**/					$ls_Sql3="INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES ";					/**/
	/**/					$ls_Sql3.="('E".$this->aa_Form['cedula'.$liX]."',";											/**/
	/**/					$ls_Sql3.="'".hash('whirlpool',$contrasena)."',";											/**/
	/**/					$ls_Sql3.="'3','V-".$this->aa_Form['cedula'.$liX]."')";										/**/
	/**/					$lb_Hecho=$this->f_Ejecutar($ls_Sql3);														/**/
	/**/					if(($lb_Hecho==true) and ($lb_Planificacion==true)){//inicio if para guardar planificacion	/**/
	/**/						$lb_Planificacion=false;																/**/
	/**/						$lb_Hecho=false;																		/**/
	/**/						$lsSql="select max(idplanificacion) as mayor from planificacion_sec";					/**/
	/**/						$lr_Tabla=$this->f_Filtro($lsSql);														/**/
	/**/						if($la_Tupla=$this->f_Arreglo($lr_Tabla)){//inicio if para codigo de planificacion		/**/
	/**/							if($la_Tupla["mayor"]==""){$liAux=1;}else{$liAux=$la_Tupla["mayor"]+1;}				/**/
	/**/						}//fin if para codigo planificacion														/**/
	/**/						$this->f_Cierra($lr_Tabla);																/**/
	/**/						$lsSql1="SELECT * FROM regimen WHERE (tipo_turno='DIURNO')";							/**/
	/**/						$lr_Tabla=$this->f_Filtro($lsSql1);														/**/
	/**/						if($la_Tupla=$this->f_Arreglo($lr_Tabla)){//inicio if para codigo de regimen			/**/
	/**/							$li_Regimen=$la_Tupla['idregimen'];													/**/
	/**/						}//fin if para codigo regimen															/**/
	/**/						$lsSqll="SELECT idplanificacion AS idp FROM planificacion_sec WHERE(codesp=".$subquery.")";	/**/
	/**/						$lsSqll.="AND (peraca='".$_SESSION['peraca']."') AND (semestre='0')";					/**/
	/**/						$lr_Tabla=$this->f_Filtro($lsSqll);														/**/
	/**/						if($la_Tupla=$this->f_Arreglo($lr_Tabla)){//inicio if para codigo de planificacion		/**/
	/**/								$lsSql="SELECT MAX(pm_codigo) AS mayor FROM planificacion_materias  ";			/**/
	/**/								$lsSql.="WHERE idplanificacion='".$la_Tupla['idp']."' ";						/**/
	/**/								$lr_Tabla=$this->f_Filtro($lsSql);												/**/
	/**/								if($la_Tupla=$this->f_Arreglo($lr_Tabla)){//inicio if para codigo de PM 		/**/
	/**/									$liAux2=$la_Tupla["mayor"];													/**/
	/**/									$lb_Hecho=true;																/**/
	/**/								} 																				/**/
	/**/						}else{																					/**/
	/**/							$ls_Sql4="INSERT INTO planificacion_sec (peraca,codesp,regimen,semestre,fechapla,horapla,";	/**/
	/**/							$ls_Sql4.="seccion,idplanificacion) VALUES ('".$_SESSION["peraca"]."',";			/**/
	/**/							$ls_Sql4.=$subquery.",'$li_Regimen','0','$Fecha_ini','$hora','1',";					/**/
	/**/							$ls_Sql4.="'$liAux')";																/**/
	/**/							$lb_Hecho=$this->f_Ejecutar($ls_Sql4);												/**/
	/**/							if($lb_Hecho){																		/**/
	/**/								$lb_Hecho=false;																/**/
	/**/								$lsSql="SELECT MAX(pm_codigo) AS mayor FROM planificacion_materias";			/**/
	/**/								$lr_Tabla=$this->f_Filtro($lsSql);												/**/
	/**/								if($la_Tupla=$this->f_Arreglo($lr_Tabla)){//inicio if para codigo de PM 		/**/
	/**/									if($la_Tupla["mayor"]==""){													/**/
	/**/										$liAux2=1;																/**/
	/**/									}else{																		/**/
	/**/										$liAux2=$la_Tupla["mayor"]+1;											/**/
	/**/									}																			/**/
	/**/								}//fin if para codigo inscripcion												/**/
	/**/								$ls_Sql5="INSERT INTO planificacion_materias (pm_codigo,idplanificacion,codmat)";/**/
	/**/								$ls_Sql5.="VALUES";																/**/
	/**/								$ls_Sql5.="($liAux2,$liAux,(SELECT codmat FROM materia WHERE idpensum=";		/**/
	/**/								$ls_Sql5.=" (SELECT CAST(MAX(CAST (idpensum AS INTEGER)) AS CHARACTER)";		/**/
	/**/								$ls_Sql5.=" FROM pensum_pre WHERE codesp=(SELECT codesp FROM carrera WHERE ";	/**/
	/**/								$ls_Sql5.="nombre LIKE '".$this->aa_Matriz['codesp']."')) AND codmat LIKE 'CINU%'))";/**/	
	/**/								$lb_Hecho=$this->f_Ejecutar($ls_Sql5);											/**/
	/**/							}else{																				/**/
	/**/								$this->f_RollBack();															/**/
	/**/							}																					/**/
	/**/						}																						/**/
	/**/					}//fin if para guardar en planificacion														/**/
	/**/					else if(!$lb_Hecho){																		/**/
	/**/						echo"<br> planificaion$liX";															/**/
	/**/						$this->f_RollBack();																	/**/
	/**/					}																							/**/
	/**/					if($lb_Hecho==true){//inicio if para el guardado en inscripcion								/**/
	/**/						$lb_Hecho=false;																		/**/
	/**/						$lsSql="SELECT MAX(num_inscripcion) AS mayor FROM inscripcion_pre";						/**/
	/**/						$lr_Tabla=$this->f_Filtro($lsSql);														/**/
	/**/						if($la_Tupla=$this->f_Arreglo($lr_Tabla)){//inicio if para codigo de inscripcion		/**/
	/**/							if($la_Tupla["mayor"]==""){															/**/
	/**/								$liAux1=1;																		/**/
	/**/							}																					/**/
	/**/							else{																				/**/
	/**/								$liAux1=$la_Tupla["mayor"]+1;													/**/
	/**/							}																					/**/
	/**/						}//fin if para codigo inscripcion														/**/
	/**/						$this->f_Cierra($lr_Tabla);																/**/
	/**/						if($liAuxx!=-1){$liAux=$liAuxx;}														/**/
	/**/						$ls_Sql6="INSERT INTO inscripcion_pre (num_inscripcion,cedula_est_pre,fecha_inscrip";	/**/
	/**/						$ls_Sql6.=",hora,peraca,pm_codigo) VALUES ('$liAux1'";									/**/
	/**/						$ls_Sql6.=",'V-".$this->aa_Form['cedula'.$liX]."','$Fecha_ini','$hora',";				/**/
	/**/						$ls_Sql6.="'".$_SESSION["peraca"]."','$liAux2')";										/**/
	/**/						$lb_Hecho=$this->f_Ejecutar($ls_Sql6);													/**/
	/**/						if($lb_Hecho==true){//inico if para guardar en insnot									/**/
	/**/							$lb_Hecho=false;																	/**/
	/**/							$ls_Sql8="INSERT INTO insnot (cedula_est_pre,condicion,asistencia,idinscripcion,";	/**/
	/**/							$ls_Sql8.="notadef,notarep) VALUES ('V-".$this->aa_Form['cedula'.$liX]."',";		/**/
	/**/							$ls_Sql8.="'2','0','$liAux1','0','0')";												/**/
	/**/							$lb_Hecho=$this->f_Ejecutar($ls_Sql8);												/**/
	/**/							if($lb_Hecho==true){																/**/
	/**/								$ls_Sql9="DELETE FROM \"CINU\" WHERE(cedula='".$this->aa_Form['cedula'.$liX]."')";/**/
	/**/								$lb_Hecho=$this->f_Ejecutar($ls_Sql9);											/**/
	/**/							}																					/**/
	/**/						}//fin if para guardar en insnot														/**/
	/**/					}//fin if para guardado en inscripcion														/**/
	/**/				}//fin if para guardar en usuario																/**/
	/**/				else{																							/**/
	/**/					echo"<br> usuario$liX";																		/**/
	/**/					$this->f_RollBack();																		/**/
	/**/				}																								/**/
	/**/			}//fin if para guardar en alumno																	/**/
	/**/			else{																								/**/
	/**/				echo"<br> alumno$liX";																			/**/
	/**/				$this->f_RollBack();																			/**/
	/**/			}																									/**/
	/**/			echo('aqui2');}//fin de donde se verifica si viene los datos en blanco								/**/
	/**/		}else{																									/**/
	/**/			$ls_Sql9="DELETE FROM \"CINU\" WHERE(cedula='".$this->aa_Form['cedula'.$liX]."')";					/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql9);																/**/
	/**/		}																										/**/
	/**/		}//fin del camino normal donde se guarda en las tablas 													/**/
	/**/		echo('aqui');}//fin for																					/**/
	/**/		if($lb_Hecho==true){//inicio commit																		/**/
	/**/			$this->f_Commit();																					/**/
	/**/		}//fin commit																							/**/
	/**/		else{//ultimo rollback																					/**/
	/**/			echo"<br> rollback final";																			/**/
	/**/			$this->f_RollBack();																				/**/
	/**/		}//fin ultimo rollback																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		$this->ab_Retornar[0]=$lb_Hecho;																		/**/
	/**/		$this->ab_Retornar[1]=$lb_Auxiliar;																		/**/
	/**/	return $ab_Retornar;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Envio Contrasena  *******************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
		public function f_EnvioContrasena($nombres,$correo){															
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
				     
				//Vamos formando la contraseña en cada iteraccion del bucle, añadiendo a la cadena $pass la letra 
				//correspondiente a la posicion $pos en la cadena de caracteres definida.
				$pass .= substr($cadena,$pos,1);
			}

			$envio=false;																							
			require_once("../modulos/MAILS/clases/cls_Correos.php");												
			$lobjCorreo=new cls_Correos;																			
			$laParametros['Para']=$correo;													
			$laParametros['ParaNombre']=$nombres;
			$this->f_Cierra($lr_Tabla);																				
			$this->f_Des();																							
			$laParametros['Asunto']="Envio Contraseña";														
			$laParametros['AltContenido']="Estimado Estudiante: ".$nombres." Se le informa que la informacion requerida para accesar al sistema <a href='http://www.testing-case.com.ve/''>UNEFA Portuguesa</a> es: Usuario: . Clave: ".$pass." Al accesar por primera vez al Sistema <a href='http://www.testing-case.com.ve/'>UNEFA Portuguesa</a> se le pedira actualizar su clave por seguridad.";								
			$laParametros['Contenido']='<html>
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
													color: rgb(38, 114, 236);
												}


											</style>
										</head>
										<body>
											<div cabecera>
												<p>UNEFA Portuguesa.</p>
											</div>
											<div contenido>
												<h1>Estimado Estudiante: '.$nombres.'.</h1><br>
												<p>Se le informa que la informacion requerida para accesar al sistema <a href="http://www.testing-case.com.ve/">UNEFA Portuguesa</a> es:</p><br>
												<p>Usuario: .</p><br>
												<p>Clave: '.$pass.'.</p><br>
												<p>Al accesar por primera vez al Sistema <a href="http://www.testing-case.com.ve/">UNEFA Portuguesa</a> se le pedira actualizar su clave por seguridad.</p>
											</div>
											<div pie>
												<p>Carretera Nacional Vía Payara Sector Piedritas Blancas Edificio Pozo Blanco, Acarigua - Portuguesa.</p>
											</div>
										</body>
									</html>';																	
			//print("<pre>");																							
			$lobjCorreo->setParametros($laParametros);																
			if($lobjCorreo->enviarCorreo()){																		
				//print "Envio el correo";																			
			}else{																									
				//print "No Envio";																					
			}																										
		return $pass;																								
	}																												
	/**********************************************************************************************************************/
}
?>
