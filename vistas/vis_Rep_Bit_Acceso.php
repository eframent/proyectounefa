<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
//$lsSql="select u.*,(p.nombre1 || ' ' || p.apellido1) as usuario from usuario as u inner join persona as p on(u.cedula=p.cedula) order by usuario"; 
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
$la_Campos=$_SESSION['matris'];
//print"<pre>";
//print_r($la_Campos);

?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Reporte Bitacora</title>
	<style type="text/css">

		table#resultados, table#formulario{
			width: 100%;
			margin: 0px auto;
			border: 1px solid silver;
			border-collapse: collapse;
		}

		table#resultados{
			opacity: 0;
			transition:all 0.5s;
		}

		table#resultados tr td{
			border: 1px solid silver;
		}

		select{
			width: auto !important;
			min-width: 100px !important;
		}

		input[name="Buscar"],input[name="Imprimir"],input[name="Imprimir2"],input[name="Imprimir3"]{
			width: auto !important;
			padding: 7px 10px !important;
		}

		#legendObligatorio {
			display: none !important;
		}

		div[op]{
			width: 400px;
		}

	</style>
	<link href="css/print_Bitacora.css" rel="stylesheet" type="text/css" media="print">

</head>
<body >
	<img src="imagenes/logo_unefa.gif" id="logo">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Reporte Bitacora</h2>
		<form name="form1" action="../controladores/cor_Rep_Bit_Acceso.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table id="formulario">
				<tr>
					<td align="right"><label>Usuario:</label></td>
					<td align="left">
						<input type="text" name="Usuario" value="<?php print($la_Campos['Usuario']); ?>">
					</td>
					<td align="right"><label>Operacion:</label></td>
					<td align="left">
						<select  name="Op">
							<option value="" selected="selected">Seleccione</option>
							<option value="Acceso"	<?php if($la_Campos['Op']=='Acceso'){print("selected");} ?> >Acceso</option>
							<option value="Session Cerrada"  <?php if($la_Campos['Op']=='Session Cerrada'){print("selected");} ?> >Session Cerrada</option>
						</select>
					</td>
				<tr>
					<td align="right"><label>Desde:</label></td>
					<td align="left">
						<input type="text" placeholder="ej: 15-06-1988" name="Fecha_ini" value="<?php print($la_Campos['Fecha_ini']); ?>" >
					</td>
					<td align="right"><label>Hasta:</label></td>
					<td align="left">
						<input type="text" name="Fecha_fin" placeholder="ej: 29-12-1988" value="<?php print($la_Campos['Fecha_fin']); ?>" >
					</td>
					<td></td>
					<td align="left">
						<input type="button" name="Buscar" value="Buscar" onclick="buscar();">
						<input type="button" name="Imprimir" value="PDF" onclick="location.href='pdf/PDF_Rep_Bit_Acceso.php';">
						<input type="button" name="Imprimir2" value="Word" onclick="location.href='pdf/doc_xls_Bit_Acceso.php?x=.doc';">
						<input type="button" name="Imprimir3" value="Excel" onclick="location.href='pdf/doc_xls_Bit_Acceso.php?x=.xls';">
					</td>
				</tr>

			</table>
			<!-- Tabla Resultados-->
			<table id="resultados">
				<tr>
					<td>Nº</td>
					<td>Usuario</td>
					<td>IP de Acceso</td>
					<td>Operacion</td>
					<td>Fecha</td>
					<td>Hora</td>
				</tr>
				<?php 
					for ($i=1; $i <= count($la_Campos['elementos']); $i++) { 
						echo "
							<tr>
								<td>".$i."</td>
								<td>".$la_Campos['elementos'][$i][0]."</td>
								<td>".$la_Campos['elementos'][$i][3]."</td>
								<td><div op>".$la_Campos['elementos'][$i][1]."</div></td>
								<td>".$la_Campos['elementos'][$i][2]."</td>
								<td>".$la_Campos['elementos'][$i][4]."</td>
							</tr>
						";
					}
				?>
			</table>

		</div>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script type="text/javascript">
	f_inicio();

	function f_inicio(){
		if (document.form1.Hay.value==2) {
			alert("No se Encontraron Resultados en su Busqueda");
		}else if (document.form1.Hay.value==1) {
			document.getElementById('resultados').style.opacity="1";
		}

		if ((document.form1.Hay.value==2) || (document.form1.Hay.value==0)) {
			document.form1.Imprimir.disabled=true;
			document.form1.Imprimir2.disabled=true;
			document.form1.Imprimir3.disabled=true;
		}
	}

	function buscar(){
		document.form1.Operacion.value="buscar";
		document.form1.Usuario.value=document.form1.Usuario.value.toUpperCase();	
		document.form1.submit();
	}


</script>
</html>
