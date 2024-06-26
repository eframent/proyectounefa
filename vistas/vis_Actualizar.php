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
$la_Nombres=Array();
$cadena="";
$columnas=$la_Campos["Columnas"];
for($lix=0;$lix<$columnas;$lix++){
	$cadena.='"'.$la_Campos['Preguntas'][$lix].'","'.$la_Campos['Respuestas'][$lix].'"';
	if($lix!=$columnas-1){
		$cadena.=",";
	} 
}
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laCamposAgregados=new Array(<?php print($cadena)?>);
		laNombre= new Array("Nacio","Cedula");
		laValor= new Array("bloqueado","bloqueado");
	</script>
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<div Contenedor>
		<div formulario>
			<h2>Actualizar Datos Personales <a href='vis_Salir.php' ><input msg='Salir' type='button' title='Cerrar Sesion' class='cerrar_se'></a></h2>
		<form name="form1" action="../controladores/cor_Actualizar.php" method="POST" >
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right" colspan="1"><label>Cédula:</label></td>
					<td colspan="3">
						<select name='Nacio' id="nacionalidad">
							<option value="V" <?php if($la_Campos['Nacio']=="V"){print("selected='selected'");}?>>V</option>
							<option value="E" <?php if($la_Campos['Nacio']=="E"){print("selected='selected'");}?>>E</option>
						</select>
						<input  type="text" name="Cedula" validar="solo numeros"  value="<?php print($la_Campos['Cedula']);?>" onblur="f_PerderFocus();"/>
					</td>
				</tr>
				<tr>
					<td align="right"><label >Primer Nombre:</label></td>
					<td><input type="text" name="Nombre1" validar=" " value="<?php print($la_Campos['Nombre1']);?>"/></td>
					<td align="right"><label>Segundo Nombre:</label></td>
					<td><input type="text" name="Nombre2" value="<?php print($la_Campos['Nombre2']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label >Primer Apellido:</label></td>
					<td><input  type="text" name="Apellido1" validar=" " value="<?php print($la_Campos['Apellido1']);?>"/></td>
					<td align="right"><label>Segundo Apellido:</label></td>
					<td><input  type="text" name="Apellido2" value="<?php print($la_Campos['Apellido2']);?>"/></td>
				</tr>
				<tr>
					<td align="right"><label>Fecha de Nacimiento:</label></td>
					<td><input type="text" name="Fecha_Nac" validar="fecha" validar="solo letras" value="<?php print($la_Campos['Fecha_Nac']);?>"/></td>
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
					<td align="right"><label>Telefono:</label></td>
					<td><input  type="text" name="Telefono" value="<?php print($la_Campos['Telefono']);?>"/></td>
				</tr>

				<tr>
					<td align="right"><label>Estado:</label></td>
					<td>
						<select validar=" " id="estado" name="Estado" onChange="f_ListaDependiente(this,'municipio');">
							<option value="-" >Seleccione</option>
							<?php $lobjCombo->fGenerar("SELECT * FROM estado WHERE (borrado='I') ORDER BY nombre_e","idestado","nombre_e",$la_Campos['Estado'],"")?>
						</select>
					</td>
					<td align="right"><label>Municipio:</label></td>
					<td>
						<select validar=" " id="municipio" dependiente="dependiente" name="Municipio" onChange="f_ListaDependiente(this,'parroquia');">
							<option value="-" >Seleccione</option>
							<?php $lobjCombo->fGenerar("SELECT * FROM municipio WHERE (borrado='I') ORDER BY nombre_m","idmunicipio","nombre_m",$la_Campos['Municipio'],"idestado")?>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><label>Parroquia:</label></td>
					<td>
						<select validar=" " id="parroquia" dependiente="dependiente" name="Parroquia" onChange="f_ListaDependiente(this,'ciudad');">
							<option value="-" >Seleccione </option> 
							<?php $lobjCombo->fGenerar("SELECT * FROM parroquia WHERE (borrado='I') ORDER BY nombre_p","idparroquia","nombre_p",$la_Campos['Parroquia'],"idmunicipio")?>
						</select>
					</td>
					<td align="right"><label>Ciudad:</label></td>
					<td>
						<select validar=" " id="ciudad" dependiente="dependiente" name="Ciudad" >
							<option value="-" >Seleccione </option>
							<?php $lobjCombo->fGenerar("SELECT * FROM ciudad WHERE (borrado='I') ORDER BY nombre","idciudad","nombre",$la_Campos['Ciudad'],"idparroquia")?>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><label >Direccion:</label></td>
					<td><textarea name='Direccion'><?php print($la_Campos['Direccion']);?></textarea></td>
					<td  align="right"><label>Sexo:</label></td>
					<td>
						<input validar=" " type="radio" id="Sexo1" name="Sexo" value="M" <?php if ($la_Campos["Sexo"] == "M") {  print("checked"); } ?>>Masculino
						<input validar=" " type="radio" id="Sexo2" name="Sexo" value="F" <?php if ($la_Campos["Sexo"] == "F") {  print("checked"); } ?>>Femenino
					</td>
				</tr>
				<tr>
					<td align="right"><label >Contraseña:</label></td>
					<td><input type="password" validar=" "  name="Contrasena"/></td>
					<td align="right"><label >Reingrese Contraseña:</label></td>
					<td><input type="password" validar="contrasena1"  name="Contrasena1" /></td>
				</tr>
				<tr>
					<td align="right"><label >Correo Electronico:</label></td>
					<td><input type="text" name="Correo" validar=" " value="<?php print($la_Campos['Correo']);?>"/></td>
				</tr>
				
			</table>	

				<div id="agregar" style="width:100%"></div>
		</div>
			<div Botonera>
				<input type='hidden' name='Nuevo' value='Nuevo' onclick='f_Nuevo();'/>
				<input type='button' name='Guardar' value='Guardar' onclick='f_Guardar();'/>
				<input type='hidden' name='Cancelar' value='Cancelar' onclick='f_Cancelar();'/>
				<input type='hidden' name='Buscar' value='Buscar' onclick='f_Buscar();'/>
				<input type='button' name='Modificar' value='Modificar' onclick='f_Modificar();'/>
				<input type='hidden' name='Eliminar' value='Eliminar' onclick='f_Eliminar();'/>
				<input type='hidden' name='Listar' value='Listar' onclick='f_Listar(0,"");'>
			</div>	
			<input	type='hidden' name='Columnas' id='Columnas' value="<?php print($la_Campos['Columnas']);?>">
			<input	type='hidden' name='Filas' id='Filas' value="2">
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script type="text/javascript">
	var b=0;
	function agregar(){
				var contenedor=document.getElementById("agregar");
				var newElement=document.createElement('div');
				celda1="<input type='text' validar=' ' name='newCamp0-"+b+"' placeholder='Pregunta Secreta N°"+(parseInt(b+1))+"'>";
				celda2="<input type='text' validar=' ' name='newCamp1-"+b+"' placeholder='Respuesta Secreta N°"+(parseInt(b+1))+"'>";
				newElement.innerHTML=celda1+celda2;
				newElement.id="Registro"+b;	
				newElement.setAttribute("tipo","Agregado");	
				contenedor.appendChild(newElement);
				alert
				b++;
			}
			function eliminar(oldElement){
				var divContenedor=oldElement.parentNode;				
				if(contAgregados!="0"){
					eliminarElemento(divContenedor.firstChild.value);
				}
				divContenedor.parentNode.removeChild(divContenedor);
				gestionDeRegistros();
				b--;
				document.getElementById("Columnas").value=contAgregados;
				document.getElementById("variable").value=arreglo;
			}
			function gestionDeRegistros(){
				var Registro;
				var Campo;
				//recorro todos los elementos agregados
				for(var x=0;x<b;x++){
					//pregunto si existe
					if(!document.getElementById("Registro"+x)){
						//pregunto si el registro siguiente existe
						if(document.getElementById("Registro"+parseInt(x+1))){
							//lo ubico 
							Registro=document.getElementById("Registro"+parseInt(x+1));
							//le bajo un espacio
							Registro.id="Registro"+x;

							Campo=Registro.firstChild;
							for(var y=0;y<Registro.childNodes.length-2;y++){
								if(y!=0){
									Campo=Campo.nextSibling;
								}
								Campo.name="newCamp"+y+"-"+x;
								Campo.id="newCamp"+y+"-"+x;
							}
						}
					}
				}
			}
</script>
<script src="JS/Librerias.js"></script>
<?php
	if(isset($_SESSION["usuario"]["Mensaje"])){
		if(strtolower($_SESSION["usuario"]["Mensaje"])=="acceso realizado con exito"){
			$Clase="Info";
		}else{
			$Clase="Error";
		}
		echo "
			<script type='text/javascript'>
				f_MostrarMensaje('".$_SESSION['usuario']['Mensaje']."','$Clase','','','si');
			</script>
		";
		unset($_SESSION["usuario"]["Mensaje"]);
	}
	?>
</html>
