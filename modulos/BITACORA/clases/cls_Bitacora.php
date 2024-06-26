<?php
	include_once("../CORE/cls_ConexionPos.php");
	class cls_Bitacora extends cls_Conexion{

		private $as_Hora;
		private $as_Fecha;

	/************************ Funcion Constructor *****************************************************/
	/* es la funcion constructor de la clase 														  */
	/**************************************************************************************************/	
	/**/	public function f_Inicializar($psOperacion)												/**/
	/**/	{																						/**/
	/**/		$this->as_Hora=date('h:s');							 					   			/**/
	/**/		$this->as_Fecha=date('Y/m/d');														/**/
	/**/		$lsOperacion=str_replace("'","",$psOperacion);										/**/
	/**/		return $lsOperacion;																/**/
	/**/	}																						/**/
	/**************************************************************************************************/

	/************************ Funcion Supervisar  *****************************************************/
	/* esta funcion como su nombre lo dice guarda los datos sobre la operacion realizada quien la     */
	/* realizo, que operacion, ademas de la fecha y hora de la misma en la base de datos              */
	/**************************************************************************************************/	
	/**/	protected function f_Supervisar($psTabla,$psOperacion,$psUsuario)						/**/
	/**/	{																						/**/
	/**/		$psUsuario=$_SESSION['usuario']['Nombre'];											/**/
	/**/		$lb_Hecho=false;																	/**/
	/**/		$psOperacion=$this->f_Inicializar($psOperacion);									/**/
	/**/		$ls_Sql="INSERT INTO bitacora (nombre_usu, hora, fecha, tabla,operacion)";			/**/ 
  	/**/		$ls_Sql.="VALUES";																	/**/
  	/**/		$ls_Sql.="('$psUsuario','$this->as_Hora','$this->as_Fecha','$psTabla','$psOperacion')";/**/
	/**/		$this->f_Con();																		/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);												/**/
	/**/		$this->f_Des();												   						/**/
	/**/		return $lb_Hecho;																	/**/
	/**/	}																						/**/
	/**************************************************************************************************/

	/************************ Funcion Supervisar  *****************************************************/
	/* esta funcion como su nombre lo dice guarda los datos sobre la operacion realizada quien la     */
	/* realizo, que operacion, ademas de la fecha y hora de la misma en la base de datos              */
	/**************************************************************************************************/	
	/**/	protected function f_SupervisarTransaccion($psTabla,$psOperacion,$psUsuario)			/**/
	/**/	{																						/**/
	/**/		$psUsuario=$_SESSION['usuario']['Nombre'];											/**/
	/**/		$lb_Hecho=false;																	/**/
	/**/		$psOperacion=$this->f_Inicializar($psOperacion);									/**/
	/**/		$ls_Sql="INSERT INTO bitacora (nombre_usu, hora, fecha, tabla,operacion)";			/**/ 
  	/**/		$ls_Sql.="VALUES";																	/**/
  	/**/		$ls_Sql.="('$psUsuario','$this->as_Hora','$this->as_Fecha','$psTabla','$psOperacion')";/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);												/**/
	/**/		return $lb_Hecho;																	/**/
	/**/	}																						/**/
	/**************************************************************************************************/

	/************************ Funcion Bitacora Acceso***************************************************/
	/* esta funcion se encarga de guardar en la bitacora de acceso 								      */
	/**************************************************************************************************/	
	/**/	protected function f_Acceso($ip,$psOperacion,$psUsuario)								/**/
	/**/	{																						/**/
	/**/		$this->as_Hora=date('h:s');							 					   			/**/
	/**/		$this->as_Fecha=date('Y/m/d');														/**/
	/**/		$lb_Hecho=false;																	/**/
	/**/		$ls_Sql="INSERT INTO bitacora_acceso (usuario, hora, fecha, operacion,ip_acceso)";	/**/ 
  	/**/		$ls_Sql.="VALUES";																	/**/
  	/**/		$ls_Sql.="('$psUsuario','$this->as_Hora','$this->as_Fecha','$psOperacion','$ip')";/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);												/**/
	/**/		return $lb_Hecho;																	/**/
	/**/	}																						/**/
	/**************************************************************************************************/

	/************************ Funcion Obtener IP    ***************************************************/
	/* Obtiene la ip publica real de una peticion				 								      */
	/**************************************************************************************************/	
	/**/	protected function obtenerIP()															/**/
	/**/	{																						/**/
	/**/		if(!empty($_SERVER['HTTP_CLIENT_IP'])) {											/**/
	/**/		    $ip=$_SERVER['HTTP_CLIENT_IP'];													/**/
	/**/		} elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {								/**/
	/**/		    $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];											/**/
	/**/		} else {																			/**/
	/**/		    $ip=$_SERVER['REMOTE_ADDR'];													/**/
	/**/		}																					/**/
	/**/		return $ip;																			/**/
	/**/	}																						/**/
	/**************************************************************************************************/

	/************************ Funcion Comparar Pass ***************************************************/
	/* compara la contraseña con el historial del usuario		 								      */
	/**************************************************************************************************/	
	/**/	protected function compararPass($psUsuario,$psPass)										/**/
	/**/	{																						/**/
	/**/		$pass=array();																		/**/
	/**/		$valido=true;																		/**/
	/**/		$ls_Sql="SELECT historial_clave FROM servidor";										/**/ 
	/**/		$this->f_Con();																		/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);													/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){											/**/
	/**/			$cantidad=$la_Tupla["historial_clave"];											/**/
	/**/		}																					/**/
	/**/		$this->f_Cierra($lr_Tabla);															/**/
	/**/		$this->f_Des();																		/**/
	/**/		$x=0;																				/**/
	/**/		$ls_Sql="SELECT * FROM historial_clave WHERE usuario='$psUsuario'";					/**/
	/**/		$ls_Sql.=" ORDER BY fecha DESC LIMIT $cantidad";									/**/ 
	/**/		$this->f_Con();																		/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);													/**/
	/**/		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){										/**/
	/**/			$pass[$x]=$la_Tupla["clave"];													/**/
	/**/			$x++;																			/**/
	/**/		}																					/**/
	/**/		$this->f_Cierra($lr_Tabla);															/**/
	/**/		$this->f_Des();																		/**/
	/**/		for($y=0;$y<$x;$y++){																/**/
	/**/			if($pass[$y]==$psPass){															/**/
	/**/				$valido=false;																/**/
	/**/			}																				/**/
	/**/		}																					/**/
	/**/		return $valido;																		/**/
	/**/	}																						/**/
	/**************************************************************************************************/

	/************************ Funcion Comproba Envio   ********************************************************************/
	/* esta funcion Verifica que el campo de envio este activo en la base de datos										  */
	/**********************************************************************************************************************/
	/**/	public function comprobarEnvio(){																			/**/
	/**/		$envio="f";																								/**/
	/**/		$ls_Sql="SELECT codigo_seguridad FROM servidor WHERE idconfiguracion='1'";								/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$envio=($la_Tupla['codigo_seguridad']=='t')?true:false;												/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		$this->f_Des();																							/**/
	/**/		return	$envio;																							/**/
	/**/	}																											/**/
	/**********************************************************************************************************************/

	/************************ Funcion Comproba Envio  trans ***************************************************************/
	/* esta funcion Verifica que el campo de envio este activo en la base de datos										  */
	/**********************************************************************************************************************/
	/**/	public function comprobarEnvioTrans(){																		/**/
	/**/		$envio="f";																								/**/
	/**/		$ls_Sql="SELECT codigo_seguridad FROM servidor WHERE idconfiguracion='1'";								/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$envio=($la_Tupla['codigo_seguridad']=='t')?true:false;												/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		return	$envio;																							/**/
	/**/	}																											/**/
	/**********************************************************************************************************************/
	}
