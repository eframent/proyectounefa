<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Dedicacion extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT * FROM dedicacion WHERE(codigo='".$this->aa_Form['Codigo']."') AND (borrado='I')";			/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["codigo"];															/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre"];															/**/
	/**/		$this->aa_Form['topeHoras']=$la_Tupla["topeHoras"];														/**/
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
	/**/		$ls_Sql="INSERT INTO dedicacion ";																		/**/
	/**/		$ls_Sql.="(topehoras, codigo, nombre)";																	/**/ 
	/**/		$ls_Sql.="VALUES ";																						/**/
	/**/		$ls_Sql.="('".$this->aa_Form['topeHoras']."','".$this->aa_Form['Codigo']."'";							/**/
	/**/		$ls_Sql.=",'".$this->aa_Form['Nombre']."')";															/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE dedicacion SET topehoras='".$this->aa_Form['topeHoras']."',";							/**/
	/**/		$ls_Sql.="nombre='".$this->aa_Form['Nombre']."'";														/**/
	/**/		$ls_Sql.=" WHERE (codigo='".$this->aa_Form['Codigo']."')";												/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE dedicacion SET borrado='A' WHERE (codigo='".$this->aa_Form['Codigo']."')";				/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Dedicacion",$ls_Sql,"Usuario en session")){											/**/
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
	/**/		if ($this->aa_Form['Valor']!=""){																		/**/
	/**/			$lsSql="SELECT v.* FROM dedicacion AS v ";															/**/
	/**/			$lsSql.=" WHERE(v.nombre like '%".$this->aa_Form['Valor']."%') 	";									/**/
	/**/			$lsSql.="AND (v.borrado='I') ORDER BY codigo LIMIT $cantidad OFFSET $inicial";						/**/
	/**/		}else if ($this->aa_Form['Valor']==""){																	/**/
	/**/			$lsSql="SELECT v.* FROM dedicacion AS v ";															/**/
	/**/			$lsSql.="WHERE(v.borrado='I') ORDER BY codigo LIMIT $cantidad OFFSET $inicial";						/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["codigo"];															/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["nombre"];															/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["topehoras"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['Valor']!=""){																		/**/
	/**/			$lsSql="SELECT * FROM dedicacion WHERE(nombre like '%".$this->aa_Form['Valor']."%') ";				/**/
	/**/			$lsSql.="AND (borrado='I') ORDER BY nombre";														/**/
	/**/		}else if ($this->aa_Form['Valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM dedicacion WHERE(borrado='I') ORDER BY nombre ";								/**/
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