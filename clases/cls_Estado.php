<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Plantilla extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT *FROM estado WHERE(idestado='".$this->aa_Form['Codigo']."' and borrado='I')";				/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["idestado"];															/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre_e"];															/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
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
	/**/		$ls_Sql="INSERT INTO estado (idestado,nombre_e,estatus,borrado) VALUES ";								/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Codigo']."','".$this->aa_Form['Nombre']."',";								/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','I')";														/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE  estado SET nombre_e='".$this->aa_Form['Nombre']."',";									/**/
	/**/		$ls_Sql.="estatus='".$this->aa_Form['Estatus']."' WHERE(idestado='".$this->aa_Form['Codigo']."')";		/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE  estado sET borrado='A' WHERE (idestado='".$this->aa_Form['Codigo']."')";				/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Estado",$ls_Sql,$_SESSION['usuario']['Nombre'])){									/**/
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
	/**/			$lsSql="select * FROM estado WHERE borrado='I' AND nombre_e like '%".$this->aa_Form['valor']."%'";	/**/
	/**/			$lsSql.="ORDER BY nombre_e LIMIT $cantidad OFFSET $inicial";												/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM estado WHERE (borrado='I')ORDER BY nombre_e LIMIT $cantidad OFFSET $inicial";		/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["idestado"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["nombre_e"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["estatus"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="select * FROM estado WHERE borrado='I' AND nombre_e like '%".$this->aa_Form['valor']."%' ";	/**/
	/**/			$ls_Sql.="ORDER BY nombre_e ";																		/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM estado WHERE (borrado='I') ORDER BY nombre_e ";								/**/
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
