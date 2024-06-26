<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Ambiente extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT * FROM ambiente WHERE(codigo='".$this->aa_Form['Codigo']."') AND (borrado='I')";			/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["codigo"];															/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre"];															/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Direccion']=$la_Tupla["direccion"];														/**/
	/**/		$this->aa_Form['Tipo']=$la_Tupla["tip_cod"];															/**/
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
	/**/		$ls_Sql="INSERT INTO ambiente (codigo,nombre,direccion,estatus,borrado,tip_cod)";						/**/
	/**/		$ls_Sql.="VALUES";																						/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Codigo']."','".$this->aa_Form['Nombre']."',";								/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Direccion']."','".$this->aa_Form['Estatus']."'";							/**/
	/**/		$ls_Sql.=",'I','".$this->aa_Form['Tipo']."')";															/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE ambiente SET nombre='".$this->aa_Form['Nombre']."',";									/**/
	/**/		$ls_Sql.="direccion='".$this->aa_Form['Direccion']."', estatus='".$this->aa_Form['Estatus']."',";		/**/
	/**/		$ls_Sql.="tip_cod='".$this->aa_Form['Tipo']."' ";														/**/
	/**/		$ls_Sql.=" WHERE(codigo='".$this->aa_Form['Codigo']."')";												/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE ambiente SET borrado='A' WHERE(codigo='".$this->aa_Form['Codigo']."')";					/**/
	/**/	}																											/**/
	/**/	print($ls_Sql);																								/**/
	/**/	if($this->f_Supervisar("Ambiente",$ls_Sql,"Usuario en session")){											/**/
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
	/**/			$lsSql="SELECT a.*,t.tip_nombre FROM ambiente AS a INNER JOIN tipo_ambiente AS t ON(t.tip_cod=a.tip_cod)";	/**/
	/**/			$lsSql.=" where borrado='I' AND nombre like '%".$this->aa_Form['valor']."%'";						/**/
	/**/			$lsSql.="ORDER BY nombre LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select a.*,t.tip_nombre FROM ambiente AS a INNER JOIN tipo_ambiente AS t ON(t.tip_cod=a.tip_cod)";	/**/
	/**/			$lsSql.=" where (borrado='I') ORDER BY nombre LIMIT $cantidad OFFSET $inicial"; 					/**/
	/**/		}																										/**/
	/**/		print($lsSql);																							/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["codigo"];															/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["nombre"];															/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["direccion"];														/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["estatus"];															/**/
	/**/			$laMatriz [$liI] [4]= $laTupla ["tip_nombre"];														/**/
	/**/			$laMatriz [$liI] [5]= $laTupla ["tip_cod"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="select * FROM ambiente where borrado='I' AND nombre like '%".$this->aa_Form['valor']."%'";	/**/
	/**/			$lsSql.=" ORDER BY codigo ";																		/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM ambiente where(borrado='I') ORDER BY nombre ";								/**/
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
