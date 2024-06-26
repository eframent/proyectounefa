<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Nombres=Array("Codigo","Estatus");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Configuracion</title>
	<link rel="stylesheet" type="text/css" href="css/gridStyle.css">
	<script>
		laNombre=new Array("Estatus1");
		laValor=new Array("checked");
	</script>
</head>
<body onload="arranque()">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		
		<div cont-configuracion>
			<div configuracion>
				<h2>Configurar Seguridad </h2>
				<form name="form1" action="../controladores/cor_Servidor.php" method="POST">
					<table>
						<tr>
							<td align="right"><label >Cantidad de Intentos fallidos(clave errada):</label></td>
							<td><input type="text" name="InFaUs" id='InFaUs' validar="solo numeros"  disabled='true'/></td>
						</tr>
						<tr>
							<td align="right"><label>Caducidad Clave(dias):</label></td>
							<td>
								<input type="text" name="CaCla" id="CaCla" validar="solo numeros"  disabled='true' />	
							</td>
						</tr>
						<tr>
							<td align="right"><label>Tiempo Inactividad(seg):</label></td>
							<td>
								<input type="text" name="TieInac" id='TieInac' validar="solo numeros" disabled='true'  />
							</td>
						</tr>
						<tr>
							<td align="right"><label>Cantidad de Preguntas Secretas para Recuperar Clave:</label></td>
							<td>
								<input type="text" name="CantPre" id='CantPre' validar="solo numeros" disabled='true' />
							</td>
						</tr>
						<tr>
							<td align="right"><label>Cantidad De Respuestas Acertadas:</label></td>
							<td>
								<input type="text" name="CantRes" id='CantRes' validar="solo numeros" disabled='true' />
							</td>
						</tr>
						<tr>							
							<td align="right"><label>Cantidad Claves Pasadas Verificar al Registrar:</label></td>
							<td>
								<input type="text" name="HistCla" validar="solo numeros" disabled='true' />
							</td>
						</tr>
						<tr>							
							<td align="right"><label>Utilizacion del Envio de Codigo de Seguirdad a Correo</label></td>
							<td>
								<select name='CodSeg'>
									<option value="t">Si</option>
									<option value="f">No</option>
								</select>
							</td>
						</tr>
					</table>
				</form>		
					<div Botonera>
						<input type='button' name='Guardar' id='Guardar' value='Guardar' disabled='true' onclick='fGuardar();'/>
						<input type='button' name='Cancelar' id='Cancelar' value='Cancelar' disabled='true' onclick='fCancelar();'/>
						<input type='button' name='Modificar' id='Modificar' value='Modificar' disabled='true' onclick='fModificar();'/>
					</div>	
			</div>
			<div usu-bloq id="usuBloq">
				<h2>Usuarios Bloqueados</h2>
				<section cab-list>
					<input	type="text" name="buscar" id="buscBloq" ><input type="button" value="Buscar" onclick="peticionBloqueados()">
					<aside cont-pag id="pagBloq">
					</aside>
				</section>
				<section cab-cont-list>
					<aside num> N°</aside>
					<aside usuario> Nombre</aside>
					<aside operacion>Operacion</aside>
				</section>

				
			</div>
			<div usu-online id="usuOnline">
				<h2>Usuarios Online</h2>
				<section cab-list>
					<input	type="text" name="buscar" id="buscOnline" ><input type="button" value="Buscar" onclick="peticionOnline()">
					<aside cont-pag id="pagOnline">
					</aside>
				</section>
				<section cab-cont-list>
					<aside num> N°</aside>
					<aside usuario> Nombre</aside>
					<aside operacion>Operacion</aside>
				</section>
				
			</div>
		</div>
		<div cont-listados>
			<div list-bita-acceso>
				<h2>Bitacora de Acceso<input type="button" class="opciones" onclick="opciones();"> </h2>
				<div id="cont-opciones">
					<form name="Acceso" method="POST">
						<br>
						<aside>
							<label>Desde:</label><br>
							<input type="text" name="f_ini">
						</aside>
						<aside>
							<label>Hasta:</label><br>
							<input type="text" name="f_fin">
						</aside>
						<aside>
							<label>Ip:</label><br>
							<input type="text" name="Ip">
						</aside>
						<aside>
							<label>Usuario:</label><br>
							<input type="text" name="usuario">
						</aside>
						<aside>
							<label>Operacion:</label><br>
							<input type="text" name="Operacion">
						</aside>
						<aside>
							<br>
							<input type="button" class="busc" ><input type="button" class="search" onclick="peticionAcceso()">
						</aside>
					</form>
				</div>
				<div id='listBitAcc'>
					<section cab-list>
						<input type="text">
						<aside pagAcceso>
							<input type="button" value="1">
							<input type="button" value="2">...
							<input type="button" value="3">

						</aside>
					</section>
					<section cab-list-acceso>
						<aside fecha>Fecha</aside>
						<aside hora>Hora</aside>
						<aside ip>IP Acceso</aside>
						<aside user>Usuario</aside>
						<aside opera>Operación</aside>
					</section>
				</div>
			</div>
			<div list-bitacora >
				<h2>Bitacora Transaccional <input type="button" class="opciones" onclick="opciones_bit();"> </h2>
				<div id="cont-opciones-bit">
					<form name="Trans" method="POST">
						<br>
						<aside>
							<label>Desde:</label><br>
							<input type="text" name="f_ini">
						</aside>
						<aside>
							<label>Hasta:</label><br>
							<input type="text" name="f_fin">
						</aside>
						<aside>
							<label>Hora:</label><br>
							<input type="text" name="hora">
						</aside>
						<aside>
							<label>Usuario:</label><br>
							<input type="text" name="usuario">
						</aside>
						<aside>
							<label>Operacion:</label><br>
							<input type="text" name="Operacion">
						</aside>
						<aside>
							<br>
							<input type="button" class="busc" ><input type="button" class="search" onclick="peticionTrans()">
						</aside>
					</form>
				</div>
				<div id='listBit'>
					<section cab-list>
						<input type="text">
						<aside pagBitacora>
							<input type="button" value="1">
							<input type="button" value="2">...
							<input type="button" value="3">
						</aside>
					</section>
					<section cab-list-bitacora>
						<aside fecha>Fecha</aside>
						<aside hora>Hora</aside>
						<aside ip>Tabla</aside>
						<aside user>Usuario</aside>
						<aside opera>Operación</aside>
					</section>
				</div>
			</div>
		</div>
		<div ordenar></div>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>/>
<script type="text/javascript" src='JS/motorValidaciones.js'></script>
<script type="text/javascript" src='JS/motorAjax.js'></script>
<script type="text/javascript" src='JS/Mensajes.js'></script>
<script src="JS/ServConf.js"></script>
</html>
