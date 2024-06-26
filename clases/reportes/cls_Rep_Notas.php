<?php
session_start();
include_once("../../CORE/cls_ConexionPos.php");

class  cls_Notas extends  cls_Conexion{
										
	/**********************************************************************************************************************/
	public function fNotas($cedula){	
		$liI=0;
		$lb_Enc=false;
		$ls_Sql="SELECT a.cedula_est_pre, p.nombre1, p.apellido1,
				c.nombre as carrera, s.nombre as semestre, m.nommat as materia,i.notadef
				from insnot as i
				INNER JOIN alumno as a ON(a.cedula_est_pre=i.cedula_est_pre)
				INNER JOIN persona as p ON(a.cedula_est_pre=p.cedula)
				INNER JOIN inscripcion_pre as ins ON(i.idinscripcion=ins.num_inscripcion)
				INNER JOIN planificacion_materias as pm ON(ins.pm_codigo=pm.pm_codigo)
				INNER JOIN materia as m ON(pm.codmat=m.codmat)
				INNER JOIN planificacion_sec as ps ON(pm.idplanificacion=ps.idplanificacion)
				INNER JOIN carrera as c ON(ps.codesp=c.codesp)
				INNER JOIN semestre as s ON(ps.semestre=s.idsemestre)
				WHERE a.cedula_est_pre='$cedula'
				ORDER BY semestre, materia";
		$this->f_Con();	
		$laMatriz= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
			$laMatriz[$liI][0]=$la_Tupla['cedula_est_pre'];																				
			$laMatriz[$liI][1]=$la_Tupla['nombre1'];																				
			$laMatriz[$liI][2]=$la_Tupla['apellido1'];																				
			$laMatriz[$liI][3]=$la_Tupla['carrera'];																				
			$laMatriz[$liI][5]=$la_Tupla['semestre'];																				
			$laMatriz[$liI][4]=$la_Tupla['materia'];																				
			$laMatriz[$liI][6]=$la_Tupla['notadef'];																				
			$liI++;
			$lb_Enc=true;																								
		}

		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();

		return $laMatriz;		           
	}									
	/**********************************************************************************************************************/

	/************************ Funcion BuscarEstudiantes   *****************************************************************/
	/* Busca en la base de datos todos los estudiantes inscritos en la seccion seleccionada								  */
	/**********************************************************************************************************************/
		public function f_Nomina_Estudiantes($pmcodigo){																							
			$estudiantes=Array();
			$liI=0;
			$lb_Enc=false;																									
			$ls_Sql="SELECT p.*,ins.num_inscripcion,i.notadef,pm.pm_codigo, m.nommat as materia, s.nombre as semestre, c.nombre as carrera, sec.nombre as seccion
					 FROM planificacion_materias AS pm 
					 INNER JOIN inscripcion_pre AS ins ON(pm.pm_codigo=ins.pm_codigo)
					 FULL OUTER JOIN insnot AS i ON(i.idinscripcion=ins.num_inscripcion)
					 INNER JOIN persona AS p ON(p.cedula=ins.cedula_est_pre)
					 INNER JOIN materia as m ON(pm.codmat=m.codmat)
					 INNER JOIN semestre as s ON(m.semestre=s.idsemestre)
					 INNER JOIN pensum_pre as pen ON(m.idpensum=pen.idpensum)
					 INNER JOIN carrera as c ON(pen.codesp=c.codesp)
					 INNER JOIN planificacion_sec as ps ON(pm.idplanificacion=ps.idplanificacion)
					 INNER JOIN seccion as sec ON(ps.seccion=sec.idseccion)
					 WHERE pm.pm_codigo='$pmcodigo'";		
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$estudiantes[$liI]['Nombres']=$la_Tupla["nombre1"]." ".$la_Tupla['nombre2'];
				$estudiantes[$liI]['Apellidos']=$la_Tupla["apellido1"]." ".$la_Tupla['apellido2'];							
				$estudiantes[$liI]['Cedula']=$la_Tupla["cedula"];													
				$estudiantes[$liI]['Numero']=$la_Tupla["num_inscripcion"];													
				$estudiantes[$liI]['Nota']=$la_Tupla["notadef"];
				$estudiantes[$liI]['Carrera']=$la_Tupla["carrera"];
				$estudiantes[$liI]['Semestre']=$la_Tupla["semestre"];
				$estudiantes[$liI]['Materia']=$la_Tupla["materia"];
				$estudiantes[$liI]['Seccion']=$la_Tupla["seccion"];
				$liI++;
			}
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $estudiantes;																									
		}																													
	/**********************************************************************************************************************/
	
}
?>
