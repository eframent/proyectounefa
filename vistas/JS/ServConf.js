var conexionServ;
var conexionBloqueados;
var conexionAcceso;
var conexionTrans;
var conexionOnline;
var x=1;
function opciones(){
	var opc=document.getElementById("cont-opciones");
	if (x==1) {
		opc.style.width="99.7%";
		opc.style.height="100px";
		x++;
	}else if(x==2) {
		opc.style.width="99.7%";
		opc.style.height="0px";
		x--;
	}
}
function opciones_bit(){
	var opc=document.getElementById("cont-opciones-bit");
	if (x==1) {
		opc.style.width="99.7%";
		opc.style.height="100px";
		x++;
	}else if(x==2) {
		opc.style.width="99.7%";
		opc.style.height="0px";
		x--;
	}
}
function arranque(){
	arranqueMaestro();
	peticionOnline();
	peticionBloqueados();
	peticionTrans();
	peticionAcceso();
}
/**********************************Funciones paginacion**********************************************************************/
function construirPaginacion(paginaActual,registros,cantidad,funcion){
	var cadenaHtml="";
	var paginas=parseInt(registros/cantidad);
	if((paginaActual!="0")&&(paginaActual!="1")&&(paginaActual!="2")){
		cadenaHtml+='<input	type="button" value="1" onclick="'+funcion+'(0)">.';
	}
	for(var x=0;x<paginas+1;x++){
		if((x>=parseInt(paginaActual-2))&&(x<=parseInt(parseInt(paginaActual)+2))){
			cadenaHtml+='<input	type="button" value="'+(x+1)+'" onclick="'+funcion+'('+x+')">';
		}	
	}
	if((paginaActual!=parseInt(paginas-1))&&(paginaActual!=parseInt(paginas-2))&&(paginaActual!=paginas)){
		cadenaHtml+='.<input	type="button" value="'+(paginas+1)+'" onclick="'+funcion+'('+paginas+')">';
	}
	return cadenaHtml;
}
/*************************************Funciones Configuracion*********************************************************/
function buscar(x){
	if(x){
		var form=document.form1;
		form.Operacion.value="buscar";
		form.submit();
	}
}
/**********************************Funciones Usuarios Bloqueados*****************************************************/
function peticionBloqueados(pag)
{	
	pag=pag||"0";
	var ruta="../controladores/cor_ServConf.php";
	var valor=document.getElementById('buscBloq').value;
	conexionBloqueados=crearXMLHttpRequest();
	conexionBloqueados.onreadystatechange = respuestaBloqueado;
	conexionBloqueados.open('POST',ruta, true);
	conexionBloqueados.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("buscarBloqueados")+"&Valor="+encodeURIComponent(valor)+"&pag="+encodeURIComponent(pag);
	document.getElementById('usuBloq').innerHTML='<div><img gif src="imagenes/29.gif"></div>';
	conexionBloqueados.send(envio);  
}
function respuestaBloqueado(){
	var clase;
	if(conexionBloqueados.readyState == 4){
		cont=1;
		//recivo el xml con los usuarios
		var xml=conexionBloqueados.responseXML;
		//designo el div donde se agregan los usuarios
		var divContenedor=document.getElementById('usuBloq');
		//variable con parametro de busqueda
		var valor=xml.getElementsByTagName("Valor")[0].textContent;
		//variable con pagina actual
		var paginaActual=xml.getElementsByTagName("paginaActual")[0].textContent;
		//variable que guarda la cantidad de registro total para la paginacion
		var registros=xml.getElementsByTagName("registros")[0].textContent;
		//variable que guarda la cantidad de registros por pagina
		var cantidad=xml.getElementsByTagName("cantidad")[0].textContent;
		//variable para guarda usuario por usuario
		var usuario;
		//cadenaHtml donde se guardan todas las partes a agregar
		var cadenaHtml="<h2>Usuarios Bloqueados</h2>";
			cadenaHtml+="<section cab-list>";
			cadenaHtml+=	'<input	type="text" name="buscar" value="'+valor+'" id="buscBloq">';
			cadenaHtml+=	'<input type="button" class="busc" ><input type="button" class="search" onclick="peticionBloqueados()">';
			cadenaHtml+=	'<aside cont-pag id="pagBloq">';
			cadenaHtml+=	construirPaginacion(paginaActual,registros,cantidad,"peticionBloqueados");
			cadenaHtml+=	'</aside>';
			cadenaHtml+='</section>';
			cadenaHtml+='<section cab-cont-list>';
			cadenaHtml+=	'<aside num> N°</aside>';
			cadenaHtml+=	'<aside usuario> Nombre</aside>';
			cadenaHtml+='	<aside operacion>Operacion</aside>';
			cadenaHtml+='</section>';
		if(xml.getElementsByTagName('mensaje')[0].textContent=="No Hay Usuarios Bloqueados"){
			cadenaHtml+="<section cab-cont-list><aside num>0</aside><aside usuario>"+xml.getElementsByTagName('mensaje')[0].textContent+"</aside></section>";
		}else{
			//busco los usuarios en el xml
			var usuarios=xml.getElementsByTagName('usuarios')[0].childNodes;
			for(var x=0;x<usuarios.length;x++){
				usuario=usuarios[x];
				cadenaHtml+="<section cab-cont-list>";
				cadenaHtml+="<aside num>"+cont+"</aside>";
				cadenaHtml+="<aside usuario>"+usuario.getElementsByTagName('Nombre')[0].textContent+"</aside>";
				cadenaHtml+="<aside operacion1><input class='cerrar' type='button'><input type='button' class='desbloquear' name='desbloq' onclick='petDesbloquear(this)'> </aside>";
				cadenaHtml+="</section>";
				cont++;
			}
		}
		divContenedor.innerHTML=cadenaHtml;		
	}
}
function petDesbloquear(obj){
	var valor=obj.parentNode.previousSibling.textContent;
	var ruta="../controladores/cor_ServConf.php";
	conexionBloqueados=crearXMLHttpRequest();
	conexionBloqueados.onreadystatechange = respDesbloquear;
	conexionBloqueados.open('POST',ruta, true);
	conexionBloqueados.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("desbloquear")+"&Valor="+encodeURIComponent(valor);
	conexionBloqueados.send(envio);
}
function respDesbloquear(){
	var clase;
	if(conexionBloqueados.readyState == 4){		
		var xml=conexionBloqueados.responseXML;
		mensaje=xml.getElementsByTagName('mensaje')[0].textContent;
		if(mensaje=="Operacion Realizada con Exito"){
			clase="Info";
		}else{
			clase="Error";
		}
		f_MostrarMensaje(mensaje,clase,"","","no");
		peticionBloqueados();
	}
}
/**********************************Funciones Online**********************************************************************/
function peticionOnline(pag)
{	
	pag=pag||"0";
	var ruta="../controladores/cor_ServConf.php";
	var valor=document.getElementById('buscOnline').value;
	conexionOnline=crearXMLHttpRequest();
	conexionOnline.onreadystatechange = respuestaOnline;
	conexionOnline.open('POST',ruta, true);
	conexionOnline.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("buscarOnline")+"&Valor="+encodeURIComponent(valor)+"&pag="+encodeURIComponent(pag);
	document.getElementById('usuOnline').innerHTML='<div><img gif src="imagenes/29.gif"></div>';
	conexionOnline.send(envio);  
}
function respuestaOnline(){
	var clase;
	if(conexionOnline.readyState == 4){
		cont=1;
		//recivo el xml con los usuarios
		var xml=conexionOnline.responseXML;
		//designo el div donde se agregan los usuarios
		var divContenedor=document.getElementById('usuOnline');
		//variable con parametro de busqueda
		var valor=xml.getElementsByTagName("Valor")[0].textContent;
		//variable con pagina actual
		var paginaActual=xml.getElementsByTagName("paginaActual")[0].textContent;
		//variable que guarda la cantidad de registro total para la paginacion
		var registros=xml.getElementsByTagName("registros")[0].textContent;
		//variable que guarda la cantidad de registros por pagina
		var cantidad=xml.getElementsByTagName("cantidad")[0].textContent;
		//variable para guarda usuario por usuario
		var usuario;
		//cadenaHtml donde se guardan todas las partes a agregar
		var cadenaHtml="<h2>Usuarios Online</h2>";
			cadenaHtml+="<section cab-list>";
			cadenaHtml+=	'<input	type="text" name="buscar" value="'+valor+'" id="buscOnline">';
			cadenaHtml+=	'<input type="button" class="busc" ><input type="button" class="search" onclick="peticionOnline()">';
			cadenaHtml+=	'<aside cont-pag id="pagOnline">';
			cadenaHtml+=	construirPaginacion(paginaActual,registros,cantidad,"peticionOnline");
			cadenaHtml+=	'</aside>';
			cadenaHtml+='</section>';
			cadenaHtml+='<section cab-cont-list>';
			cadenaHtml+=	'<aside num> N°</aside>';
			cadenaHtml+=	'<aside usuario> Nombre</aside>';
			cadenaHtml+='	<aside operacion>Operacion</aside>';
			cadenaHtml+='</section>';
		//busco los usuarios en el xml
		var usuarios=xml.getElementsByTagName('usuarios')[0].childNodes;
		for(var x=0;x<usuarios.length;x++){
			usuario=usuarios[x];
			cadenaHtml+="<section cab-cont-list>";
			cadenaHtml+="<aside num>"+cont+"</aside>";
			cadenaHtml+="<aside usuario>"+usuario.getElementsByTagName('Nombre')[0].textContent+"</aside>";
			cadenaHtml+="<aside operacion1><input type='button' class='cerrar' ><input tipe='button' class='cerrar-sesion' name='CerrarSesion' onclick='petCerrarSesion(this)'></aside>";
			cadenaHtml+="</section>";
			cont++;
		}
		divContenedor.innerHTML=cadenaHtml;		
	}
}
function petCerrarSesion(obj){
	var valor=obj.parentNode.previousSibling.textContent;
	var ruta="../controladores/cor_ServConf.php";
	conexionOnline=crearXMLHttpRequest();
	conexionOnline.onreadystatechange = respCerrarSesion;
	conexionOnline.open('POST',ruta, true);
	conexionOnline.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("cerrarSesion")+"&Valor="+encodeURIComponent(valor);
	conexionOnline.send(envio);
}
function respCerrarSesion(){
	var clase;
	if(conexionOnline.readyState == 4){		
		var xml=conexionOnline.responseXML;
		mensaje=xml.getElementsByTagName('mensaje')[0].textContent;
		if(mensaje=="Operacion Realizada con Exito"){
			clase="Info";
		}else{
			clase="Error";
		}
		f_MostrarMensaje(mensaje,clase,"","","no");
		peticionOnline();
	}
}
/**********************************Funciones Bitacora Trans*****************************************************/
function peticionTrans(pag)
{	
	pag=pag||"0";
	var ruta="../controladores/cor_ServConf.php";
	var formulario=document.Trans;
	conexionTrans=crearXMLHttpRequest();
	conexionTrans.onreadystatechange = respuestaTrans;
	conexionTrans.open('POST',ruta, true);
	conexionTrans.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("buscarTrans")+"&pag="+encodeURIComponent(pag);
	envio+="&Fecha_ini="+encodeURIComponent(formulario.f_ini.value);
	envio+="&Fecha_fin="+encodeURIComponent(formulario.f_fin.value);
	envio+="&Hora="+encodeURIComponent(formulario.hora.value);
	envio+="&Usuario="+encodeURIComponent(formulario.usuario.value);
	envio+="&Op="+encodeURIComponent(formulario.Operacion.value);
	document.getElementById('listBit').innerHTML='<div><img gif src="imagenes/29.gif"></div>';
	conexionTrans.send(envio);  
}
function respuestaTrans(){
	var clase;
	if(conexionTrans.readyState == 4){
		cont=1;
		//recivo el xml con los usuarios
		var xml=conexionTrans.responseXML;
		//designo el div donde se agregan los usuarios
		var divContenedor=document.getElementById('listBit');
		//variable con pagina actual
		var paginaActual=xml.getElementsByTagName("paginaActual")[0].textContent;
		//variable que guarda la cantidad de registro total para la paginacion
		var registros=xml.getElementsByTagName("registros")[0].textContent;
		//variable que guarda la cantidad de registros por pagina
		var cantidad=xml.getElementsByTagName("cantidad")[0].textContent;
		//variable para guarda usuario por usuario
		var usuario;
		//cadenaHtml donde se guardan todas las partes a agregar
		var cadenaHtml="<section cab-list>";
			cadenaHtml+="<input type='text'>";
			cadenaHtml+=	'<aside cont-pag id="pagBloq">';
			cadenaHtml+=	construirPaginacion(paginaActual,registros,cantidad,"peticionTrans");
			cadenaHtml+=	'</aside>';
			cadenaHtml+='</section>';
			cadenaHtml+='<section cab-list-bitacora>';
			cadenaHtml+='<aside fecha>Fecha</aside>';
			cadenaHtml+='<aside hora>Hora</aside>';
			cadenaHtml+='<aside ip>Tabla</aside>';
			cadenaHtml+='<aside user>Usuario</aside>';
			cadenaHtml+='<aside opera-cab>Operacion</aside>';
			cadenaHtml+='</section>';
		//busco los elementos en el xml
		var elementos=xml.getElementsByTagName('elementos')[0].childNodes;
		for(var x=0;x<elementos.length;x++){
			elemento=elementos[x];
			cadenaHtml+="<section cab-cont-list>";
			cadenaHtml+="<aside fecha>"+elemento.getElementsByTagName('Fecha')[0].textContent+"</aside>";
			cadenaHtml+="<aside hora>"+elemento.getElementsByTagName('Hora')[0].textContent+"</aside>";
			cadenaHtml+="<aside ip>"+elemento.getElementsByTagName('Tabla')[0].textContent+"</aside>";
			cadenaHtml+="<aside user>"+elemento.getElementsByTagName('Usuario')[0].textContent+"</aside>";
			cadenaHtml+="<aside opera-c>"+elemento.getElementsByTagName('Op')[0].textContent+"</aside>";
			cadenaHtml+="</section>";
			cont++;
		}
		divContenedor.innerHTML=cadenaHtml;		
	}
}
/**********************************Funciones Bitacora Acceso*****************************************************/
function peticionAcceso(pag)
{	
	pag=pag||"0";
	var ruta="../controladores/cor_ServConf.php";
	var formulario=document.Acceso;
	conexionAcceso=crearXMLHttpRequest();
	conexionAcceso.onreadystatechange = respuestaAcceso;
	conexionAcceso.open('POST',ruta, true);
	conexionAcceso.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("buscarAcceso")+"&pag="+encodeURIComponent(pag);
	envio+="&Fecha_ini="+encodeURIComponent(formulario.f_ini.value);
	envio+="&Fecha_fin="+encodeURIComponent(formulario.f_fin.value);
	envio+="&Ip="+encodeURIComponent(formulario.Ip.value);
	envio+="&Usuario="+encodeURIComponent(formulario.usuario.value);
	envio+="&Op="+encodeURIComponent(formulario.Operacion.value);
	document.getElementById('listBitAcc').innerHTML='<div><img gif src="imagenes/29.gif"></div>';
	conexionAcceso.send(envio);  
}
function respuestaAcceso(){
	var clase;
	if(conexionAcceso.readyState == 4){
		cont=1;
		//recivo el xml con los usuarios
		var xml=conexionAcceso.responseXML;
		//designo el div donde se agregan los usuarios
		var divContenedor=document.getElementById('listBitAcc');
		//variable con pagina actual
		var paginaActual=xml.getElementsByTagName("paginaActual")[0].textContent;
		//variable que guarda la cantidad de registro total para la paginacion
		var registros=xml.getElementsByTagName("registros")[0].textContent;
		//variable que guarda la cantidad de registros por pagina
		var cantidad=xml.getElementsByTagName("cantidad")[0].textContent;
		//variable para guarda usuario por usuario
		var usuario;
		//cadenaHtml donde se guardan todas las partes a agregar
		var cadenaHtml="<section cab-list>";
			cadenaHtml+="<input type='text'>";
			cadenaHtml+=	'<aside cont-pag id="pagBloq">';
			cadenaHtml+=	construirPaginacion(paginaActual,registros,cantidad,"peticionAcceso");
			cadenaHtml+=	'</aside>';
			cadenaHtml+='</section>';
			cadenaHtml+='<section cab-list-bitacora>';
			cadenaHtml+=	'<aside fecha> Fecha</aside>';
			cadenaHtml+=	'<aside hora> Hora</aside>';
			cadenaHtml+=	'<aside ip> IP Acceso</aside>';
			cadenaHtml+=	'<aside user> Usuario</aside>';
			cadenaHtml+=	'<aside opera-cab>Operacion</aside>';
			cadenaHtml+='</section>';
		//busco los elementos en el xml
		var elementos=xml.getElementsByTagName('elementos')[0].childNodes;
		for(var x=0;x<elementos.length;x++){
			elemento=elementos[x];
			cadenaHtml+="<section cab-cont-list>";
			cadenaHtml+="<aside fecha>"+elemento.getElementsByTagName('Fecha')[0].textContent+"</aside>";
			cadenaHtml+="<aside hora>"+elemento.getElementsByTagName('Hora')[0].textContent+"</aside>";
			cadenaHtml+="<aside ip>"+elemento.getElementsByTagName('IP')[0].textContent+"</aside>";
			cadenaHtml+="<aside user>"+elemento.getElementsByTagName('Usuario')[0].textContent+"</aside>";
			cadenaHtml+="<aside opera-c>"+elemento.getElementsByTagName('Op')[0].textContent+"</aside>";
			cadenaHtml+="</section>";
			cont++;
		}
		divContenedor.innerHTML=cadenaHtml;		
	}
}
//--------------------------------------------Funciones Maestro Servidor-------------------
function arranqueMaestro(){
	var form=document.form1;
	for(var x=0;x<form.length;x++){
		form[x].disabled=true;
	}
	var ruta="../controladores/cor_ServConf.php";
	conexionServ=crearXMLHttpRequest();
	conexionServ.onreadystatechange = respMaestro;
	conexionServ.open('POST',ruta, true);
	conexionServ.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("buscarServidor");
	conexionServ.send(envio);
}
function respMaestro(){
	if(conexionServ.readyState == 4){	
		var xml=conexionServ.responseXML;
		var servidor=xml.getElementsByTagName('busqueda')[0];
		var form=document.form1;
		for(var x=0;x<form.length;x++){
			form[x].value=xml.getElementsByTagName(form[x].name)[0].textContent;
		}
		if(xml.getElementsByTagName('mensaje')[0].textContent=="Modificacion Finalizada con Exito"){
			f_MostrarMensaje(xml.getElementsByTagName('mensaje')[0].textContent,'Info',"","","si");
		}
		document.getElementById('Modificar').disabled=false;
	}
}
function fModificar(){
	var form=document.form1;
	for(var x=0;x<form.length;x++){
		form[x].disabled=false;
	}
	document.getElementById('Modificar').disabled=true;
	document.getElementById('Guardar').disabled=false;
	document.getElementById('Cancelar').disabled=false;
}
function fCancelar(){
	document.getElementById('Guardar').disabled=true;
	document.getElementById('Cancelar').disabled=true;
	arranqueMaestro();
}
function fGuardar(){
	var form=document.form1;
	var ruta="../controladores/cor_ServConf.php";
	conexionServ=crearXMLHttpRequest();
	conexionServ.onreadystatechange = respMaestro;
	conexionServ.open('POST',ruta, true);
	conexionServ.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("guardarServidor");
	for(var x=0;x<form.length;x++){
		envio+="&"+form[x].name+"="+form[x].value;	
		form[x].value="";
		form[x].disabled=true;
	}
	document.getElementById('Guardar').disabled=true;
	document.getElementById('Cancelar').disabled=true;
	conexionServ.send(envio);
}