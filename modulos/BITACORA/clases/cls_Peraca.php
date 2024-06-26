<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Peraca extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT *,fecha(fecha_fin) AS fecha_fin,fecha(fecha_ini) AS fecha_ini FROM peraca WHERE nombre='".$this->aa_Form['Nombre']."' AND borrado='I'";					/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Fecha_Ini']=$la_Tupla["fecha_ini"];														/**/
	/**/		$this->aa_Form['Fecha_Fin']=$la_Tupla["fecha_fin"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["nombre"];															/**/
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
	/**/	$this->aa_Form['Fecha_Ini']=$this->fFechaBD($this->aa_Form['Fecha_Ini']);									/**/
	/**/	$this->aa_Form['Fecha_Fin']=$this->fFechaBD($this->aa_Form['Fecha_Fin']);									/**/
	/**/	if($this->aa_Form['Operacion']=="incluir"){																	/**/
	/**/		$ls_Sql="INSERT INTO peraca ";																			/**/
	/**/		$ls_Sql.="(peraca,fecha_ini,fecha_fin,estatus,nombre,borrado) ";										/**/
	/**/		$ls_Sql.=" VALUES ";																					/**/
	/**/		$ls_Sql.="((SELECT MAX(cast(peraca AS int)+1) FROM peraca),";											/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Fecha_Ini']."','".$this->aa_Form['Fecha_Fin']."',";						/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Nombre']."','I')";							/**/	
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE peraca SET ";																			/**/
	/**/		$ls_Sql.="fecha_ini='".$this->aa_Form['Fecha_Ini']."',";												/**/
	/**/		$ls_Sql.="fecha_fin='".$this->aa_Form['Fecha_Fin']."',estatus='".$this->aa_Form['Estatus']."',";		/**/
	/**/		$ls_Sql.="nombre='".$this->aa_Form['Nombre']."' ";														/**/	
	/**/		$ls_Sql.="WHERE nombre='".$this->aa_Form['Nombre']."'";													/**/	
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE peraca SET borrado='I' WHERE nombre='".$this->aa_Form['Nombre']."'";					/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Periodo Academico",$ls_Sql,"Usuario en session")){									/**/
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
	/**/			$lsSql="SELECT *,fecha(fecha_ini) AS fecha_inicial, fecha(fecha_fin) AS fecha_final ";				/**/
	/**/			$lsSql.="FROM peraca WHERE fecha_inicial LIKE '%".$this->aa_Form['valor']."%'";						/**/
	/**/			$lsSql.=" OR fecha_final LIKE '%".$this->aa_Form['valor']."%' ";									/**/
	/**/			$lsSql.=" OR nombre LIKE '%".$this->aa_Form['valor']."%' ";											/**/
	/**/			$lsSql.="ORDER BY fecha_ini LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT *,fecha(fecha_ini) AS fecha_inicial, fecha(fecha_fin) AS fecha_final ";				/**/
	/**/			$lsSql.=" FROM peraca ORDER BY fecha_ini LIMIT $cantidad OFFSET $inicial";							/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0] = $laTupla ["nombre"];															/**/
	/**/			$laMatriz [$liI] [1] = $laTupla ["fecha_inicial"];													/**/
	/**/			$laMatriz [$liI] [2] = $laTupla ["fecha_final"];													/**/
	/**/			$laMatriz [$liI] [3] = $laTupla ["estatus"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT * FROM peraca WHERE fecha_ini LIKE '%".$this->aa_Form['valor']."%'";					/**/
	/**/			$lsSql.=" OR fecha_fin LIKE '%".$this->aa_Form['valor']."%' ";										/**/
	/**/			$lsSql.=" OR nombre LIKE '%".$this->aa_Form['valor']."%' ";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM peraca ORDER BY fecha_ini";													/**/
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
