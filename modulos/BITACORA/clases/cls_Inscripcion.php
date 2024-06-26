<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Inscripcion extends  cls_Bitacora{
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

	/************************ Funcion Operacion   *************************************************************************/
	/* esta funcion seleciona el SQL correcto dependiendo de la operacion sugerida por el usuario y lo ejecuta segun la	  */
	/* situacion																										  */
	/**********************************************************************************************************************/
	/**/public function f_Operacion(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	$lb_enc=false;																								/**/
	/**/	$i=0;																										/**/
	/**/	$la_Matriz=Array();																							/**/
	/**/	if($this->aa_Form['Operacion']=="incluir"){																	/**/
	/**/		$this->f_Con();																							/**/
	/**/		$this->f_Begin();																						/**/
	/**/		$ls_Sql="SELECT * FROM inscripcion_pre WHERE";															/**/
	/**/		$ls_Sql.="(cedula_est_pre='".$_SESSION['usuario']['Cedula']."') AND (peraca='".$_SESSION['peraca']."')";/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){															/**/
	/**/			$la_Matriz[$i]=$la_Tupla["pm_codigo"];																/**/
	/**/			$lb_enc=true;																						/**/
	/**/			$i++;																								/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		for($x=0;$x<count($la_Matriz);$x++){																	/**/
	/**/			$materiaExiste=false;																				/**/
	/**/			for($y=0;$y<$this->aa_Form['Registros'];$y++){														/**/
	/**/				if($la_Matriz[$x]==$this->aa_Form['campo'.$y]){													/**/
	/**/					$materiaExiste=true;																		/**/
	/**/				}																								/**/
	/**/			}																									/**/
	/**/			if(!$materiaExiste){																				/**/
	/**/				$ls_Sql="DELETE FROM inscripcion_pre WHERE";														/**/
	/**/				$ls_Sql.="(cedula_est_pre='".$_SESSION['usuario']['Cedula']."') AND (peraca='".$_SESSION['peraca']."')";/**/
	/**/				$ls_Sql.=" AND (pm_codigo='".$la_Matriz[$x]."')";												/**/
	/**/				if($this->f_SupervisarTransaccion("Inscripcion",$ls_Sql,$_SESSION['usuario']['Nombre'])){		/**/
	/**/					$lb_Hecho=$this->f_Ejecutar($ls_Sql);														/**/
	/**/				}																								/**/
	/**/				if(!$lb_Hecho){																					/**/
	/**/					$this->f_RollBack();																		/**/
	/**/				}																								/**/
	/**/			}																									/**/
	/**/		}																										/**/
	/**/																												/**/
	/**/		for($x=0;$x<$this->aa_Form['Registros'];$x++){															/**/
	/**/			$ls_Sql="SELECT * FROM inscripcion_pre WHERE";														/**/
	/**/			$ls_Sql.="(cedula_est_pre='".$_SESSION['usuario']['Cedula']."') AND (peraca='".$_SESSION['peraca']."')";/**/
	/**/			$ls_Sql.=" AND (pm_codigo='".$this->aa_Form['campo'.$x]."')";										/**/
	/**/			$lr_Tabla=$this->f_Filtro($ls_Sql);																	/**/
	/**/			if($la_Tupla=$this->f_Arreglo($lr_Tabla)){															/**/
	/**/				$lb_Hecho=true;																					/**/
	/**/			}else{																								/**/
	/**/				$ls_Sql="INSERT INTO inscripcion_pre (cedula_est_pre,fecha_inscrip,hora,pm_codigo,peraca)VALUES ";/**/
	/**/				$ls_Sql.="('".$_SESSION['usuario']['Cedula']."','".date('Y-m-d')."','".date('H:i:s')."',";		/**/
	/**/				$ls_Sql.="'".$this->aa_Form['campo'.$x]."','".$_SESSION['peraca']."')";							/**/
	/**/				if($this->f_SupervisarTransaccion("Inscripcion",$ls_Sql,$_SESSION['usuario']['Nombre'])){		/**/
	/**/					$lb_Hecho=$this->f_Ejecutar($ls_Sql);														/**/
	/**/				}																								/**/
	/**/				if(!$lb_Hecho){																					/**/
	/**/					$this->f_RollBack();																		/**/
	/**/				}																								/**/
	/**/			}																									/**/
	/**/			$this->f_Cierra($lr_Tabla);																			/**/
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

	
}
?>
