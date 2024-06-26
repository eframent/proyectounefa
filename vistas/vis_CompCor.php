<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_Combo.php");
$lobj_Cuerpo = new cls_Cuerpo();
$lobj_Combo = new cls_Combo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
include_once("../clases/cls_Combo.php");

if(!isset($la_Campos['Correo'])){
	if(isset($_SESSION['usuario']['Nombre'])){
		echo "
			<script type='text/javascript'>
				location.href='vis_Salir.php';
			</script>
		";
	}else{
		echo "
			<script type='text/javascript'>
				location.href='../index.php';
			</script>
		";
	}
}
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Usuario");
		laValor=new Array("bloqueado");
	</script>
	<style type="text/css">
		div[formulario]{
			margin: 47px auto;
		}
		h1[int]{
			border: 1px solid silver;
			width: 62%;
			margin: 10px auto;
			font-size: 20px;
			padding:10px 10px 20px 80px;
			border-radius: 3px;
			text-align: center;
			color: #6C7A89;
			border-top: 0px;
			border-left: 0px;
			border-right: 0px;
		}

		img[info]{
			width: 60px;
			height: 60px;
			position: absolute;
			margin-left: -70px;
		}

		input[value="Actualizar"]{
			margin-right: -220px;
		}
	</style>
</head>
<body onload="arranque()">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<div Contenedor>
		<div formulario>
			<h2>Verificación Correo <a href='vis_Salir.php' ><input msg='Salir' type='button' title='Cerrar Sesion' class='cerrar_se'></a></h2>
		<form  action="../controladores/cor_RecuperarClave.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table >
				<tr>
					<td align="left"><h1 int> <img info src="imagenes/info.png">Por favor introduzca la dirección de correo completa, <?php print($la_Campos['Correo']);?></h1></td>
				</tr>
				<tr>
					<td align="left"><label >Usuario:</label><input type="text" validar=" " id="Usuario" name="Usuario"/></td>
				</tr>
				<tr>
					<td><label>Correo</label><input type="text" validar=" " id="Correo" name="Correo" value="" placeholder="ejemplo@ejemplo.com"/></td>
				</tr>
				<tr>
					<td><input type="button" value='Verificar' onclick="verificar()" ></td>
				</tr>
			</table>

		</div>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script type="text/javascript" >
	function arranque(){
		var form=document.forms[0];
		form.Usuario.value="<?php print($la_Campos['Nombre'])?>";
	}
	function verificar(){
		var form=document.forms[0];
		if(form.Correo.value==""){
			f_MostrarMensaje('Por favor llene el campo Correo','Alerta','','','no');
		}else{
			form.Correo.value=form.Correo.value.toUpperCase();
			form.Operacion.value='ValidarCorreo';
			form.Usuario.disabled=false;
			form.submit();
		}
	}
</script>
<script src="JS/Librerias.js"></script>
<?php
	if(isset($_SESSION["Mensaje"])){
		echo "
			<script type='text/javascript'>
				f_MostrarMensaje('".$_SESSION['Mensaje']."','Info','','','si');
			</script>
		";
		unset($_SESSION["Mensaje"]);
	}
	?>
</html>
