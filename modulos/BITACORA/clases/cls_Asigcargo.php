<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Asigcargo extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}
	/********* Funcion Obtener Formulario *************************************************/
	/**/public function f_SetsForm($pa_Form){											/**/
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
	/**/		$ls_Sql="DELETE FROM detalle_cargo_usuario WHERE(fk_usu_nombre='".$this->aa_Form['Usuario']."')";		/**/
	/**/		if($this->f_Supervisar("Asignar Cargo",$ls_Sql,"Usuario en session")){									/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/		if($this->aa_Form['Cargo']!="REVOCAR"){																	/**/
	/**/			$ls_Sql="INSERT INTO detalle_cargo_usuario (fk_car_codigo,fk_usu_nombre) VALUES";					/**/
	/**/			$ls_Sql.="('".$this->aa_Form['Cargo']."','".$this->aa_Form['Usuario']."')";							/**/
	/**/			if($this->f_Supervisar("Carrera",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/		}																										/**/
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
	/**/			$lsSql="SELECT p.*,u.nombre,c.car_codigo,c.car_nombre FROM persona AS p  ";							/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) ";													/**/
	/**/			$lsSql.="LEFT JOIN detalle_cargo_usuario AS dcu ON(u.nombre=dcu.fk_usu_nombre)";					/**/
	/**/			$lsSql.="LEFT JOIN cargo AS c ON(dcu.fk_car_codigo=c.car_codigo) WHERE";							/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%') ";										/**/
	/**/			$lsSql.="ORDER BY car_nombre LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT p.*,u.nombre,c.car_codigo,c.car_nombre FROM persona AS p  ";							/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) ";													/**/
	/**/			$lsSql.="LEFT JOIN detalle_cargo_usuario AS dcu ON(u.nombre=dcu.fk_usu_nombre)";					/**/
	/**/			$lsSql.="LEFT JOIN cargo AS c ON(dcu.fk_car_codigo=c.car_codigo) ";									/**/
	/**/			$lsSql.="ORDER BY car_nombre LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}																										/**/
	/**/		print($lsSql);																							/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($la_Tupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0] = $la_Tupla ["cedula"];														/**/
	/**/			$laMatriz [$liI] [1] = $la_Tupla ["nombre1"];														/**/
	/**/			$laMatriz [$liI] [1] .=" ".$la_Tupla ["nombre2"];													/**/
	/**/			$laMatriz [$liI] [2] = $la_Tupla ["apellido1"];														/**/
	/**/			$laMatriz [$liI] [2] .=" ".$la_Tupla ["apellido2"];													/**/
	/**/			$laMatriz [$liI] [3] = $la_Tupla ["nombre"];														/**/
	/**/			$laMatriz [$liI] [4] = $la_Tupla ["car_nombre"];													/**/
	/**/			$laMatriz [$liI] [5] = $la_Tupla ["car_codigo"];													/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT p.*,u.nombre,c.car_codigo,c.car_nombre FROM persona AS p  ";							/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) ";													/**/
	/**/			$lsSql.="LEFT JOIN detalle_cargo_usuario AS dcu ON(u.nombre=dcu.fk_usu_nombre)";					/**/
	/**/			$lsSql.="LEFT JOIN cargo AS c ON(dcu.fk_car_codigo=c.car_codigo) WHERE";							/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%') ";										/**/
	/**/			$lsSql.="ORDER BY car_nombre ";																		/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT p.*,u.nombre,c.car_codigo,c.car_nombre FROM persona AS p  ";							/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) ";													/**/
	/**/			$lsSql.="LEFT JOIN detalle_cargo_usuario AS dcu ON(u.nombre=dcu.fk_usu_nombre)";					/**/
	/**/			$lsSql.="LEFT JOIN cargo AS c ON(dcu.fk_car_codigo=c.car_codigo) ";									/**/
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
