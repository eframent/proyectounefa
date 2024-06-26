<?php
include_once("../clases/cls_Carga_Menu.php");
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/cls_Combo.php");
$lobj_Combo= new cls_Combo();
$lobj_Cuerpo = new cls_Cuerpo();
$lobj_Carga= new cls_Carga_Menu;
$Nombre=$_GET['Nombre'];
if(!$Nombre){
	$Nombre="vacio";
}
$lobj_Carga->f_Carga($Nombre);
$lobj_Cuerpo->f_Redireccion('estudiante');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<?php $lobj_Cuerpo->f_Librerias();?>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>UNEFA-Solicitudes</title>
		<meta name="keywords" content="php" />
		<link rel="stylesheet" type="text/css" href="css/upload.css">
		<script type="text/javascript">cargo="<?php print($Nombre); ?>"</script>
	</head>
	
	<body onload="mostrar();">
		<?php $lobj_Cuerpo->f_Cabecera();?>
		<?php $lobj_Cuerpo->f_Menu();?>
		<div Contenedor >
			<form name="form1" method="POST" action="../controladores/cor_Solicitudes.php">
			<div formulario style="margin:20px auto; overflow:hidden;" > 
				<h2>Gestion de Solicitudes</h2>
				<input type="hidden" name="Solicitudes" id="solicitud">	
				<input type="hidden" name="Operacion" value="incluir">	
				<fieldset style="color:black; width:45%; ">
					<legend>Tipo de Solicitud</legend>
					<input type="checkbox" name="Seleccion" onclick="Solicitar(this)" id="seleccion1" value="R">
					<label>Reingreso</label><br>
					<input type="checkbox" name="Seleccion" onclick="Solicitar(this)" id="seleccion2" value="T">
					<label>Traslado</label><br>
					<input type="checkbox" name="Seleccion" onclick="Solicitar(this)" id="seleccion3" value="C">
					<label>Cambios</label><br>
						<div id="cambios" style="height:0px; width:90%; overflow:hidden; margin:-15px 0px 15px 40px; box-shadow:none; border:none"> 
							<fieldset style="color:black;">
								<label>De Regimen</label>
								<select name='Regimen' id='textRegimen' onchange="cambiosText()">
									<option value="-" selected="selected">Seleccione</option>
									<?php $lobj_Combo->fGenerar("SELECT * FROM regimen","idregimen","tipo_turno","","")?>
				                 </select><br>
								<label>De Carrera</label>								
								<select name='Carrera' id='textCarrera' onchange="cambiosText()">
									<option value="-" selected="selected">Seleccione</option>
                  					<?php $lobj_Combo->fGenerar("SELECT * FROM carrera","codesp","nombre","","")?>
                  				</select><br>
							</fieldset>	
						</div>
					<input type="checkbox" name="Seleccion" onclick="Solicitar(this)" id="seleccion" value="M">
					<label>Cancelación de Matricula(Retiro)</label><br>
						<div id="retiros" style="height:0px; width:90%; color:black; overflow:hidden; margin:10px 40px; box-shadow:none; border:none">
							<fieldset style="color:black;">
								<input type="radio" name="Seleccion" onclick="Solicitar(this)" id="seleccion6" value="RPS" >
								<label>Retiro por Motivo de Salud(RPS)</label><br>
								<input type="radio" name="Seleccion" onclick="Solicitar(this)" id="seleccion7" value="RMS" >
								<label>Retiro por Motivo de Servicio(RMS)</label><br>
								<input type="radio" name="Seleccion" onclick="Solicitar(this)" id="seleccion8" value="RPV" >
								<label>Retiro por Voluntad Propia(RPV)</label><br>
							</fieldset>	
						</div>
						<label>Motivo</label><br>
						<textarea name="Motivo" id="Motivo" onkeyup="activarEnvio()"></textarea><br>
					<input type="button" value="Seleccione Uno" id="cambio" onclick="Siguiente()" style="width:110px">
				</fieldset>
	            <fieldset id="field2">
	                <legend>Instrucciones</legend>
	                <p id="p1" ><h8>1</h8> Selecciona la Solicitud a Realizar</p>
	                <p id="p2" ><h8>2</h8> Presionar el boton Solicitar e Imprimir el Formato resultante</p>
	                <p id="p3" ><h8>3</h8> Firmar el formato y llevarlo a el Departamento de Secretaria</p>
	            </fieldset>
			</div>
			</form>
		</div>
		<?php $lobj_Cuerpo->f_Pie();?>
	</body>

	<script src="JS/Mensajes.js"></script>
	<?php
	if(isset($_SESSION['Campos']['Mensaje'])){
		echo "
			<script type='text/javascript'>
				f_MostrarMensaje('".$_SESSION['Campos']['Mensaje']."','Info','','','no');
			</script>
		";
		unset($_SESSION['Campos']['Mensaje']);
	}
	?>
	<script language="javascript"> 
		var form=document.form1;
		document.getElementById("cambio").disabled=true;
		
	    function mostrar(){
	        document.getElementById("field2").style.marginRight="20px";
	    }

		
		function Siguiente(){
			var obj=document;
			document.forms[0].submit();
			/*
			if(obj.getElementById('seleccion3').checked==true){
				alert("hay cambio");
				//location.href="#";
			}else if(obj.getElementById('seleccion2').checked==true){
				location.href="#";
			}else if(obj.getElementById('seleccion1').checked==true){
				location.href="pdf/PDF_Reingreso.php";
			}else if(obj.getElementById('seleccion6').checked==true){
				location.href="pdf/PDF_Retiro-RPS.php";
			}else if(obj.getElementById('seleccion7').checked==true){
				location.href="pdf/PDF_Retiro-RMS.php";
			}else if(obj.getElementById('seleccion8').checked==true){
				location.href="pdf/PDF_Retiro-RPV.php";
			}else if(obj.getElementById('seleccion4').checked==true){
				location.href="#";
			}else if(obj.getElementById('seleccion5').checked==true){
				location.href="#";
			}
			*/
		}
		function Solicitar(obj){
			var Cambios=document.getElementById("cambios");
			var Retiros=document.getElementById("retiros");
			var boton=document.getElementById("cambio");
			var Solicitud=document.getElementById("solicitud");
			if((obj.value=="R")||(obj.value=="T")){
				if(obj.checked==true){
					if((obj.value=="R")&&(document.getElementById("seleccion2").checked==true)){
						obj.checked=false;
						alert('no se puede solicitar ambos tipos al mismo tiempo');
					}else if((obj.value=="T")&&(document.getElementById("seleccion1").checked==true)){
						obj.checked=false;
						alert('no se puede solicitar ambos tipos al mismo tiempo');
					}else if((obj.value=="T")&&(document.getElementById("seleccion1").checked!=true)){
						Retiros.style.transition = "all 0.5s linear 0s";
						Retiros.style.height="0px";
						document.getElementById("seleccion").checked=false;
						Solicitud.value="T";
						activarEnvio();
					}else if((obj.value=="R")&&(document.getElementById("seleccion2").checked!=true)){
						Retiros.style.transition = "all 0.5s linear 0s";
						Retiros.style.height="0px";
						document.getElementById("seleccion").checked=false;
						Solicitud.value="R";
						activarEnvio();					
					}
				}else{
					if((obj.value=="R")&&(document.getElementById("seleccion2").checked!=true)){
						Solicitud.value="";
						cambiosText();
					}else if((obj.value=="T")&&(document.getElementById("seleccion1").checked!=true)){
						Solicitud.value="";
						cambiosText();
					}
				}
			}else if(obj.value=="M"){
				if(obj.checked==true){
					if((document.getElementById("seleccion1").checked==true)||(document.getElementById("seleccion2").checked==true)||(document.getElementById("seleccion3").checked==true)){
						obj.checked=false;
						alert("No puede seleccionar Cancelación de Matricula si otra opcion ya se encuentra marcada");
					}else{
						Retiros.style.transition = "all 0.5s linear 0s";
						Retiros.style.height="100px";
						Cambios.style.transition = "all 0.5s linear 0s";
						Cambios.style.height="0px";
						Cambios.style.marginTop="-15px";
						document.getElementById("field2").style.border="2px solid red";
						boton.value="Selecione Uno";
						boton.disabled=true;
					}
				}else{
					Retiros.style.transition = "all 0.5s linear 0s";
					Retiros.style.height="0px";
					document.getElementById("seleccion6").checked=false;
					document.getElementById("seleccion7").checked=false;
					document.getElementById("seleccion8").checked=false;
					document.getElementById("field2").style.border="2px solid red";
					Solicitud.value="";
					boton.value="Selecione Uno";
					boton.disabled=true;					
				}
			}else if(obj.value=="C"){
				if(obj.checked==true){
					Retiros.style.transition = "all 0.5s linear 0s";
					Retiros.style.height="0px";
					document.getElementById("seleccion").checked=false;
					Cambios.style.transition = "all 0.5s linear 0s";
					Cambios.style.height="100px";
					Cambios.style.marginTop="5px";
					document.getElementById("field2").style.border="2px solid red";
					boton.value="Selecione Uno";
					boton.disabled=true;
				}else{
					document.getElementById("textRegimen").value="";
					document.getElementById("textCarrera").value="";
					cambiosText();
					Cambios.style.transition = "all 0.5s linear 0s";
					Cambios.style.height="0px";
					Cambios.style.marginTop="-15px";
					if((document.getElementById("seleccion1").checked==true)||(document.getElementById("seleccion2").checked==true)){
						Solicitud.value=Solicitud.value.substring(0,1);
						activarEnvio();
					}
				}
			}else if((obj.value=="RPS")||(obj.value=="RMS")||(obj.value=="RPV")){
				Solicitud.value=obj.value;
				activarEnvio();
			}
		}
		function activarEnvio(){
			var boton=document.getElementById("cambio");
			if(document.getElementById("Motivo").value==""){
				document.getElementById("field2").style.border="2px solid red";
				boton.value="Selecione Uno";
				boton.disabled=true;
			}else{
				document.getElementById("field2").style.border="1px solid #DEDEDE";
				boton.value="Solicitar";
				boton.disabled=false;
			}
		}
		function cambiosText(){
			var Solicitud=document.getElementById("solicitud");
			var regimen=document.getElementById("textRegimen");
			var carrera=document.getElementById("textCarrera");
			var boton=document.getElementById("cambio");
			if((carrera.value!="-")||(regimen.value!="-")){
				if(Solicitud.value.length<2){
					Solicitud.value+="C";
				}
				activarEnvio();
			}
			if((regimen.value=="-")&&(carrera.value=="-")){
				document.getElementById("field2").style.border="2px solid red";
				boton.disabled=true;
			}
		}
	</script>
	<script language="javascript" src="JS/barra.div.js"></script>
</html>
