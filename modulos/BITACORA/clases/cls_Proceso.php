<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Proceso extends  cls_Bitacora{
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
	/**/	$peraca=$_SESSION['peraca'];																				/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$ls_Sql="SELECT *, fecha(fecha_final) AS fecha_final, fecha(fecha_ini) AS fecha_ini FROM proceso  ";		/**/
	/**/	$ls_Sql.="WHERE peraca='$peraca' AND idtipo='".$this->aa_Form['Tipo_Pro']."'  ";							/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Fecha_Ini']=$la_Tupla["fecha_ini"];														/**/
	/**/		$this->aa_Form['Fecha_Fin']=$la_Tupla["fecha_final"];													/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Tipo_Pro']=$la_Tupla["idtipo"];															/**/
	/**/		$this->aa_Form['Peraca']=$la_Tupla["peraca"];															/**/
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
	/**/	if($this->aa_Form['Operacion']!="eliminar"){																/**/
	/**/		if($this->aa_Form['Operacion']=="incluir"){																/**/
	/**/			$ls_Sql="INSERT INTO proceso ";																		/**/
	/**/			$ls_Sql.="(peraca,fecha_ini,fecha_final,estatus,idtipo) ";											/**/
	/**/			$ls_Sql.=" VALUES ";																				/**/
	/**/			$ls_Sql.="('".$this->aa_Form['Peraca']."',";														/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Fecha_Ini']."','".$this->aa_Form['Fecha_Fin']."',";					/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Estatus']."','".$this->aa_Form['Tipo_Pro']."')";						/**/	
	/**/		}else if($this->aa_Form['Operacion']=="modificar"){														/**/
	/**/			$ls_Sql="UPDATE proceso SET ";																		/**/
	/**/			$ls_Sql.="peraca='".$this->aa_Form['Peraca']."',fecha_ini='".$this->aa_Form['Fecha_Ini']."',";		/**/
	/**/			$ls_Sql.="fecha_final='".$this->aa_Form['Fecha_Fin']."',estatus='".$this->aa_Form['Estatus']."',";	/**/
	/**/			$ls_Sql.="idtipo='".$this->aa_Form['Tipo_Pro']."' ";												/**/	
	/**/			$ls_Sql.="WHERE peraca='$peraca' AND idtipo='".$this->aa_Form['Tipo_Pro']."'  ";					/**/
	/**/		}																										/**/
	/**/		if($this->f_Supervisar("Proceso",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/	}else if($this->aa_Form['Operacion']=="eliminar"){															/**/
	/**/		$peraca=$_SESSION['peraca'];																			/**/
	/**/		$lb_Enc=false;																							/**/
	/**/		$ls_Sql="SELECT p.* FROM proceso AS p INNER JOIN tipo_proceso AS tp ON(tp.idtipo_pro=p.idtipo)   ";		/**/
	/**/		$ls_Sql.="WHERE p.peraca='$peraca' AND tp.padre='".$this->aa_Form['Tipo_Pro']."'  ";					/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$lb_Enc=true;																						/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		$this->f_Des();																							/**/
	/**/		if(!$lb_Enc){																							/**/
	/**/			$ls_Sql="DELETE FROM proceso ";																		/**/
	/**/			$ls_Sql.="WHERE peraca='$peraca' AND idtipo='".$this->aa_Form['Tipo_Pro']."'  ";					/**/
	/**/			if($this->f_Supervisar("Proceso",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/		}else{																									/**/
	/**/			$men="No se puede borrar un Proceso si tiene un proceso hijo abierto en el periodo academico vigente";/**/
	/**/			$_SESSION['mensaje']=$men;																			/**/
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
	/**/		$laMatriz=Array();																						/**/
	/**/		$peraca=$_SESSION['peraca'];																			/**/
	/**/		$liI=1;																									/**/
	/**/		$cantidad=8;// cantidad de resultados por página														/**/
	/**/		$inicial= $this->aa_Form['pg'] * $cantidad; // desde que registro va a iniciar la busqueda				/**/
	/**/		$this->f_Con();																							/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT p.*,t.nombre,per.nombre AS pernom,fecha(p.fecha_ini) AS fecha_ini,fecha(p.fecha_final) AS fecha_final";/**/
	/**/			$lsSql.=" FROM proceso AS p INNER JOIN tipo_proceso AS t ON(p.idtipo=t.idtipo_pro)";				/**/
	/**/			$lsSql.=" INNER JOIN peraca AS per ON(p.peraca=per.peraca)";										/**/
	/**/			$lsSql.="WHERE peraca='$peraca'";																	/**/
	/**/			$lsSql.=" AND (fecha_ini LIKE '%".$this->aa_Form['valor']."%'";										/**/
	/**/			$lsSql.=" OR fecha_final LIKE '%".$this->aa_Form['valor']."%') ";									/**/
	/**/			$lsSql.="ORDER BY p.peraca LIMIT $cantidad OFFSET $inicial";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT p.*,t.nombre,per.nombre AS pernom,fecha(p.fecha_ini) AS fecha_ini,fecha(p.fecha_final) AS fecha_final";/**/
	/**/			$lsSql.=" FROM proceso AS p INNER JOIN tipo_proceso AS t ON(p.idtipo=t.idtipo_pro)";				/**/
	/**/			$lsSql.=" INNER JOIN peraca AS per ON(p.peraca=per.peraca)";										/**/
	/**/			$lsSql.="WHERE p.peraca='$peraca'";																	/**/
	/**/			$lsSql.="ORDER BY peraca LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0] = $laTupla ["nombre"];															/**/
	/**/			$laMatriz [$liI] [1] = $laTupla ["fecha_ini"];														/**/
	/**/			$laMatriz [$liI] [2] = $laTupla ["fecha_final"];													/**/
	/**/			$laMatriz [$liI] [3] = $laTupla ["pernom"];															/**/
	/**/			$laMatriz [$liI] [4] = $laTupla ["estatus"];														/**/
	/**/			$laMatriz [$liI] [5] = $laTupla ["idtipo"];															/**/
	/**/			$laMatriz [$liI] [6] = $laTupla ["peraca"];															/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT * FROM proceso WHERE peraca='$peraca'";												/**/
	/**/			$lsSql.="AND (fecha_ini LIKE '%".$this->aa_Form['valor']."%'";										/**/
	/**/			$lsSql.=" OR fecha_final LIKE '%".$this->aa_Form['valor']."%')";									/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT * FROM proceso WHERE peraca='$peraca' ORDER BY fecha_ini";							/**/
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

	/************************* Funcion Comprobar Proceso ******************************************************************/
	/**	esta funcion revisa si hay un proceso abierto del tipo seleccionado 	S						 				 **/
	/**********************************************************************************************************************/
	/**/	public function f_ComprobarPro($psNombrePro){												 				/**/
	/**/	$lb_Enc=0;																									/**/
	/**/	$peraca=$_SESSION['peraca'];																				/**/
	/**/	$fecha=date("Y-m-d");																						/**/
	/**/	$ls_Sql="SELECT p.*,tp.* FROM proceso AS p
						INNER JOIN tipo_proceso AS tp ON(tp.idtipo_pro=p.idtipo) 
						WHERE ('$fecha' BETWEEN p.fecha_ini AND p.fecha_final) 
						AND (p.peraca='$peraca')
						AND (tp.nombre LIKE '%$psNombrePro%')";															/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$lb_Enc=1;																								/**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************* Funcion Verificar Padre ********************************************************************/
	/**	esta funcion revisa si hay un proceso padre abierto en este peraca 								 				 **/
	/**********************************************************************************************************************/
	/**/	public function f_VerificarPadre(){															 				/**/
	/**/	$lb_Enc=0;																									/**/
	/**/	$peraca=$_SESSION['peraca'];																				/**/
	/**/	$hijo=$this->aa_Form['Hijo'];																				/**/
	/**/	$fecha=date("Y-m-d");																						/**/
	/**/	$ls_Sql="SELECT tp.nombre, fecha(p.fecha_final) AS fecha_final,fecha(per.fecha_fin) AS fecha_fin, tp.holgura 
						FROM tipo_proceso AS tp
						INNER JOIN proceso AS p ON(p.idtipo=tp.idtipo_pro)
						INNER JOIN peraca AS per ON(p.peraca=per.peraca)
						WHERE 
						(tp.idtipo_pro=
							(SELECT p.idtipo FROM tipo_proceso as tp 
							INNER JOIN proceso AS p ON(p.idtipo=tp.padre)
							WHERE (tp.idtipo_pro='$hijo')
							AND (p.peraca='$peraca')
							)
						)
						AND 
						(p.peraca='$peraca')";																			/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['FechaPeraca']=$la_Tupla['fecha_fin'];													/**/
	/**/		$this->aa_Form['FechaPadre']=$la_Tupla['fecha_final'];													/**/
	/**/		$this->aa_Form['Holgura']=$la_Tupla['holgura'];															/**/
	/**/		$lb_Enc=true;																							/**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	if(!$lb_Enc){																								/**/
	/**/		$ls_Sql="SELECT tp.nombre FROM tipo_proceso AS tp 
							WHERE (tp.idtipo_pro= 
								(SELECT tp.padre FROM tipo_proceso as tp 
								WHERE (tp.idtipo_pro='$hijo')  
								) 
							)";																							/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$this->aa_Form['NombrePadre']=$la_Tupla['nombre'];													/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		$this->f_Des();																							/**/
	/**/		$ls_Sql="SELECT fecha(fecha_fin) AS fecha_fin FROM peraca WHERE peraca='$peraca'";						/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$this->aa_Form['FechaPeraca']=$la_Tupla['fecha_fin'];												/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
}
?>
