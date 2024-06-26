<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Tipo_Ambiente extends  cls_Bitacora{
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

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	/**/public function f_Buscar(){																						/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$ls_Sql="SELECT *FROM tipo_ambiente WHERE (tip_cod='".$this->aa_Form['Codigo']."' and tip_estatus='A')";	/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["tip_cod"];															/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["tip_nombre"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["tip_estatus"];														/**/
	/**/		$this->aa_Form['Descripcion']=$la_Tupla["tip_descripcion"];												/**/
	/**/		$lb_Enc=true;																							/**/
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
	/**/	if($this->aa_Form['Operacion']=="incluir"){																	/**/
	/**/		$ls_Sql="INSERT INTO tipo_ambiente (tip_cod,tip_nombre,tip_estatus,tip_descripcion)VALUES ";			/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Codigo']."','".$this->aa_Form['Nombre']."',";								/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Descripcion']."')";	 					/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE tipo_ambiente SET tip_nombre='".$this->aa_Form['Nombre']."',tip_estatus=";				/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."',tip_descripcion='".$this->aa_Form['Descripcion']."'";			/**/
	/**/		$ls_Sql.=" WHERE (tip_cod='".$this->aa_Form['Codigo']."')";												/**/																			/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE  tipo_ambiente SET tip_estatus='B' WHERE (tip_cod='".$this->aa_Form['Codigo']."')";		/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Tipo de Ambiente",$ls_Sql,"Usuario en session")){									/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	return $lb_Hecho;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

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
	/**/			$lsSql="select * FROM tipo_ambiente where tip_estatus='A' AND tip_nombre like '%".$this->aa_Form['valor']."%'";	/**/
	/**/			$lsSql.="ORDER BY tip_nombre LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM tipo_ambiente where (tip_estatus='A') ORDER BY tip_nombre LIMIT $cantidad OFFSET $inicial";/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["tip_cod"];															/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["tip_nombre"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["tip_descripcion"];													/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["tip_estatus"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}	
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT * FROM tipo_ambiente WHERE tip_estatus='A' AND tip_nombre LIKE '%".$this->aa_Form['valor']."%' ";	/**/
	/**/				$lsSql.="ORDER BY tip_nombre ";																	/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM tipo_ambiente WHERE (tip_estatus='A') ORDER BY tip_nombre ";					/**/
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
