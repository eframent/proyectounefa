<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
include_once("../clases/cls_Combo.php");
$lobj_Combo = new cls_Combo(); 
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Codigo","Nombre","Fecha","Nombre_Carrera","Carrera","Estatus");
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
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Registro de Pensum</h2>
		<form name="form1" action="../controladores/cor_Pensum.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label>Código: </label></td>
					<td><input type="text" name="Codigo" validar="solo numeros" value="<?php print($la_Campos['Codigo']);?>" onblur="f_PerderFocus();"/></td>
				</tr>
				<tr>
					<td align="right"><label>Nombre: </label></td>
					<td><input type="text" validar=" " name="Nombre" value="<?php print($la_Campos['Nombre']);?>" /></td>
				</tr>
				<tr>
					<td align="right"><label>Fecha de Inicio:</label></td>
					<td><input type="text" validar=" " name="Fecha" value="<?php print($la_Campos['Fecha']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label>Carrera: </label></td>
					<td>
						<select name="Carrera" validar=" ">
							<option value="-">Seleccione</option>
							<?php $lobj_Combo->fGenerar("SELECT * FROM carrera WHERE(borrado='I')","codesp","nombre",$la_Campos['Carrera'],""); ?>
						</select >
					</td>
				</tr>
				<tr>
					<td align="right"><label>Estatus:</label></td>
					<td>
						<input type="radio" validar=" " name="Estatus" id="Estatus1" value="A" <?php if($la_Campos['Estatus']=="A"){print("checked");} ?>><label>Activo</label>
						<input type="radio" validar=" " name="Estatus" id="Estatus2" value="I" <?php if($la_Campos['Estatus']=="I"){print("checked");} ?>><label>Inactivo</label>
					</td>
				</tr>
			</table>		
		</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Pensum");?>
</body>
<script src="JS/Librerias.js"></script>
</html>
