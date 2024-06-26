<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Codigo","Nombre","Abreviatura","Descripcion");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Estatus1");
		laValor=new Array("checked");
	</script>
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Tipos de Condicion</h2>
		<form name="form1" action="../controladores/cor_Condicion.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label>Codigo de Condicion:</label></td>
					<td><input type="text" name="Codigo" validar="solo numeros" value="<?php print($la_Campos['Codigo']);?>" onblur="f_PerderFocus();"/></td>
				</tr>
				<tr>
					<td align="right"><label>Nombre:</label></td>
					<td><input type="text" validar=" " name="Nombre" value="<?php print($la_Campos['Nombre']);?>"></td>
				</tr>
				<tr>
					<td align="right"><label>Abreviatura:</label></td>
					<td><input type="text" validar=" " name="Abreviatura" value="<?php print($la_Campos['Abreviatura']);?>"></td>
				</tr>
				<tr>
					<td align="right"><label>Descripcion:</label></td>
					<td><textarea cols="18" name="Descripcion"> <?php print($la_Campos['Descripcion']);?></textarea></td>
				</tr>
			</table>
		</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Condicion");?>
</body>
<script src="JS/Librerias.js"></script>
</html>
