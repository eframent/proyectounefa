<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Campos['Nombre']=(!isset($_SESSION['usuario']['Nombre']))?$la_Campos['Nombre']:$_SESSION['usuario']['Nombre'];
$la_Nombres=Array("Codigo","Estatus");
if(isset($_SESSION['Verificacion'])){
	unset($_SESSION['Verificacion']);
}else{
	echo "
			<script type='text/javascript'>
				location.href='vis_Salir.php';
			</script>
		";	
}
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
<body onload="arranque()">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<div Contenedor>
		<div formulario id="aqui">
			<h2>Cambio Contraseña <a href='vis_Salir.php' ><input msg='Salir' type='button' title='Cerrar Sesion' class='cerrar_se'></a></h2>
		<form name="clave" action="../controladores/cor_ActualizarClave.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>				
				<tr>
					<td align="right"><label >Usuario:</label></td>
					<td align="left"><input type="text" validar=" "  name="Usuario"/></td>
				</tr>
				<tr>
					<td align="right"><label >Contraseña:</label></td>
					<td><input type="password" validar=" "  name="Contrasena"/></td>
				</tr>
				<tr>
					<td align="right"><label >Reingrese Contraseña:</label></td>
					<td><input type="password" validar="contrasena1"  name="Contrasena1" onkeyup='validar()'/></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="button" value="Actualizar" onclick="validarEnvio()"></td>
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
		form=document.forms[0];
		form.Usuario.value="<?php print($la_Campos['Nombre']) ?>";
		form.Usuario.disabled=true;
	}
	function validar(){
		var form=document.clave;
		form.Contrasena1.style.background=(form.Contrasena.value==form.Contrasena1.value)?"#99CD9B":"#CD9A99";
	}
	function validarEnvio(){
		var form=document.clave;
		if(form.Contrasena.value==form.Contrasena1.value){
			form.Operacion.value="actualizar";
			form.Usuario.disabled=false;
			form.submit();
		}else{
			f_MostrarMensaje("Contraseñas No Coinsiden","Error","","30px");
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
