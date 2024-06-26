<?php 
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_RepHorarioDocente.php");
$lobj_Carga= new cls_RepHorarioDocente();
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Cuerpo->f_Redireccion();
$bloques=$lobj_Carga->fBloques();
$la_bloques=$lobj_Carga->fSecciones();
$lobj_Cuerpo->f_Redireccion('docente');
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Docente</title>
	<link rel="stylesheet" type="text/css" href="css/horarios.css">
	<link rel="stylesheet" type="text/css" href="css/horario_est.css" media="print">
</head>
<body onload="comenzar()" onScroll="bajar()">
<img src="imagenes/logo_unefa.gif" id="logo">
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor=" " >
		
		<div id="contenedorHorario">
			<div titulo  >
				Horario <?php echo "<label id='nom_horario'> ".$_SESSION['usuario']['Nombres']."</label>"?>
				<input id="ocul" type='button' title='Pulse El Boton Si Desea Ocultar' onclick='f_Esconder(this,"52px","470px","hidden");' >
				<input id="Imprimir" type='button' title='Pulse Para Imprimir Horario' onclick='print();' value="Imprimir">
			</div >
			<div id="interno">
				<div id="tituloLeyenda">LEYENDA</div>
				<div id="legenda"></div>
			</div>
		</div>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body >
<script type="text/javascript" src="JS/Librerias.js"></script>
<script type="text/javascript" src="JS/horarios.js"></script>
<script type="text/javascript">
	var dias=["Lunes","Martes","Míercoles","Jueves","Víernes","Sabado","Domingo"];
	var horas=[<?php 
				for($b=0;$b<count($bloques);$b++){
					echo"'".$bloques[$b][1]."'";
					if($b!=count($bloques)-1){
						echo",";
					}
				}
				?>];
	var att=["bloque","dia","name"];
	var cont=new Array();
	var arreglo=new Array();
	<?php 
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
	?>
	<?php 
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
		}else{
			echo "bloquesInscritos=new Array();";
		}
	?>
	var materiasAInscribir=new Array();

//------------------------------------------------------ funciones simples --------------------------------------------------
	
	function activar(){
		if(document.getElementById("Horario")){
			eliminar();
		}
		var horario=construirHorario(dias,horas,att,cont);
		var contenedor=document.getElementById("interno");
		contenedor.appendChild(horario);
	}
	function eliminar(){
		destruirHorario();
	}
	function llenar(){
		activar();
		llenarHorario(arreglo);
		construirLegenda('docente');
		
	}
	function comenzar(){
		activar();
		document.getElementById("contenedorHorario").style.height="470px";
		if(bloquesInscritos.length>0){
			arreglo=bloquesInscritos;
			llenar();
			activarRetorno(document.getElementById("Horario"));
			moverLeyenda();
		}
	}
	function moverLeyenda(){

	}
	function f_Guardar(){
		var campo;
		var form=document.createElement("form");
		form.action="../controladores/cor_Inscripcion.php";
		form.method="POST";
		if(materiasAInscribir.length>0){
			for(var x=0;x<materiasAInscribir.length;x++){
				campo=document.createElement("input");
				campo.type="text";
				campo.name="campo"+x;
				campo.value=materiasAInscribir[x];
				form.appendChild(campo);
			}
			campo=document.createElement("input");
			campo.type="text";
			campo.name="Registros";
			campo.value=materiasAInscribir.length;
			form.appendChild(campo);
			campo=document.createElement("input");
			campo.type="text";
			campo.name="Operacion";
			campo.value="incluir";
			form.appendChild(campo);
			document.body.appendChild(form);
			form.submit();
		}else{
			f_MostrarMensaje("No puede realizar un guardado sin materias","Alerta",document.getElementById("Horario"))
		}
	}
</script>
<script type="text/javascript" src="JS/legendaHorario.js"></script>
</html>