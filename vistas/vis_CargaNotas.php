<?php
session_start();
include_once("../clases/cls_CuerpoCargaNotas.php");
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo = new cls_Cuerpo();
$lobj_Carga= new cls_CuerpoCargaNotas;
$Nombre=$_GET['Nombre'];
$proceso=$lobj_Cuerpo->f_Proceso("CARGA DE NOTAS");
$lobj_Cuerpo->f_Redireccion('docente');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<?php $lobj_Cuerpo->f_Librerias();?>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Carga De Notas</title>
		<meta name="keywords" content="php" />
		<link rel="stylesheet" type="text/css" href="css/asignar.css">
		<link rel="stylesheet" type="text/css" href="css/proyeccion.css">
		<link rel="stylesheet" type="text/css" href="css/crear.css">
		<style type="text/css">
			div#legendObligatorio{
				display: none !important;
			}

			i.icon-print{
				margin-top: 2px !important;
				margin-left: 20px;
				cursor: pointer;
			}
		</style>	
	</head>	
	<body onScroll="bajar()" >
		<?php $lobj_Cuerpo->f_Cabecera();?>
		<?php $lobj_Cuerpo->f_Menu();?>
		<div Contenedor=" " >
			<div syle="display:none">
				<form action="cambioAProyeccion.php" method="POST" name="form1" >
					<input type='hidden' name='cmbseccion' >
					<input type='hidden' name='cmbsemestre' >
					<input type='hidden' name='cmbcodesp'  >
					<input type='hidden' name='cmbregimen'  >
					<input type='hidden' name='cmbperaca' >
				</form>
			</div>
			<div style="background:white; width:100%;">
				<?php $lobj_Carga->f_Maquetar(substr($variable, 26)); ?>
			</div>
		</div>
		<?php $lobj_Cuerpo->f_Pie();?>
	</body>
	<script type="text/javascript">
		proceso=<?php print($proceso); ?>;
	</script>
	<script language="javascript" src="JS/scroll.js"></script>
	<script type="text/javascript" src="JS/motorValidaciones.js"></script>
	<script type="text/javascript" src="JS/cargaDeNotas.js"></script>
	<script type="text/javascript" src="JS/gestionDeProcesos.js"></script>
	<script type="text/javascript" src="JS/motorAjax.js"></script>
	<script type="text/javascript">

//--------------------------------------------tranciciones fieldset--------------------------------------
		function controlField(obj){
			var contLegend=0;
			var contHide=0;
			var Contenedor=obj.parentNode;
			var fields=obj.parentNode.childNodes;
			var cantidadFields=fields.length;
			if(Contenedor.classList.contains('crecerCompleto')){
				Contenedor.classList.remove('crecerCompleto');
			}
			Contenedor.classList.add('crecerContenedor');
			for(var f=0;f<cantidadFields;f++){
				if(fields[f].classList.contains('legend')){
					contLegend++;
					if(fields[f]==obj){
						if(fields[f].classList.contains('bajarLegend')){
							hideField(fields[f]);
							contHide++;
						}else{
							showField(fields[f]);
							contHide--;
						}
					}else{
						hideField(fields[f]);
						contHide++;
					}
				}
			}
			if(contHide==contLegend){
				Contenedor.classList.remove('crecerContenedor');
			}
		}
		function showField(obj){
			var Field=obj.nextSibling;
			var Legend=obj;
			Field.classList.add('bajarField');
			Legend.classList.add('bajarLegend');
		}
		function hideField(obj){
			var Field=obj.nextSibling;
			var Legend=obj;
			if(Field){
				if(Field.classList.contains('bajarCompleto')){
					Field.classList.remove('bajarCompleto');
					Field.childNodes[1].innerHTML="<div class='K'>pulse una materia para ver sus detalles</div>";
				}else{
					Field.classList.remove('bajarField');
				}
			}
			Legend.classList.remove('bajarLegend');
		}

//----------------------------------------fin tranciciones fieldset--------------------------------------
		function Crear(seccion,carrera,semestre,peraca,regimen){
			var form=document.form1;
			form.cmbseccion.value=seccion;
			form.cmbperaca.value=peraca;
			form.cmbsemestre.value=semestre;
			form.cmbregimen.value=regimen;
			form.cmbcodesp.value=carrera;
			setTimeout(function(){form.submit()},100);
		}
		function eliminarSeccion(idSeccion){
			if(confirm("desea Elimnar esta Seccion")){
				var form=document.createElement("form");
				form.innerHTML="<input type='hidden' name='cmbseccion' value='"+idSeccion+"'>\
								<input type='hidden' name='Operacion' value='eliminar'>";
				form.method="POST";
				form.action="../controladores/cor_Proyeccion.php";
				document.body.appendChild(form);
				form.submit();
			}
		}
		function modificarSec(idSeccion){
			if(confirm("desea modificar esta Seccion")){
				var form=document.createElement("form");
				form.innerHTML="<input type='hidden' name='cmbseccion' value='"+idSeccion+"'>\
								<input type='hidden' name='Operacion' value='cargarModificacion'>";
				form.method="POST";
				form.action="../controladores/cor_Proyeccion.php";
				document.body.appendChild(form);
				form.submit();
			}
		}
//----------------------------------reducir ------------------------------------------------------------
	function reducir(obj){
		var seccionesN=obj.nextSibling;
		var seccionesD=obj.nextSibling.nextSibling;
		var fields=seccionesN.childNodes;
		var cantidadFields=fields.length;
		if((seccionesN.classList.contains('reducir'))||(seccionesD.classList.contains('reducir'))){
			seccionesN.classList.remove('reducir');
			seccionesD.classList.remove('reducir');
		}else{
			if((seccionesN.classList.contains('crecerContenedor'))||(seccionesD.classList.contains('crecerContenedor'))){
				seccionesN.classList.remove('crecerContenedor');
				seccionesD.classList.remove('crecerContenedor');
			}else if((seccionesN.classList.contains('crecerCompleto'))||(seccionesD.classList.contains('crecerCompleto'))){
				seccionesN.classList.remove('crecerCompleto');
				seccionesD.classList.remove('crecerCompleto');
			}else{
				seccionesN.classList.add('reducir');
				seccionesD.classList.add('reducir');
			}
			for(var f=0;f<cantidadFields;f++){
				if(fields[f].classList.contains('legend')){
					hideField(fields[f]);
				}
			}
			fields=seccionesD.childNodes;
			cantidadFields=fields.length;
			for(var f=0;f<cantidadFields;f++){
				if(fields[f].classList.contains('legend')){
					hideField(fields[f]);
				}
			}
		}
	}
//----------------------------------detalle ----------------------------------------------------------

	</script>
	<script language="javascript" src="JS/Mensajes.js">	</script>
</html>
