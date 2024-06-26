<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_Combo.php");
$lobj_Cuerpo = new cls_Cuerpo();
$lobj_Combo = new cls_Combo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
include_once("../clases/cls_Combo.php");

if(!isset($la_Campos['preguntas'])){
	if(isset($_SESSION['usuario']['Nombre'])){
		echo "
			<script type='text/javascript'>
				location.href='vis_Salir.php';
			</script>
		";
	}else{
		echo "
			<script type='text/javascript'>
				location.href='../index.php';
			</script>
		";
	}
}
if($la_Campos["CantPre"]<$la_Campos["Columnas"]){
	$la_Campos['Columnas']=$la_Campos["CantPre"];
}
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script>
		laNombre=new Array("Usuario");
		laValor=new Array("bloqueado");
		//guardo la cantidad de respuestas acertada permitidas a js
		laCantResp=<?php print($la_Campos['CantResp']); ?>;
		//paso todas las preguntas de php a js para posteriror comparacion
		laPreguntas=[<?php 
						for($x=0;$x<count($la_Campos['preguntas']);$x++){
							if($x!=0){
								print(',');
							}
							print("'".$la_Campos["preguntas"][$x]['Pregunta']."'");
						} 
					?>];	
	</script>
</head>
<body onload="arranque()">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<div Contenedor>
		<div formulario>
			<h2>Recuperar Clave <a href='vis_Salir.php' ><input msg='Salir' type='button' title='Cerrar Sesion' class='cerrar_se'></a></h2>
		<form  action="../controladores/cor_RecuperarClave.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>
			<input type="hidden" value="<?php print($la_Campos['Columnas']); ?>" name="Columnas">
			<table id="agregar">
				<tr>
					<td align="left"><label >Usuario:</label><input type="text" validar=" " id="Usuario" name="Usuario"/></td>
				</tr>
			</table>

		</div>
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script type="text/javascript" >
var b=0;
	var conexionBasica;
	function arranque(){
		form=document.forms[0];
		form.Usuario.value="<?php print($la_Campos['Nombre']) ?>";
		form.Usuario.disabled=true;
		var columnas=form.Columnas.value;
		for(var x=0;x<laPreguntas.length;x++){
			agregar();
		}
		//luego de Agregar Las Preguntas Agrego el boton
		var botonEnviar=document.createElement('input');
		botonEnviar.type="button";
		botonEnviar.value="Enviar";
		botonEnviar.id="Enviar";
		botonEnviar.onclick=validarPreguntas;
		//busca la tabla donde agregare el boton
		var contenedor=document.getElementById("agregar");
		contenedor.appendChild(botonEnviar);

	}
	function validarPreguntas(){
		var validado=0;
		form=document.forms[0];
		for(var x=0;x<form.length;x++){
			if((form[x].type=="text")&&(form[x].value=="")){
				validado++;
			}
		}
		if(validado==0){
			form.Usuario.disabled=false;
			form.Operacion.value="ValidarPreguntas";
			for(var x=0;x<form.length;x++){
				if((form[x].nodeName.toLowerCase()=="input")&&(form[x].type.toLowerCase()=="text")){
					form[x].value=form[x].value.toUpperCase();
				}
			}
			document.forms[0].submit();
		}else{
			f_MostrarMensaje('Por Favor Rellene Todos Los Campos','Alerta','','','si');
		}
	}
	function agregar(){
		var contenedor=document.getElementById("agregar");
		var newElement=document.createElement('div');
		celda1=laPreguntas[b];
		celda2="<input type='text' name='respuesta-"+b+"' placeholder='Respuesta Secreta N°"+(parseInt(b+1))+"'>";
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
	if(isset($_SESSION["Mensaje"])){
		echo "
			<script type='text/javascript'>
				f_MostrarMensaje('".$_SESSION['Mensaje']."','Info','','','si');
			</script>
		";
		unset($_SESSION["Mensaje"]);
	}
	?>
</html>
