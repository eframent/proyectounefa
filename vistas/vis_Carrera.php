<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Codigo","Nombre","Titulo","Estatus");
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
			<h2>Registro de Carrera</h2>
		<form name="form1" action="../controladores/cor_Carrera.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label >Código :</label></td>
					<td><input type="text" name="Codigo"  validar="solo numeros"  value="<?php print($la_Campos['Codigo']);?>" onblur="f_PerderFocus();"/></td>
				</tr>
				<tr>
					<td align="right"><label>Nombre:</label></td>
					<td><input type="text" name="Nombre" validar=" " value="<?php print($la_Campos['Nombre']);?>"></td>
				</tr>
				<tr>
					<td align="right"><label >Titulo:</label></td>
					<td><input  validar=" " type="text" name="Titulo" value="<?php print($la_Campos['Titulo']);?>"></td>
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
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Carrera");?>
</body>
<script src="JS/Librerias.js"></script>
</html>
