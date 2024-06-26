<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_Combo.php");
$lobj_Cuerpo = new cls_Cuerpo();
$lobj_Combo = new cls_Combo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Codigo","Nombre","Valor","Idtipo","Nombre_Tipo");
$ls_Sql="SELECT * FROM tipoevaluativo ";
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Registro de Valoraciones</h2>
		<form name="form1" action="../controladores/cor_Valoracion.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label>Código:</label></td>
					<td><input validar="solo numeros" type="text" name="Codigo" validar="solo numeros" value="<?php print($la_Campos['Codigo']);?>" onblur="f_PerderFocus();"/></td>
				</tr>
				<tr>
					<td align="right"><label>Nombre:</label></td>
					<td><input validar=" " type="text" name="Nombre" value="<?php print($la_Campos['Nombre']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label>Valor Real:</label></td>
					<td><input validar="solo numeros" type="text" name="Valor" value="<?php print($la_Campos['Valor']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label>Tipo de Evaluación:</label></td>
					<td><select validar=" " name="Idtipo"><option value="-">Seleccione</option><?php $lobj_Combo->fGenerar($ls_Sql,"idtipo","nombre",$la_Campos["Idtipo"],"");?></select></td>
				</tr>
			</table>
			</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
			</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Valoracion");?>
</body>
<script src="JS/Librerias.js"></script>
</html>
