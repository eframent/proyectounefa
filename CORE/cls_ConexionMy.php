<?php 
class cls_Conexion {
	
	private $ar_Con;
	
	/******************** Funcion Conectar ************************************************************************/
	/* Funcion que se utiliza para la coneccion 																  */
	/**************************************************************************************************************/
	/**/protected function f_Con(){																				/**/
	/**/	$ls_Serv="localhost";																				/**/
	/**/	$ls_Usr="root";																						/**/
	/**/	$ls_Pass="iutep";																					/**/
	/**/	$ls_Bd="unefa";																						/**/
	/**/	$this->ar_Con=mysql_connect($ls_Serv,$ls_Usr,$ls_Pass) or die ('coneccion fallida'.mysql_error());	/**/
	/**/	mysql_select_db($ls_Bd,$this->ar_Con);																/**/
	/**/	mysql_query("SET NAMES utf8");																		/**/
	/**/}																										/**/
	/**************************************************************************************************************/
	
	/******************** Funcion Ejecutar ****************************************/
	/* esta funcion es la encargada de ejecutar las sentencias SQL pasadas como   */
	/* parametro a la funcion y regresar si los ejecuto o no 					  */
	/******************************************************************************/
	/**/protected function f_Ejecutar($ps_Sql){									/**/
	/**/	$lb_Hecho=false;													/**/
	/**/	mysql_query($ps_Sql,$this->ar_Con);									/**/
	/**/	if(mysql_affected_rows($this->ar_Con)>0){							/**/
	/**/		$lb_Hecho=true;													/**/
	/**/	}																	/**/
	/**/	return $lb_Hecho;													/**/
	/**/}																		/**/
	/******************************************************************************/

	/******************** Funcion Filtro ******************************************/
	/* este funcion se encarga realizar las busquedas y retornar el resultado de  */
	/* misma 																	  */
	/******************************************************************************/
	/**/protected function f_Filtro($ps_Sql){									/**/
	/**/	$lr_Tabla=mysql_query($ps_Sql,$this->ar_Con);						/**/
	/**/	return $lr_Tabla;													/**/
	/**/}																		/**/
	/******************************************************************************/

	/******************** Funcion Arreglo *****************************************/
	/* esta funcion se encarga realizar la transformacion de un resultado query   */
	/* en un arreglo asosiativo													  */
	/******************************************************************************/
	/**/protected function f_Arreglo($pr_Tabla){								/**/
	/**/	$la_Tupla=mysql_fetch_array($pr_Tabla);								/**/
	/**/	return $la_Tupla;													/**/
	/**/}																		/**/
	/******************************************************************************/

	/******************** Funcion Cierra  *****************************************/
	/* esta funcion cierra o elimina el resultado de la busqueda para evitar      */
	/* perdida de informacion													  */
	/******************************************************************************/
	/**/protected function f_Cierra($pr_Tabla){									/**/
	/**/	mysql_free_result($pr_Tabla);										/**/
	/**/}																		/**/
	/******************************************************************************/

	/******************** Funcion Desconectar *************************************/
	/* esta funcion cierra la coneccion o Desconecta 						      */
	/******************************************************************************/
	/**/protected function f_Des(){												/**/
	/**/	mysql_close($this->ar_Con);											/**/
	/**/}																		/**/
	/******************************************************************************/

	/**************** Funciones BEGIN-ROLLBACK-COMMIT *****************************/
	/* Estas funciones son las encargadas de gestionar las transacciones 	      */
	/* realizadas dentro de nustra aplicacion									  */
	/******************************************************************************/
	/**/protected function f_Begin(){											/**/
	/**/	mysql_query("BEGIN",$this->ar_Con);									/**/
	/**/}																		/**/
	/******************************************************************************/
	/**/protected function f_Commit(){											/**/
	/**/	mysql_query("COMMIT",$this->ar_Con);								/**/
	/**/}																		/**/
	/******************************************************************************/
	/**/protected function f_RollBack(){										/**/
	/**/	mysql_query("ROLLBACK",$this->ar_Con);								/**/
	/**/}																		/**/
	/******************************************************************************/

	/******************** Funcion Registros   *************************************/
	/* esta funcion retorna cantidad de filas devueltas en un query			      */
	/******************************************************************************/
	/**/protected function f_Registro($prTb)									/**/
    /**/{																		/**/  
 	/**/    $li_Registros=mysql_num_rows($prTb);								/**/
 	/**/    return $li_Registros;												/**/
    /**/}																		/**/
    /******************************************************************************/
}

?>
