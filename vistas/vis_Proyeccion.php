<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_Combo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Combo= new cls_Combo();
$la_Campos=$_SESSION["Campos"];
$precargado=$_SESSION['precargado'];
$SeccionAModificar=$_SESSION["SeccionAModificar"];
$la_listados=$_SESSION["matriz"];
if(count($SeccionAModificar["Cuerpo"])!=0){
	$precargado=$SeccionAModificar["Cuerpo"];
	$columnas=count($SeccionAModificar['Detalle']);
}
unset($_SESSION["SeccionAModificar"]);
unset($_SESSION['precargado']);
unset($_SESSION["Campos"]);
unset($_SESSION["matriz"]);
if(count($precargado)==0){
	header("location: vis_ProyeccionSec.php");
}
$idseccion=$SeccionAModificar["Cuerpo"]['Sec'];
//---------------------------Construir el Arreglo Multidimensional en una Cadena de la Seccion a Modificar---------------------------
$arreglo="[";
if(count($SeccionAModificar["Detalle"])<1){
	$arreglo.="]";
}
for($x=0;$x<count($SeccionAModificar["Detalle"]);$x++){
	$arreglo.="[";
	for($y=0;$y<count($SeccionAModificar["Detalle"][$x]);$y++){
		$arreglo.="[";
		$arreglo.="'".$SeccionAModificar["Detalle"][$x][$y]["Dia"]."',";
		$arreglo.="'".$SeccionAModificar["Detalle"][$x][$y]["Bloque"]."',";
		$arreglo.="'".$SeccionAModificar["Detalle"][$x][$y]["Ambiente"]."',";
		$arreglo.="'".$SeccionAModificar["Detalle"][$x][$y]["Materia"]."'";
		$arreglo.="]";
		if($y!=count($SeccionAModificar["Detalle"][$x])-1){
			$arreglo.=",";
		}else{
			$arreglo.="]";
		}
	}
	if($x!=count($SeccionAModificar["Detalle"])-1){
		$arreglo.=",";
	}else{
		$arreglo.="]";
	}
}
//---------------------------------------------------fin de construccion----------------------------------------------------------------s
//Esto es cuando se busca y se crea una cadena para guardar todos los campos del agregar en el detalle y poder mostrarlos
$cadena="";
for($lix=0;$lix<$columnas;$lix++){
	$cadena.='"'.$SeccionAModificar['Detalle'][$lix][0]['Materia'].'","'.$SeccionAModificar['Detalle'][$lix][0]['Docente'].'","'.$SeccionAModificar['Detalle'][$lix][0]['Tope'].'"';
	if($lix!=$columnas-1){
		$cadena.=",";
	} 
}
$lsSql="select m.codmat,m.nommat,(p.codesp || '-' || m.semestre) AS padre from materia as m 
		inner join pensum_pre as p ON(m.idpensum=p.idpensum)
		inner join semestre as s ON(m.semestre=s.idsemestre)
		order by padre";
