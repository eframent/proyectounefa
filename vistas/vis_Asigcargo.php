<?php
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_Combo.php");
session_start();
$lobj_Combo= new cls_Combo();
$lobj_Cuerpo = new cls_Cuerpo();
$Nombre=$_GET['Nombre'];
if(!$Nombre){
	$Nombre="vacio";
}
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Cedula","Nombres","Apellidos","Usuario","Cargo","Codigo_Cargo");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<?php $lobj_Cuerpo->f_Librerias();?>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Unefa</title>
		<meta name="keywords" content="php" />
		<link rel="stylesheet" type="text/css" href="css/asignar.css">
		<style type="text/css">
			div#legendObligatorio{
				display: none !important;
			}
		</style>
	</head>
	
	<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
		<?php $lobj_Cuerpo->f_Cabecera();?>
		<?php $lobj_Cuerpo->f_Menu();?>
		<div Contenedor>
			<form name="form1" action="../controladores/cor_Asigcargo.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<div id="paso1" style="width:90%; background:white; margin:30px auto; border-radius:5px;">
				<h2>Seleccionar el Usuario al cual se le va a asignar el cargo</h2>
				<fieldset style="min-height:100px; color:black;">
					<legend>Paso 1 </legend>				
					<input type='button' id="Nuevo" name='Nuevo' value='Iniciar' onclick='f_Nuevo();'/>
					<input type='button' value="Buscar"  onclick='f_Listar(0,"");'>
				</fieldset>
			</div>
			</form>
			<form name="form3" action="../controladores/cor_Asigcargo.php" method="POST">
			<div id="paso2" style="display:none; width:90%; min-height:250px; background:white; margin:30px auto; border-radius:5px;" >
				<h2 style="height:auto;">Paso 2: Seleccionar el cargo que se asignará</h2>
				<input type="hidden" name="Operacion" value="guardar">
				<fieldset style="min-height:220px; color:black">
					<legend>Datos de usuario</legend>
						<table>
						<tr>
							<td align="right"><label>Nombre Completo </label></td>
							<td><input type="text" name="Persona" id="Persona" value="<?php print($la_Campos['Nombres']." ".$la_Campos['Apellidos']); ?>"></td>
						</tr>
						<tr>
							<td align="right"><label>Nombre de Usuario</label></td>
							<td><input type="text" name="Usuario" id="Usuario" value="<?php print($la_Campos['Usuario'])?>" ></td>
						</tr>
						<tr>
							<td align="right"><label>Cargo</label></td>
							<td>
								<select requerido="obligatorio" name="Cargo" validar=" ">
									<option value="-">Seleccione</option>
									<?php $lobj_Combo->fGenerar("select * from cargo order by car_nombre","car_codigo","car_nombre",$la_Campos["Codigo_Cargo"],"");?>
									<option value="REVOCAR">REVOCAR</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="button" value="Guardar" onclick="asignar()"></center></td>
						</tr>
					</table>
				</fieldset>
			</div>
			</form>
		</div>
		<?php $lobj_Cuerpo->f_Pie();?>
		<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Asigcargo");?>
	</body>
<script src="JS/Librerias.js"></script>
	<script language="javascript" src="JS/barra.div.js"></script>
		<script type="text/javascript">
			function paso2(){
				var paso2=document.getElementById('paso2');
				var paso1=document.getElementById('paso1');
				paso2.style.display='block';
				paso1.style.display='none';
				document.getElementById("Persona").disabled=true;
				document.getElementById("Usuario").disabled=true;
			}
			function asignar(){
				form=document.form3;
				if(form.Cargo.value!="-"){
					form.Usuario.disabled=false;
					form.submit();
				}else{
					f_MostrarMensaje("Seleccione un Cargo","Alerta");
					form.Cargo.focus();
				}
			}
			<?php 
				if($la_Campos['Hay']=='1'){
					echo"
					paso2();
					";
				}else if($la_Campos['Hacer']=='Listo'){
					echo"f_MostrarMensaje('Operacion realizada con exito','Info');";
				}
			?>
		</script>
</html>
