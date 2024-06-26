<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Bandeja de Solicitudes</title>
        <link rel="stylesheet" href="css/bandeja.css" />
        <script type="text/javascript" src='JS/motorAjax.js'></script>
        <script type="text/javascript" src='JS/Mensajes.js'></script>
        <script type="text/javascript" src='JS/bandeja.js'></script>
</head>
<body onload="arranque()" >
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor id='contenedor'>
		<fieldset >
			<legend >Leyenda</legend>
			
				<div organizador>
					<div cont-p id='pendientes'>
						<div title-p>Cantidad Solicitudes Pendientes</div>
						10
					</div>
					<div pendiente ><p>P</p></div>
					<div estatus-p>ENDIENTE </div>
				</div>

				<div organizador>
					<div cont-e id="enproceso">
						<div title-e>Cantidad Solicitudes Pendientes</div>
						10
					</div>
					<div en-proceso ><p>E</p></div>
					<div estatus-e> N PROCESO </div>
				</div>

				<div organizador>
					<div cont-a id="aprobadas">
						<div title-a>Cantidad Solicitudes Pendientes</div>
						10
					</div>
					<div  aprovado ><p>A</p></div>
					<div  estatus-a>PROBADO </div>			
				</div>

				<div organizador>
					<div cont-r id="rechazados">
						<div title-r>Cantidad Solicitudes Pendientes</div>
						10
					</div>
					<div  rechazado ><p>R</p></div>
					<div  estatus-r>ECHAZADO </div>
				</div>

			</fieldset>
			<div ordenar></div>
			<h2>BANDEJA DE SOLICITUDES</h2>
			
		<div formulario>
		
		<form name="form1" action="../controladores/cor_Listado_soli.php" method="POST">
			<br>
			<input type="hidden" name="guarda">
			<table style="margin-top:-20px !important;"> 
					<tr class="cab">
						<td style='width:26px;'><label>#</label></td>
						<td style='width:100px;'><label>NOMBRE DEL SOLICITANTE</label></td>
						<td style='width:100px;'><label>TIPO DE SOLICITUD</label></td>
						<td style='width:100px;'><label>ESTATUS</label></td>
						<td style='width:100px;'><label>FECHA</label></td>
						<td style='width:100px;'><label>ATENDER</label></td>
						<td style='width:100px;'><label>PREVISUALIZAR</label></td>
					</tr>
			</table>
			<div id="inspector">
				<div>
					<img gif src="imagenes/29.gif">
				</div>
			 </div>
		</div>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>

</html>
