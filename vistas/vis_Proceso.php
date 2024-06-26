<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
include_once("../clases/cls_Combo.php");
$lobj_Combo = new cls_Combo(); 
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Tipo_proceso","Fecha_Ini","Fecha_Fin","Periodo_Academico","Estatus","Tipo_Pro","Peraca");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
$sql="	SELECT tp.* FROM tipo_proceso AS tp 
		INNER JOIN permiso_proceso AS p ON(tp.idtipo_pro=p.fk_tippro_codigo)
		WHERE fk_car_codigo=(SELECT car_codigo FROM cargo WHERE car_nombre='".$_SESSION['usuario']['Cargo']."')";
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		peraca="";
		laNombre=new Array("Estatus1","Estatus1","Estatus2","Peraca","Peraca");
		laValor=new Array("checked","bloqueado","bloqueado","bloqueado","<?php print($_SESSION['peraca'])?>");
	</script>
	<!-- archivos para el calendario-->
	<script src="JS/jscal2.js"></script>
    <script src="JS/es.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jscal2.css" />
    <link rel="stylesheet" type="text/css" href="css/border-radius.css" />
    <link rel="stylesheet" type="text/css" href="css/steel.css" /> 
</head>
<body onload="cargarProceso(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Abrir Proceso</h2>
		<form name="form1" action="../controladores/cor_Proceso.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<table>
				<tr>
					<td align="right"><label>Tipo de Proceso a Abrir:</label></td>
					<td>
						<select name="Tipo_Pro" validar=" " onblur="f_PerderFocusCombo(this);">
							<option value="-">Seleccione</option>
							<?php $lobj_Combo->fGenerar($sql,"idtipo_pro","nombre",$la_Campos['Tipo_Pro'],""); ?>
						</select >
					</td>
				</tr>
				<tr>
					<td align="right"><label>Período Académico:</label></td>
					<td>
						<select name="Peraca" validar=" ">
							<option value="-">Seleccione</option>
							<?php $lobj_Combo->fGenerar("SELECT * FROM peraca WHERE(borrado='I')","peraca","nombre",$la_Campos['Peraca'],""); ?>
						</select >
					</td>
				</tr>
				<tr>
					<td align="right"><label>Fecha de Inicio:</label></td>
					<td><input id="f_date1" type="text" validar="fecha inicio" name="Fecha_Ini" value="<?php print($la_Campos['Fecha_Ini']);?>"/><i id="f_date3" class="icon32 icon-blue icon-date"></i></td>
				</tr>
				<tr>
					<td align="right"><label>Fecha de Cierre:</label></td>
					<td><input id="f_date2" type="text" validar="fecha fin" name="Fecha_Fin" onblur="verificarPeraca(this)" value="<?php print($la_Campos['Fecha_Fin']);?>"/><i id="f_date4" class="icon32 icon-blue icon-date"></i></td>
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
		<div Botonera>
				<input type='button' name='Nuevo' value='Nuevo' onclick='f_Nuevo();'/>
				<input type='button' name='Guardar' value='Guardar' onclick='f_Guardar();'/>
				<input type='button' name='Cancelar' value='Cancelar' onclick='f_NCancelar();'/>
				<input type='hidden' name='Buscar' value='Buscar' onclick='f_Buscar();'/>
				<input type='hidden' name='Modificar' value='Modificar' onclick='f_Modificar();'/>
				<input type='button' name='Eliminar' value='Eliminar' onclick='f_NEliminar();'/>
				<input type='button' name='Listar' value='Listar' onclick='f_Listar(0,"");'>
			</div>	
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
	<?php $lobj_Cuerpo->f_Listar($la_listados,$la_Nombres,$la_Campos["pg"],$la_Campos["valor"],"Proceso");?>
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
<script type="text/javascript">
<?php 	
	if(isset($_SESSION['mensaje'])){
		$mensaje=$_SESSION['mensaje'];
		unset($_SESSION['mensaje']);
		print("f_MostrarMensaje('$mensaje','Error','','110px','si');");
	}
