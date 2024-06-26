<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Modulo extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT *FROM modulo WHERE (mod_nombre='".$this->aa_Form['Nombre']."') AND (mod_estatus<>'B')";		/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["mod_nombre"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["mod_estatus"];														/**/
	/**/		$this->aa_Form['Color']=$la_Tupla["mod_color"];															/**/
	/**/		$this->aa_Form['Clases_Icono']=$la_Tupla["mod_icon_clases"];											/**/
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
	/**/		$ls_Sql="INSERT INTO modulo (mod_nombre,mod_estatus,mod_color,mod_icon_clases)VALUES ";					/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Nombre']."',";															/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Color']."',";			 					/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Clases_Icono']."')";									 					/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE modulo SET mod_nombre='".$this->aa_Form['Nombre']."',mod_estatus=";						/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."', mod_color='".$this->aa_Form['Color']."'";					/**/
	/**/		$ls_Sql.=", mod_icon_clases='".$this->aa_Form['Clases_Icono']."'";										/**/
	/**/		$ls_Sql.=" WHERE (mod_nombre='".$this->aa_Form['Nombre']."')";											/**/																			/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="DELETE FROM modulo WHERE (mod_nombre='".$this->aa_Form['Nombre']."')";							/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Modulo",$ls_Sql,"Usuario en session")){												/**/
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
	/**/			$lsSql="SELECT * FROM modulo WHERE (mod_estatus<>'B') AND	";										/**/
	/**/			$lsSql.="mod_nombre LIKE '%".$this->aa_Form['valor']."%'";											/**/
	/**/			$lsSql.="ORDER BY mod_nombre LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM modulo WHERE (mod_estatus<>'B')	";											/**/
	/**/			$lsSql.="ORDER BY mod_nombre LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["mod_nombre"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["mod_estatus"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["mod_color"];														/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["mod_icon_clases"];													/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT *FROM modulo  WHERE (mod_estatus<>'B') AND ";										/**/
	/**/			$lsSql.="mod_nombre LIKE '%".$this->aa_Form['valor']."%' ORDER BY mod_nombre ";						/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM modulo ORDER BY mod_nombre ";													/**/
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
