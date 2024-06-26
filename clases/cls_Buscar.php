<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Buscar extends  cls_Bitacora{
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

	/************************ Funcion Listar      *************************************************************************/
	/* esta funcion se encarga de listar todos los registros que se encuentren en la base de datos  					  */
	/**********************************************************************************************************************/
	/**/	public function fListar ()																					/**/
	/**/	{																											/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=1;																									/**/
	/**/		$cantidad=8;// cantidad de resultados por página														/**/
	/**/		$inicial= $this->aa_Form['pg'] * $cantidad; // desde que registro va a iniciar la busqueda				/**/
	/**/		$this->f_Con();																							/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT * FROM tpersona WHERE per_nom like '%".$this->aa_Form['valor']."%' AND (tip_cod='1')";/**/
	/**/			$lsSql.="ORDER BY per_nom LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM tpersona WHERE(tip_cod='1') ORDER BY per_nom LIMIT $cantidad OFFSET $inicial";/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["per_ced"];															/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["per_nom"];															/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["per_ape"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT * FROM tpersona WHERE per_nom like '%".$this->aa_Form['valor']."%' AND (tip_cod='1')";/**/
	/**/			$lsSql.="ORDER BY per_nom LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM tpersona WHERE(tip_cod='1') ORDER BY per_nom ";								/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		if (!isset($_SESSION["num_reg"])){ // revisa si la variable existe 										/**/
	/**/			$_SESSION["num_reg"]=$this->f_Registro($lrTb); // se busca la cantidad de registros 				/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $laMatriz;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
}
?>