?>
var conexion;
function f_NEliminar(){
	form.Tipo_Pro.disabled=false;
	f_Eliminar();
}
function f_NCancelar(){
	if(document.getElementById('padre')){
		var padre=document.getElementById('padre');
		var holgura=document.getElementById('holgura');
		padre.parentNode.removeChild(padre);
		holgura.parentNode.removeChild(holgura);
	}
	f_Cancelar();
}
function cargarProceso(x){
	cargar(x);
	if((form.Hay.value=="0")&&(form.Operacion.value=="incluir")&&(form.Hacer.value=="incluir")){
		verificarPadre(form.Tipo_Pro.value);
	}else if((form.Hay.value=="1")&&(form.Operacion.value=="buscar")){
		//verificarPadre(form.Tipo_Pro.value);
	}
}
function verificarPadre(proceso){
	if(document.getElementById('padre')){
		var padre=document.getElementById('padre');
		var holgura=document.getElementById('holgura');
		padre.parentNode.removeChild(padre);
		holgura.parentNode.removeChild(holgura);
	}
	var ruta="../controladores/cor_Proceso.php";
	conexion=crearXMLHttpRequest();
	conexion.onreadystatechange = respVerificacion;
	conexion.open('POST',ruta, true);
	conexion.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("verificarPadre")+"&Hijo="+encodeURIComponent(proceso);
	document.forms[0].Fecha_Ini.disabled=true;
	document.forms[0].Fecha_Fin.disabled=true;
	//ejecuto el envio
	conexion.send(envio);
}
function respVerificacion(){
	if(conexion.readyState == 4){		
		var xml=conexion.responseXML;
		var Padre=xml.getElementsByTagName('NombrePadre')[0].textContent;
		document.forms[0].Fecha_Ini.disabled=false;
		document.forms[0].Fecha_Fin.disabled=false;
		peraca=verificarFecha(xml.getElementsByTagName('FechaPeraca')[0].textContent,"d-m-Y");
		if(xml.getElementsByTagName('padre')[0].textContent!="1"){
			if(Padre!=""){
				var mensaje="No Existe Un Proceso de "+Padre+" Abierto en este Periodo Academico.\n";
				mensaje+=" Por favor espere a haya un proceso del mismo abierto en este Periodo Academico ";
				f_MostrarMensaje(mensaje,"Error","","110px","si");
				document.forms[0].Tipo_Pro.value="-";
			}
		}else{
			var fecha=xml.getElementsByTagName('FechaPadre')[0].textContent;
			fecha=verificarFecha(fecha,"d-m-Y");
			document.forms[0].Fecha_Ini.value=fecha;
			document.forms[0].Fecha_Ini.disabled=true;
			//creo la tupla donde estara la fecha del proceso padre
			var tuplaPadre=document.createElement('tr');
			tuplaPadre.id="padre";
			tuplaPadre.innerHTML="<td align='right'><label>Fecha de Proceso Padre:</label></td><td><input type='text' name='fechaPadre' value='"+fecha+"' disabled='true'></td>";
			//luego la tupla donde estara el tiempo de holgura
			var tuplaHolgura=document.createElement('tr');
			tuplaHolgura.id="holgura";
			tuplaHolgura.innerHTML="<td align='right'><label>Tiempo de Holgura</label></td><td><input type='text' name='Holgura' value='"+xml.getElementsByTagName('Holgura')[0].textContent+"' disabled></td>";
			var tuplaDuracion=document.createElement('tr');
			tuplaDuracion.id="duracion";
			tuplaDuracion.innerHTML="<td align='right'><label>Tiempo de Duracion</label></td><td><input type='text' name='Duracion' value='0' onkeyup='holgura(this.value,0)' ></td>";
			var table=document.getElementsByTagName('table')[0].childNodes[1];
			//limpio el arreglo de los nodos de texto entre los nodos reales
			for(var x=0;x<table.childNodes.length;x++){
				var nodo=table.childNodes[x];
				if(nodo.nodeName.toLowerCase()=="#text"){
					table.removeChild(nodo);
				}
			}
			table.insertBefore(tuplaDuracion,table.childNodes[2]);
			table.insertBefore(tuplaHolgura,table.childNodes[2]);
			table.insertBefore(tuplaPadre,table.childNodes[2]);
			holgura(form.Holgura.value,1);
			//SI se encuentra en modificacion me calcula el valor de holgura
			if((form.Hay.value=="1")&&(form.Operacion.value=="buscar")){
				form.Holgura.value=restarFechas(form.fechaPadre.value,form.Fecha_Ini.value);
			}			
		}
	}
}
function holgura(dias,tipo){
	dias=(dias=="")?parseInt(0):parseInt(dias);
	var fecha;
	if(tipo==0){
		fecha=verificarFecha(document.forms[0].Fecha_Ini.value,"Y-m-d");
	}else{
		fecha=verificarFecha(document.forms[0].fechaPadre.value,"Y-m-d");	
	}
	fecha=fecha.replace("-", "/").replace("-", "/");	  
 
	fecha= new Date(fecha);
	fecha.setDate(fecha.getDate()+dias);
	var anio=fecha.getFullYear();
	var mes= fecha.getMonth()+1;
	var dia= fecha.getDate();
	 
	if(mes.toString().length<2){
		mes="0".concat(mes);        
	}    
	 
	if(dia.toString().length<2){
		dia="0".concat(dia);        
	}
	if(tipo==0){
		document.forms[0].Fecha_Fin.value=dia+"-"+mes+"-"+anio;
		document.forms[0].Fecha_Fin.disabled=true;
	}else{
		document.forms[0].Fecha_Ini.value=dia+"-"+mes+"-"+anio;
	}
}
function verificarFecha(fecha,patron){
	fecha=fecha.replace("-", "/").replace("-", "/");	  
	if(patron=="Y-m-d"){
		if(isNaN(fecha.substr(2,1))){
			var d=fecha.substr(0,2);
			var m=fecha.substr(3,2);
			var a=fecha.substr(6,4);
			fecha=a+"-"+m+"-"+d;
		}
	}else if(patron=="d-m-Y"){
		if(!isNaN(fecha.substr(2,1))){
			var a=fecha.substr(0,4);
			var m=fecha.substr(5,2);
			var d=fecha.substr(8,2);
			fecha=d+"-"+m+"-"+a;
		}
	}else if(patron=="m-d-Y"){
		if(isNaN(fecha.substr(2,1))){
			var m=fecha.substr(0,2);
			var d=fecha.substr(3,2);
			var a=fecha.substr(6,4);
			fecha=a+"-"+m+"-"+d;
		}
	}
	fecha=fecha.replace("/", "-").replace("/", "-");
	return fecha;
}
function verificarPeraca(fecha){
	var fecha1= new Date(verificarFecha(peraca,"Y-m-d"));
	var fecha2= new Date(verificarFecha(fecha.value,"Y-m-d"));
	if((isValidDate(fecha1))&&(isValidDate(fecha2))){
		if(fecha1<fecha2){
			f_MostrarMensaje("La fecha de cierre no puede ser mayor a la fecha final del Periodo Academico("+peraca+")","Alerta",document.getElementsByTagName("h2")[0]);
			fecha.value="";
		}
	}else{
		f_MostrarMensaje("formato de fechas invalido("+fecha.value+"/"+peraca+")","Alerta",document.getElementsByTagName("h2")[0]);
		fecha.value="";
		fecha.focus();
	}
}
function restarFechas(f1,f2){
	var aFecha1 = f1.split('-'); 
 	var aFecha2 = f2.split('-');  
 	var fFecha1 = Date.UTC(aFecha1[2],aFecha1[1]-1,aFecha1[0]); 
 	var fFecha2 = Date.UTC(aFecha2[2],aFecha2[1]-1,aFecha2[0]);
 	var dif = fFecha2 - fFecha1;
 	var dias = Math.floor(dif / (1000 * 60 * 60 * 24)); 
 return dias;
}
</script>
</html>
