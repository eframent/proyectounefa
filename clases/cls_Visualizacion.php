<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Visualizacion extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}
		public function f_SetForm($ps_Form){
			$this->aa_Form=$ps_Form;
		}

	/************************ Funcion Bloques     *************************************************************************/
	/* esta funcion se encarga buscar todos los bloques que se encuentren en la base de datos y este activos			  */
	/**********************************************************************************************************************/
	/**/	public function fBloques()																					/**/
	/**/	{																											/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=0;																									/**/
	/**/		$regimen=$this->aa_Form['Regimen'];																		/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT * FROM bloque WHERE(blo_status='A') AND (idregimen='$regimen') ORDER BY blo_posicion";	/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["blo_codigo"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["blo_rango"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $laMatriz;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Ambientes   *************************************************************************/
	/* esta funcion se encarga buscar todos los Ambientes que se encuentren en la base de datos y este activos			  */
	/**********************************************************************************************************************/
	/**/	public function fAmbientes()																				/**/
	/**/	{																											/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=0;																									/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT * FROM ambiente WHERE(estatus='A') AND (borrado='I') ORDER BY tip_cod";					/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["codigo"];															/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["nombre"];															/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["direcion"];														/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["tip_cod"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $laMatriz;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Ambientes   *************************************************************************/
	/* esta funcion se encarga buscar todos los Ambientes que se encuentren en la base de datos y este activos			  */
	/**********************************************************************************************************************/
	/**/	public function fTipoAmbientes()																			/**/
	/**/	{																											/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=0;																									/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT * FROM tipo_ambiente WHERE(tip_estatus='A')  ";											/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["tip_cod"];															/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["tip_nombre"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $laMatriz;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion BloquesOcupados *********************************************************************/
	/* esta funcion se encarga buscar los bloques de horario que ya estan en uso 										  */
	/**********************************************************************************************************************/
	/**/	public function fBloquesOcupados()																			/**/
	/**/	{																											/**/
	/**/		if($this->aa_Form['Seccion']!=""){$seccion="AND p.idplanificacion<>'".$this->aa_Form['Seccion']."'";}	/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=0;																									/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT dpm.*,pm.cedula_docente FROM planificacion_sec AS p ";									/**/
	/**/		$lsSql.="INNER JOIN planificacion_materias AS pm ON(p.idplanificacion=pm.idplanificacion)";				/**/
	/**/		$lsSql.="INNER JOIN detalle_pm AS dpm ON(pm.pm_codigo=dpm.pm_codigo) ";									/**/
	/**/		$lsSql.="WHERE (p.peraca='".$_SESSION['peraca']."') $seccion";											/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["dia"];																/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["blo_codigo"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["amb_codigo"];														/**/
	/**/			if($laTupla ["cedula_docente"]==$this->aa_Form["Docente"]){											/**/
	/**/				$laMatriz [$liI] [3]= "3";																		/**/
	/**/			}else{																								/**/
	/**/				$laMatriz [$liI] [3]= "0";																		/**/
	/**/			}		   																							/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $laMatriz;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Horas	*******************************************************************************/
	/* esta funcion se encarga buscar y sumar las horas de clase de una materia 										  */
	/**********************************************************************************************************************/
	/**/	public function fHoras()																					/**/
	/**/	{																											/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT (horteo+horpra+horlab) AS horas FROM materia WHERE(codmat='".$this->aa_Form['Valor']."')";/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		if($laTupla=$this->f_Arreglo($lrTb)){																	/**/
	/**/			$horas= $laTupla ["horas"];																			/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $horas;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Horas	*******************************************************************************/
	/* esta funcion se encarga buscar y sumar las horas de clase de una materia 										  */
	/**********************************************************************************************************************/
	/**/	public function fHorasD()																					/**/
	/**/	{																											/**/
	/**/		$docente=$this->aa_Form['Docente'];																		/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT count(pm.cedula_docente) AS horas FROM planificacion_sec AS p ";							/**/
	/**/		$lsSql.="INNER JOIN planificacion_materias AS pm ON(p.idplanificacion=pm.idplanificacion)";				/**/
	/**/		$lsSql.="INNER JOIN detalle_pm AS dpm ON(pm.pm_codigo=dpm.pm_codigo) ";									/**/
	/**/		$lsSql.="WHERE (p.peraca='".$_SESSION['peraca']."') AND (pm.cedula_docente='$docente')";				/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		if($laTupla=$this->f_Arreglo($lrTb)){																	/**/
	/**/			$horas= $laTupla ["horas"];																			/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $horas;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Horas	*******************************************************************************/
	/* esta funcion se encarga buscar y sumar las horas de clase de una materia 										  */
	/**********************************************************************************************************************/
	/**/	public function fTopeHorasD()																				/**/
	/**/	{																											/**/
	/**/		$docente=$this->aa_Form['Docente'];																		/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT d.topehoras AS horas FROM docente AS doc ";												/**/
	/**/		$lsSql.="INNER JOIN dedicacion AS d ON(doc.dedicacion=d.codigo)";										/**/
	/**/		$lsSql.="WHERE doc.cedula_doc='$docente' ";																/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		if($laTupla=$this->f_Arreglo($lrTb)){																	/**/
	/**/			$horas= $laTupla ["horas"];																			/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $horas;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
}
?>
