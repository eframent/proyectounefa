<?php 
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_CargaInscripcion.php");
$lobj_Carga= new cls_CargaInscripcion();
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Cuerpo->f_Redireccion();
$bloques=$lobj_Carga->fBloques();
$la_bloques=$lobj_Carga->fSecciones();
$proceso=$lobj_Cuerpo->f_Proceso("INSCRIPCION");
$lobj_Cuerpo->f_Redireccion('estudiante');
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Inscripcion de Materias</title>
	<link rel="stylesheet" type="text/css" href="css/horarios.css">
	<link href="css/horario_est.css" rel="stylesheet" type="text/css" media="print">
	<style type="text/css">
		#legendObligatorio{
			display: none;
		}
	</style>
</head>
<body onload="comenzar()" onScroll="bajar()">
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor=" " >
		<div id="frameSet">
			<div titulo title='Pulse El Boton Si Desea Ocultar' onclick='f_Esconder(this.lastChild,"52px","470px","auto");'>
				Seleccion de Materias a Inscribir
				<input id="ocul" type='button'   >
			</div>
			<iframe id="frame" src=""></iframe>
		</div>
		<div id="contenedorHorario">
			<div titulo >
				Mi Horario
				<input id="ocul" type='button' title='Pulse El Boton Si Desea Ocultar' onclick='f_Esconder(this,"52px","470px","hidden");' >
				<input guardar type='button' title="Guardar Cambios" onclick="f_Guardar()">
				<input id="imprimir" type='button' title='Pulse para Imprimir Horario' onclick='print();' value="Imprimir">
			</div >
			<div id="interno">
				<div id="tituloLeyenda">LEYENDA</div>
				<div id="legenda"></div>
			</div>
		</div>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body >
<script type="text/javascript">
	proceso=<?php print($proceso); ?>;
</script>
<script type="text/javascript" src="JS/gestionDeProcesos.js"></script>
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
		contenedor.insertBefore(horario,document.getElementById("tituloLeyenda"));
	}
	function eliminar(){
		destruirHorario();
	}
	function llenar(){
		activar();
		llenarHorario(arreglo);
		construirLegenda();
		
	}
	function comenzar(){
		var contenedor=document.getElementById("frameSet");
		var frame=document.getElementById("frame");
		frame.src="vis_FrameInscrip.php?buscar";
		activar();
		document.getElementById("contenedorHorario").style.height="470px";
		if(bloquesInscritos.length>0){
			arreglo=bloquesInscritos;
			llenar();
			activarRetorno(document.getElementById("Horario"));
		}
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