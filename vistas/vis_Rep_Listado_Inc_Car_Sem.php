<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
$lsSql="select * from carrera where (borrado='I') order by codesp"; 
$lsSql2="select * from semestre where (borrado='I') order by idsemestre"; 
$lsSql3="select * from seccion where (borrado='I') order by idseccion"; 
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
$la_Campos=$_SESSION['matris'];
/*print"<pre>";
print_r($la_Campos);
print"</pre>";
*/
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Reporte Estudiantes Inscritos por Carrera y Semestre</title>
	<style type="text/css">

		table#resultados, table#formulario{
			width: 80%;
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

	</style>
</head>
<body >
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Buscar Estudiantes Inscritos por Carrera y Semestre</h2>
		<form name="form1" action="../controladores/cor_Rep_Listado_Inc_Car_Sem.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table id="formulario">
				<tr>
					<td align="right"><label>Carrera:</label></td>
					<td align="left">
						<select  name="Carrera">
							<option value="-" selected="selected">Seleccione</option>
							<?php $lobjCombo->fGenerar($lsSql,"codesp","nombre",$la_Campos['Carrera'],"")?>
						</select>
					</td>
					<td align="right"><label>Semestre:</label></td>
					<td align="left">
						<select  name="Semestre">
							<option value="-" selected="selected">Seleccione</option>
							<?php $lobjCombo->fGenerar($lsSql2,"idsemestre","nombre",$la_Campos['Semestre'],"")?>
						</select>
					</td>
					<td align="right"><label>Secciòn:</label></td>
					<td align="left">
						<select  name="Seccion">
							<option value="-" selected="selected">Seleccione</option>
							<?php $lobjCombo->fGenerar($lsSql3,"idseccion","nombre",$la_Campos['Seccion'],"")?>
						</select>
					</td>
					
				</tr>
				<tr>
					<td align="right"><label>Desde:</label></td>
					<td align="left">
						<input type="text" placeholder="ej: 15-06-1988" name="Fec_Ini" value="<?php print($la_Campos['Fec_Ini']); ?>" >
					</td>
					<td align="right"><label>Hasta:</label></td>
					<td align="left">
						<input type="text" name="Fec_Fin" placeholder="ej: 29-12-1988" value="<?php print($la_Campos['Fec_Fin']); ?>" >
					</td>
					<td></td>
					<td align="left">
						<input type="button" name="Buscar" value="Buscar" onclick="buscar();">
						<input type="button" name="Imprimir" value="PDF" onclick="location.href='pdf/Rep_Listado_Inc_Car_Sem.php';">
						<input type="button" name="Imprimir2" value="Word" onclick="location.href='pdf/doc_xls_Listado_Inscritos.php?x=.doc';">
						<input type="button" name="Imprimir3" value="Excel" onclick="location.href='pdf/doc_xls_Listado_Inscritos.php?x=.xls';">
					</td>
				</tr>

			</table>
			<!-- Tabla Resultados-->
			<table id="resultados">
				<tr>
					<td>Nº</td>
					<td>Cédula</td>
					<td>Nombre</td>
					<td>Apellido</td>
					<td>Seccion</td>
				</tr>
				<?php 
					for ($i=1; $i <= count($la_Campos['Matriz']); $i++) { 
						echo "
							<tr>
								<td>".$i."</td>
								<td>".$la_Campos['Matriz'][$i][0]."</td>
								<td>".$la_Campos['Matriz'][$i][1]."</td>
								<td>".$la_Campos['Matriz'][$i][2]."</td>
								<td>".$la_Campos['Matriz'][$i][6]."-".$la_Campos['Matriz'][$i][5]."</td>
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
			alert("No se Encontraron Estudiantes\nInscritos en esta carrera y\nEste Semestre");
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
		document.form1.submit();
	}


</script>
</html>
