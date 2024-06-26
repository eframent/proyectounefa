<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
$lsSql="select * from modulo order by mod_nombre"; 
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Nombre","Nombre_Modulo","Modulo","Estatus","Tipo_Modulo","Tipo","Ruta");
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
			<h2>Registros de Submodulo </h2>
		<form name="form1" action="../controladores/cor_Submodulo.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label>Nombre:</label></td>
					<td><input validar="solo letras" type="text" name="Nombre" value="<?php print($la_Campos['Nombre']);?>" onblur="f_PerderFocus();"/></td>
				</tr>
				<tr>
					<td align="right"><label>Ruta del Archivo:</label></td>
					<td><input mayus="none" validar=" " type="text" name="Ruta" value="<?php print($la_Campos['Ruta']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label>Modulo:</label></td>
					<td><select validar=" "name="Modulo"><option value="-" selected="selected">Seleccione</option><?php $lobjCombo->fGenerar($lsSql,"mod_codigo","mod_nombre",$la_Campos['Modulo'],"")?></select></td>
				</tr>
				<tr>
					<td align="right"><label>Tipo:</label></td>
					<td>
						<select validar=" " name="Tipo"><option value="-" selected="selected">Seleccione</option>
							<option value="1" <?php if($la_Campos['Tipo']=="1"){print("selected='selected'");}?>>Maestro</option>
							<option value="2" <?php if($la_Campos['Tipo']=="2"){print("selected='selected'");}?>>Transaccion</option>
							<option value="3" <?php if($la_Campos['Tipo']=="3"){print("selected='selected'");}?>>Reporte</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><label>Estatus:</label></td>
					<td>
						<input validar=" " type="radio" id="Estatus1" name="Estatus" value="A"<?php if($la_Campos['Estatus']=="A"){print("checked");}?>/><label>Activo</label>
						<input validar=" " type="radio" id="Estatus2" name="Estatus" value="I"<?php if($la_Campos['Estatus']=="I"){print("checked");}?>/><label>Inactivo</label>
					</td>
				</tr>
			</table>
		</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Submodulo");?>
</body>
<script src="JS/Librerias.js"></script>
</html>
