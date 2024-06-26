<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Cedula","Nombre1","Nombre2","Apellido1","Apellido2","Nombre_Usu","Nacio","Estatus","Correo","Dedicacion");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
$lsSql="select * from dedicacion  where (borrado='I') order by nombre"; 
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre= new Array("Estatus1","Estatus1","Estatus2","Nombre_Usu","Nombre_Usu");
		laValor= new Array("checked","bloqueado","bloqueado","bloqueado","D<?php print($la_Campos['Cedula']);?>");
	</script>
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Registro de Personal Docente</h2>
		<form name="form1" action="../controladores/cor_Docente.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label >Cédula:</label></td>
					<td colspan="3">
						<select name="Nacio" id="nacionalidad">
							<option value="V" <?php if($la_Campos['Nacio']=="V"){print("selected='selected'");}?>>V</option>
							<option value="E" <?php if($la_Campos['Nacio']=="E"){print("selected='selected'");}?>>E</option>
						</select>
						<input  type="text" name="Cedula" validar="solo numeros"  value="<?php print($la_Campos['Cedula']);?>" onblur="f_PerderFocus();"/>
					</td>
				</tr>
				<tr>
					<td align="right"><label>Primer Nombre:</label></td>
					<td><input type="text" name="Nombre1" validar=" " value="<?php print($la_Campos['Nombre1']);?>"/></td>
					<td align="right"><label >Segundo Nombre:</label></td>
					<td><input type="text" name="Nombre2" value="<?php print($la_Campos['Nombre2']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label>Primer Apellido:</label></td>
					<td><input type="text" name="Apellido1" validar=" " value="<?php print($la_Campos['Apellido1']);?>"/></td>
					<td align="right"><label >Segundo Apellido:</label></td>
					<td><input  type="text" name="Apellido2" value="<?php print($la_Campos['Apellido2']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label >Dedicación:</label></td>
					<td>
						<select validar=" " name="Dedicacion">
							<option value="-" selected="selected">Seleccione</option>
							<?php $lobjCombo->fGenerar($lsSql,"codigo","nombre",$la_Campos['Dedicacion'],"")?>
						</select>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td align="right"><label >Nombre de Usuario:</label></td>
					<td colspan="3"><input type="text" id="nombre" validar=" " onblur="validarAJAX(this, validarUsuario, 'usuario');" name="Nombre_Usu" value="<?php print($la_Campos['Nombre_Usu']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label >Contraseña:</label></td>
					<td><input type="password" validar=" "  name="Contrasena"/></td>
					<td align="right"><label >Reingrese Contraseña:</label></td>
					<td><input type="password" validar="contrasena1"  name="Contrasena1" /></td>
				</tr>
				<tr>
					<td align="right"><label >Correo Electronico:</label></td>
					<td><input type="text" name="Correo" validar=" " value="<?php print($la_Campos['Correo']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label >Estatus:</label></td>
					<td>
						<input type="radio" id="Estatus1" name="Estatus" value="A" <?php if ($la_Campos["Estatus"] == "A") {  print("checked"); } ?>><label>Activo</label>
						<input  type="radio" id="Estatus2" name="Estatus" value="I" <?php if ($la_Campos["Estatus"] == "I") {  print("checked"); } ?>><label>Inactivo</label>
					</td>
				</tr>
			</table>
		</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Docente");?>
</body>
<script src="JS/Librerias.js"></script>
</html>
