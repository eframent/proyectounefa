<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Municipio extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT *FROM municipio WHERE (idmunicipio='".$this->aa_Form['Codigo']."') and (borrado='I')";		/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["idmunicipio"];														/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre_m"];															/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Estado']=$la_Tupla["idestado"];															/**/
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
	/**/		$ls_Sql="INSERT INTO municipio (idmunicipio,nombre_m,estatus,idestado,borrado)VALUES ";					/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Codigo']."','".$this->aa_Form['Nombre']."',";								/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Estado']."','I')";	 						/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE municipio SET nombre_m='".$this->aa_Form['Nombre']."',estatus=";						/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."',idestado='".$this->aa_Form['Estado']."'";						/**/
	/**/		$ls_Sql.=" WHERE (idmunicipio='".$this->aa_Form['Codigo']."')";											/**/																			/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE  municipio SET borrado='A' WHERE (idmunicipio='".$this->aa_Form['Codigo']."')";			/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("municipio",$ls_Sql,"Usuario en session")){											/**/
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
	/**/			$lsSql="SELECT c.*,p.nombre_e FROM municipio AS c INNER JOIN ";										/**/
	/**/			$lsSql.="estado AS p ON(c.idestado=p.idestado) ";													/**/
	/**/			$lsSql.="WHERE c.borrado='I' AND nombre_m LIKE '%".$this->aa_Form['valor']."%'";					/**/
	/**/			$lsSql.=" ORDER BY nombre_m LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT c.*,p.nombre_e FROM municipio AS c INNER JOIN ";										/**/
	/**/			$lsSql.="estado AS p ON(c.idestado=p.idestado) ";													/**/
	/**/			$lsSql.="WHERE c.borrado='I' ";																		/**/
	/**/			$lsSql.=" ORDER BY nombre_m LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["idmunicipio"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["nombre_m"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["nombre_e"];														/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["idestado"];														/**/
	/**/			$laMatriz [$liI] [4]= $laTupla ["estatus"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT * FROM municipio WHERE borrado='I' AND nombre_m LIKE '%".$this->aa_Form['valor']."%'";/**/
	/**/				$lsSql.="ORDER BY nombre_m ";																	/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM municipio WHERE (borrado='I') ORDER BY nombre_m ";							/**/
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
