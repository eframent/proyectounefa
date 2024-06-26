<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Codigo","Nombre","Descripcion");
$lobj_Cuerpo->f_Redireccion();
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Nombre","Nombre");
		laValor=new Array("Se precargo","bloqueado");
	</script>
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Tipos de Egreso</h2>
		<form name="form1" action="../controladores/cor_Tipoe.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<label>Codigo de tipo de egreso</label>
			<input type="text" requerido="obligatorio" name="Codigo" value="<?php print($la_Campos['Codigo']);?>" onblur="f_PerderFocus();"/><br>
			<label>Nombre</label>
			<input type="text" requerido="obligatorio" name="Nombre" value="<?php print($la_Campos['Nombre']);?>"/><br>
			<label>Descripcion</label>
			<textarea name="Descripcion"> <?php print($la_Campos['Descripcion']);?></textarea><br>
		</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Tipoe");?>
</body>
<script src="JS/Librerias.js"></script>
</html>
