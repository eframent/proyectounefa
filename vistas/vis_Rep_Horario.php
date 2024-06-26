<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Codigo","Nombre","Direccion","Estatus","Tipo_Ambiente","Tipo");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Estatus1","Estatus1","Estatus2");
		laValor=new Array("checked","bloqueado","bloqueado");
	</script>
	<link rel="stylesheet" type="text/css" href="css/Rep_Horario.css">
	<link rel="stylesheet" type="text/css" href="css/horarios.css">
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Visualización de horarios</h2>
			<fieldset cont-busqueda >
			<legend>Buscar por:</legend>
				<div class="abrir" onclick='construirElementoBusqueda("seccion")'>
					<i class="icon32 icon-white icon-contacts"></i>
					<div tooltip>Sección</div>
				</div>
				<div class="abrir usuario" onclick='construirElementoBusqueda("docente")'>
					<i class="icon32 icon-white icon-user"></i>
					<div tooltip>Docente</div>
				</div>
				<div class="abrir" onclick='construirElementoBusqueda("aula")'>
					<i class="icon32 icon-white icon-aula"></i>
					<div tooltip>Aula</div>
				</div>
				<div class="ordenar"></div>
			</fieldset>
			<form name='busqueda'>

			</form>
			<L id='ultimo'></L>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Ambiente");?>
</body>
<script src="JS/Librerias.js"></script>
<script type="text/javascript" src='JS/horarios.js'></script>
<script type="text/javascript" src='JS/RepHorario.js'></script>
<script type="text/javascript">
	function aula(){
		document.getElementById('aula').style.height="";
	}
</script>
</html>
