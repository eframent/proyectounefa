<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_TipoPro extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT * FROM tipo_proceso WHERE(idtipo_pro='".$this->aa_Form['Codigo']."') AND (borrado='I')";	/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["idtipo_pro"];														/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre"];															/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Padre']=$la_Tupla["padre"];																/**/
	/**/		$this->aa_Form['Modulo']=$la_Tupla["modulo"];															/**/
	/**/		$this->aa_Form['Holgura']=$la_Tupla["holgura"];															/**/
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
	/**/		if($this->aa_Form['Padre']=="-"){																		/**/
	/**/			$this->aa_Form['Padre']="NULL";																		/**/
	/**/		}else{																									/**/
	/**/			$this->aa_Form['Padre']="'".$this->aa_Form['Padre']."'";											/**/
	/**/		}																										/**/
	/**/		$ls_Sql="INSERT INTO tipo_proceso (idtipo_pro,nombre,estatus,borrado,padre,modulo,holgura)";			/**/
	/**/		$ls_Sql.="VALUES";																						/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Codigo']."','".$this->aa_Form['Nombre']."','".$this->aa_Form['Estatus']."'";/**/
	/**/		$ls_Sql.=",'I',".$this->aa_Form['Padre'].",".$this->aa_Form['Modulo'].",'".$this->aa_Form['Holgura']."')";/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		if($this->aa_Form['Padre']=="-"){																		/**/
	/**/			$this->aa_Form['Padre']="NULL";																		/**/
	/**/		}else{																									/**/
	/**/			$this->aa_Form['Padre']="'".$this->aa_Form['Padre']."'";											/**/
	/**/		}																										/**/
	/**/		$ls_Sql="UPDATE tipo_proceso SET nombre='".$this->aa_Form['Nombre']."',";								/**/
	/**/		$ls_Sql.=" estatus='".$this->aa_Form['Estatus']."', padre=".$this->aa_Form['Padre'].", ";				/**/
	/**/		$ls_Sql.=" modulo='".$this->aa_Form['Modulo']."',holgura='".$this->aa_Form['Holgura']."' ";				/**/
	/**/		$ls_Sql.=" WHERE(idtipo_pro='".$this->aa_Form['Codigo']."')";											/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE tipo_proceso SET borrado='A' WHERE(idtipo_pro='".$this->aa_Form['Codigo']."')";			/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Tipo de Proceso",$ls_Sql,"Usuario en session")){									/**/
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
	/**/			$lsSql="select *FROM tipo_proceso where borrado='I' AND nombre like '%".$this->aa_Form['valor']."%'";/**/
	/**/			$lsSql.="ORDER BY nombre LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM tipo_proceso  where (borrado='I') ORDER BY nombre LIMIT $cantidad OFFSET $inicial";/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["idtipo_pro"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["nombre"];															/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["estatus"];															/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["padre"];															/**/
	/**/			$laMatriz [$liI] [4]= $laTupla ["modulo"];															/**/
	/**/			$laMatriz [$liI] [5]= $laTupla ["holgura"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="select *FROM tipo_proceso where borrado='I' AND nombre like '%".$this->aa_Form['valor']."%'";/**/
	/**/			$lsSql.=" ORDER BY idtipo_pro ";																	/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM tipo_proceso where (borrado='I') ORDER BY nombre ";							/**/
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
