<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Departamento extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT * FROM departamento WHERE(dep_nombre='".$this->aa_Form['Nombre']."') ";						/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["dep_nombre"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["dep_status"];														/**/
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
	/**/		$ls_Sql="INSERT INTO departamento (dep_nombre,dep_status)";												/**/
	/**/		$ls_Sql.="VALUES";																						/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Nombre']."','".$this->aa_Form['Estatus']."')";							/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE departamento SET dep_nombre='".$this->aa_Form['Nombre']."',";							/**/
	/**/		$ls_Sql.="dep_status='".$this->aa_Form['Estatus']."' WHERE(dep_nombre='".$this->aa_Form['Nombre']."')";	/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="DELETE FROM departamento WHERE(dep_nombre='".$this->aa_Form['Nombre']."')";					/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Departamento",$ls_Sql,"Usuario en session")){										/**/
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
	/**/			$lsSql="select *FROM departamento where dep_nombre like ";											/**/
	/**/			$lsSql.="'%".$this->aa_Form['valor']."%' ORDER BY dep_nombre LIMIT $cantidad OFFSET $inicial";		/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM departamento ORDER BY dep_nombre LIMIT $cantidad OFFSET $inicial";			/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["dep_nombre"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["dep_status"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="select *FROM departamento where dep_nombre like ";											/**/
	/**/			$lsSql.="'%".$this->aa_Form['valor']."%' ORDER BY dep_nombre ";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM departamento ORDER BY dep_nombre ";											/**/
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
