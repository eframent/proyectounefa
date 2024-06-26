<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Rep_Horario extends  cls_Bitacora{
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
	
	/************************ Funcion BuscarAula  **********************************************************************/
	/* Busca todos las Aulas que poseen un horario armado en este período academico									  */
	/**********************************************************************************************************************/
		public function f_BuscarAula(){																							
			$usuarios=Array();
			$liI=0;
			$cont=0;
			$lb_Enc=false;
			$campos=" WHERE nombre like '%".$this->aa_Form['Nombre']."%'";

			$peraca=$_SESSION['peraca'];
			$ls_Sql="SELECT * FROM ambiente $campos";								
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$elementos[$liI]['Nombre']=$la_Tupla['nombre'];													
				$elementos[$liI]['Codigo']=$la_Tupla['codigo'];											
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['elementos']=$elementos;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/********************************************************************************************************************/


	/************************ Funcion BuscarDocente  **********************************************************************/
	/* Busca todos los docentes que poseen un horario armado en este período academico									  */
	/**********************************************************************************************************************/
		public function f_BuscarDocente(){																							
			$usuarios=Array();
			$liI=0;
			$cont=0;
			$lb_Enc=false;
			$campos=" AND cedula_doc like '%".$this->aa_Form['Cedula']."%'";
			$campos.=" AND nombre1 like '%".$this->aa_Form['Nombre1']."%'";
			$campos.=" AND nombre2 like '%".$this->aa_Form['Nombre2']."%'";
			$campos.=" AND apellido1 like '%".$this->aa_Form['Apellido1']."%'";
			$campos.=" AND apellido2 like '%".$this->aa_Form['Apellido2']."%'";

			$peraca=$_SESSION['peraca'];
			$ls_Sql="SELECT 
					(per.nombre1||' '||substring(per.nombre2 from 1 for 1)||'. '||per.apellido1||' '||substring(per.apellido2 from 1 for 1)||'.') AS nombres,
					cedula_doc
					FROM docente AS d 
					INNER JOIN persona AS per ON(per.cedula=d.cedula_doc)
					INNER JOIN planificacion_materias AS pm ON(d.cedula_doc=pm.cedula_docente)
					INNER JOIN materia AS m ON (m.codmat=pm.codmat)
					INNER JOIN planificacion_sec AS p ON(p.idplanificacion=pm.idplanificacion)
					WHERE p.peraca='$peraca' $campos
					GROUP BY cedula_doc, nombres
					ORDER BY d.cedula_doc ";								
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$elementos[$liI]['Nombres']=$la_Tupla['nombres'];													
				$elementos[$liI]['Cedula']=$la_Tupla['cedula_doc'];											
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['elementos']=$elementos;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/********************************************************************************************************************/
	

	/************************ Funcion BuscarSeccion  **********************************************************************/
	/* Busca todos las secciones planificadas en este período academico									  				  */
	/**********************************************************************************************************************/
		public function f_BuscarSeccion(){																							
			$usuarios=Array();
			$liI=0;
			$cont=0;
			$lb_Enc=false;
			$campos=" AND sem.nombre like '%".$this->aa_Form['Semestre']."%'";
			$campos.=" AND sec.nombre like '%".$this->aa_Form['Seccion']."%'";
			$campos.=" AND c.nombre like '%".$this->aa_Form['Carrera']."%'";
			$campos.=" AND r.tipo_turno like '%".$this->aa_Form['Regimen']."%'";

			$peraca=$_SESSION['peraca'];
			$ls_Sql="SELECT c.nombre AS carrera,sem.nombre AS semestre, sec.nombre AS seccion, 
						r.tipo_turno AS turno, p.idplanificacion AS codigo
						FROM planificacion_sec AS p
						INNER JOIN carrera AS c ON(c.codesp=p.codesp)
						INNER JOIN semestre AS sem ON(sem.idsemestre=p.semestre)
						INNER JOIN seccion AS sec ON(sec.idseccion=p.seccion)
						INNER JOIN regimen AS r ON(r.idregimen=p.regimen)
						WHERE p.peraca='$peraca' $campos
						AND p.semestre<>'0'
						ORDER BY p.codesp,sem.idsemestre,sec.idseccion";								
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$elementos[$liI]['Carrera']=$la_Tupla['carrera'];													
				$elementos[$liI]['Semestre']=$la_Tupla['semestre'];											
				$elementos[$liI]['Seccion']=$la_Tupla['seccion'];											
				$elementos[$liI]['Turno']=$la_Tupla['turno'];											
				$elementos[$liI]['Codigo']=$la_Tupla['codigo'];											
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['elementos']=$elementos;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/********************************************************************************************************************/
	

	/************************ Funcion BuscarBloques  **********************************************************************/
	/* Busca los bloques de hora para la creacion de horarios											  				  */
	/**********************************************************************************************************************/
		public function f_BuscarBloques(){																							
			$usuarios=Array();
			$liI=0;
			$cont=0;
			$lb_Enc=false;
			if($this->aa_Form['busqueda']=='seccion'){
				$ls_Sql="SELECT b.* FROM bloque AS b 
						INNER JOIN regimen AS r ON(r.idregimen=b.idregimen)
						WHERE r.idregimen=(SELECT regimen FROM planificacion_sec WHERE idplanificacion='".$this->aa_Form['Codigo']."')
						AND b.blo_status='A'
						ORDER BY blo_posicion";
			}else{
				$ls_Sql="SELECT * FROM bloque WHERE blo_status='A' ORDER BY blo_posicion";	
			}

			
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$elementos[$liI]['Codigo']=$la_Tupla['blo_codigo'];													
				$elementos[$liI]['Nombre']=$la_Tupla['blo_rango'];											
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['bloques']=$elementos;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/********************************************************************************************************************/

	/************************ Funcion Horario Docente *********************************************************************/
	/* esta funcion se encarga buscar todos los bloques de hora ocupados para el docente seleccionado					  */
	/**********************************************************************************************************************/
		public function f_HorarioDocente()																				
		{																											
			$laMatriz=Array();																						
			$laArreglo=Array();																						
			$contadorSecciones=-1;																					
			$cedula=$this->aa_Form['Cedula'];																	
			$peraca=$_SESSION['peraca'];																			
			$contadorMaterias=-1;																					
			$contadorBloques=0;																						
			$controlSeccion=-1;																						
			$controlMaterias=-1;																					
			$liI=0;																									
			$this->f_Con();																							
			$lsSql="SELECT p.idplanificacion,pm.codmat,pm.tope,dpm.*,s.nombre AS semestre,p.regimen,
				sec.nombre AS seccion,m.nommat, amb.nombre AS ambiente, pm.pm_codigo,m.credito AS unidades,
				(per.nombre1||' '||substring(per.nombre2 from 1 for 1)||'. '||per.apellido1||' '||substring(per.apellido2 from 1 for 1)||'.') AS docente
				FROM docente AS d 
				INNER JOIN planificacion_materias AS pm ON(d.cedula_doc=pm.cedula_docente)
				INNER JOIN detalle_pm AS dpm ON(pm.pm_codigo=dpm.pm_codigo)
				INNER JOIN materia AS m ON (m.codmat=pm.codmat)
				INNER JOIN planificacion_sec AS p ON(p.idplanificacion=pm.idplanificacion)
				INNER JOIN semestre AS s ON(s.idsemestre=p.semestre)
				INNER JOIN seccion AS sec ON(sec.idseccion=p.seccion)
				INNER JOIN ambiente AS amb ON(amb.codigo=dpm.amb_codigo)
				INNER JOIN persona AS per ON(per.cedula=d.cedula_doc)
				WHERE pm.cedula_docente='$cedula' AND p.peraca='$peraca'
				ORDER BY semestre, seccion,p.idplanificacion, p.regimen,pm.codmat,dpm.dia,dpm.amb_codigo,dpm.blo_codigo";	
			$lrTb=$this->f_Filtro($lsSql);																			
			While($laTupla=$this->f_Arreglo($lrTb)){																
				$laMatriz [$liI] [0]= $laTupla ["dia"];																
				$laMatriz [$liI] [1]= $laTupla ["blo_codigo"];														
				$laMatriz [$liI] [2]= $laTupla ["amb_codigo"];														
				$laMatriz [$liI] [3]= $laTupla ["codmat"];															
                $laMatriz [$liI] [4]= $laTupla ["docente"];                                                         
                $laMatriz [$liI] [5]= $laTupla ["ambiente"];                                                        
                $laMatriz [$liI] [6]= $laTupla ["nommat"];                                                          
                $laMatriz [$liI] [7]= $laTupla ["pm_codigo"];		                                                
				$laMatriz [$liI] [8]= $laTupla ["unidades"];
				$laMatriz [$liI] ['regimen']=$laTupla['regimen'];														
				$liI++;   																							
			}																										
			$this->f_Cierra($lrTb);																					
            $this->f_Des();                                                                                         
            $cm=0;                                                                                                  
            $cs=-1;                                                                                                 
			$cB=0;
			$regimen;																							        
			for($bloques=0;$bloques<count($laMatriz);$bloques++){													
				if(($laMatriz[$bloques][3]!=$controlMaterias)||($regimen!=$laMatriz[$bloques]['regimen'])){
						$contadorBloques=0;
						$regimen=$laMatriz[$bloques]['regimen'];																			
						$controlMaterias=$laMatriz[$bloques][3];													
                        $contadorMaterias++;                                                                        
                        $cm++;                                                                                      
				}																									
				$laArreglo[$contadorMaterias][$contadorBloques][0]=$laMatriz[$bloques][0];							
				$laArreglo[$contadorMaterias][$contadorBloques][1]=$laMatriz[$bloques][1];							
				$laArreglo[$contadorMaterias][$contadorBloques][2]=$laMatriz[$bloques][2];							
				$laArreglo[$contadorMaterias][$contadorBloques][3]=$laMatriz[$bloques][3];							
				$laArreglo[$contadorMaterias][$contadorBloques][4]=$laMatriz[$bloques][4];							
				$laArreglo[$contadorMaterias][$contadorBloques][5]=$laMatriz[$bloques][5];							
				$laArreglo[$contadorMaterias][$contadorBloques][6]=$laMatriz[$bloques][6];							
				$laArreglo[$contadorMaterias][$contadorBloques][7]=$laMatriz[$bloques][7];							
				$laArreglo[$contadorMaterias][$contadorBloques][8]=$laMatriz[$bloques][8];							
                $contadorBloques++;                                                                                 
				$cb++;																					            
			}																										
			return $laArreglo;																						
		}																												
	/**********************************************************************************************************************/
	
	/************************ Funcion Horario Aula  ***********************************************************************/
	/* esta funcion se encarga buscar todos los bloques de horas ocupados para el aula seleccionada						  */
	/**********************************************************************************************************************/
		public function f_HorarioAula()																				
		{																								
			$laMatriz=Array();																						
			$laArreglo=Array();																						
			$contadorSecciones=-1;																					
			$codigo=$this->aa_Form['CodigoAula'];																	
			$peraca=$_SESSION['peraca'];																			
			$contadorMaterias=-1;																					
			$contadorBloques=0;																						
			$controlSeccion=-1;																						
			$controlMaterias=-1;																					
			$liI=0;																									
			$this->f_Con();																							
			$lsSql="SELECT  p.idplanificacion,pm.codmat,pm.tope,dpm.*,s.nombre AS semestre,p.regimen,
					sec.nombre AS seccion,m.nommat, amb.nombre AS ambiente, pm.pm_codigo,m.credito AS unidades,
					(per.nombre1||' '||substring(per.nombre2 from 1 for 1)||'. '||per.apellido1||' '||substring(per.apellido2 from 1 for 1)||'.') AS docente
					FROM planificacion_sec AS p
					INNER JOIN planificacion_materias AS pm ON(p.idplanificacion=pm.idplanificacion)
					INNER JOIN materia AS m ON(pm.codmat=m.codmat)
					INNER JOIN detalle_pm AS dpm ON(pm.pm_codigo=dpm.pm_codigo)
					INNER JOIN ambiente AS amb ON(amb.codigo=dpm.amb_codigo)
					INNER JOIN carrera AS c ON(p.codesp=c.codesp)
					INNER JOIN regimen AS r ON(p.regimen=r.idregimen)
					INNER JOIN semestre AS s ON(p.semestre=s.idsemestre)
					INNER JOIN seccion AS sec ON(p.seccion=sec.idseccion)
					INNER JOIN persona AS per ON(pm.cedula_docente=per.cedula)
					INNER JOIN peraca AS pera ON(pera.peraca=p.peraca)
					WHERE(p.peraca='$peraca') 
					AND (dpm.amb_codigo='$codigo')
					AND (p.semestre<>'0')
					ORDER BY p.semestre,p.seccion,p.regimen";	
			$lrTb=$this->f_Filtro($lsSql);																			
			While($laTupla=$this->f_Arreglo($lrTb)){																
				$laMatriz [$liI] [0]= $laTupla ["dia"];																
				$laMatriz [$liI] [1]= $laTupla ["blo_codigo"];														
				$laMatriz [$liI] [2]= $laTupla ["amb_codigo"];														
				$laMatriz [$liI] [3]= $laTupla ["codmat"];															
                $laMatriz [$liI] [4]= $laTupla ["docente"];                                                         
                $laMatriz [$liI] [5]= $laTupla ["ambiente"];                                                        
                $laMatriz [$liI] [6]= $laTupla ["nommat"];                                                          
                $laMatriz [$liI] [7]= $laTupla ["pm_codigo"];		                                                
				$laMatriz [$liI] [8]= $laTupla ["unidades"];
				$laMatriz [$liI] ['regimen']=$laTupla['regimen'];														
				$liI++;   																							
			}																										
			$this->f_Cierra($lrTb);																					
            $this->f_Des();                                                                                         
            $cm=0;                                                                                                  
            $cs=-1;                                                                                                 
			$cB=0;
			$regimen;																							        
			for($bloques=0;$bloques<count($laMatriz);$bloques++){													
				if(($laMatriz[$bloques][3]!=$controlMaterias)||($regimen!=$laMatriz[$bloques]['regimen'])){
						$contadorBloques=0;
						$regimen=$laMatriz[$bloques]['regimen'];																			
						$controlMaterias=$laMatriz[$bloques][3];													
                        $contadorMaterias++;                                                                        
                        $cm++;                                                                                      
				}																									
				$laArreglo[$contadorMaterias][$contadorBloques][0]=$laMatriz[$bloques][0];							
				$laArreglo[$contadorMaterias][$contadorBloques][1]=$laMatriz[$bloques][1];							
				$laArreglo[$contadorMaterias][$contadorBloques][2]=$laMatriz[$bloques][2];							
				$laArreglo[$contadorMaterias][$contadorBloques][3]=$laMatriz[$bloques][3];							
				$laArreglo[$contadorMaterias][$contadorBloques][4]=$laMatriz[$bloques][4];							
				$laArreglo[$contadorMaterias][$contadorBloques][5]=$laMatriz[$bloques][5];							
				$laArreglo[$contadorMaterias][$contadorBloques][6]=$laMatriz[$bloques][6];							
				$laArreglo[$contadorMaterias][$contadorBloques][7]=$laMatriz[$bloques][7];							
				$laArreglo[$contadorMaterias][$contadorBloques][8]=$laMatriz[$bloques][8];							
                $contadorBloques++;                                                                                 
				$cb++;																					            
			}																										
			return $laArreglo;										
		}																												
	/**********************************************************************************************************************/

	/************************ Funcion Horario Seccion  ***********************************************************************/
	/* esta funcion se encarga buscar todos los bloques de horas ocupados para la seccion seleccionada						  */
	/**********************************************************************************************************************/
		public function f_HorarioSeccion()																				
		{	
			$laMatriz=Array();																						
			$laArreglo=Array();																						
			$contadorSecciones=-1;																					
			$codigo=$this->aa_Form['Codigo'];																	
			$peraca=$_SESSION['peraca'];																			
			$contadorMaterias=-1;																					
			$contadorBloques=0;																						
			$controlSeccion=-1;																						
			$controlMaterias=-1;																					
			$liI=0;																									
			$this->f_Con();																							
			$lsSql="SELECT  p.idplanificacion,pm.codmat,pm.tope,dpm.*,s.nombre AS semestre,p.regimen,
					sec.nombre AS seccion,m.nommat, amb.nombre AS ambiente, pm.pm_codigo,m.credito AS unidades,
					(per.nombre1||' '||substring(per.nombre2 from 1 for 1)||'. '||per.apellido1||' '||substring(per.apellido2 from 1 for 1)||'.') AS docente
					FROM planificacion_sec AS p
					INNER JOIN planificacion_materias AS pm ON(p.idplanificacion=pm.idplanificacion)
					INNER JOIN materia AS m ON(pm.codmat=m.codmat)
					INNER JOIN detalle_pm AS dpm ON(pm.pm_codigo=dpm.pm_codigo)
					INNER JOIN ambiente AS amb ON(amb.codigo=dpm.amb_codigo)
					INNER JOIN carrera AS c ON(p.codesp=c.codesp)
					INNER JOIN regimen AS r ON(p.regimen=r.idregimen)
					INNER JOIN semestre AS s ON(p.semestre=s.idsemestre)
					INNER JOIN seccion AS sec ON(p.seccion=sec.idseccion)
					INNER JOIN persona AS per ON(pm.cedula_docente=per.cedula)
					INNER JOIN peraca AS pera ON(pera.peraca=p.peraca)
					WHERE(p.peraca='$peraca') 
					AND (p.idplanificacion='$codigo')
					AND (p.semestre<>'0')
					ORDER BY p.semestre,p.seccion,p.regimen";	
			$lrTb=$this->f_Filtro($lsSql);																			
			While($laTupla=$this->f_Arreglo($lrTb)){																
				$laMatriz [$liI] [0]= $laTupla ["dia"];																
				$laMatriz [$liI] [1]= $laTupla ["blo_codigo"];														
				$laMatriz [$liI] [2]= $laTupla ["amb_codigo"];														
				$laMatriz [$liI] [3]= $laTupla ["codmat"];															
                $laMatriz [$liI] [4]= $laTupla ["docente"];                                                         
                $laMatriz [$liI] [5]= $laTupla ["ambiente"];                                                        
                $laMatriz [$liI] [6]= $laTupla ["nommat"];                                                          
                $laMatriz [$liI] [7]= $laTupla ["pm_codigo"];		                                                
				$laMatriz [$liI] [8]= $laTupla ["unidades"];
				$laMatriz [$liI] ['regimen']=$laTupla['regimen'];														
				$liI++;   																							
			}																										
			$this->f_Cierra($lrTb);																					
            $this->f_Des();                                                                                         
            $cm=0;                                                                                                  
            $cs=-1;                                                                                                 
			$cB=0;
			$regimen;																							        
			for($bloques=0;$bloques<count($laMatriz);$bloques++){													
				if(($laMatriz[$bloques][3]!=$controlMaterias)||($regimen!=$laMatriz[$bloques]['regimen'])){
						$contadorBloques=0;
						$regimen=$laMatriz[$bloques]['regimen'];																			
						$controlMaterias=$laMatriz[$bloques][3];													
                        $contadorMaterias++;                                                                        
                        $cm++;                                                                                      
				}																									
				$laArreglo[$contadorMaterias][$contadorBloques][0]=$laMatriz[$bloques][0];							
				$laArreglo[$contadorMaterias][$contadorBloques][1]=$laMatriz[$bloques][1];							
				$laArreglo[$contadorMaterias][$contadorBloques][2]=$laMatriz[$bloques][2];							
				$laArreglo[$contadorMaterias][$contadorBloques][3]=$laMatriz[$bloques][3];							
				$laArreglo[$contadorMaterias][$contadorBloques][4]=$laMatriz[$bloques][4];							
				$laArreglo[$contadorMaterias][$contadorBloques][5]=$laMatriz[$bloques][5];							
				$laArreglo[$contadorMaterias][$contadorBloques][6]=$laMatriz[$bloques][6];							
				$laArreglo[$contadorMaterias][$contadorBloques][7]=$laMatriz[$bloques][7];							
				$laArreglo[$contadorMaterias][$contadorBloques][8]=$laMatriz[$bloques][8];							
                $contadorBloques++;                                                                                 
				$cb++;																					            
			}																										
			return $laArreglo;																														
		}																												
	/**********************************************************************************************************************/
}
?>
