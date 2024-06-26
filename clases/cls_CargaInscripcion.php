<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_CargaInscripcion extends  cls_Bitacora{
		

		public function __construct(){
			
		}
	/************************ Funcion Bloques     *************************************************************************/
	/* esta funcion se encarga buscar todos los bloques que se encuentren en la base de datos y este activos			  */
	/**********************************************************************************************************************/
	/**/	public function fSecciones()																				/**/
	/**/	{																											/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$laArreglo=Array();																						/**/
	/**/		$contadorSecciones=-1;																					/**/
	/**/		$cedula=$_SESSION['usuario']['Cedula'];																	/**/
	/**/		$peraca=$_SESSION['peraca'];																			/**/
	/**/		$contadorMaterias=-1;																					/**/
	/**/		$contadorBloques=0;																						/**/
	/**/		$controlSeccion=-1;																						/**/
	/**/		$controlMaterias=-1;																					/**/
	/**/		$liI=0;																									/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT (per.nombre1 || ' ' || per.apellido1) AS docente,p.idplanificacion,
						pm.cedula_docente,pm.codmat,pm.tope,dpm.*,s.nombre AS semestre,
						sec.nombre AS seccion,m.nommat, amb.nombre AS ambiente, pm.pm_codigo,m.credito AS unidades
						FROM alumno AS a
						INNER JOIN inscripcion_pre AS i ON(i.cedula_est_pre=a.cedula_est_pre)
						INNER JOIN planificacion_materias AS pm ON(pm.pm_codigo=i.pm_codigo)
						INNER JOIN detalle_pm AS dpm ON(pm.pm_codigo=dpm.pm_codigo)
						INNER JOIN materia AS m ON (m.codmat=pm.codmat)
						INNER JOIN planificacion_sec AS p ON(p.idplanificacion=pm.idplanificacion)
						INNER JOIN semestre AS s ON(s.idsemestre=p.semestre)
						INNER JOIN seccion AS sec ON(sec.idseccion=p.seccion)
						INNER JOIN persona AS per ON(per.cedula=pm.cedula_docente)
						INNER JOIN ambiente AS amb ON(amb.codigo=dpm.amb_codigo)
						WHERE (a.cedula_est_pre='$cedula') AND (p.peraca='$peraca')
						ORDER BY semestre, seccion,p.idplanificacion, pm.codmat,dpm.dia,dpm.amb_codigo,dpm.blo_codigo";	/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["dia"];																/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["blo_codigo"];														/**/
	/**/			$laMatriz [$liI] [2]= $laTupla ["amb_codigo"];														/**/
	/**/			$laMatriz [$liI] [3]= $laTupla ["codmat"];															/**/
    /**/            $laMatriz [$liI] [4]= $laTupla ["docente"];                                                         /**/
    /**/            $laMatriz [$liI] [5]= $laTupla ["ambiente"];                                                        /**/
    /**/            $laMatriz [$liI] [6]= $laTupla ["nommat"];                                                          /**/
    /**/            $laMatriz [$liI] [7]= $laTupla ["pm_codigo"];		                                                /**/
	/**/			$laMatriz [$liI] [8]= $laTupla ["unidades"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
    /**/        $this->f_Des();                                                                                         /**/
    /**/        $cm=0;                                                                                                  /**/
    /**/        $cs=-1;                                                                                                 /**/
	/**/		$cB=0;																							        /**/
	/**/		for($bloques=0;$bloques<count($laMatriz);$bloques++){													/**/
	/**/			if($laMatriz[$bloques][3]!=$controlMaterias){												       	/**/
	/**/					$contadorBloques=0;																			/**/
	/**/					$controlMaterias=$laMatriz[$bloques][3];													/**/
    /**/                    $contadorMaterias++;                                                                        /**/
    /**/                    $cm++;                                                                                      /**/
	/**/			}																									/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][0]=$laMatriz[$bloques][0];							/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][1]=$laMatriz[$bloques][1];							/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][2]=$laMatriz[$bloques][2];							/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][3]=$laMatriz[$bloques][3];							/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][4]=$laMatriz[$bloques][4];							/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][5]=$laMatriz[$bloques][5];							/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][6]=$laMatriz[$bloques][6];							/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][7]=$laMatriz[$bloques][7];							/**/
	/**/			$laArreglo[$contadorMaterias][$contadorBloques][8]=$laMatriz[$bloques][8];							/**/
    /**/            $contadorBloques++;                                                                                 /**/
	/**/			$cb++;																					            /**/
	/**/		}																										/**/
	/**/		return $laArreglo;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Bloques     *************************************************************************/
	/* esta funcion se encarga buscar todos los bloques que se encuentren en la base de datos y este activos			  */
	/**********************************************************************************************************************/
	/**/	public function fBloques()																					/**/
	/**/	{																											/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=0;																									/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT * FROM bloque WHERE(blo_status='A') ORDER BY blo_posicion";								/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($laTupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]= $laTupla ["blo_codigo"];														/**/
	/**/			$laMatriz [$liI] [1]= $laTupla ["blo_rango"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $laMatriz;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
}
?>