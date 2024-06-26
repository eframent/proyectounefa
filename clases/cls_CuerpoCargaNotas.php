<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_CuerpoCargaNotas extends  cls_Bitacora{
	private $aa_Cargadas=Array();
	private $aa_Semestres=Array();
	private $aa_MatrizCons=Array();

	public function f_Carga(){
		$la_Matriz= Array();
		$la_MatrizCons= Array();
		$liI=0;
		$peraca=$_SESSION['peraca'];
		$variable=$_SESSION['usuario']['Cedula'];
		$ls_Sql="SELECT  p.codesp,c.nombre AS carrera,p.regimen,r.tipo_turno,p.semestre ,s.nombre AS sem,p.seccion,sec.nombre AS sec,
				pm.*,m.nommat, (per.nombre1||' '||per.nombre2) AS nombredoc, (per.apellido1||' '||per.apellido2) AS apellidodoc, p.peraca,
				pera.nombre AS periodo
				FROM planificacion_sec AS p
				INNER JOIN planificacion_materias AS pm ON(p.idplanificacion=pm.idplanificacion)
				INNER JOIN materia AS m ON(pm.codmat=m.codmat)
				INNER JOIN carrera AS c ON(p.codesp=c.codesp)
				INNER JOIN regimen AS r ON(p.regimen=r.idregimen)
				INNER JOIN semestre AS s ON(p.semestre=s.idsemestre)
				INNER JOIN seccion AS sec ON(p.seccion=sec.idseccion)
				INNER JOIN persona AS per ON(pm.cedula_docente=per.cedula)
				INNER JOIN peraca AS pera ON(pera.peraca=p.peraca)
				WHERE(p.peraca='$peraca') 
				AND (pm.cedula_docente='$variable')
				AND (p.semestre<>'0')
				ORDER BY p.semestre,p.seccion,p.regimen";
		$this->f_Con();
		$lrTb=$this->f_Filtro($ls_Sql);
		while($laTupla=$this->f_Arreglo($lrTb))
        {
			$la_Matriz[$liI][0]=$laTupla["codesp"];
			$la_Matriz[$liI][1]=$laTupla["carrera"];
			$la_Matriz[$liI][2]=$laTupla["regimen"];
			$la_Matriz[$liI][3]=$laTupla["tipo_turno"];
			$la_Matriz[$liI][4]=$laTupla["semestre"];
			$la_Matriz[$liI][5]=$laTupla["sem"];
			$la_Matriz[$liI][6]=$laTupla["seccion"];
			$la_Matriz[$liI][7]=$laTupla["sec"];
			$la_Matriz[$liI][8]=$laTupla["idplanificacion"];//maneja seccion
			$la_Matriz[$liI][9]=$laTupla["cedula_docente"];
			$la_Matriz[$liI][10]=$laTupla["codmat"];//maneja materia
			$la_Matriz[$liI][11]=$laTupla["tope"];
			$la_Matriz[$liI][12]=$laTupla["pm_codigo"];
			$la_Matriz[$liI][13]=$laTupla["nommat"];
			$la_Matriz[$liI][14]=$laTupla["nombredoc"];
			$la_Matriz[$liI][15]=$laTupla["peraca"];
			$la_Matriz[$liI][16]=$laTupla["apellidodoc"];
			$la_Matriz[$liI][17]=$laTupla["periodo"];
			$liI++;
		}
		$this->f_Cierra($lrTb);
		$this->f_Des();
		$ls_Sql="SELECT c.nombre AS carrera,c.codesp,p.peraca,p.nombre AS periodo 
					FROM carrera AS c, peraca AS p 
					WHERE(peraca='$peraca') AND (c.nombre LIKE '%$variable%')";
		$this->f_Con();
		$lrTb=$this->f_Filtro($ls_Sql);
		if($laTupla=$this->f_Arreglo($lrTb))
        {
			$la_MatrizCons[0]=$laTupla["carrera"];
			$la_MatrizCons[1]=$laTupla["periodo"];
			$la_MatrizCons[2]=$laTupla["codesp"];
			$la_MatrizCons[3]=$laTupla["peraca"];
		}
		$this->f_Cierra($lrTb);
		$this->f_Des();
		$this->aa_MatrizCons=$la_MatrizCons;
		$this->aa_Cargadas=$la_Matriz;
		unset($la_Matriz);
		$la_Matriz= Array();
		$liI=0;
		$ls_Sql="SELECT * FROM semestre WHERE (borrado='I') AND (idsemestre<>'0')";
		$this->f_Con();
		$lrTb=$this->f_Filtro($ls_Sql);
		while($laTupla=$this->f_Arreglo($lrTb))
        {
			$la_Matriz[$liI][0]=$laTupla["idsemestre"];
			$la_Matriz[$liI][1]=$laTupla["nombre"];
			$liI++;
		}
		$this->f_Cierra($lrTb);
		$this->f_Des();
		$this->aa_Semestres=$la_Matriz;
	}
	public function f_Maquetar($variable){
		$this->f_Carga($variable);	
		$seccionAcrear=-1;
		$controlCreada=0;
		$la_Matriz=Array();
		$la_Matriz=$this->aa_Cargadas;
		$la_MatrizCons=Array();
		$la_MatrizCons=$this->aa_MatrizCons;
		echo "<div tituloTrans> <label class='titulo'>CARGAR NOTAS </label> </div>";
		for($x=0;$x<count($this->aa_Semestres);$x++){			
			$controlSecciones=-1;
			//Nocturna
			$contadorSeccionesN=0;
			$seccionAcrearN=-1;
			$controlSeccionBorradaN=true;
			//Diurna
			$contadorSeccionesD=0;
			$seccionAcrearD=-1;
			$controlSeccionBorradaD=true;
			//cuento la catidad de secciones de este semestre
			for($y=0;$y<count($la_Matriz);$y++){
				//busco que solo verifique las secciones que esten detro del semestre del ciclo x
				if($this->aa_Semestres[$x][0]==$la_Matriz[$y][4]){
					//verifico si la seccion planificada es la misma o es una diferente
					if($controlSecciones!=$la_Matriz[$y][8]){
						//verifico el turno al que pertence
						if($la_Matriz[$y][2]=="1"){							
							//cuento la seccion planificada 
							$contadorSeccionesN++;
							//verifico si el espacio es una seccion borrada
							if(($la_Matriz[$y][6]!=$contadorSeccionesN)&&($controlSeccionBorradaN)){
								//designo que la seccion a crear sea la borrada
								$seccionAcrearN=$contadorSeccionesN;
								//se encaraga de que no vuelva a entrar y se cree la correcta
								$controlSeccionBorradaN=false;
							}
						}else if($la_Matriz[$y][2]=="2"){							
							//cuento la seccion planificada 
							$contadorSeccionesD++;
							//verifico si el espacio es una seccion borrada
							if(($la_Matriz[$y][6]!=$contadorSeccionesD)&&($controlSeccionBorradaD)){
								//designo que la seccion a crear sea la borrada
								$seccionAcrearD=$contadorSeccionesD;
								//se encaraga de que no vuelva a entrar y se cree la correcta
								$controlSeccionBorradaD=false;
							}
						}
						//designo que el control de secciones sea igual a esta seccion planificada
						$controlSecciones=$la_Matriz[$y][8];
					}
				}
			}
			//si la seccion a crear es -1 significa que no hay ninguna que fue borrada
			if($seccionAcrearN==-1){
				$seccionAcrearN=$contadorSeccionesN+1;
			}
			if($seccionAcrearD==-1){
				$seccionAcrearD=$contadorSeccionesD+1;
			}
			echo"<div nosequiees onclick='reducir(this)' style='box-shadow:0px 0px 2px black;' ".$x."> 
					<div style='background:#ecf0f1; box-shadow:none; '>
						<label class='sec'> Semestre: <c>".$this->aa_Semestres[$x][1]."</c></label>
						<label class='cantsec'> Cantidad de secciones diurnas: <c>".$contadorSeccionesD."</c></label>
						<label class='cantsec'> Cantidad de secciones nocturnas: <c>".$contadorSeccionesN."</c></label>
						<input type='button' id='ocul' style='margin-top:5px;'>
					</div>
				</div>";
				$HTMLDiurnas="<div class='contentField reducir' diurnas><div legenda>Secciones Diurnas</div>";
				$HTMLNocturnas="<div class='contentField reducir' nocturnas><div legenda>Secciones Nocturnas</div>";
					//arraca de nuevo el ciclo para la creacion de secciones
					$controlSecciones=-1;
					$contadorSeccionesN=0;
					$contadorSeccionesD=0;
					//recorro todas las secciones
					for($y=0;$y<count($la_Matriz);$y++){
						//verifico las secciones sean del semestre del ciclo x
						if($la_Matriz[$y][4]==$this->aa_Semestres[$x][0]){
							//verifico si la seccion planificada es la misma o es una diferente de la anterior
							if($controlSecciones!=$la_Matriz[$y][8]){
								//verifico el turno de la seccion
								if($la_Matriz[$y][2]=="1")//nocturna
								{
									if($contadorSeccionesN!=0){
										$HTMLNocturnas.="</article><article><div class='K'>pulse una materia para ver sus detalles</div></article></div>";
									}
									$HTMLNocturnas.="<div class='legend' onclick='controlField(this)'>".$la_Matriz[$y][7]."</div>";
										$HTMLNocturnas.="<div class='fieldset'>";
											$HTMLNocturnas.="<article nocturnasa> <h4>Materias</h4>";
									$contadorSeccionesN++;
								}
								else if($la_Matriz[$y][2]=="2")//diurna
								{
									if($contadorSeccionesD!=0){
										$HTMLDiurnas.="</article><article><div class='K'>pulse una materia para ver sus detalles</div></article></div>";
									}
									$HTMLDiurnas.="<div class='legend' onclick='controlField(this)'>".$la_Matriz[$y][7]."</div>";
										$HTMLDiurnas.="<div class='fieldset'>";
											$HTMLDiurnas.="<article diurnasa><h4>Materias</h4>";
									$contadorSeccionesD++;
								}
								$controlCreada=1;
								$controlSecciones=$la_Matriz[$y][8];
							}
							if($la_Matriz[$y][2]=="1")//nocturna
							{
								$HTMLNocturnas.="<span class='ancho' title='Haga Click Para Ver Detalles' tope='".$la_Matriz[$y][11]."' nombredoc='".$la_Matriz[$y][14]."' apellidodoc='".$la_Matriz[$y][16]."' onclick='detalleMateria(this,".'"'.$la_Matriz[$y][12].'"'.")'>".$la_Matriz[$y][13]."</span><br>";
							}
							else if($la_Matriz[$y][2]=="2")//diurnas
							{
								$HTMLDiurnas.="<span class='ancho' title='Haga Click Para Ver Detalles' tope='".$la_Matriz[$y][11]."' nombredoc='".$la_Matriz[$y][14]."' apellidodoc='".$la_Matriz[$y][16]."' onclick='detalleMateria(this,".'"'.$la_Matriz[$y][12].'"'.")'>".$la_Matriz[$y][13]."</span><br>";
							}
						}
					}
					if($contadorSeccionesD!=0){
						$HTMLDiurnas.="</article><article><div class='K'>pulse una materia para ver sus detalles</div></article></div>";
					}
					if($contadorSeccionesN!=0){
						$HTMLNocturnas.="</article><article><div class='K'>pulse una materia para ver sus detalles</div></article></div>";
					}
					$controlCreada=0;
				
				$HTMLDiurnas.="</div>";
				$HTMLNocturnas.="</div>";				
				print($HTMLDiurnas);
				print($HTMLNocturnas);
		}
	}
}
?>