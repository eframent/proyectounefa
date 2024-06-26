<?php
include_once("../../CORE/cls_ConexionPos.php");

class  cls_ConstanciadeEst extends  cls_Conexion{
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
	/**/	$ls_Sql="select p.nombre1,p.nombre2,p.apellido1,p.apellido2,a.cedula_est_pre,s.nombre as semestre,c.nombre
                     as carrera from alumno as a
                     inner join persona as p ON (a.cedula_est_pre=p.cedula) 
                     inner join semestre as s ON (s.idsemestre=a.semestre) 
                     inner join carrera as c ON (c.codesp=a.codesp) 
                     where (a.cedula_est_pre='$this->asbusqueda') and a.estatus='A'";
	/**/	$this->f_Con();	
			$laMatriz= array();																							/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$laMatriz [$liI] [0]=$la_Tupla["cedula_est_pre"];        	   									    	/**/
	/**/		$laMatriz [$liI] [1]=$la_Tupla["nombre1"];        			        							    	/**/
	/**/		$laMatriz [$liI] [2]=$la_Tupla["nombre2"];        		         								    	/**/
	/**/		$laMatriz [$liI] [3]=$la_Tupla["apellido1"];        	    									    	/**/
	/**/		$laMatriz [$liI] [4]=$la_Tupla["apellido2"];        	    									    	/**/
	/**/		$laMatriz [$liI] [5]=$la_Tupla["semestre"];        		        								    	/**/
	/**/		$laMatriz [$liI] [6]=$la_Tupla["carrera"];        			        							    	/**/
	/**/		$liI++; 																					            /**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $laMatriz;		           																			/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

}
?>
