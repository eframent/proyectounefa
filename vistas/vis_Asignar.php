<?php
include_once("../clases/cls_Carga_Menu.php");
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo = new cls_Cuerpo();
$lobj_Carga= new cls_Carga_Menu;
$Nombre=$_GET['Nombre'];
if(!$Nombre){
	$Nombre="vacio";
}
$lobj_Carga->f_Carga($Nombre);
$hacer=$_SESSION["campos"]["Hacer"];
unset($_SESSION["campos"]["Hacer"]);
$lobj_Cuerpo->f_Redireccion("vis_Cargo.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<?php $lobj_Cuerpo->f_Librerias();?>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Asignar Sub-Modulos</title>
		<meta name="keywords" content="php" />
		<link rel="stylesheet" type="text/css" href="css/asignar.css">
		<script type="text/javascript">cargo="<?php print($Nombre); ?>"</script>
		<style type="text/css">
			div#legendObligatorio{
				display: none !important;
			}

			input[type="button"]:first-child{
				margin-left: 0px !important;
			}

			fieldset[leyenda]{
				float: left;
				width: 150px;
				margin-left: 7px;
				margin-top: 10px;
				border-radius: 3px !important;
				height: auto !important;
			}

			fieldset[leyenda] legend{
				font-size: 12px;
				background: rgb(226,226,226) ;
				color: rgb(28,69,131);
				margin-left: 0px;
				padding: 5px 20px;
				margin-top: -5px;
			}

		</style>
	</head>
	
	<body onload="f_Arranque()">
		<?php $lobj_Cuerpo->f_Cabecera();?>
		<?php $lobj_Cuerpo->f_Menu();?>
		<div Contenedor >
			<FORM method="POST" name="form1" action="../controladores/corEgreso.php">
			  	<div agrupar style="background: white;">
			  		<div  om style="overflow:hidden; height:30px; ">
			  			<input type="text" style="float:left" name="buscar" placeholder="Buscar . . ." onKeyUp="f_buscar(this.value);" >
			  			<L style="font-size:20px;float:left">Asignar Submodulos</L>
						<input type='button' class="icon" style="height: 30px; width:30px; margin-right:5px;margin-top:0px; float:right; background: url('imagenes/bl32.png'); background-position:-130px -32px;padding:0px;" onclick='f_Esconder(this);' title="Ocultar / Mostrar Contenido">
						<input type='button' class="icon gira" style="border:none;height: 30px; width:30px; margin-right:5px;margin-top:0px; float:right; background: url('imagenes/bl32.png'); background-position: -34px -258px;padding:0px;" onclick='location.href="vis_Cargo.php";' title="Registrar Cargo" >
						<input type='button'  style="padding:3px 8px; width:auto; margin-right:5px; float:right; margin-top:0px; width:auto;" value='Asignar' onclick='location.href="vis_Asigcargo.php";' title="Asignar Cargo">
					</div>

				  	<div id="uno" >
				  		<h2 style="margin:0px;">Disponibles</h2>
				  		<?php $lobj_Carga->f_Campos(); ?>
				  	</div>
				  	<fieldset leyenda id='ignoralo'>
				  		<legend>Leyenda</legend>
				  		<div infoLeyenda>A <div contLeyenda>Archivos</div></div>
				  		<div infoLeyenda>T <div contLeyenda>Transacciones</div></div>
				  		<div infoLeyenda>R <div contLeyenda>Reportes</div></div>
				  		<div infoLeyenda>P <div contLeyenda>Procesos</div></div>
				  	</fieldset>
			  		<div id="botones">
						
						<input ar id="limpiar" type="button" value="Limpiar " onclick="f_Limpiar()"> 
						<INPUT ar id="guardar" type='button' value="Guardar" onclick="f_Guardar()" > 
					</div>
				 	<div id="dos"><h2 style="margin:0px;">Asignados</h2><?php $lobj_Carga->f_CamposCargados(); ?></div>
				</div>
				<div legend>
					<?php $lobj_Carga->f_Legenda(); ?>
					<input type="button" onclick="f_MostrarTodo()" style="width:60px; margin-top: 0px; height:50px " value="[]" id="mostrarTodo">
 				</div>
			</FORM>
		</div>
		<input type="hidden" value="<?php print($hacer);?>" id="hacer">
		<div id='capaPopUp'></div>
					<div id='popUpDiv'>
						<div titulo> 
							Añadir submodulo
							<input type='button' id='cerrar' value='X' title='Cerrar' />
						</div>
						<div id='capaContent' >
							<iframe src="vis_Submodulo.php" style="height:500px;width:1024px;" ></iframe>
						</div>
					</div>
		<?php $lobj_Cuerpo->f_Pie();?>
	</body>
	<script language="javascript" src="JS/Mensajes.js">	</script>
	<script type="text/javascript">

		function f_Arranque(){
			if(document.getElementById("hacer").value=="Listo"){
				f_MostrarMensaje("Operacion Realizada con Exito","Info");	
			}else if(document.getElementById("hacer").value=="No"){
				f_MostrarMensaje("Operacion Realizada con Exito","Error");	
			}
			f_ComprobarLetras();
		}
	</script>
	<script language="javascript" src="JS/asignar.js">	</script>
	<script language="javascript" src="JS/barra.div.js"></script>
</html>
