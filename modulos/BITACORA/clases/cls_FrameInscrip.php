<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_FrameInscrip extends  cls_Bitacora{
		

		public function __construct(){
			
		}


	/************************ Funcion Bloques     *************************************************************************/
	/* esta funcion se encarga buscar todos los bloques que se encuentren en la base de datos y este activos			  */
	/**********************************************************************************************************************/
	/**/	public function fSecciones()																				/**/
	/**/	{																											/**/
	/**/		include_once("cls_validarEstudiante.php");																/**/
	/**/		$lobjValidarMaterias= new cls_validarEstudiante;														/**/
	/**/		$subSqlMaterias=$lobjValidarMaterias->validarMaterias();												/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$laArreglo=Array();																						/**/
	/**/		$cedula=$_SESSION['usuario']['Cedula'];																	/**/
	/**/		$peraca=$_SESSION['peraca'];																			/**/
	/**/		$contadorSecciones=-1;																					/**/
	/**/		$contadorMaterias=-1;																					/**/
	/**/		$contadorBloques=0;																						/**/
	/**/		$controlSeccion=-1;																						/**/
	/**/		$controlMaterias=-1;																					/**/
	/**/		$liI=0;																									/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lsSql="SELECT (per.nombre1 || ' ' || per.apellido1) AS docente,p.idplanificacion,
                        pm.cedula_docente,pm.codmat,pm.tope,dpm.*,s.nombre AS semestre,pm.tope,
                        sec.nombre AS seccion,m.nommat, amb.nombre AS ambiente, pm.pm_codigo, m.credito AS unidades,
                        p.regimen
                        FROM materia AS m
                        INNER JOIN alumno AS a ON (a.idpensum=m.idpensum)
                        INNER JOIN planificacion_materias AS pm ON(pm.codmat=m.codmat)
                        INNER JOIN detalle_pm AS dpm ON(pm.pm_codigo=dpm.pm_codigo)
                        INNER JOIN planificacion_sec AS p ON(p.idplanificacion=pm.idplanificacion)
                        INNER JOIN semestre AS s ON(s.idsemestre=p.semestre)
                        INNER JOIN seccion AS sec ON(sec.idseccion=p.seccion)
                        INNER JOIN persona AS per ON(per.cedula=pm.cedula_docente)
                        INNER JOIN ambiente AS amb ON(amb.codigo=dpm.amb_codigo)
                        WHERE (a.cedula_est_pre='$cedula')  AND (p.peraca='$peraca')
                        AND(
                        	$subSqlMaterias
                        )
						AND (pm.tope>(SELECT COUNT(*) FROM inscripcion_pre WHERE pm_codigo=pm.pm_codigo))
                        ORDER BY p.regimen,p.semestre, p.seccion,p.idplanificacion, pm.codmat";							/**/
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
    /**/            $laMatriz [$liI] [8]= $laTupla ["unidades"];                                                        /**/
	/**/			$laMatriz [$liI] [9]= $laTupla ["semestre"];														/**/
	/**/			$laMatriz [$liI] [10]= $laTupla ["cedula_docente"];													/**/
    /**/            $laMatriz [$liI] [11]= $laTupla ["idplanificacion"];                                                /**/
	/**/			$laMatriz [$liI] [12]= $laTupla ["seccion"];														/**/
	/**/			$laMatriz [$liI] [13]= $laTupla ["regimen"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
    /**/        $this->f_Des();                                                                                         /**/
    /**/        $cm=0;                                                                                                  /**/
    /**/        $cs=-1;                                                                                                 /**/
	/**/		$cB=0;																							        /**/
	/**/		for($bloques=0;$bloques<count($laMatriz);$bloques++){													/**/
	/**/			if($laMatriz[$bloques][11]!=$controlSeccion){														/**/
	/**/				$contadorSecciones++;																			/**/
	/**/				$contadorMaterias=-1;																			/**/
    /**/                $controlSeccion=$laMatriz[$bloques][11];                                                        /**/
    /**/                $controlMaterias=-1;					                                                        /**/
    /**/                $cs++;                                                                                          /**/
	/**/			}                                       															/**/
	/**/			if($laMatriz[$bloques][3]!=$controlMaterias){												       	/**/
	/**/					$contadorBloques=0;																			/**/
	/**/					$controlMaterias=$laMatriz[$bloques][3];													/**/
    /**/                    $contadorMaterias++;                                                                        /**/
    /**/                    $cm++;                                                                                      /**/
	/**/			}																									/**/
	/**/			$laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][0]=$laMatriz[$bloques][0];		/**/
	/**/			$laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][1]=$laMatriz[$bloques][1];		/**/
	/**/			$laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][2]=$laMatriz[$bloques][2];		/**/
	/**/			$laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][3]=$laMatriz[$bloques][3];		/**/
	/**/			$laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][4]=$laMatriz[$bloques][4];		/**/
	/**/			$laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][5]=$laMatriz[$bloques][5];		/**/
	/**/			$laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][6]=$laMatriz[$bloques][6];		/**/
	/**/			$laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][7]=$laMatriz[$bloques][7];		/**/
    /**/            $laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][8]=$laMatriz[$bloques][8];      /**/
    /**/            $laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][9]=$laMatriz[$bloques][9];      /**/
    /**/            $laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][10]=$laMatriz[$bloques][10];    /**/
    /**/            $laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][11]=$laMatriz[$bloques][11];    /**/
    /**/            $laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][12]=$laMatriz[$bloques][12];    /**/
    /**/            $laArreglo[$contadorSecciones][$contadorMaterias][$contadorBloques][13]=$laMatriz[$bloques][13];    /**/
    /**/            $contadorBloques++;                                                                                 /**/
	/**/			$cb++;																					            /**/
	/**/		}																										/**/
	/**/		return $laArreglo;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
}
?>