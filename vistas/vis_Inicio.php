<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_Menu.php");
$lobj_Cuerpo = new cls_Cuerpo();
$lobj_Carga = new cls_Menu();
$lobj_Carga->f_Carga();
$_SESSION['reporte']=$_SESSION['usuario']['Cedula'];
$lobj_Cuerpo->f_Redireccion();
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<link rel="stylesheet" type="text/css" href="css/asignar.css">
	<link href="css/horario_est.css" rel="stylesheet" type="text/css" media="print">
	<style type="text/css">
		div#legendObligatorio{
			display: none !important;
		}

		div#contenedorHorario{
			height: 800px !important;
		}
	</style>
</head>
<body onScroll="bajar();">
	<img src="imagenes/logo_unefa.gif" id="logo">

	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div agrup>
			<?php $lobj_Carga->f_Inicio(); 
			?>
		</div>
	</div>

	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script src="JS/Librerias.js"></script>
<?php
	if(isset($_SESSION["usuario"]["Mensaje"])){
		echo "
			<script type='text/javascript'>
				f_MostrarMensaje('".$_SESSION['usuario']['Mensaje']."','Info','','','no');
			</script>
		";
		unset($_SESSION["usuario"]["Mensaje"]);
	}
	?>
</html>
