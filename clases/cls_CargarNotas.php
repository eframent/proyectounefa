<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_CargaNotas extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}

	/********* Funcion Obtener Formulario *********/
		public function f_SetsForm($pa_Form){		
			$this->aa_Form=$pa_Form;				
		}											
	/**********************************************/

	/********* Funcion Retornar Formulario ********/
		public function	f_GetsForm(){				
			return $this->aa_Form;					
		}											
	/**********************************************/

	/************************ Funcion BuscarEstudiantes   *****************************************************************/
	/* Busca en la base de datos todos los estudiantes inscritos en la seccion seleccionada								  */
	/**********************************************************************************************************************/
		public function f_BuscarEstudiantes(){																							
			$estudiantes=Array();
			$liI=0;
			$lb_Enc=false;																									
			$ls_Sql="SELECT p.*,ins.num_inscripcion,i.notadef,pm.pm_codigo
					 FROM planificacion_materias AS pm 
					 INNER JOIN inscripcion_pre AS ins ON(pm.pm_codigo=ins.pm_codigo)
					 FULL OUTER JOIN insnot AS i ON(i.idinscripcion=ins.num_inscripcion)
					 INNER JOIN persona AS p ON(p.cedula=ins.cedula_est_pre)
					 
					 WHERE pm.pm_codigo=".$this->aa_Form['pmcodigo']."";		
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$estudiantes[$liI]['Nombres']=$la_Tupla["nombre1"]." ".$la_Tupla['nombre2'];
				$estudiantes[$liI]['Apellidos']=$la_Tupla["apellido1"]." ".$la_Tupla['apellido2'];							
				$estudiantes[$liI]['Cedula']=$la_Tupla["cedula"];													
				$estudiantes[$liI]['Numero']=$la_Tupla["num_inscripcion"];													
				$estudiantes[$liI]['Nota']=$la_Tupla["notadef"];													
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['estudiantes']=$estudiantes;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/**********************************************************************************************************************/

	/************************ Funcion guardarNotas  ***********************************************************************/
	/* Esta funcion se encarga de guardar las notas finales 															  */
	/**********************************************************************************************************************/
		public function guardarNotas(){		
			$lb_Hecho=false;
			for($x=0;$x<$this->aa_Form['Columnas'];$x++){
				$lb_Enc=false;
				$numeroIns=$this->aa_Form['numeroIns'.$x];
				$nota=$this->aa_Form['Nota'.$x];

				$ls_Sql="SELECT * FROM insnot WHERE idinscripcion='$numeroIns'";
				$this->f_Con();																									
				$lr_Tabla=$this->f_Filtro($ls_Sql);																				
				if($la_Tupla=$this->f_Arreglo($lr_Tabla)){
					$lb_Enc=true;																								
				}
				$this->f_Cierra($lr_Tabla);																						
				$this->f_Des();	
				if($lb_Enc){

					$ls_Sql="UPDATE insnot SET notadef='$nota'";
					$ls_Sql.=" WHERE(idinscripcion='$numeroIns')";
					$this->f_Con();																									
					$lb_Hecho=$this->f_Ejecutar($ls_Sql);
					$this->f_Des();	

				}else{
					
					$ls_Sql="INSERT INTO insnot (cedula_est_pre,condicion,asistencia,notadef,idinscripcion) VALUES 
							((SELECT cedula_est_pre FROM inscripcion_pre WHERE num_inscripcion='$numeroIns'),
							(SELECT idcondicion FROM condicion WHERE abreviatura='P'),
							'100',$nota,$numeroIns)";
					$this->f_Con();																									
					$lb_Hecho=$this->f_Ejecutar($ls_Sql);
					$this->f_Des();	

				}
			}
			return $lb_Hecho;																									
		}																													
	/**********************************************************************************************************************/
	
}
?>
