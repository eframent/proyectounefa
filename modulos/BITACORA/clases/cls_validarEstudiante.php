<?php

	include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
   class cls_validarEstudiante extends cls_Bitacora
   {
   	  protected $aa_Form=array();

	  public function __construct()
	  {
	  }
	  
	  public function __destruct()
	  {
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
	
	private function cargarPensum($estudiante){
		$la_pensum=array();
		$liI=0;
		$ls_Sql="SELECT m.codmat,m.nommat, s.nombre AS semestre,m.prela1,m.prela2,m.prela3
				FROM alumno AS e 
				INNER JOIN materia AS m ON (m.idpensum=e.idpensum)
				INNER JOIN semestre AS s ON(s.idsemestre=m.semestre)
				WHERE (e.cedula_est_pre='$estudiante') AND (m.semestre<>'0')
				ORDER BY m.semestre";				
		$this->f_Con();																								
		$lr_Tabla=$this->f_Filtro($ls_Sql);																			
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	
			$la_pensum[$liI]['codigo']=$la_Tupla["codmat"];														
			$la_pensum[$liI]['nombre']=$la_Tupla["nommat"];															
			$la_pensum[$liI]['prela1']=$la_Tupla["prela1"];															
			$la_pensum[$liI]['prela2']=$la_Tupla["prela2"];															
			$la_pensum[$liI]['prela3']=$la_Tupla["prela3"];															
			$liI++;																							
		}																											
		$this->f_Cierra($lr_Tabla);																					
		$this->f_Des();																								
		return $la_pensum;																								
	}
	private function cargarMateriasPasadas($estudiante){
		$la_MateriasP=array();
		$liI=0;
		$ls_Sql="SELECT pm.codmat
				FROM insnot AS nota
				INNER JOIN inscripcion_pre AS i ON(nota.idinscripcion=i.num_inscripcion)
				INNER JOIN planificacion_materias AS pm ON(pm.pm_codigo=i.pm_codigo)
				WHERE (nota.cedula_est_pre='$estudiante') AND (nota.notadef>10)";				
		$this->f_Con();																								
		$lr_Tabla=$this->f_Filtro($ls_Sql);																			
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	
			$la_MateriasP[$liI]['codigo']=$la_Tupla["codmat"];														
			$liI++;																							
		}																											
		$this->f_Cierra($lr_Tabla);																					
		$this->f_Des();																								
		return $la_MateriasP;
	}
	public function validarMaterias(){
		//arreglo donde se guardan todas las materias validadas
		$materiasAOptar=array();
		//contador que maneja el tamaño del arreglo de materias validadas
		$cantMaterias=0;
		$estudiante=$_SESSION['usuario']['Cedula'];
		$pensum=$this->cargarPensum($estudiante);
		$materiasPasadas=$this->cargarMateriasPasadas($estudiante);
		
		$validado=0;
		for($x=0;$x<count($pensum);$x++){
			$validado=0;
			//valido que la materia no haya sido aprobada en anteriores
			//ocasiones
			for($y=0;$y<count($materiasPasadas);$y++){
				if($pensum[$x]['codigo']==$materiasPasadas[$y]['codigo']){
					$validado++;
					break;
				}
			}
			//si la materia no fue aprobada con anterioridad continuo
			//en caso contrario lo dejo hasta ahi
			if($validado==0){
				//prosigo con las prelaciones
				if($pensum[$x]['prela1']!='-'){
					$prelacion=0;
					for($y=0;$y<count($materiasPasadas);$y++){
						if($pensum[$x]['prela1']==$materiasPasadas[$y]['codigo']){
							$prelacion++;
							break;
						}
					}
					//si no encontro la prelacion entre las aprobadas el valor sera 0
					if($prelacion==0){
						$validado++;
					}
				}
				if($pensum[$x]['prela2']!='-'){
					$prelacion=0;
					for($y=0;$y<count($materiasPasadas);$y++){
						if($pensum[$x]['prela2']==$materiasPasadas[$y]['codigo']){
							$prelacion++;
							break;
						}
					}
					//si no encontro la prelacion entre las aprobadas el valor sera 0
					if($prelacion==0){
						$validado++;
					}
				}
				if($pensum[$x]['prela3']!='-'){
					$prelacion=0;
					for($y=0;$y<count($materiasPasadas);$y++){
						if($pensum[$x]['prela3']==$materiasPasadas[$y]['codigo']){
							$prelacion++;
							break;
						}
					}
					//si no encontro la prelacion entre las aprobadas el valor sera 0
					if($prelacion==0){
						$validado++;
					}
				}
				//si la materia a cumplido con todas sus prelaciones se agrega a el arreglo de materias 
				//a optar
				if($validado==0){
					$materiasAOptar[$cantMaterias]['codigo']=$pensum[$x]['codigo'];
					$materiasAOptar[$cantMaterias]['nombre']=$pensum[$x]['nombre'];
					$cantMaterias++;
				}
			}
		}	
		$cadena="";
		for( $x = 0; $x < count($materiasAOptar); $x++ ){
			if($x==(count($materiasAOptar)-1)){
				$cadena.="(pm.codmat='".$materiasAOptar[$x]['codigo']."')";
			}else{
				$cadena.="(pm.codmat='".$materiasAOptar[$x]['codigo']."') OR";
			}
		}
		return $cadena;
	}
}
?>
