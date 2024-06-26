<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Bloque extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT *FROM bloque WHERE (blo_codigo='".$this->aa_Form['Codigo']."' and blo_status='A')";			/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["blo_codigo"];														/**/
	/**/		$this->aa_Form['Rango']=$la_Tupla["blo_rango"];															/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["blo_status"];														/**/
	/**/		$this->aa_Form['Posicion']=$la_Tupla["blo_posicion"];													/**/
	/**/		$this->aa_Form['Regimen']=$la_Tupla["idregimen"];														/**/
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
	/**/		$ls_Sql="INSERT INTO bloque (blo_codigo,blo_rango,blo_status,blo_posicion,idregimen)VALUES ";			/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Codigo']."','".$this->aa_Form['Rango']."',";								/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Posicion']."'";	 						/**/
	/**/		$ls_Sql.=",'".$this->aa_Form['Regimen']."')";	 														/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE tipo_ambiente SET blo_rango='".$this->aa_Form['Rango']."',blo_status=";					/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."',blo_posicion='".$this->aa_Form['Posicion']."'";				/**/
	/**/		$ls_Sql.=",idregimen='".$this->aa_Form['Regimen']."' WHERE (blo_codigo='".$this->aa_Form['Codigo']."')";/**/																			/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE  bloque SET blo_status='B' WHERE (blo_codigo='".$this->aa_Form['Codigo']."')";			/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Bloque de Hora",$ls_Sql,$_SESSION['usuario']['Nombre'])){							/**/
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
	/**/			$lsSql="select * FROM bloque where blo_status='A' AND blo_rango like '%".$this->aa_Form['valor']."%'";	/**/
	/**/			$lsSql.="ORDER BY blo_posicion LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM bloque where (blo_status='A') ORDER BY blo_posicion LIMIT $cantidad OFFSET $inicial";/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["blo_codigo"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["blo_rango"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["blo_posicion"];													/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["blo_status"];														/**/
	/**/			$laMatriz [$liI] [4]= $laTupla ["idregimen"];														/**/
	/**/			$liI++;   																							/**/	
	/**/		}			   																							/**/	
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT * FROM bloque WHERE blo_status='A' AND blo_rango LIKE '%".$this->aa_Form['valor']."%' ";	/**/
	/**/				$lsSql.="ORDER BY blo_rango ";																	/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM bloque WHERE (blo_status='A') ORDER BY blo_rango ";							/**/
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
