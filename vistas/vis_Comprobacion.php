<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Estatus1");
		laValor=new Array("checked");
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
		<div formulario id="aqui">
			<h2>Codigo de Comprobación <a href='vis_Salir.php' ><input msg='Salir' type='button' title='Cerrar Sesion' class='cerrar_se'></a></h2>
		<form name="verificacion" action="../controladores/cor_RecuperarClave.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<input type='hidden' name='Contrasena' value='<?php print($la_Campos['Contrasena']); ?>'>
			<table>
				<tr>
					<td colspan="2"><h1 int> <img info src="imagenes/info.png">Introduzca el codigo de verificación que fue enviado a la cuenta de correo asosiada a su usuario de sistema</h1></td>
				</tr>
				<tr>
					<td align="right"><label >Usuario:</label></td>
					<td align="left"><input type="text" validar=" "  name="Usuario"/></td>
				</tr>				
				<tr>
					<td align="right"><label >Ingrese Codigo de Verificación:</label></td>
					<td align="left"><input type="text" validar=" "  name="Verificacion" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="button" value="Verificar" onclick="validarEnvio()"></td>
				</tr>
			</table>	
		</div>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script type="text/javascript" src="JS/Mensajes.js"></script>
<script type="text/javascript">
	function arranque(){		
		var form=document.forms[0];
		form.Usuario.value="<?php print($la_Campos['Nombre'])?>";
		form.Usuario.disabled=true;
	}
	function validarEnvio(){
		var form=document.verificacion;
		if(form.Verificacion.value!=""){
			form.Operacion.value="ValidarCodigo";
			form.Usuario.disabled=false;
			form.submit();
		}else{
			f_MostrarMensaje("Por favor llene el campo codigo","Alerta","","30px",'si');
		}
	}
</script>
<?php
	if(isset($_SESSION["Mensaje"])){
		echo "
			<script type='text/javascript'>
				f_MostrarMensaje('".$_SESSION['Mensaje']."','Info','','','no');
			</script>
		";
		unset($_SESSION["Mensaje"]);
	}
	?>
</html>
