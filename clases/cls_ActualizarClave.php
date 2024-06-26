<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_ActualizarClave extends  cls_Bitacora{
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


	
	/************************ Funcion Operacion   *************************************************************************/
	/* esta funcion seleciona el SQL correcto dependiendo de la operacion sugerida por el usuario y lo ejecuta segun la	  */
	/* situacion																										  */
	/**********************************************************************************************************************/
	/**/public function f_Operacion(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	if($this->compararPass($_SESSION['usuario']['Nombre'],$this->aa_Form['Contrasena'])){						/**/
	/**/		$this->f_Con();																							/**/
	/**/		$this->f_Begin();																						/**/
	/**/		if($this->aa_Form['Operacion']=="actualizar"){															/**/
	/**/			$ls_Sql="UPDATE usuario SET  contrasena='".$this->aa_Form['Contrasena']."', estatus='A' ";			/**/
	/**/			$ls_Sql.=" WHERE nombre='".$this->aa_Form['Usuario']."' ";											/**/
	/**/		}																										/**/
	/**/		if($this->f_SupervisarTransaccion("Usuario",$ls_Sql,"Usuario en session")){								/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			if($lb_Hecho){																						/**/
	/**/				$fecha=date("Y/m/d");																			/**/
	/**/				$ls_Sql="INSERT INTO historial_clave (usuario,clave,fecha) VALUES";								/**/
	/**/				$ls_Sql.="('".$this->aa_Form['Usuario']."','".$this->aa_Form['Contrasena']."','$fecha')";		/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$ip=$this->obtenerIP();																			/**/
	/**/				$this->f_Acceso($ip,"Cambio De Clave ",$this->aa_Form['Usuario']);								/**/
	/**/			}else{																								/**/
	/**/				$this->f_RollBack();																			/**/
	/**/			}																									/**/
	/**/		}																										/**/
	/**/		if($lb_Hecho){																							/**/
	/**/			$this->f_Commit();																					/**/
	/**/		}else{																									/**/
	/**/			$this->f_RollBack();																				/**/
	/**/		}																										/**/
	/**/		$this->f_Des();																							/**/
	/**/	}else{																										/**/
	/**/		$ls_Sql="SELECT historial_clave FROM servidor";															/**/ 
	/**/		$this->f_Con();																							/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$cantidad=$la_Tupla["historial_clave"];																/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		$this->f_Des();																							/**/
	/**/		$_SESSION['Mensaje']="La clave no puede ser igual a las $cantidad anteriores";							/**/
	/**/	}																											/**/
	/**/	return $lb_Hecho;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	
}
?>
