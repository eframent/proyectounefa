<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
$la_Nombres=Array("Cedula","Nombre1","Nombre2","Apellido1","Apellido2","Nombre_Usu","Nacio","Estatus","Estado_civ","Sexo","Telefono","Correo","Estado","Municipio","Parroquia","Ciudad","Fecha_Ing","Carrera","Semestre","Pensum","Estudios","Rusnies","Tipo_ret","Condicion","Permin","Indgen","Etnia","Disc","Lugar_Nac","Fecha_Nac","Turno");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script type="text/javascript">
		laNombre=new Array("Estatus1","Fecha_Ing","Estatus2","Estatus1","Fecha_Ing","Nombre_Usu","Nombre_Usu");
		laValor=new Array("checked","<?php print(date('d/m/Y')); ?>","disabled","deshabilitado","bloqueado","bloqueado","E<?php print($la_Campos['Cedula']);?>");
	</script>
	<style type="text/css">
		label[cedula]{
			color:rgb(108, 122, 137);
			margin-left: 15px;
		}

		@media screen and (max-width: 550px) {
			input[name="Cedula"]{
				width: 100px;
			}

			table input[name="Nombre_Usu"] {
			    width: 100%;
			}

			select#condicion{
				width: 160%;
			}
		}
	</style>
	<!-- archivos para el calendario-->
	<script src="JS/jscal2.js"></script>
    <script src="JS/es.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jscal2.css" />
    <link rel="stylesheet" type="text/css" href="css/border-radius.css" />
    <link rel="stylesheet" type="text/css" href="css/steel.css" />  
