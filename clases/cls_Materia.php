<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Materia extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT *FROM materia WHERE (codmat='".$this->aa_Form['Codigo']."' and borrado='I')";				/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Codigo']=$la_Tupla["codmat"];															/**/
	/**/		$this->aa_Form['Nombre_materia']=$la_Tupla["nommat"];													/**/
	/**/		$this->aa_Form['Semestre']=$la_Tupla["semestre"];														/**/
	/**/		$this->aa_Form['Pensum']=$la_Tupla["idpensum"];															/**/
	/**/		$this->aa_Form['Credito']=$la_Tupla["credito"];															/**/
	/**/		$this->aa_Form['Horas_teoricas']=$la_Tupla["horteo"];													/**/
	/**/		$this->aa_Form['Horas_practica']=$la_Tupla["horpra"];													/**/
	/**/		$this->aa_Form['Horas_laboratorio']=$la_Tupla["horlab"];												/**/
	/**/		$this->aa_Form['Prelacion_uno']=$la_Tupla["prela1"];													/**/
	/**/		$this->aa_Form['Prelacion_dos']=$la_Tupla["prela2"];													/**/
	/**/		$this->aa_Form['Descripcion']=$la_Tupla["descripcion"];													/**/
	/**/		$this->aa_Form['Electiva']=$la_Tupla["electiva"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Prelacion_tres']=$la_Tupla["prela3"];													/**/
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
	/**/		$ls_Sql="INSERT INTO materia (codmat,semestre,idpensum,credito,horteo,horpra,horlab,nommat,";			/**/
	/**/		$ls_Sql.="prela1,prela2,descripcion,electiva,estatus,prela3,borrado) VALUES ";							/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Codigo']."','".$this->aa_Form['Semestre']."',";							/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Pensum']."','".$this->aa_Form['Credito']."',";	 							/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Horas_teoricas']."','".$this->aa_Form['Horas_practica']."',";				/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Horas_laboratorio']."','".$this->aa_Form['Nombre_materia']."',";			/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Prelacion_uno']."','".$this->aa_Form['Prelacion_dos']."',";				/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Descripcion']."','".$this->aa_Form['Electiva']."',";						/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Prelacion_tres']."','I')";					/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE materia SET semestre='".$this->aa_Form['Semestre']."',";								/**/
	/**/		$ls_Sql.="idpensum='".$this->aa_Form['Pensum']."',credito='".$this->aa_Form['Credito']."',";			/**/
	/**/		$ls_Sql.="horteo='".$this->aa_Form['Horas_teoricas']."',horpra='".$this->aa_Form['Horas_practica']."',";/**/
	/**/		$ls_Sql.="horlab='".$this->aa_Form['Horas_laboratorio']."',nommat='".$this->aa_Form['Nombre_materia']."',";/**/
	/**/		$ls_Sql.="prela1='".$this->aa_Form['Prelacion_uno']."',prela2='".$this->aa_Form['Prelacion_dos']."',";	/**/
	/**/		$ls_Sql.="descripcion='".$this->aa_Form['Descripcion']."',electiva='".$this->aa_Form['Electiva']."',";	/**/
	/**/		$ls_Sql.="estatus='".$this->aa_Form['Estatus']."',prela3='".$this->aa_Form['Prelacion_tres']."'";		/**/
	/**/		$ls_Sql.=" WHERE (codmat='".$this->aa_Form['Codigo']."')";												/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE  materia SET borrado='A' WHERE (codmat='".$this->aa_Form['Codigo']."')";				/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("Materia",$ls_Sql,"Usuario en session")){											/**/
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
	/**/			$lsSql="select * FROM materia WHERE borrado='I' AND nommat like '%".$this->aa_Form['valor']."%'";	/**/
	/**/			$lsSql.="ORDER BY nommat LIMIT $cantidad OFFSET $inicial";												/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM materia WHERE (borrado='I') ORDER BY nommat LIMIT $cantidad OFFSET $inicial";		/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]=$laTupla["codmat"];															/**/
	/**/			$laMatriz [$liI] [1]=$laTupla["nommat"];															/**/
	/**/			$laMatriz [$liI] [2]=$laTupla["semestre"];															/**/
	/**/			$laMatriz [$liI] [3]=$laTupla["idpensum"];															/**/
	/**/			$laMatriz [$liI] [4]=$laTupla["credito"];															/**/
	/**/			$laMatriz [$liI] [5]=$laTupla["horteo"];															/**/
	/**/			$laMatriz [$liI] [6]=$laTupla["horpra"];															/**/
	/**/			$laMatriz [$liI] [7]=$laTupla["horlab"];															/**/
	/**/			$laMatriz [$liI] [8]=$laTupla["prela1"];															/**/
	/**/			$laMatriz [$liI] [9]=$laTupla["prela2"];															/**/
	/**/			$laMatriz [$liI] [10]=$laTupla["descripcion"];														/**/
	/**/			$laMatriz [$liI] [11]=$laTupla["electiva"];															/**/
	/**/			$laMatriz [$liI] [12]=$laTupla["estatus"];															/**/
	/**/			$laMatriz [$liI] [13]=$laTupla["prela3"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="select * FROM materia WHERE borrado='I' AND nommat like '%".$this->aa_Form['valor']."%' ";	/**/
	/**/				$lsSql.="ORDER BY nommat ";																		/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM materia WHERE (borrado='I') ORDER BY nommat ";								/**/
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
