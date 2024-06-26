<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
session_start();
class  cls_Menu extends  cls_Bitacora{
	private $aa_MatrizAr=Array();
	private $aa_MatrizTra=Array();
	private $aa_MatrizRep=Array();
	private $aa_Modulos=Array();
	private $ai_Campos=0;
	public function f_Carga(){
		$la_Matriz= Array();
		$liI=0;
		//Cargo todos los maestros que tiene permitido  ver el usuario en session para armar el menu
		$Nombre=$_SESSION['usuario']['Cargo'];
		$ls_Sql="SELECT s.*,m.* FROM permiso AS p 
				INNER JOIN submodulo AS s ON(s.sub_codigo=p.fk_sub_codigo)
				INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
				WHERE (p.fk_car_codigo=(
					SELECT car_codigo FROM cargo 
					WHERE(car_nombre='$Nombre')
				)) 
				AND (m.mod_estatus<>'B') 
				AND (s.sub_estatus<>'B')
				AND (s.sub_tipo='1')
				ORDER by m.mod_nombre, s.sub_nombre";
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
		$this->aa_MatrizAr=$la_Matriz;
		unset($la_Matriz);
		//Una vez cargados los maestros se procede al armado de las transacciones en el menu
		$la_Matriz= Array();
		$liI=0;
		$Nombre=$_SESSION['usuario']['Cargo'];
		$ls_Sql="SELECT s.*,m.* FROM permiso AS p 
				INNER JOIN submodulo AS s ON(s.sub_codigo=p.fk_sub_codigo)
				INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
				WHERE (p.fk_car_codigo=(
					SELECT car_codigo FROM cargo 
					WHERE(car_nombre='$Nombre')
				)) 
				AND (m.mod_estatus<>'B') 
				AND (s.sub_estatus<>'B')
				AND (s.sub_tipo='2')
				ORDER by m.mod_nombre, s.sub_nombre";
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
		$this->aa_MatrizTra=$la_Matriz;
		//y por ultimo se cargan los reportes
		unset($la_Matriz);
		$la_Matriz= Array();
		$liI=0;
		$Nombre=$_SESSION['usuario']['Cargo'];
		$ls_Sql="SELECT s.*,m.* FROM permiso AS p 
				INNER JOIN submodulo AS s ON(s.sub_codigo=p.fk_sub_codigo)
				INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
				WHERE (p.fk_car_codigo=(
					SELECT car_codigo FROM cargo 
					WHERE(car_nombre='$Nombre')
				)) 
				AND (m.mod_estatus<>'B') 
				AND (s.sub_estatus<>'B')
				AND (s.sub_tipo='3')
				ORDER by m.mod_nombre, s.sub_nombre";
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
		$this->aa_MatrizRep=$la_Matriz;
		unset($la_Matriz);
		$la_Matriz= Array();
		$liI=0;
		$Nombre=$_SESSION['usuario']['Cargo'];
		$ls_Sql="SELECT m.mod_nombre,m.mod_codigo,m.mod_icon_clases FROM permiso AS p 
				INNER JOIN submodulo AS s ON(s.sub_codigo=p.fk_sub_codigo)
				INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
				WHERE (p.fk_car_codigo=(
					SELECT car_codigo FROM cargo 
					WHERE(car_nombre='$Nombre')
				)) 
				AND (m.mod_estatus<>'B') 
				AND (s.sub_estatus<>'B')
				GROUP BY m.mod_nombre,m.mod_codigo,m.mod_icon_clases
				ORDER by m.mod_nombre";
		$this->f_Con();
		$lrTb=$this->f_Filtro($ls_Sql);
		while($laTupla=$this->f_Arreglo($lrTb))
        {
			$la_Matriz[$liI][0]=$laTupla["mod_codigo"];
			$la_Matriz[$liI][1]=$laTupla["mod_nombre"];
			$la_Matriz[$liI][2]=$laTupla["mod_icon_clases"];
			$liI++;
		}
		$this->f_Cierra($lrTb);
		$this->f_Des();
		$this->aa_Modulos=$la_Matriz;
	}
	public function f_Redimencionar($titulo){
		echo"
			<div om msg='Presione si Desea Ocultar/Mostrar el Contenido' title='Pulse El Boton Si Desea Ocultar' >
				$titulo
				<input id='ocul' type='button' value='' onclick='f_Esconder(this.parentNode);' >
			</div>
		";
	}
	public function f_Menu(){
		$control="";
		$this->f_Carga();
		$controlAutoEvaluacion=0;
		$controlCargaNotas=0;
		echo"
			<div Menu id='menu'>
				<img src='imagenes/Logo.png' id='logoUnefa'>
				<ul id='css3menu1' >
					<li class='topmenu'><a title='Atras' onclick='window.history.back();'><i class='icon icon-white icon-carat-1-w'></i><label>Atras</label></a>
					<li class='topmenu'><a href='vis_Inicio.php' title='Inicio'><i class='icon icon-white icon-home'></i><label>Inicio</label></a>";
					for($x=0;$x<count($this->aa_Modulos);$x++){										
						$controlAr=0;
						$controlRep=0;
						echo"<li class='topmenu'><a href='#' title='".$this->aa_Modulos[$x][1]."'><i class='".strtolower($this->aa_Modulos[$x][2])."'></i><label>".strtolower($this->aa_Modulos[$x][1])."</label></a>
							<ul>";
								for($y=0;$y<count($this->aa_MatrizAr);$y++){
									if($this->aa_MatrizAr[$y][3]==$this->aa_Modulos[$x][0]){
										if($controlAr==0){
											echo "<li class='topmenu'><a href='#' title='Archivos'><i class='ICON ICON-WHITE ICON-GEAR'></i>Configuración<i class='icon icon-white icon-triangle-e'></i></a>
												<ul>";
											$controlAr=1;
										}
										echo"<li>
												<a href='".$this->aa_MatrizAr[$y][2]."'>
													".strtolower($this->aa_MatrizAr[$y][1])."
												</a>
											</li>";
									}
								}
							if($controlAr==1){
								echo"</ul>";
							}
							
								for($w=0;$w<count($this->aa_MatrizRep);$w++){
									if($this->aa_MatrizRep[$w][3]==$this->aa_Modulos[$x][0]){
										if($controlRep==0){
											echo "<li class='topmenu'><a href='#' title='Reportes'><i class='icon icon-white icon-page'></i>Reportes<i class='icon icon-white icon-triangle-e'></i></a>
												<ul>";
												$controlRep=1;
										}
										echo"<li>
												<a href='".$this->aa_MatrizRep[$w][2]."'>".strtolower($this->aa_MatrizRep[$w][1])."</a>
											</li>";
									}
								}
								if($controlRep==1){
									echo"</ul>";
								}

								for($z=0;$z<count($this->aa_MatrizTra);$z++){
									if($this->aa_MatrizTra[$z][3]==$this->aa_Modulos[$x][0]){
										echo"<li ><a href='".$this->aa_MatrizTra[$z][2]."' >".strtolower($this->aa_MatrizTra[$z][1])."</a></li>";		
									}
								}
						echo"</ul>";
					}
					if($_SESSION['usuario']['Tipo']==2){
					
							echo"<li class='topmenu'><a href='#' title='Docente'><i class='icon icon-white icon-folder-open'></i><label>docente</label></a>
															
								<ul>
									<li ><a href='visTransEva.php?lsidtipo=1&lsnombreva=Autoevaluacion&lsa=1' >autoevaluación</a></li>
									<li ><a href='vis_CargaNotas.php' >carga de notas</a></li>
								</ul>
								";

					}		
			if($_SESSION["usuario"]["Tipo"]=="3"){
				echo"<li class='topmenu'><a href='#'>Estudiante</a>";
					echo"<ul>";	
						echo"<li class='topmenu'><a href='#' title='Reportes'><i class='icon icon-white icon-page'></i>Reportes<i class='icon icon-white icon-triangle-e'></i></a>";
							echo"<ul>";
								echo "<li ><a href='vis_Rep_Notas.php' >Boletin de Notas</a></li>";
							echo"</ul>";
						echo"</li>";
						echo "<li ><a href='vis_Solicitudes.php' >Solicitudes</a>";
						echo"<li ><a href='vis_Inscripcion.php' >Inscripcion de Materias</a></li>";

					echo"</ul>
				</li>";
			}
		echo "
		<script>
			function salir(){
				location.href='vis_Salir.php';
			}
		</script>
		<li class='topmenu right'><input type='button' title='Cerrar Sesion' class='cerrar_se' onclick='salir();'></li>
		<li class='topmenu right'><a href='#' title='Hora'><i class='icon icon-white icon-clock'></i><div>".date('H:i')."</div></a></li>
		<li class='topmenu right'><a href='#' title='Fecha'><i class='icon icon-white icon-calendar'></i><div>".date('d/m/Y')."</div></a></li>
			<div perfil>
				<i class='icon icon-white icon-user'></i>
				<div cont-perfil>
					<h3>Perfil de Usuario</h3>
						<li><i class='icon icon-blue icon-user'></i> ".$_SESSION['usuario']['Nombres']."</li>
						<li><i class='icon icon-blue icon-profile'></i> ".$_SESSION['usuario']['Cargo']."</li>
						<li class='division'></li>
						<li ><a href='../controladores/cor_RecuperarClave.php?Operacion=RecuperarClave&Nombre=".$_SESSION['usuario']['Nombre']."' ><i class='icon icon-blue icon-key'></i>Cambiar Clave</a></li>
				</div>
			</div>
		</ul>
				
			</div>
			<div id='legendObligatorio'>Los campos marcados con <span class='obligatorio'></span>  son obligatorios</div>
			";
	}
	public function f_InicioEstudiante(){
		include_once("../clases/cls_CargaInscripcion.php");
		$lobj_Carga= new cls_CargaInscripcion();				
		$bloques=$lobj_Carga->fBloques();
		$la_bloques=$lobj_Carga->fSecciones();
		echo" <div id='contenedorHorario' style='overflow:auto'>
				<div titulo  >
					Horario de Clases <label id='nom_horario'>".$_SESSION['usuario']['Nombres']."</label>
					<input id='ocul' type='button' title='Pulse El Boton Si Desea Ocultar' onclick='f_Esconder(this,\"52px\",\"470px\",\"auto\");' >
					<input id='imprimir' value='Imprimir' type='button' title='Pulse Para Imprimir Horario' onclick='print();' >
				</div>
			</div>";
		echo"<script type='text/javascript' src='JS/horarios.js'></script>";
		echo'<link rel="stylesheet" type="text/css" href="css/horarios.css">';
		echo"<script type='text/javascript' >
			var dias=['Lunes','Martes','Míercoles','Jueves','Víernes','Sabado','Domingo'];
			var horas=["; 
						for($b=0;$b<count($bloques);$b++){
							echo"'".$bloques[$b][1]."'";
							if($b!=count($bloques)-1){
								echo",";
							}
						}
						echo"];
			var att=['bloque','dia','name'];
			var cont=new Array();
			var arreglo=new Array();";
			for($d=0;$d<7;$d++){
				echo"cont[".$d."]=[";
				for($b=0;$b<count($bloques);$b++){
					echo"['".$bloques[$b][0]."','".($d+1)."','Bloques']";
					if($b!=count($bloques)-1){
						echo",";
					}
				}
				echo"];\n";
			} 
				if(count($la_bloques)>0){
					echo"bloquesInscritos=[\n\t";
					for($m=0;$m<count($la_bloques);$m++){
						if($m==0){
							echo"[\n\t ";
						}
						$contSec++;
						for($b=0;$b<count($la_bloques[$m]);$b++){
							if($b==0){
								echo"[\n\t\t ";
							}
							$contMat++;
							for($a=0;$a<count($la_bloques[$m][$b]);$a++){
								echo '"'.$la_bloques[$m][$b][$a].'"';
								if($a!=count($la_bloques[$m][$b])-1){
									echo",";
								}
							}	
							if($b==count($la_bloques[$m])-1){
								echo" ]\n\t";
							}else{
								echo" ],\n\t\t[";
							}
						}
						if($m==count($la_bloques)-1){
							echo" ]\n\t";
						}else{
							echo" ],[\n\t\t";
						}
					}
					echo"];";
				}
		echo'

		comenzar();
	function activar(){
		if(document.getElementById("Horario")){
			eliminar();
		}
		var horario=construirHorario(dias,horas,att,cont);
		document.getElementById("contenedorHorario").appendChild(horario);
	}
	function eliminar(){
		destruirHorario();
	}
	function llenar(){
		activar();
		llenarHorario(arreglo);
	}
	function comenzar(){
		activar();
		document.getElementById("contenedorHorario").style.height="470px";
		if(bloquesInscritos.length>0){
			arreglo=bloquesInscritos;
			llenar();
		}
	}';

		echo"</script>";
	}
	public function f_Inicio(){
		$control="";
		
		for($liI=0;$liI<count($this->aa_MatrizAr);$liI++){
			if($control!=$this->aa_MatrizAr[$liI][3]){
				$control=$this->aa_MatrizAr[$liI][3];
				echo"<div  ordenar >";
				echo "<label>";
					$this->f_Redimencionar($this->aa_MatrizAr[$liI][4]);
				echo "</label>";
			}
			echo "
			<a href='".$this->aa_MatrizAr[$liI][2]."'><li>
				".$this->aa_MatrizAr[$liI][1]."
			</li></a>
			";
			if($control!=$this->aa_MatrizAr[$liI+1][3]){
				echo"</div>";
			}
		}
		if($_SESSION["usuario"]["Tipo"]=="3"){
			$this->f_InicioEstudiante();
		}
	}

	public function f_Menu2(){
		$control="";
		$this->f_Carga();
		echo"
			<div Menu id='menu'>
				<img src='imagenes/Logo.png' id='logoUnefa'>
				<ul id='css3menu1' >
					<li class='topmenu'><a title='Atras' onclick='window.history.back();'><i class='icon icon-white icon-carat-1-w'></i><label>Atras</label></a>
					<li class='topmenu'><a href='vis_Inicio.php' title='Inicio'><i class='icon icon-white icon-home'></i><label>Inicio</label></a>
					<li class='topmenu'><a href='#' title='Archivos'><i class='icon icon-white icon-folder-open'></i><label>Configuración</label></a>
						<ul >";
							for($liI=0;$liI<count($this->aa_MatrizAr);$liI++){
								if($control!=$this->aa_MatrizAr[$liI][3]){
									$control=$this->aa_MatrizAr[$liI][3];
									echo "<li class='topmenu'><a href='#'>".$this->aa_MatrizAr[$liI][4]."<i class='icon icon-white icon-triangle-e'></i></a>";
									echo"<ul>";
								}
								echo "<li>
									<a href='".$this->aa_MatrizAr[$liI][2]."'>
										".$this->aa_MatrizAr[$liI][1]."
									</a>
								</li>";
								if($control!=$this->aa_MatrizAr[$liI+1][3]){
									echo"</ul>";
								}
							}
			echo"</ul>
				<li class='topmenu'><a href='#' title='Transacciones'><i class='icon icon-white icon-gear'></i><label>Transacciones</label></a>";
				echo"<ul>";
					if($_SESSION["usuario"]["Tipo"]=="3"){
						echo"<li ><a href='vis_Inscripcion.php' >Inscripcion de Materias</a></li>";		
					}
					if($_SESSION["usuario"]["Tipo"]=="2"){
						echo"<li ><a href='visTransEva.php?lsidtipo=1&lsnombreva=Autoevaluacion&lsa=1' >AUTOEVALUACION</a></li>";		
						echo"<li ><a href='vis_CargaNotas.php' >CARGA DE NOTAS</a></li>";		
					}
					$control="";
					for($liI=0;$liI<count($this->aa_MatrizTra);$liI++){
						if($control!=$this->aa_MatrizTra[$liI][3]){
							$control=$this->aa_MatrizTra[$liI][3];
							echo "<li class='topmenu'><a href='#' >".$this->aa_MatrizTra[$liI][4]."<i class='icon icon-white icon-triangle-e'></i></a>";
							echo"<ul>";
						}
					echo "<li>
							<a href='".$this->aa_MatrizTra[$liI][2]."'>
								".$this->aa_MatrizTra[$liI][1]."
							</a>
						</li>";
						if($control!=$this->aa_MatrizTra[$liI+1][3]){
							echo"</ul>";
						}
					}	
		echo"</ul>
				<li class='topmenu'><a href='#' title='Reportes'><i class='icon icon-white icon-page'></i><label>Reportes</label></a>";
					echo"<ul>";	
					if($_SESSION["usuario"]["Tipo"]=="3"){
						echo "<li ><a href='pdf/PDF_ConstanciadeEst.php'>Constancia de Estudios</a></li>";
					}
						$control="";
						for($liI=0;$liI<count($this->aa_MatrizRep);$liI++){
							if($control!=$this->aa_MatrizRep[$liI][3]){
								$control=$this->aa_MatrizRep[$liI][3];
								echo "<li class='topmenu'><a href='#' >".$this->aa_MatrizRep[$liI][4]."<i class='icon icon-white icon-triangle-e'></i></a>";
								echo"<ul>";
							}
						echo "<li>
								<a href='".$this->aa_MatrizRep[$liI][2]."'>
									".$this->aa_MatrizRep[$liI][1]."
								</a>
							</li>";
							if($control!=$this->aa_MatrizRep[$liI+1][3]){
								echo"</ul>";
							}
						}
		echo"</ul>";
			if($_SESSION["usuario"]["Tipo"]=="3"){
				echo"<li class='topmenu'><a href='#'>Secciones</a>";
					echo"<ul>";	
						echo "<li ><a href='vis_Solicitudes.php' >Solicitudes</a>";
					echo"</ul>
				</li>";
			}
		echo "
		<script>
			function salir(){
				location.href='vis_Salir.php';
			}
		</script>
		<li class='topmenu right'><input type='button' title='Cerrar Sesion' class='cerrar_se' onclick='salir();'></li>
		<li class='topmenu right'><a href='#' title='Hora'><i class='icon icon-white icon-clock'></i><div>".date('H:i')."</div></a></li>
		<li class='topmenu right'><a href='#' title='Fecha'><i class='icon icon-white icon-calendar'></i><div>".date('d/m/Y')."</div></a></li>
			<div perfil>
				<i class='icon icon-white icon-user'></i>
				<div cont-perfil>
					<h3>Perfil de Usuario</h3>
						<li><i class='icon icon-blue icon-user'></i> ".$_SESSION['usuario']['Nombres']."</li>
						<li><i class='icon icon-blue icon-profile'></i> ".$_SESSION['usuario']['Cargo']."</li>
						<li class='division'></li>
						<li ><a href='../controladores/cor_RecuperarClave.php?Operacion=RecuperarClave&Nombre=".$_SESSION['usuario']['Nombre']."' ><i class='icon icon-blue icon-key'></i>Cambiar Clave</a></li>
				</div>
			</div>
		</ul>
				
			</div>
			<div id='legendObligatorio'>Los campos marcados con <span class='obligatorio'></span>  son obligatorios</div>
			";
	}
	
}
?>