</head>
<body onScroll="bajar()" onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario >
			<h2>Registro de Estudiantes</h2>
		<form name="form1" action="../controladores/cor_Estudiante.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<label cedula>Cedula:</label>
							<select name="Nacio" id="nacionalidad">
								<option value="V" <?php if($la_Campos['Nacio']=="V"){print("selected='selected'");}?>>V</option>
								<option value="E" <?php if($la_Campos['Nacio']=="E"){print("selected='selected'");}?>>E</option>
							</select>
							<input type="text" name="Cedula"  validar="solo numeros" value="<?php print($la_Campos['Cedula']);?>" onblur="f_PerderFocus();"/>
			<fieldset>
				<legend>Datos Personales</legend>
				<table>
					<tr>
						<td align="right"><label>Primer Nombre:</label></td>
						<td><input type="text" name="Nombre1" requerido="obligatorio" validar="solo letras" value="<?php print($la_Campos['Nombre1']);?>"/></td>
						<td align="right"><label>Segundo Nombre:</label></td>
						<td><input type="text" name="Nombre2"  value="<?php print($la_Campos['Nombre2']);?>"/></td>
					</tr>
					<tr>
						<td align="right"><label>Primer Apellido:</label></td>
						<td><input type="text" name="Apellido1"  validar="solo letras" value="<?php print($la_Campos['Apellido1']);?>"/></td>
						<td align="right"><label>Segundo Apellido:</label></td>
						<td><input type="text" name="Apellido2" value="<?php print($la_Campos['Apellido2']);?>"/></td>
					</tr>
					<tr>
						<td align="right"><label>Fecha de Nacimiento:</label></td>
						<td><input id="f_date1" type="text" name="Fecha_Nac" validar="fecha" validar="solo letras" value="<?php print($la_Campos['Fecha_Nac']);?>"/><i id="f_date3" class="icon32 icon-blue icon-date"></i></td>
						<td align="right"><label>Lugar de nacimiento:</label></td>
						<td><input type="text" name="Lugar_Nac" validar=" " validar="solo letras" value="<?php print($la_Campos['Lugar_Nac']);?>"/></td>
					</tr>
					<tr>
						<td align="right"><label>Estado Civil:</label></td>
						<td>
							<select name="Estado_civ" validar=" ">
								<option value="-" >Seleccione</option>
								<option value="S" <?php if($la_Campos['Estado_civ']=="S"){print("selected='selected'");}?>>Soltero</option>
								<option value="C" <?php if($la_Campos['Estado_civ']=="C"){print("selected='selected'");}?>>Casado</option>
								<option value="O" <?php if($la_Campos['Estado_civ']=="O"){print("selected='selected'");}?>>Concuvino</option>
								<option value="V" <?php if($la_Campos['Estado_civ']=="V"){print("selected='selected'");}?>>Viudo</option>
							</select>
						</td>
						<td align="right"><label>Sexo:</label></td>
						<td>
							<input type="radio" id="Sexo1" name="Sexo" value="M" <?php if ($la_Campos["Sexo"] == "M") {  print("checked"); } ?>><label>Masculino</label>
							<input type="radio" id="Sexo2" name="Sexo" value="F" <?php if ($la_Campos["Sexo"] == "F") {  print("checked"); } ?>><label>Femenino</label>
						</td>
					</tr>
					<tr>
						<td align="right"><label >Telefono:</label></td>
						<td><input type="text" name="Telefono" validar=" " value="<?php print($la_Campos['Telefono']);?>"/></td>
					</tr>
					<tr>
						<td align="right"><label>Correo electronico:</label></td>
						<td><input type="text" name="Correo" value="<?php print($la_Campos['Correo']);?>"/></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>Direccion</legend>
				<table>
					<tr>
						<td align="right"><label>Estado:</label></td>
						<td>
							<select id="estado" name="Estado" onChange="f_ListaDependiente(this,'municipio');">
								<option value="-" >Seleccione</option>
								<?php $lobjCombo->fGenerar("SELECT * FROM estado WHERE (borrado='I') ORDER BY nombre_e","idestado","nombre_e",$la_Campos['Estado'],"")?>
							</select>
						</td>
						<td align="right"><label>Municipio:</label></td>
						<td>
							<select id="municipio" dependiente="dependiente" name="Municipio" onChange="f_ListaDependiente(this,'parroquia');">
								<option value="-" >Seleccione</option>
								<?php $lobjCombo->fGenerar("SELECT * FROM municipio WHERE (borrado='I') ORDER BY nombre_m","idmunicipio","nombre_m",$la_Campos['Municipio'],"idestado")?>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right"><label>Parroquia:</label></td>
						<td>
							<select id="parroquia" dependiente="dependiente" name="Parroquia" onChange="f_ListaDependiente(this,'ciudad');">
								<option value="-" >Seleccione </option> 
								<?php $lobjCombo->fGenerar("SELECT * FROM parroquia WHERE (borrado='I') ORDER BY nombre_p","idparroquia","nombre_p",$la_Campos['Parroquia'],"idmunicipio")?>
							</select>
						</td>
						<td align="right"><label>Ciudad:</label></td>
						<td>
							<select id="ciudad" dependiente="dependiente" name="Ciudad" >
								<option value="-" >Seleccione </option>
								<?php $lobjCombo->fGenerar("SELECT * FROM ciudad WHERE (borrado='I') ORDER BY nombre","idciudad","nombre",$la_Campos['Ciudad'],"idparroquia")?>
							</select>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>Datos Academicos</legend>
				<table>
					<tr>
						<td align="right"><label>Fecha de Ingreso:</label></td>
						<td><input type="text" name="Fecha_Ing" value="<?php print($la_Campos['Fecha_Ing']);?>"/></td>
						<td align="right"><label>Carrera Cursar:</label></td>
						<td>
							<select validar=" " id="carrera" name="Carrera" onChange="f_ListaDependiente(this,'pensum_pre');">
								<option value="-" >Selecione</option>
								<?php $lobjCombo->fGenerar("SELECT * FROM carrera WHERE (borrado='I') ORDER BY nombre","codesp","nombre",$la_Campos['Carrera'],"")?>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right"><label>Pensum a Cursar:</label></td>
						<td>
							<select validar=" " id="pensum_pre" dependiente="dependiente" name="Pensum">
								<option value="-" dependiente="dependiente" >Seleccione </option>
								<?php $lobjCombo->fGenerar("SELECT * FROM pensum_pre WHERE (borrado='I') ORDER BY nombre","idpensum","nombre",$la_Campos['Pensum'],"codesp")?>
							</select>
						</td>
						<td align="right"><label >Semestre Cursar:</label></td>
						<td>
							<select validar=" " id="semestre" name="Semestre">
								<option value="-" >Seleccione</option>
								<?php $lobjCombo->fGenerar("SELECT * FROM semestre WHERE (borrado='I') ORDER BY nombre","idsemestre","nombre",$la_Campos['Semestre'],"")?>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right"><label>Turno:</label></td>
						<td>
							<select id="regimen" name="Turno">
								<option value="-" >Seleccione</option>
								<?php $lobjCombo->fGenerar("SELECT * FROM regimen WHERE (borrado='I') ORDER BY tipo_turno","idregimen","tipo_turno",$la_Campos['Turno'],"")?>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right"><label>Codigo Rusnies:</label></td>
						<td><input type="text" name="Rusnies" value="<?php print($la_Campos['Rusnies']);?>"/></td>
						<td align="right"><label>Lugar de Estudios Secundarios:</label></td>
						<td><input type="text" name="Estudios" value="<?php print($la_Campos['Estudios']);?>"/></td>
					</tr>
					<tr>
						<td align="right"><label>Tipo de Retiro:</label></td>
						<td>
							<select name="Tipo_ret">
								<option value="-" >Seleccione</option>
								<option value="D">Disciplina</option>
								<option value="A">Academica</option>
								<option value="S">Servicio</option>
								<option value="V">Voluntad</option>
								<option value="M">Muerte</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right"><label>Indice General:</label></td>
						<td><input type="text" name="Indgen"   value="<?php print($la_Campos['Indgen']);?>"/></td>
						<td align="right"><label>Persona Militar:</label></td>
						<td>
							<input type="radio" id="Permin1" validar=" " name="Permin" value="A" <?php if ($la_Campos["Permin"] == "A") {  print("checked"); } ?>><label>Si</label>
							<input type="radio" id="Permin2" validar=" " name="Permin" value="I" <?php if ($la_Campos["Permin"] == "I") {  print("checked"); } ?>><label>No</label>
						</td>
					</tr>
					<tr>
						<td align="right"><label>Codicion:</label></td>
						<td>
							<select  validar=" " id="condicion" name="Condicion">
								<option value="-" >Selecione</option>
								<?php $lobjCombo->fGenerar("SELECT * FROM condicion WHERE (borrado='I') ORDER BY nombre","idcondicion","nombre",$la_Campos['Condicion'],"")?>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right"><label>Etnia indigena:</label></td>
						<td><input type="text" name="Etnia" value="<?php print($la_Campos['Etnia']);?>"/></td>
						<td align="right"><label >Discapacidad:</label></td>
						<td><input type="text" name="Disc" value="<?php print($la_Campos['Disc']);?>"/></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<table>
					<tr>
						<td align="right"><label>Nombre de Usuario:</label></td>
						<td><input type="text" id="nombre" validar=" " onblur="validarAJAX(this, validarUsuario, 'usuario');" name="Nombre_Usu" value="<?php print($la_Campos['Nombre_Usu']);?>"/></td>
						
					</tr>
					<tr>
						<td align="right"><label>Contraseña:</label></td>
						<td><input type="password" validar=" "  name="Contrasena"/></td>
					</tr>
					<tr>
						<td align="right"><label>Reingrese Contraseña:</label></td>
						<td><input type="password" validar="contrasena1"  name="Contrasena1" /></td>
						
					</tr>
					<tr>
						<td align="right"><label>Estatus:</label></td>
						<td>
							<input type="radio" id="Estatus1" name="Estatus" value="A" <?php if ($la_Campos["Estatus"] == "A") {  print("checked"); } ?>><label>Activo</label>
							<input type="radio" id="Estatus2" name="Estatus" value="I" <?php if ($la_Campos["Estatus"] == "I") {  print("checked"); } ?>><label>Inactivo</label>
						</td>
					</tr>
				</table>
				<legend>Datos de Usuario</legend>
			</fieldset>
		</div>
			<?php $lobj_Cuerpo->f_Botonera();?>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Estudiante");?>
</body>
<script type="text/javascript">
  var cal = Calendar.setup({
      onSelect: function(cal) { cal.hide() },
      showTime: false
  });
  cal.manageFields("f_date1", "f_date1", "%d-%m-%Y");
  cal.manageFields("f_date3", "f_date1", "%d-%m-%Y");
</script>
<script src="JS/Librerias.js"></script>
</html>
