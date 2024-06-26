<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Asignar extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}

	/********* Funcion Obtener Formulario *********/
	/**/public function f_SetsForm($pa_Form){	/**/
	/**/	$this->aa_Form=$pa_Form;			/**/
	/**/}										/**/
	/**********************************************/

	/************************ Funcion Operacion   *************************************************************************/
	/* esta funcion seleciona el SQL correcto dependiendo de la operacion sugerida por el usuario y lo ejecuta segun la	  */
	/* situacion																										  */
	/**********************************************************************************************************************/
	/**/public function f_Operacion(){																					/**/
	/**/	$codigo="(SELECT car_codigo FROM cargo WHERE car_nombre='".$this->aa_Form['Cargo']."')";					/**/
	/**/	$lb_Hecho=true;																								/**/
	/**/	if($this->aa_Form['Operacion']=="Guardar"){																	/**/
	/**/		$this->f_Con();																							/**/
	/**/		$this->f_Begin();																						/**/
	/**/		$ls_Sql="DELETE FROM permiso WHERE(fk_car_codigo=$codigo)";												/**/
	/**/		if($this->f_SupervisarTransaccion("Asignar",$ls_Sql,"Usuario en session")){								/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	/**/
	/**/		}																										/**/
	/**/		$ls_Sql="DELETE FROM permiso_proceso WHERE(fk_car_codigo=$codigo)";										/**/
	/**/		if($this->f_SupervisarTransaccion("Asignar",$ls_Sql,"Usuario en session")){								/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/		}																										/**/
	/**/		for($x=0;$x<count($this->aa_Form)-2;$x++){																/**/
	/**/			$campo=explode('-',$this->aa_Form[$x]);																/**/
	/**/			if($campo[0]=="4"){																					/**/
	/**/				$ls_Sql="INSERT INTO permiso_proceso (fk_car_codigo,fk_tippro_codigo)VALUES ";					/**/
	/**/				$ls_Sql.="($codigo,'".$campo[1]."')";															/**/
	/**/			}else{																								/**/
	/**/				$ls_Sql="INSERT INTO permiso (fk_car_codigo,fk_sub_codigo)VALUES ";								/**/
	/**/				$ls_Sql.="($codigo,'".$campo[1]."')";															/**/
	/**/			}																									/**/
	/**/			if($this->f_SupervisarTransaccion("Asignar",$ls_Sql,"Usuario en session")){							/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/			}																									/**/
	/**/		}																										/**/
	/**/		if($lb_Hecho){																							/**/
	/**/			$this->f_Commit();																					/**/
	/**/		}else{																									/**/
	/**/			$this->f_Rollback();																				/**/
	/**/		}																										/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	return $lb_Hecho;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

}
?>
