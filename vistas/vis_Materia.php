<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
$lsSql_Semestre="select * from semestre where (borrado='I') order by idsemestre"; 
$lsSql_Pensum="select * from pensum_pre  where (borrado='I') order by idpensum"; 
$lsSql_Prelacion="select * from materia  where (borrado='I') order by codmat"; 
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Codigo","Nombre_materia","Semestre","Pensum","Credito","Horas_teoricas","Horas_practica","Horas_laboratorio","Prelacion_uno","Prelacion_dos","Descripcion","Electiva","Estatus","Prelacion_tres");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Estatus1","Estatus1");
		laValor=new Array("checked","bloqueado");
	</script>
</head>
<body onScroll="bajar();" onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Registro de Materia </h2>
		<form name="form1" action="../controladores/cor_Materia.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label>Código:</label></td>
					<td><input type="text" validar=" " name="Codigo" value="<?php print($la_Campos['Codigo']);?>" onblur="f_PerderFocus();"/></td>
					<td align="right"><label >Nombre de la Materia:</label></td>
					<td><input type="text" validar=" " name="Nombre_materia" value="<?php print($la_Campos['Nombre_materia']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label>Descripción:</label></td>
					<td><textarea cols="18" name="Descripcion"> <?php print($la_Campos['Descripcion']);?></textarea></td>
					<td align="right"><label>Unidades Acredítables:</label></td>
					<td>
						<select validar=" " name="Credito">
							<option value="-" selected="selected">Seleccione</option>
			                <option value="1" <?php if($la_Campos['Credito']=="1"){print("selected='selected'");}?>>1</option>
			                <option value="2" <?php if($la_Campos['Credito']=="2"){print("selected='selected'");}?>>2</option>
			                <option value="3" <?php if($la_Campos['Credito']=="3"){print("selected='selected'");}?>>3</option>
			                <option value="4" <?php if($la_Campos['Credito']=="4"){print("selected='selected'");}?>>4</option>
			                <option value="5" <?php if($la_Campos['Credito']=="5"){print("selected='selected'");}?>>5</option>
			            </select>
					</td>
				</tr>
				<tr>
					<td align="right"><label>Horas Teóricas:</label></td>
					<td><input type="text" name="Horas_teoricas" value="<?php print($la_Campos['Horas_teoricas']);?>"/></td>
					<td align="right"><label>Horas Practicas:</label></td>
					<td><input type="text" name="Horas_practica" value="<?php print($la_Campos['Horas_practica']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label>Horas Laboratorio:</label></td>
					<td><input type="text" name="Horas_laboratorio" value="<?php print($la_Campos['Horas_laboratorio']);?>"/></td>
					<td align="right"><label>Semestre:</label></td>
					<td><select validar=" " name="Semestre"><option value="-" selected="selected">Seleccione</option><?php $lobjCombo->fGenerar($lsSql_Semestre,"idsemestre","nombre",$la_Campos['Semestre'],"")?></select><br></td>
				</tr>
				<tr>
					<td align="right"><label>Pensum:</label></td>
					<td><select validar=" " name="Pensum"><option value="-" selected="selected">Seleccione</option><?php $lobjCombo->fGenerar($lsSql_Pensum,"idpensum","nombre",$la_Campos['Pensum'],"")?></select></td>
				</tr>
				<tr>
					<td align="right"><label>Prelación 1:</label></td>
					<td colspan="3"><select name="Prelacion_uno"><option value="-" selected="selected">Seleccione</option><?php $lobjCombo->fGenerar($lsSql_Prelacion,"codmat","nommat",$la_Campos['Prelacion_uno'],"")?></select></td>
				</tr>
				<tr>
					<td align="right"><label>Prelacion 2:</label></td>
					<td colspan="3"><select name="Prelacion_dos"><option value="-" selected="selected">Seleccione</option><?php $lobjCombo->fGenerar($lsSql_Prelacion,"codmat","nommat",$la_Campos['Prelacion_dos'],"")?></select></td>
				</tr>
				<tr>
					<td align="right"><label>Prelación 3:</label></td>
					<td colspan="3"><select name="Prelacion_tres"><option value="-" selected="selected">Seleccione</option><?php $lobjCombo->fGenerar($lsSql_Prelacion,"codmat","nommat",$la_Campos['Prelacion_tres'],"")?></select></td>
				</tr>
				<tr>
					<td align="right"><label>Electiva:</label></td>
					<td>
						<input type="radio" id="Electiva1" name="Electiva" value="A"<?php if($la_Campos['Electiva']=="A"){print("checked");}?>/>SI
						<input type="radio" id="Electiva2" name="Electiva" value="I"<?php if($la_Campos['Electiva']=="I"){print("checked");}?>/>NO
					</td>
					<td align="right"><label>Estatus:</label></td>
					<td>
						<input validar=" " type="radio" id="Estatus1" name="Estatus" value="A"<?php if($la_Campos['Estatus']=="A"){print("checked");}?>/>Activo
						<input validar=" " type="radio" id="Estatus2" name="Estatus" value="I"<?php if($la_Campos['Estatus']=="I"){print("checked");}?>/>Inactivo
					</td>
				</tr>
			</table>
		</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Materia");?>
</body>
<script src="JS/Librerias.js"></script>
</html>
