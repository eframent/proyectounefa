<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Cargo extends  cls_Bitacora{
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
	/**/	$ls_Sql="SELECT * FROM cargo WHERE(car_nombre='".$this->aa_Form['Nombre']."') ";							/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Nombre']=$la_Tupla["car_nombre"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["car_status"];														/**/
	/**/		$this->aa_Form['Departamento']=$la_Tupla["fk_dep_codigo"];												/**/
	/**/		$lb_Enc=true;																							/**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Operacion   *************************************************************************/
	/* esta funcion seleciona el SQL correcto carendiendo de la operacion sugerida por el usuario y lo ejecuta segun la	  */
	/* situacion																										  */
	/**********************************************************************************************************************/
	/**/public function f_Operacion(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	if($this->aa_Form['Operacion']=="incluir"){																	/**/
	/**/		$ls_Sql="INSERT INTO cargo (car_nombre,car_status,fk_dep_codigo)";										/**/
	/**/		$ls_Sql.="VALUES";																						/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Nombre']."','".$this->aa_Form['Estatus']."',";							/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Departamento']."')";														/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE cargo SET fk_dep_codigo='".$this->aa_Form['Departamento']."',";							/**/
	/**/		$ls_Sql.="car_status='".$this->aa_Form['Estatus']."' WHERE(car_nombre='".$this->aa_Form['Nombre']."')";	/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="DELETE FROM cargo WHERE(car_nombre='".$this->aa_Form['Nombre']."')";							/**/
	/**/	}																											/**/
	/**/	if($this->f_Supervisar("cargo",$ls_Sql,"Usuario en session")){												/**/
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
	/**/			$lsSql="select *FROM cargo as c  ";																	/**/
	/**/			$lsSql.="inner join departamento as d on(c.fk_dep_codigo=d.dep_codigo) where car_nombre like ";		/**/
	/**/			$lsSql.="'%".$this->aa_Form['valor']."%' ORDER BY car_nombre LIMIT $cantidad OFFSET $inicial";		/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select *FROM cargo as c  ";																	/**/
	/**/			$lsSql.="inner join departamento as d on(c.fk_dep_codigo=d.dep_codigo) ";							/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["car_nombre"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["dep_nombre"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["fk_dep_codigo"];													/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["car_status"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="select *FROM cargo where car_nombre like ";													/**/
	/**/			$lsSql.="'%".$this->aa_Form['valor']."%' ORDER BY car_nombre ";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="select * FROM cargo ORDER BY car_nombre ";													/**/
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
