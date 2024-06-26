<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_ImportFin extends  cls_Bitacora{
		private $aa_Data;

		public function __construct($pa_Data){
			$this->aa_Data=$pa_Data;
		}
		


	/************************ Funcion Guardar	  *************************************************************************/
	/* esta funcion seleciona Crea el sql necesario para el guardado de toda la data de CINU una vez previsualizdad		  */
	/**********************************************************************************************************************/
	/**/public function f_Guardar(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	$contErrores=0;																								/**/
	/**/	$mensaje="No se pudo Realizar la Operacion:";																/**/
	/**/	for($x=2;$x<count($this->aa_Data)+2;$x++){																	/**/
	/**/		$lb_Enc=false;																							/**/
	/**/		$ls_Sql='SELECT * FROM "CINU" WHERE(cedula='."'".$this->aa_Data[$x]['Cedula']."'".')';					/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$contErrores++;																						/**/
	/**/		}else{																									/**/
	/**/			$lsSql='INSERT INTO "CINU" (rusnies,cedula,nombres,rama_edu,grado,"IA",telefono,correo,"PROM"';		/**/
	/**/			$lsSql.=',"POS")VALUES';																			/**/
	/**/			$lsSql.="('".$this->aa_Data[$x]['Rusnies']."','".$this->aa_Data[$x]['Cedula']."','".$this->aa_Data[$x]['Nombres']."',";/**/
	/**/			$lsSql.="'".$this->aa_Data[$x]['RamaE']."','".$this->aa_Data[$x]['Grado']."','".$this->aa_Data[$x]['IA']."',";/**/
	/**/			$lsSql.="'".$this->aa_Data[$x]['Telefonos']."','".$this->aa_Data[$x]["Correo"]."','".$this->aa_Data[$x]['Prom']."',";/**/
	/**/			$lsSql.="'".$this->aa_Data[$x]['Pos']."')";															/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($lsSql);																/**/
	/**/			$lb_Enc=true;																						/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lr_Tabla);																				/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	if($contErrores>=1){																						/**/
	/**/		$_SESSION['Error']=$mensaje." No se pudieron importar, ".$contErrores." Registros ya existian";			/**/
	/**/	}																											/**/
	/**/	return $lb_Hecho;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

}
?>