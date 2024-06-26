<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Retiros extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}
	/********* Funcion Obtener Formulario *************************************************/
	/**/public function f_SetsForm($pa_Form){											/**/
	/**/	if($pa_Form['Sancion']==""){$pa_Form['Sancion']="0";}						/**/
	/**/	$this->aa_Form=$pa_Form;													/**/
	/**/}																				/**/
	/**************************************************************************************/

	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsForm(){			/**/
	/**/	return $this->aa_Form;				/**/
	/**/}										/**/
	/**********************************************/

	/************************ Funcion Operacion   *************************************************************************/
	/* esta funcion seleciona el SQL correcto dependiendo de la operacion sugerida por el usuario y lo ejecuta segun la	  */
	/* situacion																										  */
	/**********************************************************************************************************************/
	/**/public function f_Operacion(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	if($this->aa_Form['Operacion']=="guardar"){																	/**/
	/**/		$this->f_Con();																							/**/
	/**/		$this->f_Begin();																						/**/
	/**/		$ls_Sql="UPDATE alumno SET estatus='I', tipo_retiro='".$this->aa_Form['Retiro']."'";					/**/
	/**/		$ls_Sql.=" WHERE(cedula_est_pre='".$this->aa_Form['Cedula']."')";										/**/
	/**/		if($this->f_SupervisarTransaccion("Retiros",$ls_Sql,$_SESSION['usuario']['Nombre'])){					/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/		}																										/**/
	/**/		if($lb_Hecho){																							/**/
	/**/			$ls_Sql="INSERT INTO retiro (tipo,cedula_est_pre,sancion)VALUES";									/**/
	/**/			$ls_Sql.="('".$this->aa_Form['Retiro']."','".$this->aa_Form['Cedula']."','".$this->aa_Form['Sancion']."')";/**/
	/**/			if($this->f_SupervisarTransaccion("Retiros",$ls_Sql,$_SESSION['usuario']['Nombre'])){				/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/			}																									/**/
	/**/		}else{																									/**/
	/**/			$this->f_RollBack();																				/**/
	/**/		}																										/**/
	/**/		if($lb_Hecho){																							/**/
	/**/			$this->f_Commit();																					/**/
	/**/		}else{																									/**/
	/**/			$this->f_RollBack();																				/**/
	/**/		}																										/**/
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
	/**/		$la_Cedula=Array();																						/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=1;																									/**/
	/**/		$cantidad=8;// cantidad de resultados por página														/**/
	/**/		$inicial= $this->aa_Form['pg'] * $cantidad; // desde que registro va a iniciar la busqueda				/**/
	/**/		$this->f_Con();																							/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT e.*, p.* FROM alumno AS e ";															/**/
	/**/			$lsSql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";									/**/
	/**/			$lsSql.="WHERE (e.estatus='A')";																	/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%') ";										/**/
	/**/			$lsSql.="ORDER BY nombre1 LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT e.*, p.* FROM alumno AS e ";															/**/
	/**/			$lsSql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";									/**/
	/**/			$lsSql.="WHERE (e.estatus='A')";																	/**/
	/**/			$lsSql.="ORDER BY nombre1 LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}																										/**/
	/**/		print($lsSql);																							/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($la_Tupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0] = $la_Tupla ["cedula_est_pre"];												/**/
	/**/			$laMatriz [$liI] [1] = $la_Tupla ["nombre1"];														/**/
	/**/			$laMatriz [$liI] [1] .=" ".$la_Tupla ["nombre2"];													/**/
	/**/			$laMatriz [$liI] [2] = $la_Tupla ["apellido1"];														/**/
	/**/			$laMatriz [$liI] [2] .=" ".$la_Tupla ["apellido2"];													/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT e.*, p.* FROM alumno AS e ";															/**/
	/**/			$lsSql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";									/**/
	/**/			$lsSql.="WHERE (e.estatus='A')";																	/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%') ";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT e.*, p.* FROM alumno AS e ";															/**/
	/**/			$lsSql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";									/**/
	/**/			$lsSql.="WHERE (e.estatus='A')";																	/**/
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