$lobj_Cuerpo->f_Redireccion();
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<link rel="stylesheet" type="text/css" href="css/horarios.css">
	<style type="text/css">
		iframe{
			width: 1170px;
			height: 560px;
			border: none;
			overflow: auto !important;
		}

		#volver{
			transition:all 0.5s;
			position: fixed;
			width: auto;
			margin-left: -200px;
			margin-top: 500px;
			background-image: url("imagenes/iconos/blanco/eye.png");
			background-repeat: no-repeat;
			background-position: right;
			padding-right: 15px;
			background-color: rgb(41, 56, 140);
		}

		#volver:hover{
			margin-left: -50px;
		}
		
		div#legendObligatorio{
			display: none !important;
		}

		#popUpDiv {
			margin-top: -320px !important;
			height: 640px !important;
		}

		#capaContent {
			overflow: auto !important;
		}

		fieldset table tr td{
			box-shadow: none !important;
		}

		fieldset table tr:first-child{
			background: white !important;
			text-align: left !important;
		}

		fieldset table tr td:first-child{
			background: white !important;
		}

	</style>
	<script type="text/javascript">
		var hacer=<?php print(count($precargado))?>;
		var seccion=<?php print("'".$SeccionAModificar["Cuerpo"]["Sec"]."'")?>;
		if(hacer!=0){
			laCamposAgregados=new Array(<?php print($cadena)?>);
			laNombre=new Array("Seccion","paso1","Columnas","Filas","cmbperaca","cmbperaca","cmbcodesp","cmbcodesp","cmbsemestre","cmbsemestre","cmbseccion","cmbseccion","cmbregimen","cmbregimen");
			laValor=new Array("<?php print($idseccion)?>","bloqueado","<?php print(count($SeccionAModificar['Detalle']))?>","3","<?php print($precargado['cmbperaca']); ?>","bloqueado","<?php print($precargado['cmbcodesp']);?>","bloqueado","<?php print($precargado['cmbsemestre']);?>","bloqueado","<?php print($precargado['cmbseccion']);?>","bloqueado","<?php print($precargado['cmbregimen']);?>","bloqueado");
		}else{
			laCamposAgregados=new Array(<?php print($cadena)?>);
			laNombre=new Array("paso2");
			laValor=new Array("bloqueado");
		}
	</script>
</head>
<body onScroll="bajar()" onload="f_NuevoA()">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<input type='button' id="volver" value='Visualizar Secciones     ' onclick='location.href="vis_ProyeccionSec.php"'>
		<div formulario>
			<h2>Crear Seccion</h2>
		<form name="form1" action="../controladores/cor_Proyeccion.php" id="form1" onsubmit="onEnviar()" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<fieldset id="paso1" name="paso1">
				<legend>Seccion</legend>
							<TABLE >
                  					<tr>
                  						<td align="right"><label>Per&iacute;odo:</label></td>
				                 		<td >  <select name="cmbperaca" tabindex="5" id="cmbperaca" ><option value="-" selected="selected">Seleccione</option>
				                 					<?php $lobj_Combo->fGenerar("SELECT * FROM peraca WHERE (estatus='A')","peraca","nombre","","")?>
				                 				</select> </td>
                  						<td align="right"><label>Carrera:</label></td>
                  						<td ><select name="cmbcodesp" tabindex="5" id="cmbcodesp" >
                  								<option value="-" selected="selected">Seleccione</option>
                  								<?php $lobj_Combo->fGenerar("SELECT * FROM carrera","codesp","nombre","","")?>
                  							</select>  
                  					
                  					</td>
                  				 </tr>
				                 <tr>
				                 	<td align="right"><label>Semestre:</label></td>
				                 	<td ><select name="cmbsemestre" onchange="f_ListaDependienteDoble('cmbcodesp','cmbsemestre','cmbcodmat')"tabindex="5" id="cmbsemestre" >
				                 			<option value="-" selected="selected">Seleccione</option>
				                 				<?php $lobj_Combo->fGenerar("SELECT * FROM semestre","idsemestre","nombre","","")?>
				                 		</select>
				                 	</td>
				                 	<td align="right"><label>Secci&oacute;n:</label></td>
				                 	<td >  <select name="cmbseccion" tabindex="5" id="cmbseccion" ><option value="-" selected="selected">Seleccione</option>
				                 				<?php $lobj_Combo->fGenerar("SELECT * FROM seccion","idseccion","nombre","","")?>
				                 			</select>  </td>
				                 </tr>  
				                 <tr>
				                 	<td align="right"><label>Turno:</label></td>
				                 	<td >  <select  name="cmbregimen" tabindex="5" id="cmbregimen" ><option value="-" selected="selected">Seleccione</option>
				                 				<?php $lobj_Combo->fGenerar("SELECT * FROM regimen","idregimen","tipo_turno","","")?>
				                 			</select> </td>
				                 </tr>    
							</TABLE>
							<input type="button" onclick="cambioDePaso(1)" value="Paso 2">
			</fieldset>	
			<fieldset id="paso2" name="paso2">
				<legend>Materias</legend>
				<input type="button" onclick="cambioDePaso(2)" value="Deshacer">
				<table>
					<tr>
						<td><select id="cmbcodmat" >
								<option value="-">Seleccione Materia</option>
								<?php $lobj_Combo->fGenerar($lsSql,"codmat","nommat","","padre")?>
							</select>
						</td>
						<td><select id="docente">
								<option value="-">Seleccione Docente</option>
								<?php $lobj_Combo->fGenerar("SELECT d.cedula_doc,(p.nombre1 || ' ' || p.apellido1) AS nombres FROM docente AS d INNER JOIN persona AS p ON(p.cedula=d.cedula_doc)","cedula_doc","nombres","","padre")?>
							</select>
							<input type="button" id="btnBuscar"  onclick="f_CambioIFrame('1')"> 
						</td>
						<td><input style="width:auto; margin-right:5px;" type="button" value="seleccionar bloques"  onclick="f_CambioIFrame()" id="Visualizar"></td>
					</tr>
				</table>
			</fieldset>
			
			<input type="hidden" name="Columnas" value="<?php print($la_Campos['Columnas']);?>" id="Columnas">
			<input type="hidden" name="Filas" value="3">	
			<input type="hidden" name="Seccion" >	
				
			 	<div id="agregar" style="width:100%"></div>
				<input name="variable" id="variable"  type="hidden">
				
		<div id="contenedorHorario"> </div>
		</div>
			<div Botonera>
				<input type='button' name='Nuevo' value='Nuevo' onclick='f_NuevoA();'/>
				<input type='button' name='Guardar' value='Guardar' onclick='f_GuardarA();'/>
				<input type='button' name='Cancelar' value='Cancelar' onclick='f_Cancelar();'/>
				<input type='hidden' name='Buscar' value='Buscar' onclick='f_Buscar();'/>
				<input type='hidden' name='Modificar' value='Modificar' onclick='f_Modificar();'/>
				<input type='hidden' name='Eliminar' value='Eliminar' onclick='f_Eliminar();'/>
				<input type='hidden' name='Listar' value='Listar' onclick='f_Listar(0,"");'>
			</div>	
		</form>
	</div>

	<?php $lobj_Cuerpo->f_Pie();?>

		<div id='capaPopUp'></div>
		<div id='popUpDiv'>
			<div titulo > 
				<h id='Titulo'>Visualizacion de Bloques Ocupados</h>
				<input type='button' id='cerrar' value='X' title='Cerrar' />
			</div>
			<div id='capaContent'>
				<iframe id="frame" src="" >
				</iframe>
			</div>
		</div>
