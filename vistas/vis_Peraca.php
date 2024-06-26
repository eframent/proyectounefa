<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Nombre","Fecha_Ini","Fecha_Fin","Estatus");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Estatus2","Estatus1","Estatus2");
		laValor=new Array("checked","bloqueado","bloqueado");
	</script>
	
	<!-- archivos para el calendario-->
	<script src="JS/jscal2.js"></script>
    <script src="JS/es.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jscal2.css" />
    <link rel="stylesheet" type="text/css" href="css/border-radius.css" />
    <link rel="stylesheet" type="text/css" href="css/steel.css" />  
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<form name="form1" action="../controladores/cor_Peraca.php" method="POST">
		<div formulario>
			<h2>Registro de Período Académico</h2>
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>

			<table>	
				<tr>
					<td align="right"><label>Nombre: </label></td>
					<td><input type="text" validar=" " name="Nombre" value="<?php print($la_Campos['Nombre']);?>" onblur='f_PerderFocus()'/></td>
				</tr>
				<tr>
					<td align="right"><label>Fecha de Inicio:</label></td>
					<td><input id="f_date1" placeholder='Pulse para eleccionar fecha' type="text" validar="fecha inicio" name="Fecha_Ini" value="<?php print($la_Campos['Fecha_Ini']);?>"/><i id="f_date3" class="icon32 icon-blue icon-date"></i></td>
				</tr>
				<tr>
					<td align="right"><label>Fecha de Cierre:</label></td>
					<td><input id="f_date2" placeholder='Pulse para eleccionar fecha' type="text" validar="fecha fin" name="Fecha_Fin" value="<?php print($la_Campos['Fecha_Fin']);?>"/><i id="f_date4" class="icon32 icon-blue icon-date"></i></td>
					
				</tr>				
				<tr>
					<td align="right"><label>Estatus:</label></td>
					<td>
						<input type="radio" validar=" " name="Estatus" id="Estatus1" value="A" <?php if($la_Campos['Estatus']=="A"){print("checked");} ?>><label>Activo</label>
						<input type="radio" validar=" " name="Estatus" id="Estatus2" value="I" <?php if($la_Campos['Estatus']=="I"){print("checked");} ?>><label>Inactivo</label>
					</td>
				</tr>
			</table>		
		</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Peraca");?>
</body>
<script type="text/javascript">

      var cal = Calendar.setup({
          onSelect: function(cal) { cal.hide() },
          showTime: false
      });
      cal.manageFields("f_date1", "f_date1", "%d-%m-%Y");
      cal.manageFields("f_date3", "f_date1", "%d-%m-%Y");
      cal.manageFields("f_date4", "f_date2", "%d-%m-%Y");
      cal.manageFields("f_date2", "f_date2", "%d-%m-%Y");
		
    </script>
<script src="JS/Librerias.js"></script>
</html>
