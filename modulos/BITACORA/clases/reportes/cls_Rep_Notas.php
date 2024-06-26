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
	
}
?>
