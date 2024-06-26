<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
include_once("../clases/cls_Combo.php");
$lobj_Combo= new cls_Combo();
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Nombre","Nombre_Departamento","Departamento","Estatus");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Estatus1","Estatus1","Estatus2");
		laValor=new Array("checked","bloqueado","bloqueado");
	</script>
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
		<div formulario>
			<h2>Registros de Cargo </h2>
		<form name="form1" action="../controladores/cor_Cargo.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label >Nombre:</label></td>
					<td><input  validar=" " type="text" name="Nombre" value="<?php print($la_Campos['Nombre']);?>" onblur="f_PerderFocus();"/></td>
				</tr>
				<tr>
					<td align="right"><label >Departamento:</label></td>
					<td>
						<select validar=" " name="Departamento">
							<option value="-">Seleccione</option>
							<?php $lobj_Combo->fGenerar("select * from departamento order by dep_nombre","dep_codigo","dep_nombre",$la_Campos["Departamento"],"");?>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><label >Estatus:</label></td>
					<td>
						<input  requerido="obligatorio" type="radio" id="Estatus1" name="Estatus" value="A"<?php if($la_Campos['Estatus']=="A"){print("checked");}?>/>Activo
						<input  requerido="obligatorio" type="radio" id="Estatus2" name="Estatus" value="I"<?php if($la_Campos['Estatus']=="I"){print("checked");}?>/>Inactivo			</td>
				</tr>
			</table>
			
			<br>
					</div>
			<div Botonera>
				<input type='button' name='Nuevo' value='Nuevo' onclick='f_Nuevo();'/>
				<input type='button' name='Guardar' value='Guardar' onclick='f_Guardar();'/>
				<input type='button' name='Cancelar' value='Cancelar' onclick='f_Cancelar();'/>
				<input type='button' name='Buscar' value='Buscar' onclick='f_Buscar();'/>
				<input type='button' name='Modificar' value='Modificar' onclick='f_Modificar();'/>
				<input type='button' name='Eliminar' value='Eliminar' onclick='f_Eliminar();'/>
				<input type='button' name='Listar' value='Listar' onclick='f_Listar(0,"");'>
				<input type='button' name='Modificar1' value='Modificar y Añadir' onclick='f_ModificarDetalles();'/>
			</div>	
		      
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Cargo");?>
</body>
<script src="JS/Librerias.js"></script>
<script>	
       function f_GuardarDetalles()
       {
		  if(f_Validar()){
		  		fActivar_Campos();
		  		f_Revisar();
		  		form.Operacion.value="GuardarYContinuar";
				form.submit();
			}
	   }

	   function f_ModificarDetalles()
       {
		  if(f_Validar()){
		  		fActivar_Campos();
		  		f_Revisar();
		  		form.Operacion.value="ModificarYContinuar";
				form.submit();
			}
       } 
</script>
</html>
