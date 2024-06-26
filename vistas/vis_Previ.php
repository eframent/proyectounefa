<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Cuerpo->f_Redireccion();
$mensaje=$_SESSION['Importacion']['STATUS'];
if($mensaje=="Archivo Cargado Con Éxito"){
	$data=$_SESSION['Importacion']["DATA"];
}
$numeroDeFilas=count($data)+1;
unset($_SESSION['Importacion']);
$nombres= Array("Rusnies","Cedula","Nombres","RamaE",'Grado','IA','Telefonos','Correo','Prom','Pos');
$lobj_Cuerpo->f_Redireccion();
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<link rel="stylesheet" type="text/css" href="css/upload.css">
	<style type="text/css">
		table tr {
			transition:all 0.5s;
			border: 1px solid #34495e;
		}

		table tr td{
			border: none;
			background-color: rgba(236, 240, 241,0.8);

		}
		table tr:hover>td{
			background: #2980b9;
			cursor: pointer;
			color: white;
			height: 30px;
			margin-left: 10px;

		}

		form input[type="button"]{
			float: right;
			margin-right: 10px;
			width: auto;
			margin-top: 5px;
		}

		#botones{
			width: 100%;
			height: 50px;
			box-shadow: none;
			border:0px;
		}

	</style>
</head>
<body >
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>	
	<form name="form1" action="../controladores/cor_ImportFin.php" method="POST">	
	<table style="border-collapse:collapse; text-align:center; " width="100%" >
		<tr>
			<th>Rusnies</th>
			<th>Cedula</th>
			<th >Nombres y Apellidos</th>
			<th>Rama Educativa</th>
			<th>Grado</th>
			<th>IA</th>
			<th>Telefono</th>
			<th>Correo</th>
			<th>PROM</th>
			<th>POS</th>
		</tr>
	<?php
		for($x=2;$x<$numeroDeFilas+1;$x++){
			echo"<tr>";
			$numeroDeColumnas=count($data[$x]);
			for($y=0;$y<$numeroDeColumnas;$y++){
				echo"<td>".$data[$x][$nombres[$y]]."</td>";
			}
			echo"</tr>";
		}
	?>

	</table>		
			
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<div id="botones">
				<input type='button' class="btn" value="Regresar"  onclick='window.history.go(-1);'>
				<input type='button' class="btn" value="Realmente Desea Guardar"   onclick='f_Guardado()'>
				<input type='button' class="btn" id="Nuevo" name='Nuevo' value='Guardar' onclick='f_Nuevo();'/>
				
				
			</div>
	</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script src="JS/Librerias.js"></script>
<script type="text/javascript">
	<?php 
		if($mensaje=="Archivo Cargado Con Éxito"){
			echo'f_MostrarMensaje("'.$mensaje.'","Info");';
		}else{
			echo'f_MostrarMensaje("'.$mensaje.'","Error");
				 document.getElementById("Nuevo").disabled=true;
				 setTimeout(function(){location.href="vis_Importar.php"},3500);';
		}
	?>
	function f_Guardado(){
		<?php $_SESSION['DATA']=$data; ?>
		document.form1.submit();
	}
</script>
</html>
