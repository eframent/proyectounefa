<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Docente extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}
	/********* Funcion Obtener Formulario *************************************************/
	/**/public function f_SetsForm($pa_Form){											/**/
	/**/	$this->aa_Form=$pa_Form;													/**/
	/**/	$this->aa_Form["Contrasena"]=hash('whirlpool',$this->aa_Form["Contrasena"]);/**/
	/**/}																				/**/
	/**************************************************************************************/

	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsForm(){			/**/
	/**/	return $this->aa_Form;				/**/
	/**/}										/**/
	/**********************************************/

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	/**/public function f_Buscar(){																						/**/
	/**/	$la_Cedula=Array();																							/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$ls_Sql="SELECT p.cedula,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre,p.c_electronico FROM";/**/
	/**/	$ls_Sql.=" docente AS d ";																					/**/
	/**/	$ls_Sql.=" JOIN persona AS p ON(d.cedula_doc=p.cedula) JOIN usuario AS u ON(u.cedula=p.cedula) ";			/**/
	/**/	$ls_Sql.="WHERE(d.cedula_doc='".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."')";					/**/
	/**/	$ls_Sql.=" AND (d.borrado='I')";																			/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$la_Cedula = explode('-',$la_Tupla ["cedula"]);															/**/
	/**/		$this->aa_Form['Cedula']=$la_Cedula[1];																	/**/
	/**/		$this->aa_Form['Nacio']=$la_Cedula [0];																	/**/
	/**/		$this->aa_Form['Nombre1']=$la_Tupla["nombre1"];															/**/
	/**/		$this->aa_Form['Nombre2']=$la_Tupla["nombre2"];															/**/
	/**/		$this->aa_Form['Apellido1']=$la_Tupla["apellido1"];														/**/
	/**/		$this->aa_Form['Apellido2']=$la_Tupla["apellido2"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Nombre_Usu']=$la_Tupla["nombre"];														/**/
	/**/		$this->aa_Form['Correo']=$la_Tupla["c_electronico"];													/**/
	/**/		$this->aa_Form['Dedicacion']=$la_Tupla["dedicacion"];													/**/
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
	/**/		$ls_Sql="SELECT * FROM persona WHERE cedula='".$this->aa_Form['Cedula']."'";							/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$ls_Sql="INSERT INTO docente (cedula_doc,estatus,borrado,dedicacion) VALUES";						/**/
	/**/			$ls_Sql.="('".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."','A','I'";						/**/
	/**/			$ls_Sql.=",'".$this->aa_Form['Dedicacion']."')";													/**/
	/**/			if($this->f_Supervisar("Docente",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/			$ls_Sql="INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES ";							/**/
	/**/			$ls_Sql.="('".$this->aa_Form["Nombre_Usu"]."','".$this->aa_Form["Contrasena"]."','2'";				/**/
	/**/			$ls_Sql.=",'".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."')";							/**/	
	/**/			if($this->f_Supervisar("Usuario",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/		}else {																									/**/
	/**/			$ls_Sql="INSERT INTO persona (cedula,nombre1,nombre2,apellido1,apellido2,c_electronico) VALUES";	/**/ 
	/**/			$ls_Sql.="('".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."','".$this->aa_Form["Nombre1"]; /**/
	/**/			$ls_Sql.="','".$this->aa_Form["Nombre2"]."','".$this->aa_Form["Apellido1"]."',";					/**/
	/**/			$ls_Sql.="'".$this->aa_Form["Apellido2"]."','".$this->aa_Form["Correo"]."')";						/**/
	/**/			if($this->f_Supervisar("Persona",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/			$ls_Sql="INSERT INTO docente (cedula_doc,estatus,borrado,dedicacion) VALUES";						/**/
	/**/			$ls_Sql.="('".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."','A','I',";					/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Dedicacion']."')";														/**/
	/**/			if($this->f_Supervisar("Docente",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/			$ls_Sql="INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES ";							/**/
	/**/			$ls_Sql.="('".$this->aa_Form["Nombre_Usu"]."','".$this->aa_Form["Contrasena"]."','2'";				/**/
	/**/			$ls_Sql.=",'".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."')";							/**/	
	/**/			if($this->f_Supervisar("Usuario",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/		}																										/**/
	/**/	}else if($this->aa_Form['Operacion']=="modificar"){															/**/
	/**/		$ls_Sql="UPDATE persona SET ";																			/**/
	/**/		$ls_Sql.=" nombre1='".$this->aa_Form["Nombre1"]."', nombre2='".$this->aa_Form["Nombre2"]."',";			/**/
	/**/		$ls_Sql.=" apellido1='".$this->aa_Form["Apellido1"]."', apellido2='".$this->aa_Form["Apellido2"]."'";	/**/
	/**/		$ls_Sql.=" , c_electronico='".$this->aa_Form["Correo"]."'";												/**/
	/**/		$ls_Sql.=" WHERE (cedula='".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."')";					/**/
	/**/		if($this->f_Supervisar("Persona",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/		$ls_Sql="UPDATE docente SET ";																			/**/
	/**/		$ls_Sql.="estatus='".$this->aa_Form["Estatus"]."', dedicacion='".$this->aa_Form["Dedicacion"]."' ";		/**/
	/**/		$ls_Sql.=" WHERE (cedula_doc='".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."')";				/**/
	/**/		if($this->f_Supervisar("Docente",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$ls_Sql="UPDATE docente SET borrado='A'";																/**/
	/**/		$ls_Sql.=" WHERE (cedula_doc='".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."')";				/**/
	/**/		if($this->f_Supervisar("Docente",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/		$ls_Sql="DELETE FROM usuario WHERE (cedula='".$this->aa_Form['Nacio']."-".$this->aa_Form["Cedula"]."')";/**/
	/**/		if($this->f_Supervisar("Usuario",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
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
	/**/			$lsSql="SELECT p.cedula,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre,p.c_electronico";/**/
	/**/			$lsSql.=",d.dedicacion	FROM docente AS d ";														/**/
	/**/			$lsSql.="JOIN persona AS p ON(d.cedula_doc=p.cedula) ";												/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) AND (u.tipo_usu='2')";								/**/
	/**/			$lsSql.="WHERE (d.borrado='I') AND ";																/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%') ";										/**/
	/**/			$lsSql.="ORDER BY nombre1 LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT p.cedula,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre,p.c_electronico";/**/
	/**/			$lsSql.=",d.dedicacion FROM docente AS d ";															/**/
	/**/			$lsSql.="JOIN persona AS p ON(d.cedula_doc=p.cedula) ";												/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) AND (u.tipo_usu='2')";								/**/
	/**/			$lsSql.="WHERE (d.borrado='I') ";																	/**/
	/**/			$lsSql.="ORDER BY nombre1 LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($la_Tupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$la_Cedula = explode('-',$la_Tupla ["cedula"]);														/**/
	/**/			$laMatriz [$liI] [0] = $la_Cedula [1];																/**/
	/**/			$laMatriz [$liI] [1] = $la_Tupla ["nombre1"];														/**/
	/**/			$laMatriz [$liI] [2] = $la_Tupla ["nombre2"];														/**/
	/**/			$laMatriz [$liI] [3] = $la_Tupla ["apellido1"];														/**/
	/**/			$laMatriz [$liI] [4] = $la_Tupla ["apellido2"];														/**/
	/**/			$laMatriz [$liI] [5] = $la_Tupla ["nombre"];														/**/
	/**/			$laMatriz [$liI] [6] = $la_Cedula[0];																/**/
	/**/			$laMatriz [$liI] [7] = $la_Tupla ["estatus"];														/**/
	/**/			$laMatriz [$liI] [8] = $la_Tupla ["c_electronico"];													/**/
	/**/			$laMatriz [$liI] [9] = $la_Tupla ["dedicacion"];													/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT p.cedula,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre,p.c_electronico";/**/
	/**/			$lsSql.="   FROM docente AS d ";																	/**/
	/**/			$lsSql.="JOIN persona AS p ON(d.cedula_doc=p.cedula) ";												/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) AND (u.tipo_usu='2')";								/**/
	/**/			$lsSql.="WHERE (d.borrado='I') AND ";																/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%') ";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT p.cedula,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre,p.c_electronico";/**/
	/**/			$lsSql.="  FROM docente AS d ";																		/**/
	/**/			$lsSql.="JOIN persona AS p ON(d.cedula_doc=p.cedula) ";												/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) AND (u.tipo_usu='2')";								/**/
	/**/			$lsSql.="WHERE (d.borrado='I') ";																	/**/
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

	/************************ Funcion Listar      *************************************************************************/
	/* esta funcion se encarga de listar todos los registros que se encuentren en la base de datos  					  */
	/**********************************************************************************************************************/
	/**/	public function fListarTrans ()																					/**/
	/**/	{																											/**/
	/**/		$la_Cedula=Array();																						/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=1;																									/**/
	/**/		$cantidad=8;// cantidad de resultados por página														/**/
	/**/		$inicial= $this->aa_Form['pg'] * $cantidad; // desde que registro va a iniciar la busqueda				/**/
	/**/		$this->f_Con();																							/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT d.cedula_doc,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre  ";		/**/
	/**/			$lsSql.="FROM docente AS d ";																		/**/
	/**/			$lsSql.="JOIN persona AS p ON(d.cedula_doc=p.cedula) ";												/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) AND (u.tipo_usu='2')";								/**/
	/**/			$lsSql.="WHERE (d.borrado='I') AND ";																/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%') ";										/**/
	/**/			$lsSql.="ORDER BY nombre1 LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT d.cedula_doc,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre"; 		/**/
	/**/			$lsSql.="  FROM docente AS d ";																		/**/
	/**/			$lsSql.="JOIN persona AS p ON(d.cedula_doc=p.cedula) ";												/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) AND (u.tipo_usu='2')";								/**/
	/**/			$lsSql.="WHERE (d.borrado='I') ";																	/**/
	/**/			$lsSql.="ORDER BY nombre1 LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($la_Tupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0] = $la_Tupla ["cedula_doc"];													/**/
	/**/			$laMatriz [$liI] [1] = $la_Tupla ["nombre1"];														/**/
	/**/			$laMatriz [$liI] [2] = $la_Tupla ["nombre2"];														/**/
	/**/			$laMatriz [$liI] [3] = $la_Tupla ["apellido1"];														/**/
	/**/			$laMatriz [$liI] [4] = $la_Tupla ["apellido2"];														/**/
	/**/			$laMatriz [$liI] [7] = $la_Tupla ["estatus"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT d.cedula_doc,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre  ";		/**/
	/**/			$lsSql.="FROM docente AS d ";																		/**/
	/**/			$lsSql.="JOIN persona AS p ON(d.cedula_doc=p.cedula) ";												/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) AND (u.tipo_usu='2')";								/**/
	/**/			$lsSql.="WHERE (d.borrado='I') AND ";																/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%') ";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT d.cedula_doc,d.estatus,p.nombre1,p.nombre2,p.apellido1,p.apellido2,u.nombre  ";/**/
	/**/			$lsSql.="  FROM docente AS d ";																		/**/
	/**/			$lsSql.="JOIN persona AS p ON(d.cedula_doc=p.cedula) ";												/**/
	/**/			$lsSql.="JOIN usuario AS u ON(u.cedula=p.cedula) AND (u.tipo_usu='2')";								/**/
	/**/			$lsSql.="WHERE (d.borrado='I') ";																	/**/
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
