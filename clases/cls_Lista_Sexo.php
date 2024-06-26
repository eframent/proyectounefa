<?php
include_once("../../CORE/cls_ConexionPos.php");

class  cls_Sexo extends  cls_Conexion{
		private $asbusqueda;

		public function __construct(){
			$this->asbusqueda="";
		}

	/********* Funcion Obtener Busqueda   *********/
	/**/public function fSetsbusqueda($psbusqueda){/**/
	/**/	$this->asbusqueda=$psbusqueda;		/**/
	/**/}										/**/
	/**********************************************/

	/********* Funcion Retornar Busqueda   ********/
	/**/public function	fGetsbusqueda(){			/**/
	/**/	return $this->asbusqueda;			/**/
	/**/}										/**/
	/**********************************************/

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	/**/public function fBusqueda(){																						/**/
	/**/	$liI=0;																							        	/**/
	/**/	$ls_Sql="select *from persona as p
                     inner join alumno as a ON (p.cedula=a.cedula_est_pre)
                     where (p.sexo='$this->asbusqueda')";
	/**/	$this->f_Con();	
			$laMatriz= array();																							/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$laMatriz [$liI] [0]=$la_Tupla["cedula_est_pre"];        	   									    	/**/
	/**/		$laMatriz [$liI] [1]=$la_Tupla["nombre1"];        			        							    	/**/
	/**/		$laMatriz [$liI] [2]=$la_Tupla["nombre2"];        		         								    	/**/
	/**/		$laMatriz [$liI] [3]=$la_Tupla["apellido1"];        	    									    	/**/
	/**/		$laMatriz [$liI] [4]=$la_Tupla["apellido2"];        	    									    	/**/
	/**/		$laMatriz [$liI] [5]=$la_Tupla["sexo"];        	    									    	/**/
	/**/		$liI++; 																					            /**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $laMatriz;		           																			/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

}
?>
