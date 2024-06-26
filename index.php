<?php
/*
        unefa.html
        
        Copyright 2012 Joel Lameda <Joel Lameda@TEQUE-154547956>
        
        This program is free software; you can redistribute it and/or modify
        it under the terms of the GNU General Public License as published by
        the Free Software Foundation; either version 2 of the License, or
        (at your option) any later version.
        
        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.
        
        You should have received a copy of the GNU General Public License
        along with this program; if not, write to the Free Software
        Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
        MA 02110-1301, USA.
*/ 
session_start();
	$aux3=substr( sha1( microtime() ),0,6); 

$mensaje=$_SESSION["Mensaje"];
unset($_SESSION["Mensaje"]);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
	       <title>Unefa</title>
	       <meta http-equiv="content-type" content="text/html;charset=utf-8" />
	       <meta name='viewport' content='width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0' />
	       <link rel="Shortcut Icon" href="vistas/imagenes/logo_unefa.gif" type="image/x-icon" />
	       <link rel="stylesheet" type="text/css" href="vistas/css/formato.php"/>
	       <link rel="stylesheet" type="text/css" href="vistas/css/mensajes.css" />
	       <link rel="stylesheet" type="text/css" href="vistas/css/index.css" />
	       
	       <script type="text/javascript" src="vistas/JS/Mensajes.js"></script>
    </head> 
    <body onload="Arranque()" >
    	<div Cabecera style="height:160px;">
    		<img src='vistas/imagenes/br2.png') width='50%' height='20%'/>
			<img src='vistas/imagenes/unefan.jpg') width='100%' height='80%'/>
    	</div>
    	<div Contenedor style="height:400px;">
    		 <fieldset>  <!--Acceso a la Intranet-->
    		 	<h2>Acceso al Sistema</h2>
                      <FORM method="POST" name="form1" action="controladores/cor_Validar.php">
							<input type='hidden' name='Operacion' value='buscar'/>
							<input type='hidden' name='Hacer' />
			        <label for="Nombre">Nombre:</label>
			      		<br>
                                <INPUT id="usuario"  type="text" maxlength="15" tabindex="1" name="Nombre" required="required" class="campo" tabindex="2"  value="" maxlength="11" placeholder="Usuario"> 
                               		<br>
                               	<label for="Contrasena">Contraseña:</label>
                               		<br>
                                <INPUT type="password" maxlength="20" class="campo" tabindex="2" required="required" name="Contrasena" id="contraseña" tabindex="3"maxlength="20" rows="10px" placeholder="Contrase&ntilde;a" >
                                <br>
                                <label>Código de seguridad</label><br>
								<label><img src="captcha.php?aux=<?php echo $aux3;?>"/></label>
								<input type="text" name="codigo" id="codigo" placeholder="Introduzca el Código" tabindex="3" required>
                                <INPUT type="button" onclick="f_Submit()" class="ingresar" name="btningresar"  tabindex="12" value="Entrar">
                          	<INPUT type="reset" class="ingresar" value="Cancelar"  tabindex="12" >
		                  </FORM>
		                <br>
                  		<a onclick="recuperar()">¿Olvidó su Contraseña?</a>
		          </fieldset>      <!--Cierra el div acceso-->
    	</div>
    	<div Pie>
			<p>Carretera Nacional Vía Payara, Sector Piedritas Blancas, Edificio Pozo Blanco, Acarigua - Portuguesa.</p>
		</div>
    </body>

	       <script type="text/javascript" >
	       		function Arranque(){
	       			var mensaje="<?php print($mensaje);?>";
	       			var clase="Error";
	       			if(mensaje!=""){
	       				if(mensaje=="Contraseña Actualizada con exito"){
	       					clase="Info";
	       				}
	       				f_MostrarMensaje(mensaje,clase,"","40px");
	       			}
	       		}
	       		function f_Submit(){
	       			form=document.form1;
	       			var aux1="<?php print($aux3); ?>";
					var aux2=document.getElementById("codigo").value;
					if(aux1 == aux2){
						if(form.Nombre.value==""){
		       				f_MostrarMensaje("Campo Usuario Vacio","Error","","20px","si");
		       			}else if(form.Contrasena.value==""){
		       				f_MostrarMensaje("Campo Contraseña Vacio","Error","","20px","si");
		       			}else if((form.Contrasena.value!="")&&(form.Nombre.value!="")){	       				
		       				form.Nombre.value=form.Nombre.value.toUpperCase();
		       				form.submit();
		       			}
					}else{
	       				f_MostrarMensaje("El codigo de verificacion no Coisiden","Error","","20px","si");
						setTimeout(function(){location.reload();},3000);
					}
	       			
	       		}
	       		function recuperar(){
	       			form=document.form1;
	       			if(form.Nombre.value==""){
	       				f_MostrarMensaje("Coloque El Nombre de Usaurio del que Desea Recuperar Su Contraseña","Error","","45px","si");
	       			}else{
	       				form.action="controladores/cor_RecuperarClave.php";
	       				form.Operacion.value="RecuperarClave";
	       				form.Contrasena.value="1";
	       				f_Submit();
	       			}
	       		}
	       </script>
  
</html>

