<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Carga_Menu extends  cls_Bitacora{
	private $aa_Matriz=Array();
	private $aa_Cargadas=Array();
	private $aa_Todas=Array();
	private $ai_Campos=0;

	public function f_Carga($Nombre){
		$la_Matriz= Array();
		$liI=0;
		$ls_Sql="SELECT s.sub_codigo,s.sub_nombre,s.sub_tipo,m.mod_codigo,m.mod_color,m.mod_nombre FROM permiso AS p 
				INNER JOIN submodulo AS s ON(s.sub_codigo=p.fk_sub_codigo)
				INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
				WHERE (p.fk_car_codigo=(
					SELECT car_codigo FROM cargo 
					WHERE(car_nombre='$Nombre')
					)
				) 
				AND (m.mod_estatus<>'I') 
				AND (s.sub_estatus<>'I')
				UNION
				SELECT tp.idtipo_pro AS sub_codigo,tp.nombre AS sub_nombre,2+2,m.mod_codigo,m.mod_color,m.mod_nombre FROM permiso_proceso AS p 
				INNER JOIN tipo_proceso AS tp ON(tp.idtipo_pro=p.fk_tippro_codigo)
				INNER JOIN modulo AS m ON(m.mod_codigo=tp.modulo)
				WHERE (p.fk_car_codigo=(
					SELECT car_codigo FROM cargo 
					WHERE(car_nombre='$Nombre')
					)
				) 
				AND (m.mod_estatus<>'I') 
				ORDER BY mod_codigo";
		$this->f_Con();
		$lrTb=$this->f_Filtro($ls_Sql);
		while($laTupla=$this->f_Arreglo($lrTb))
        {
			$la_Matriz[$liI][0]=$laTupla["sub_codigo"];
			$la_Matriz[$liI][1]=$laTupla["sub_nombre"];
			$la_Matriz[$liI][2]=$laTupla["sub_ruta"];
			$la_Matriz[$liI][3]=$laTupla["mod_codigo"];
			$la_Matriz[$liI][4]=$laTupla["mod_nombre"];
			$la_Matriz[$liI][5]=$laTupla["mod_color"];
			$la_Matriz[$liI][6]=$laTupla["sub_tipo"];
			$liI++;
		}
		$this->f_Cierra($lrTb);
		$this->f_Des();
		$this->aa_Cargadas=$la_Matriz;
		unset($la_Matriz);
		$la_Matriz=Array();
		$liI=0;
		$ls_Sql="SELECT s.sub_codigo,s.sub_nombre,s.sub_tipo,m.mod_codigo,m.mod_color,m.mod_nombre FROM submodulo AS s
				INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
				WHERE (
						s.sub_codigo NOT IN(
							SELECT s.sub_codigo FROM permiso AS p 
							INNER JOIN submodulo AS s ON(s.sub_codigo=p.fk_sub_codigo)
							INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
							WHERE (p.fk_car_codigo=(
								SELECT car_codigo FROM cargo 
								WHERE(car_nombre='$Nombre')
							)
						) 
						AND (m.mod_estatus<>'I') 
						AND (s.sub_estatus<>'I')
					)
				)
				AND (m.mod_estatus<>'I') 
				AND (s.sub_estatus<>'I')
				UNION
				SELECT tp.idtipo_pro AS sub_codigo,tp.nombre AS sub_nombre,2+2,m.mod_codigo,m.mod_color,m.mod_nombre FROM tipo_proceso AS tp
				INNER JOIN modulo AS m ON(m.mod_codigo=tp.modulo)
				WHERE (
					tp.idtipo_pro NOT IN(
						SELECT tp.idtipo_pro FROM permiso_proceso AS p 
						INNER JOIN tipo_proceso AS tp ON(tp.idtipo_pro=p.fk_tippro_codigo)
						INNER JOIN modulo AS m ON(m.mod_codigo=tp.modulo)
						WHERE (p.fk_car_codigo=(
							SELECT car_codigo FROM cargo 
							WHERE(car_nombre='$Nombre')
						)
						) 
						AND (m.mod_estatus<>'I')
					)
				)
				AND (m.mod_estatus<>'I') 
				ORDER BY mod_codigo";
		$this->f_Con();
		$lrTb=$this->f_Filtro($ls_Sql);
		while($laTupla=$this->f_Arreglo($lrTb))
        {
			$la_Matriz[$liI][0]=$laTupla["sub_codigo"];
			$la_Matriz[$liI][1]=$laTupla["sub_nombre"];
			$la_Matriz[$liI][2]=$laTupla["sub_ruta"];
			$la_Matriz[$liI][3]=$laTupla["mod_codigo"];
			$la_Matriz[$liI][4]=$laTupla["mod_nombre"];
			$la_Matriz[$liI][5]=$laTupla["mod_color"];
			$la_Matriz[$liI][6]=$laTupla["sub_tipo"];
			$liI++;
		}
		$this->f_Cierra($lrTb);
		$this->f_Des();
		$this->aa_Matriz=$la_Matriz;
		unset($la_Matriz);
		$la_Matriz=Array();
		$liI=0;
		$ls_Sql="SELECT s.*,m.* FROM submodulo AS s
				INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
				WHERE (m.mod_estatus<>'I') 
				AND (s.sub_estatus<>'I')
				ORDER BY m.mod_codigo";
		$this->f_Con();
		$lrTb=$this->f_Filtro($ls_Sql);
		while($laTupla=$this->f_Arreglo($lrTb))
        {
			$la_Matriz[$liI][0]=$laTupla["sub_codigo"];
			$la_Matriz[$liI][1]=$laTupla["sub_nombre"];
			$la_Matriz[$liI][2]=$laTupla["sub_ruta"];
			$la_Matriz[$liI][3]=$laTupla["mod_codigo"];
			$la_Matriz[$liI][4]=$laTupla["mod_nombre"];
			$la_Matriz[$liI][5]=$laTupla["mod_color"];
			$liI++;
		}
		$this->f_Cierra($lrTb);
		$this->f_Des();
		$this->aa_Todas=$la_Matriz;
	}
	public function f_Redimencionar($titulo){
		echo"
			<div om title='Pulse El Boton Si Desea Ocultar' >
				$titulo
				<input ocul type='button' value='>' onclick='f_Esconder(this.parentNode);' >
			</div>
		";
	}
	public function f_Campos(){
		$control="";
		$liC=-1;
		for($liI=0;$liI<count($this->aa_Matriz);$liI++){
			if($this->aa_Matriz[$liI][3]!=$control){
				$control=$this->aa_Matriz[$liI][3];
				$liC++;
			}
			echo"<fieldset campo codigo=".$this->aa_Matriz[$liI][0]." tipo='".$this->aa_Matriz[$liI][6]."'name='campo".$this->ai_Campos."' id='campo".$this->ai_Campos."' padre='mod$liC' style ='width: 97%; background:".$this->aa_Matriz[$liI][5]."' fondo='".$this->aa_Matriz[$liI][5]."'>";
				echo"<input asig type='button'  style ='background:".$this->aa_Matriz[$liI][5]."' onclick='f_Mover(this);' value='".$this->aa_Matriz[$liI][1]."' id='cam".$this->ai_Campos."'>";
				echo"<input style='float:right; margin:15px 50px 0px 0px;'  type='checkbox' name='check' id='check".$this->ai_Campos."'>";
				if($this->aa_Matriz[$liI][6]=='1'){
						echo "<div tipPermiso>A</div>";
					}else if($this->aa_Matriz[$liI][6]=='2'){
						echo "<div tipPermiso>T</div>";
					}else if($this->aa_Matriz[$liI][6]=='3'){
						echo "<div tipPermiso>R</div>";
					}else if($this->aa_Matriz[$liI][6]=='4'){
						echo "<div tipPermiso>P</div>";
					}
			echo"</fieldset>";
			$this->ai_Campos++;
		}
		echo"<input type='hidden' value='$liC' id='control' >";
	}

	public function f_CamposCargados(){
		$control="";
		$liC=-1;
		for($liI=0;$liI<count($this->aa_Cargadas);$liI++){
			if($this->aa_Cargadas[$liI][3]!=$control){
				$control=$this->aa_Cargadas[$liI][3];
				$liC++;
			}
			echo"<fieldset campo codigo=".$this->aa_Cargadas[$liI][0]." tipo='".$this->aa_Cargadas[$liI][6]."' name='campo".$this->ai_Campos."' id='campo".$this->ai_Campos."' padre='mod$liC' style ='width: 97%; background:".$this->aa_Cargadas[$liI][5]."' fondo='".$this->aa_Cargadas[$liI][5]."'>";
					echo"<input asig type='button'  style ='background:".$this->aa_Cargadas[$liI][5]."' onclick='f_Mover(this);' value='".$this->aa_Cargadas[$liI][1]."' id='cam".$this->ai_Campos."'>";
					echo"<input style='float:right; margin:15px 50px 0px 0px;'  type='checkbox' name='check' id='check".$this->ai_Campos."'>";
					if($this->aa_Cargadas[$liI][6]=='1'){
						echo "<div tipPermiso>A</div>";
					}else if($this->aa_Cargadas[$liI][6]=='2'){
						echo "<div tipPermiso>T</div>";
					}else if($this->aa_Cargadas[$liI][6]=='3'){
						echo "<div tipPermiso>R</div>";
					}else if($this->aa_Cargadas[$liI][6]=='4'){
						echo "<div tipPermiso>P</div>";
					}
			echo"</fieldset>";
			$this->ai_Campos++;
		}
	}
	public function f_Legenda(){
		$control="";
		$campo=count($this->aa_Todas);
		$liC=-1;
		for($liI=0;$liI<count($this->aa_Todas);$liI++){
			if($this->aa_Todas[$liI][3]!=$control){
				$control=$this->aa_Todas[$liI][3];
				$liC++;
				echo "<center>";
				echo "<fieldset campo align='center' name='".$this->aa_Todas[$liI][4]."'  padre='mod$liC' id='campo$campo' style='width:200px ;float:left;background:".$this->aa_Todas[$liI][5]."' fondo='".$this->aa_Todas[$liI][5]."'>";
				echo "<input asig type='button' value='".$this->aa_Todas[$liI][4]."' style ='background:".$this->aa_Todas[$liI][5]."'  onclick='f_MostrarElementos(this);'>";
				echo "<div contLeyenda>Precione para ocultar o mostrar elementos de ".$this->aa_Todas[$liI][4]."</div></fieldset>";
				echo "</center>";
				$campo++;
			}
		}
	}
}
?>