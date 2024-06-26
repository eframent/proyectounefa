<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Proyeccion extends  cls_Bitacora{
		private $aa_Form;
		private $aa_Matriz;
		private $aa_Auxiliar;
		private $ab_Retornar;
		private $aa_Variable;

		public function __construct(){
			$this->aa_Form=Array();
			$this->aa_Matriz=Array();
			$this->aa_Auxiliar=Array();
			$this->ab_Retornar=Array();
		}

	/********* Funcion Obtener Formulario *********/
	/**/public function f_SetsForm($pa_Form){	/**/
	/**/	$this->aa_Form=$pa_Form;			/**/
	/**/}										/**/
	/**********************************************/
	
	/********* Funcion Setear Variable 	  *************************/
	/**/public function f_SetsVariable($pa_Variable){			/**/
	/**/	$this->aa_Variable=$pa_Variable;					/**/
	/**/														/**/
	/**/}														/**/
	/**************************************************************/

	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsForm(){			/**/
	/**/	return $this->aa_Form;				/**/
	/**/}										/**/
	/**********************************************/
	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsMatriz(){			/**/
	/**/	return $this->aa_Matriz;			/**/
	/**/}										/**/
	/**********************************************/
	
	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsAuxiliar(){		/**/
	/**/	return $this->aa_Auxiliar;			/**/
	/**/}										/**/
	/**********************************************/

	/********* Funcion Eliminar Secciones *********************************************************************************************/
	/**/public function f_Eliminar(){																								/**/
	/**/	$lb_Hecho=false;																										/**/
	/**/	$ls_Sql="DELETE FROM planificacion_sec WHERE (idplanificacion='".$this->aa_Form['cmbseccion']."')";						/**/
	/**/	if($this->f_Supervisar("Planificacion De Secciones",$ls_Sql,$_SESSION['usuario']['Nombre'])){							/**/
	/**/		$this->f_Con();																										/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																				/**/
	/**/		$this->f_Des();																										/**/
	/**/	}																														/**/
	/**/	return $lb_Hecho;																										/**/
	/**/}																															/**/
	/**********************************************************************************************************************************/

		//funcion para de busqueda para modificacion 
		public function f_CargarModificacion(){																								
		$lb_Hecho=false;																										
		$la_Matriz= Array();
		$la_Detalle= Array();
		$liI=0;
		$ls_Sql="SELECT * FROM planificacion_sec
				WHERE (idplanificacion='".$this->aa_Form['cmbseccion']."')";
		$this->f_Con();
		$lrTb=$this->f_Filtro($ls_Sql);
		if($laTupla=$this->f_Arreglo($lrTb))
        {
        	$la_Matriz ["cmbperaca"] = $laTupla ["peraca"];
        	$la_Matriz ["cmbcodesp"] = $laTupla ["codesp"];
        	$la_Matriz ["cmbregimen"] = $laTupla ["regimen"];
        	$la_Matriz ["cmbsemestre"] = $laTupla ["semestre"];
        	$la_Matriz ["cmbseccion"] = $laTupla ["seccion"];
        	$la_Matriz ["Sec"] = $laTupla ["idplanificacion"];
        	$lb_Hecho=true;
        }
        $this->f_Cierra($lrTb);
		$this->f_Des();
		// si encontro busca el detalle
		if($lb_Hecho){
			//control de materia primer detalle
			$controlPrimerDetalle=-1;
			$liC=0;
			$ls_Sql="SELECT p.*,dp.* FROM planificacion_materias AS p
					INNER JOIN detalle_pm AS dp ON(dp.pm_codigo=p.pm_codigo)
					WHERE (idplanificacion='".$this->aa_Form['cmbseccion']."')";
			$this->f_Con();
			$lrTb=$this->f_Filtro($ls_Sql);
			while($laTupla=$this->f_Arreglo($lrTb))
	        {
	        	if($controlPrimerDetalle==-1){
	        		$controlPrimerDetalle=$laTupla ["pm_codigo"];
	        	}
	        	if($controlPrimerDetalle!=$laTupla ["pm_codigo"]){
	        		$controlPrimerDetalle=$laTupla ["pm_codigo"];
	        		$liC++;
	        		$liI=0;
	        	}
	        	$la_Detalle [$liC] [$liI] ["Seccion"] = $laTupla ["idplanificacion"];
	        	$la_Detalle [$liC] [$liI] ["Docente"] = $laTupla ["cedula_docente"];
	        	$la_Detalle [$liC] [$liI] ["Materia"] = $laTupla ["codmat"];
	        	$la_Detalle [$liC] [$liI] ["Tope"] = $laTupla ["tope"];
	        	$la_Detalle [$liC] [$liI] ["Pm_codigo"] = $laTupla ["pm_codigo"];
	        	$la_Detalle [$liC] [$liI] ["Bloque"] = $laTupla ["blo_codigo"];
	        	$la_Detalle [$liC] [$liI] ["Dia"] = $laTupla ["dia"];
	        	$la_Detalle [$liC] [$liI] ["Ambiente"] = $laTupla ["amb_codigo"];
	        	$liI++;
	        }
	        $this->f_Cierra($lrTb);
			$this->f_Des();
			$_SESSION["SeccionAModificar"]["Cuerpo"]=$la_Matriz;
			$_SESSION["SeccionAModificar"]["Detalle"]=$la_Detalle;
		}																												
		return $lb_Hecho;																										
	}																															
	
	public function f_Guardado(){
		$lt_Hora=date('H:i:s');
		$lf_Fecha=date('Y/m/d');
		$arr=explode(",",$this->aa_Variable);
		$auxiliar=Array();
		$y=0;
		$z=0;
		for($x=0;$x<count($arr);$x++){
			if($y==4){
				$y=0;
				$z++;
			}
			$auxiliar[$z][$y]=$arr[$x];
			$y++;
		}
		$arr=$auxiliar;
		$control=-1;
		$y=-1;
		$z=-1;
		$auxiliar=Array();
		for($x=0;$x<count($arr);$x++){
			if($control!=$arr[$x][3]){
				$control=$arr[$x][3];
				$z++;
				$y=0;
			}
			$auxiliar[$z][$y]=$arr[$x];
			$y++;
		}
		$arr=$auxiliar;
//------------------------------ Este camino es cuando es una Modificacion ---------------------------------
		if($this->aa_Form['Seccion']!=""){
			$lb_Hecho=false;
			$ls_Sql="DELETE FROM planificacion_materias WHERE idplanificacion='".$this->aa_Form['Seccion']."'";
			$this->f_Con();
			$this->f_Begin();
			$lb_Hecho=$this->f_Ejecutar($ls_Sql);
			if($lb_Hecho){				
				for($x=0;$x<$this->aa_Form['Columnas'];$x++){
					$lb_Hecho=false;
					$ls_Sql="INSERT INTO planificacion_materias (idplanificacion,codmat,cedula_docente,tope) VALUES ('".$this->aa_Form['Seccion']."','".$this->aa_Form['newCamp0-'.$x]."','".$this->aa_Form['newCamp1-'.$x]."','".$this->aa_Form['newCamp2-'.$x]."') ";
					$lb_Hecho=$this->f_Ejecutar($ls_Sql);
					if($lb_Hecho){
						$lb_Hecho=false;
						$idmateria="("."SELECT pm_codigo FROM planificacion_materias WHERE ";
						$idmateria.="codmat='".$this->aa_Form['newCamp0-'.$x]."' AND cedula_docente='".$this->aa_Form['newCamp1-'.$x]."' AND";
						$idmateria.=" tope='".$this->aa_Form['newCamp2-'.$x]."' AND idplanificacion='".$this->aa_Form['Seccion']."'".")";
						for($y=0;$y<count($arr);$y++){
							if($arr[$y][0][3]==$this->aa_Form['newCamp0-'.$x]){
								for($z=0;$z<count($arr[$y]);$z++){
									$ls_Sql="INSERT INTO detalle_pm (pm_codigo,dia,blo_codigo,amb_codigo) VALUES ($idmateria,'".$arr[$y][$z][0]."','".$arr[$y][$z][1]."','".$arr[$y][$z][2]."')";
									$lb_Hecho=$this->f_Ejecutar($ls_Sql);
									if(!$lb_Hecho){
										$this->f_Rollback();print("<br><br>rollback interno<br><br>");
									}
								}
							}
						}
					}else{
						$this->f_Rollback();
					}
				}
			}else{
				$this->f_Rollback();
			}			
			if($lb_Hecho){
				$this->f_Commit();
			}else{
				$this->f_Rollback();print("<br><br>rollback final<br><br>");
			}
			$this->f_Des();

		}else{
//---------------------------------------Aqui es la parte de Insercion Cuando la Seccion no existe ----------------------------------------------------
			$lb_Hecho=false;
			$ls_Sql="INSERT INTO planificacion_sec (peraca,regimen,codesp,semestre,horapla,fechapla,seccion) VALUES 
					(".$this->aa_Form['cmbperaca'].",".$this->aa_Form['cmbregimen'].",".$this->aa_Form['cmbcodesp'].",".$this->aa_Form['cmbsemestre'].",'".$lt_Hora."','".$lf_Fecha."',".$this->aa_Form['cmbseccion'].")";
			$this->f_Con();
			$this->f_Begin();
			$lb_Hecho=$this->f_Ejecutar($ls_Sql);
			if($lb_Hecho){
				$idseccion="("."SELECT idplanificacion FROM planificacion_sec WHERE ";
				$idseccion.=" peraca='".$this->aa_Form['cmbperaca']."' AND regimen='".$this->aa_Form['cmbregimen']."' AND ";
				$idseccion.=" codesp='".$this->aa_Form['cmbcodesp']."' AND semestre='".$this->aa_Form['cmbsemestre']."' AND ";
				$idseccion.=" horapla='".$lt_Hora."' AND fechapla='".$lf_Fecha."' AND seccion='".$this->aa_Form['cmbseccion']."'".")";
				for($x=0;$x<$this->aa_Form['Columnas'];$x++){
					$lb_Hecho=false;
					$ls_Sql="INSERT INTO planificacion_materias (idplanificacion,codmat,cedula_docente,tope) VALUES ($idseccion,'".$this->aa_Form['newCamp0-'.$x]."','".$this->aa_Form['newCamp1-'.$x]."','".$this->aa_Form['newCamp2-'.$x]."') ";
					$lb_Hecho=$this->f_Ejecutar($ls_Sql);
					if($lb_Hecho){
						$lb_Hecho=false;
						$idmateria="("."SELECT pm_codigo FROM planificacion_materias WHERE ";
						$idmateria.="codmat='".$this->aa_Form['newCamp0-'.$x]."' AND cedula_docente='".$this->aa_Form['newCamp1-'.$x]."' AND";
						$idmateria.=" tope='".$this->aa_Form['newCamp2-'.$x]."' AND idplanificacion=$idseccion".")";
						for($y=0;$y<count($arr);$y++){
							if($arr[$y][0][3]==$this->aa_Form['newCamp0-'.$x]){
								for($z=0;$z<count($arr[$y]);$z++){
									$ls_Sql="INSERT INTO detalle_pm (pm_codigo,dia,blo_codigo,amb_codigo) VALUES ($idmateria,'".$arr[$y][$z][0]."','".$arr[$y][$z][1]."','".$arr[$y][$z][2]."')";
									$lb_Hecho=$this->f_Ejecutar($ls_Sql);
									if(!$lb_Hecho){
										$this->f_Rollback();print("<br><br>rollback interno<br><br>");
									}
								}
							}
						}						
					}else{
						$this->f_Rollback();print("<br><br>rollback medio<br><br>");
					}
				}
			}else{
				$this->f_Rollback();print("<br><br>rollback extreno<br><br>");
			}
			if($lb_Hecho){
				$this->f_Commit();
			}else{
				$this->f_Rollback();print("<br><br>rollback final<br><br>");
			}
			$this->f_Des();
		}
	}
	
}
?>

