<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Depuracion extends  cls_Bitacora{
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
			$ls_Sql="SELECT p.*,ins.num_inscripcion
					 FROM planificacion_materias AS pm 
					 INNER JOIN inscripcion_pre AS ins ON(pm.pm_codigo=ins.pm_codigo)
					 INNER JOIN persona AS p ON(p.cedula=ins.cedula_est_pre)
					 WHERE pm.pm_codigo=".$this->aa_Form['pmcodigo']."";		
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$estudiantes[$liI]['Nombres']=$la_Tupla["nombre1"]." ".$la_Tupla['nombre2'];
				$estudiantes[$liI]['Apellidos']=$la_Tupla["apellido1"]." ".$la_Tupla['apellido2'];							
				$estudiantes[$liI]['Cedula']=$la_Tupla["cedula"];													
				$estudiantes[$liI]['Numero']=$la_Tupla["num_inscripcion"];													
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['estudiantes']=$estudiantes;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/**********************************************************************************************************************/
	
	/************************ Funcion BuscarMaterias  *********************************************************************/
	/* Busca en la base de datos todas las materias en las cuales se podra mover el estudiante designado				  */
	/**********************************************************************************************************************/
		public function f_BuscarMaterias(){																							
			$materias=Array();
			$liI=0;
			$lb_Enc=false;																									
			$ls_Sql="SELECT m.codmat,m.nommat,pm.pm_codigo,s.nombre AS seccion,r.tipo_turno AS turno
					FROM planificacion_materias AS pm
					INNER JOIN planificacion_sec AS p ON(p.idplanificacion=pm.idplanificacion)
					INNER JOIN materia AS m ON(pm.codmat=m.codmat)
					INNER JOIN seccion AS s ON(s.idseccion=p.seccion)
					INNER JOIN regimen AS r ON(r.idregimen=p.regimen)
					WHERE pm.codmat=(
							SELECT pm.codmat 
							FROM inscripcion_pre AS ins 
							INNER JOIN planificacion_materias AS pm ON(pm.pm_codigo=ins.pm_codigo)
							WHERE ins.num_inscripcion='".$this->aa_Form['Ins']."'
						)
					AND p.peraca='".$_SESSION['peraca']."'
					AND pm_codigo<>(
							SELECT pm.pm_codigo
							FROM inscripcion_pre AS ins 
							INNER JOIN planificacion_materias AS pm ON(pm.pm_codigo=ins.pm_codigo)
							WHERE ins.num_inscripcion='".$this->aa_Form['Ins']."'
						)
					ORDER BY r.tipo_turno";		
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$materias[$liI]['Nombre']=$la_Tupla["nommat"];
				$materias[$liI]['Codigo_M']=$la_Tupla["pm_codigo"];							
				$materias[$liI]['Seccion']=$la_Tupla['turno']."-".$la_Tupla["seccion"];	
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['materias']=$materias;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/**********************************************************************************************************************/

	/************************ Funcion moverEstudiantes  *******************************************************************/
	/* Esta funcion se encarga de mover un estudiante de una seccion a otra 											  */
	/**********************************************************************************************************************/
		public function moverEstudiantes(){		
			$lb_Hecho=false;
			$ls_Sql="UPDATE inscripcion_pre SET pm_codigo='".$this->aa_Form['pmcodigo']."'";
			$ls_Sql.=" WHERE(num_inscripcion='".$this->aa_Form['Ins']."')";
			$this->f_Con();																									
			$lb_Hecho=$this->f_Ejecutar($ls_Sql);
			$this->f_Des();
			return $lb_Hecho;																									
		}																													
	/**********************************************************************************************************************/
	
}
?>
