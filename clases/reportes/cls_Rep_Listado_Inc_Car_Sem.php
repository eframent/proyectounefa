<?php
include_once("../CORE/cls_ConexionPos.php");

class  cls_Listado extends  cls_Conexion{
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

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	public function f_Buscar(){	
			$lb_Enc=false;																					
			$contW=0;																					
			$liI=1;
			$peraca="'".$_SESSION['peraca']."'";
			if(($this->aa_Form['Carrera']!='-')){
				$carrera="(c.codesp='".$this->aa_Form['Carrera']."')";
				$contW++;
			}
			if ($this->aa_Form['Semestre']!='-') {
				$semestre="(s.idsemestre='".$this->aa_Form['Semestre']."')";
				$contW++;
			}
			if ($this->aa_Form['Seccion']!='-') {
				$seccion="(sec.idseccion='".$this->aa_Form['Seccion']."')";
				$contW++;
			}if(($this->aa_Form['Fecha_Ini']!='')&&($this->aa_Form['Fecha_Fin']!='')){
				$fecha="(i.fecha_inscrip BETWEEN '".$this->aa_Form['Fecha_Ini']."' AND '".$this->aa_Form['Fecha_Fin']."')";
				$contW++;
			}
			$and1="";
			$and2="";
			$and3="";
			if($contW=="1"){
				$and1="AND";
			}else if($contW=="2"){
				$and1=$and2="AND";
			}else if($contW=="3"){
				$and1=$and2=$and3="AND";
			}else if($contW=="4"){
				$and1=$and2=$and3=$and4="AND";
			}			
			$ls_Sql="SELECT p.cedula, p.nombre1, p.apellido1, c.nombre as carrera,s.nombre as semestre,sec.nombre as seccion,asig.nommat AS materia
						FROM persona as p
						inner join alumno as a on(p.cedula=a.cedula_est_pre) 
						inner join inscripcion_pre as i on(a.cedula_est_pre=i.cedula_est_pre) 
						inner join planificacion_materias as pm on(i.pm_codigo=pm.pm_codigo) 
						inner join materia as asig on(asig.codmat=pm.codmat) 
						inner join planificacion_sec as p_sec on(pm.idplanificacion=p_sec.idplanificacion) 
						inner join carrera as c on(p_sec.codesp=c.codesp) 
						inner join semestre as s on(p_sec.semestre=s.idsemestre)
						inner join seccion as sec on(p_sec.seccion=sec.idseccion)
						WHERE (p_sec.peraca=$peraca) $and1 $carrera $and2 $semestre $and3 $seccion $and4 $fecha
						group by p.cedula,p.nombre1,p.apellido1,c.nombre,s.nombre,sec.nombre,asig.nommat order by s.nombre,asig.nommat,sec.nombre, p.nombre1,p.apellido1;";
	
		$this->f_Con();	
			$laMatriz= Array();
		print("<pre>");																							
		print($ls_Sql);																			
		$lr_Tabla=$this->f_Filtro($ls_Sql);																			
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	
			$laMatriz [$liI] [0]=$la_Tupla["cedula"];        	   									    	
			$laMatriz [$liI] [1]=$la_Tupla["nombre1"];        			        							    	
			$laMatriz [$liI] [2]=$la_Tupla["apellido1"];        		         								    	
			$laMatriz [$liI] [3]=$la_Tupla["carrera"];        	    									    	
			$laMatriz [$liI] [4]=$la_Tupla["semestre"];       	    									    		
			$laMatriz [$liI] [5]=$la_Tupla["seccion"];       	    									    		
			$laMatriz [$liI] [6]=$la_Tupla["materia"];       	    									    		
			$liI++; 
				$lb_Enc=true;																					            
		}																											
		$this->f_Cierra($lr_Tabla);																					
		$this->f_Des();	
			$this->aa_Form['Matriz']=$laMatriz;																							
		return $lb_Enc;
	}																												
	/**********************************************************************************************************************/

}
?>