</body>
<script type="text/javascript" src='JS/horarios.js'></script>
<script language="javascript" src="JS/controlDeArreglosProyeccion.js"></script>
<script language="javascript">
			var b=0;
			var arregloDocentes= new Array();
			function f_NuevoA(){
				f_Nuevo();
				f_ManejoDeTransacciones();
				if(document.form1.Columnas.value!=0){
					arreglo=<?php print($arreglo);?>;
					contAgregados=<?php print(count($SeccionAModificar["Detalle"]));?>
				}
				f_ValidarComboMateria()
			}
			function f_GuardarA(){
				if(b>0){
					f_Guardar();						
				}else{
					f_MostrarMensaje("Agregue Una Materia","Alerta",document.getElementsByTagName('fieldset')[1]);
				}
			}
			function f_CambioIFrame(num){
				var popUp=document.getElementById("abrirPop");
				var frame=document.getElementById("frame");
				if(num==1){
					frame.src="vis_Buscar.php?buscar";
					popUp.click();		
				}else{
					if(document.getElementById("cmbcodmat").value=="-"){
						f_MostrarMensaje("Debe seleccionar materia antes de continuar","Alerta",document.getElementById("paso2"));
					}else if(document.getElementById("docente").value=="-"){
						f_MostrarMensaje("Debe seleccionar docente antes de continuar","Alerta",document.getElementById("paso2"));
					}else{
						frame.src="vis_Visualizacion.php?buscar="+document.getElementById("cmbcodmat").value;
						document.getElementById('Titulo').textContent=document.getElementById('cmbcodmat').options[document.getElementById('cmbcodmat').selectedIndex].text;
						popUp.click();					
					}	
				}
			}
			function agregar(){
				var contenedor=document.getElementById("agregar");
				var newElement=document.createElement('div');
				celda1="<select id='newCamp0-"+b+"' name='newCamp0-"+b+"' disabled='disabled'/><?php $lobj_Combo->fGenerar($lsSql,"codmat","nommat","","padre")?></select>";
				celda2="<select id='newCamp1-"+b+"' name='newCamp1-"+b+"'disabled='disabled' /><?php $lobj_Combo->fGenerar("SELECT d.cedula_doc,(p.nombre1 || ' ' || p.apellido1) AS nombres FROM docente AS d INNER JOIN persona AS p ON(p.cedula=d.cedula_doc)","cedula_doc","nombres","","padre")?></select>";
				celda3="<input type='text' id='newCamp2-"+b+"' name='newCamp2-"+b+"' disabled='disabled'>";
				celda4="<input type='button' value='Eliminar' onclick='eliminarEl(this)'><input type='button' onclick='modificar(this)' value='Modificar'>"
				newElement.innerHTML=celda1+celda2+celda3+celda4;
				newElement.id="Registro"+b;	
				newElement.setAttribute("tipo","Agregado");			
				contenedor.appendChild(newElement);
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
			function modificar(elemento){
				var contenedor = elemento.parentNode;
				document.getElementById("docente").value=contenedor.firstChild.nextSibling.value;
				document.getElementById("cmbcodmat").value=contenedor.firstChild.value;
				document.getElementById("Visualizar").click();
			}
			function f_ListaDependienteDoble(padre1,padre2,id){
				var hijo=document.getElementById(id);
				var padre =document.getElementById(padre1).value+"-"+document.getElementById(padre2).value;
				for(var x=1;x<hijo.options.length;x++){
					hijo.options[x].style.display="none";
					if(hijo.options[x].className=="hijo "+padre){
						hijo.options[x].style.display="block";
					}
				}
			}
			function cambioDePaso(num){
				var fieldsetDesactivado;
				var fieldsetActivado;
				if(num==1){
					fieldsetDesactivado=document.getElementById("paso1");
					fieldsetActivado=document.getElementById("paso2");
					if(!f_validarPaso()){
						fieldsetActivado.disabled=false;
						fieldsetDesactivado.disabled=true;
						document.form1.Operacion.value="incluir";
					}
				}else{
					fieldsetDesactivado=document.getElementById("paso2");
					fieldsetActivado=document.getElementById("paso1");
					f_ListaDependienteDoble('cmbcodesp','cmbsemestre','cmbcodmat');
		       	   	if(form.Columnas){
		       	   		if(form.Columnas.value!=""){
		       	   			var columnas=parseInt(form.Columnas.value);
		       	   			var filas=0;
		       	   			if((form.Filas.value=="")||(form.Filas.value==0)){
		       	   				filas=parseInt(1);
		       	   			}else{
		       	   				filas=parseInt(form.Filas.value);
		       	   			}
		       	   			for(var y=0;y<columnas;y++){
		       	   				eliminar(form.elements["newCamp0-"+y]);
		       	   			}
		       	   		}
		       	   	}
		       	   	document.getElementById("cmbcodmat").value="-";
		       	   	document.getElementById("docente").value="-";
		       	   	document.getElementById("tope").value="";
					fieldsetActivado.disabled=false;
					fieldsetDesactivado.disabled=true;
				}
			}
			function f_validarPaso(){
				lb_validar=false;
				if(form.cmbperaca.value=="-"){
					lb_validar=true;
				}else if(form.cmbcodesp.value=="-"){
					lb_validar=true;
				}else if(form.cmbsemestre.value=="-"){
					lb_validar=true;
				}else if(form.cmbseccion.value=="-"){
					lb_validar=true;
				}else if(form.cmbregimen.value=="-"){
					lb_validar=true;
				}
				if(lb_validar){
					f_MostrarMensaje("los campos deben estar llenos para poder avanzar","Error");
				}
				return lb_validar; 
			}
    </script>
<script src="JS/Librerias.js"></script>
</html>
