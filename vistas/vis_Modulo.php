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
$la_Nombres=Array("Nombre","Estatus","Color","Clases_Icono");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<script type="text/javascript" language="javascript" src="JS/colorPicker.js"></script>
	<link rel="stylesheet" href="css/colorPicker.css" type="text/css"></link>
	<link rel="stylesheet" href="css/capa.css" type="text/css"></link>
	<title>Registro</title>
	<script>
		laNombre=new Array("Estatus1","Estatus1","Estatus2");
		laValor=new Array("checked","bloqueado","bloqueado");
	</script>

</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor id='contenedor'>
		<div formulario >
			<h2>Registros de Modulo </h2>
		<form name="form1" action="../controladores/cor_Modulo.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label>Nombre:</label></td>
					<td><input validar=" " type="text" name="Nombre" value="<?php print($la_Campos['Nombre']);?>" onblur="f_PerderFocus();"/></td>
				</tr>
				<tr>
					<td align="right"><label>Clases Icono:</label></td>
					<td><input validar=" " type="text" name="Clases_Icono" value="<?php print($la_Campos['Clases_Icono']);?>"/><button onclick='boton()' type='button'><i class="icon32 icon-blue icon-zoomin" onclick='boton()'></i></button></td>
				</tr>
				<tr>
					<td align="right"><label>Color:</label></td>
					<td><input validar=" " type="text" name="Color" value="<?php print($la_Campos['Color']);?>" onclick="startColorPicker(this)" onkeyup="maskedHex(this)"/></td>
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
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Modulo");?>
</body>
<script src="JS/ventanaModal.js"></script>
<script src="JS/libreriaIconos.js"></script>
<script src="JS/Librerias.js"></script>
</html>
