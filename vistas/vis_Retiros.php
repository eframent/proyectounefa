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
$la_Nombres=Array("Cedula","Nombres","Apellidos");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<?php $lobj_Cuerpo->f_Librerias();?>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Unefa</title>
		<meta name="keywords" content="php" />
		<link rel="stylesheet" type="text/css" href="css/upload.css">
		<style type="text/css">
			div#legendObligatorio{
				display: none !important;
			}
		</style>
	</head>
	
	<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>);">
		<?php $lobj_Cuerpo->f_Cabecera();?>
		<?php $lobj_Cuerpo->f_Menu();?>
		<div Contenedor>
			<form name="form1" action="../controladores/cor_Retiros.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<div id="paso1" style="width:90%; background:white; border-radius:5px; margin-top:20px;" >
				<h2>Gestionar Cancelacion de Matricula</h2>
				<fieldset style="width:45%;">
					<legend>Seleccione Estudiante</legend>
					<input type='button' style="margin-left:225px" class="btn" id="Nuevo" name='Nuevo' value='Iniciar' onclick='f_Nuevo();'/>
					<input type='button' class="btn" value="Buscar"  onclick='f_Listar(0,"");'>
				</fieldset>	

			</div>
			</form>
			<form name="form3" action="../controladores/cor_Retiros.php" method="POST">
			<div id="paso2" style="display:none; width:90%; border-radius:5px; background:white; margin-top:20px;" >
				<h2>Gestionar Cancelacion de Matricula</h2>
				<input type="hidden" name="Operacion" value="guardar">
				<fieldset>
					<legend>Datos de usuario</legend>
					<table>
						<tr>
							<td align="right"><label>Nombre Completo </label></td>
							<td><input type="text" name="Persona" id="Persona" value="<?php print($la_Campos['Nombres']." ".$la_Campos['Apellidos']); ?>"></td>
						</tr>
						<tr>
							<td align="right"><label>Cedula</label></td>
							<td><input type="text" name="Cedula" id="Cedula" value="<?php print($la_Campos['Cedula'])?>" ></td>
						</tr>
						<tr>
							<td align="right"><label>Tipo Retiro</label></td>
							<td>
								<select requerido="obligatorio" name="Retiro">
									<option value="-">Seleccione</option>
									<?php $lobj_Combo->fGenerar("SELECT * FROM tipo_retiro","idtipo_ret","nombre",$la_Campos["Codigo_Tipo"],"");?>
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"><label>Sanción</label></td>
							<td>
								<input  type="checkbox" onclick="cambio()"><input type="text" id="Sancion" name="Sancion" placeholder="Períodos de Sanción" style="width:0px" maxlength="2" validar="solo numeros">
							</td>
						</tr>
						<tr>
							<td colspan="2"  align="right"><input class="btn" type="button" value="Atras" onclick="location.href='vis_Retiros.php';"><input style="margin-right:15px;" class="btn" type="button" value="Guardar" onclick="asignar()"></center></td>
						</tr>
					</fieldset>
					</table>
			</div>
			</form>
		</div>
		<?php $lobj_Cuerpo->f_Pie();?>
		<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Retiros");?>
	</body>
<script src="JS/Librerias.js"></script>
	<script language="javascript" src="JS/barra.div.js"></script>
		<script type="text/javascript">
			<?php 
				if($la_Campos['Hay']=='1'){
					echo"
					paso2();
					";
				}else if($la_Campos['Hacer']=='Listo'){
					echo"f_MostrarMensaje('Operacion realizada con exito','Info');";
				}
			?>
			function paso2(){
				var paso2=document.getElementById('paso2');
				var paso1=document.getElementById('paso1');
				paso2.style.display='block';
				paso1.style.display='none';
				document.getElementById("Persona").disabled=true;
				document.getElementById("Cedula").disabled=true;
			}
			function asignar(){
				form=document.form3;
				if(form.Retiro.value!="-"){
					form.Cedula.disabled=false;
					form.submit();
				}else{
					f_MostrarMensaje("Seleccione un Tipo de Retiro","Alerta");
					form.Retiro.focus();
				}
			}
			function cambio(){
				form=document.form3;
				if(form.Sancion.style.width=="0px"){
					form.Sancion.style="transition:width 0.5s";
					form.Sancion.style.width="215px"
					form.Sancion.style.marginLeft="20px"
				}else{
					form.Sancion.style="transition:width 0.5s";
					form.Sancion.style.width="0px";
					form.Sancion.style.marginLeft="20px"					
				}
			}

		</script>
</html>
