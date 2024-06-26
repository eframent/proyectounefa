<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Submodulo extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT *FROM submodulo WHERE (sub_nombre='".$this->aa_Form['Nombre']."') AND (sub_estatus<>'B')";	/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["sub_nombre"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["sub_estatus"];														/**/
	/**/		$this->aa_Form['Tipo']=$la_Tupla["sub_tipo"];															/**/
	/**/		$this->aa_Form['Modulo']=$la_Tupla["fk_mod_codigo"];													/**/
	/**/		$this->aa_Form['Ruta']=$la_Tupla["sub_ruta"];															/**/
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
	/**/		$ls_Sql="INSERT INTO submodulo (sub_nombre,sub_estatus,fk_mod_codigo,sub_tipo,sub_ruta)";				/**/
	/**/		$ls_Sql.="VALUES ('".$this->aa_Form['Nombre']."',";														/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Modulo']."'";			 					/**/
	/**/		$ls_Sql.=",'".$this->aa_Form['Tipo']."','".$this->aa_Form['Ruta']."')";				 					/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE submodulo SET sub_nombre='".$this->aa_Form['Nombre']."',sub_estatus=";					/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."',fk_mod_codigo='".$this->aa_Form['Modulo']."'";				/**/
	/**/		$ls_Sql.=",sub_tipo='".$this->aa_Form['Tipo']."',sub_ruta='".$this->aa_Form['Ruta']."'";				/**/
	/**/		$ls_Sql.=" WHERE (sub_nombre='".$this->aa_Form['Nombre']."')";											/**/																			/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="DELETE FROM submodulo WHERE (sub_nombre='".$this->aa_Form['Nombre']."')";						/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Submodulo",$ls_Sql,"Usuario en session")){											/**/
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
	/**/			$lsSql="SELECT p.*,m.mod_nombre FROM submodulo AS p INNER JOIN modulo AS m 	";						/**/
	/**/			$lsSql.="ON(m.mod_codigo=p.fk_mod_codigo) WHERE (sub_estatus<>'B') AND 	";							/**/
	/**/			$lsSql.="p.sub_nombre LIKE '%".$this->aa_Form['valor']."%'";										/**/
	/**/			$lsSql.="ORDER BY sub_nombre LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT p.*,m.mod_nombre FROM submodulo AS p INNER JOIN modulo AS m 	";						/**/
	/**/			$lsSql.="ON(m.mod_codigo=p.fk_mod_codigo) WHERE (sub_estatus<>'B') ";								/**/
	/**/			$lsSql.="ORDER BY sub_nombre LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["sub_nombre"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["mod_nombre"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["fk_mod_codigo"];													/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["sub_estatus"];														/**/
	/**/			if($laTupla ["sub_tipo"]=='1'){																		/**/
	/**/				$laMatriz [$liI] [4]= "Maestro";																/**/
	/**/			}else if($laTupla ["sub_tipo"]=='2'){																/**/
	/**/				$laMatriz [$liI] [4]= "Transaccion";															/**/
	/**/			}else if($laTupla ["sub_tipo"]=='3'){																/**/
	/**/				$laMatriz [$liI] [4]= "Reporte";																/**/
	/**/			}																									/**/
	/**/			$laMatriz [$liI] [5]= $laTupla ["sub_tipo"];														/**/
	/**/			$laMatriz [$liI] [6]= $laTupla ["sub_ruta"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT *FROM submodulo WHERE  sub_nombre LIKE '%".$this->aa_Form['valor']."%'";				/**/
	/**/			$lsSql.=" AND (sub_estatus<>'B') ORDER BY sub_nombre ";												/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM submodulo WHERE (sub_estatus<>'B') ORDER BY sub_nombre ";						/**/
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
