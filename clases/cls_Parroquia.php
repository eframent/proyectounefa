<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Parroquia extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT *FROM parroquia WHERE (idparroquia='".$this->aa_Form['Codigo']."')";						/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["idparroquia"];														/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre_p"];															/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Municipio']=$la_Tupla["idmunicipio"];													/**/
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
	/**/		$ls_Sql="INSERT INTO parroquia (idparroquia,nombre_p,estatus,idmunicipio,borrado)VALUES ";				/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Codigo']."','".$this->aa_Form['Nombre']."',";								/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Municipio']."','I')";		 				/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE parroquia SET nombre_p='".$this->aa_Form['Nombre']."',estatus=";						/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."',idmunicipio='".$this->aa_Form['Municipio']."'";				/**/
	/**/		$ls_Sql.=" WHERE (idparroquia='".$this->aa_Form['Codigo']."')";											/**/																			/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE  parroquia SET borrado='A' WHERE (idparroquia='".$this->aa_Form['Codigo']."')";			/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Parroquia",$ls_Sql,"Usuario en session")){											/**/
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
	/**/			$lsSql="SELECT p.*,m.nombre_m FROM parroquia AS p INNER JOIN municipio AS m 	";					/**/
	/**/			$lsSql.="ON(m.idmunicipio=p.idmunicipio) WHERE p.borrado='I' ";										/**/
	/**/			$lsSql.="AND p.nombre_p LIKE '%".$this->aa_Form['valor']."%'";										/**/
	/**/			$lsSql.="ORDER BY nombre_p LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT p.*,m.nombre_m FROM parroquia AS p INNER JOIN municipio AS m 	";					/**/
	/**/			$lsSql.="ON(m.idmunicipio=p.idmunicipio) WHERE p.borrado='I' ";										/**/
	/**/			$lsSql.="ORDER BY nombre_p LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["idparroquia"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["nombre_p"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["nombre_m"];														/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["idmunicipio"];														/**/
	/**/			$laMatriz [$liI] [4]= $laTupla ["estatus"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT *FROM parroquia WHERE borrado='I' AND nombre_p LIKE '%".$this->aa_Form['valor']."%'";/**/
	/**/				$lsSql.="ORDER BY nombre_p ";																	/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM parroquia WHERE(borrado='I') ORDER BY nombre_p ";								/**/
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
