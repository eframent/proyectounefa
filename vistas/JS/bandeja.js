var conexionPaginacion;
var conexionTrans;
var conexionCombos;
function arranque(){
	peticionPaginacion();
}
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
/*-------------------------------------------- AJAX ---------------------------------------------------*/
function peticionPaginacion(pag)
{	
	pag=pag||"0";
	var ruta="../controladores/cor_Bandeja.php";
	var valor="";
	//var valor=document.getElementById('buscBloq').value;
	conexionPaginacion=crearXMLHttpRequest();
	conexionPaginacion.onreadystatechange = respuestaPaginacion;
	conexionPaginacion.open('POST',ruta, true);
	conexionPaginacion.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("buscar")+"&Valor="+encodeURIComponent(valor)+"&pag="+encodeURIComponent(pag);
	document.getElementById('inspector').innerHTML='<div><img gif src="imagenes/29.gif"></div>';
	conexionPaginacion.send(envio);  
}
function respuestaPaginacion(){
	var clase;
	if(conexionPaginacion.readyState == 4){
		cont=1;
		//recibo el xml con los solicituds
		var xml=conexionPaginacion.responseXML;
		//designo el div donde se agregan los solicituds
		var divContenedor=document.getElementById('inspector');
		//variable con parametro de busqueda
		var valor=xml.getElementsByTagName("Valor")[0].textContent;
		//variable con pagina actual
		var paginaActual=xml.getElementsByTagName("paginaActual")[0].textContent;
		//variable que guarda la cantidad de registro total para la paginacion
		var registros=xml.getElementsByTagName("registros")[0].textContent;
		//variable que guarda la cantidad de registros por pagina
		var cantidad=xml.getElementsByTagName("cantidad")[0].textContent;
		var pendientes=0;
		var enproceso=0;
		var aprobadas=0;
		var rechazados=0;
		//variable para guarda solicitud por solicitud
		var solicitud;
		//cadenaHtml donde se guardan todas las partes a agregar
		var cadenaHtml="<table>";
		//busco los solicituds en el xml
		if(xml.getElementsByTagName('mensaje')[0].textContent=="No Hay Solicitudes"){
			cadenaHtml+="<tr><td colspan='7'>No Hay Solicitudes en Este Momento</td></tr>"
		}else{
			var solicituds=xml.getElementsByTagName('Solicitudes')[0].childNodes;
			for(var x=0;x<solicituds.length;x++){
				solicitud=solicituds[x];
				cadenaHtml+="<tr>";
				cadenaHtml+="<td style='width:28px;'>"+solicitud.getElementsByTagName('ID')[0].textContent+"</td>";
				cadenaHtml+="<td style='width:88px;'>"+solicitud.getElementsByTagName('Nombre')[0].textContent+"</td>";
				cadenaHtml+="<td style='width:0px;'>"+solicitud.getElementsByTagName('Tipo')[0].textContent+"</td>";
				if(solicitud.getElementsByTagName('Estatus')[0].textContent=='P'){
					pendientes++;
					cadenaHtml+="<td style='width:80px;'><div style='width:30px; padding:7px 0px; background:#1BA39C; border-radius:100px; color:white;'>"+solicitud.getElementsByTagName('Estatus')[0].textContent+"</div></td>";
				}else if(solicitud.getElementsByTagName('Estatus')[0].textContent=='A'){
					aprobadas++;
					cadenaHtml+="<td style='width:80px;'><div style='width:30px; padding:7px 0px; background:#26A65B; border-radius:100px; color:white;'>"+solicitud.getElementsByTagName('Estatus')[0].textContent+"</div></td>";
				}else if(solicitud.getElementsByTagName('Estatus')[0].textContent=='E'){
					enproceso++;
					cadenaHtml+="<td style='width:80px;'><div style='width:30px; padding:7px 0px; background:#F89406; border-radius:100px; color:white;'>"+solicitud.getElementsByTagName('Estatus')[0].textContent+"</div></td>";
				}else if(solicitud.getElementsByTagName('Estatus')[0].textContent=='R'){
					rechazados++;
					cadenaHtml+="<td style='width:80px;'><div style='width:30px; padding:7px 0px; background:#CF000F; border-radius:100px; color:white;'>"+solicitud.getElementsByTagName('Estatus')[0].textContent+"</div></td>";
				}
				cadenaHtml+="<td style='width:80px;'><div>"+solicitud.getElementsByTagName('Fecha')[0].textContent+"</div></td>";
				if(solicitud.getElementsByTagName('Estatus')[0].textContent=='P'){
					cadenaHtml+="<td style='width:80px;'><a href='#'><div onclick='petAtender("+solicitud.getElementsByTagName('ID')[0].textContent+")' atender=''><div title-atender=''>Revisar Solicitud</div></div></a></td>";			
				}else{
					cadenaHtml+="<td style='width:80px;'><a href='#'></a></td>";
				}
				if(solicitud.getElementsByTagName('Tipo')[0].textContent!="CAMBIO"){
					cadenaHtml+="<td style='width:98px;'><a href='#'><div onclick='petRevisar("+solicitud.getElementsByTagName('ID')[0].textContent+")' pdf=''><div title-pdf=''>Descargar Solicitud en PDF</div></div></a></td>";
				}else{
					cadenaHtml+="<td style='width:98px;'><a href='#'></div></a></td>";
				}
				
				cadenaHtml+="</tr>";
				cont++;
			}
		}
		//coloco la paginacion
		cadenaHtml+=	'<tr><td colspan="7"><aside cont-pag id="pagBloq">';
		cadenaHtml+=	construirPaginacion(paginaActual,registros,cantidad,"peticionPaginacion");
		cadenaHtml+=	'</td></tr></aside>';
		divContenedor.innerHTML=cadenaHtml;
		manejoDeBurbujas(pendientes,aprobadas,enproceso,rechazados);
	}
}
function manejoDeBurbujas(pendientes,aprobadas,enproceso,rechazados){
	//el manejo de las burbujas de estatus	
	var contadorDePendientes=document.getElementById('pendientes');	
	var contadorDeEnProceso=document.getElementById('enproceso');	
	var contadorDeAprobadas=document.getElementById('aprobadas');	
	var contadorDeRechazadas=document.getElementById('rechazados');
	contadorDePendientes.innerHTML="<div title-p>Cantidad Solicitudes Pendientes</div>"+pendientes;	
	contadorDeAprobadas.innerHTML="<div title-a>Cantidad Solicitudes Aprovadas</div>"+aprobadas;	
	contadorDeEnProceso.innerHTML="<div title-e>Cantidad Solicitudes En Proceso</div>"+enproceso;	
	contadorDeRechazadas.innerHTML="<div title-r>Cantidad Solicitudes Rechazadas</div>"+rechazados;	
}
/*------------------------------------ Funciones Transaccionales -----------------------------------------------------*/
function petAtender(id){
	var ruta="../controladores/cor_Bandeja.php";
	conexionTrans=crearXMLHttpRequest();
	conexionTrans.onreadystatechange = respAtender;
	conexionTrans.open('POST',ruta, true);
	conexionTrans.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("atender")+"&ID="+encodeURIComponent(id);
	//creo la capa solicitud
	solicitud=abrirCapas();
	solicitud.innerHTML='<div><img gif src="imagenes/29.gif"></div>';
	//ejecuto el envio
	conexionTrans.send(envio);
}
function respAtender(){
	if(conexionTrans.readyState == 4){		
		var xml=conexionTrans.responseXML;
		var divContenedor=document.getElementById('capaContenido');
		var solicitud=xml.getElementsByTagName('solicitud')[0];
		var tipo=solicitud.getElementsByTagName('idTipo')[0].textContent;
		//Si el estado de la solicitud se encuentra en Pendiente 
		cadenaHtml="<h3 >Solicitud Seleccionada</h3>";
		if(solicitud.getElementsByTagName('Estatus')[0].textContent=='P'){
			//contruir la capa de solicitud
			cadenaHtml+="<table>";
			cadenaHtml+=	"<tr>";
			cadenaHtml+=		"<td>ID</td><td>"+solicitud.getElementsByTagName('ID')[0].textContent+"</td>";
			cadenaHtml+=	"</tr>";
			cadenaHtml+=	"<tr>";
			cadenaHtml+=		"<td>Solicitante</td><td>"+solicitud.getElementsByTagName('Nombre')[0].textContent+"</td>";
			cadenaHtml+=	"</tr>";
			cadenaHtml+=	"<tr>";
			cadenaHtml+=		"<td>Tipo de Solicitud</td><td>"+solicitud.getElementsByTagName('Tipo')[0].textContent+"</td>";
			cadenaHtml+=	"</tr>";
			if(solicitud.getElementsByTagName('Codesp')[0].textContent!=""){			
				cadenaHtml+=	"<tr>";
				cadenaHtml+=		"<td>Carrera Solicitada</td><td>"+solicitud.getElementsByTagName('Carrera')[0].textContent+"</td>";
				cadenaHtml+=	"</tr>";
			}
			if(solicitud.getElementsByTagName('Regimen')[0].textContent!=""){
				cadenaHtml+=	"<tr>";
				cadenaHtml+=		"<td>Turno Solicitado</td><td>"+solicitud.getElementsByTagName('Turno')[0].textContent+"</td>";
				cadenaHtml+=	"</tr>";
			}
			if((tipo=='1')||(tipo=='3')){
				cadenaHtml+=	"<tr>";
				cadenaHtml+=		"<td>Seleccione Pensum a Sugerir</td>";
				cadenaHtml+=		"<td>";
				cadenaHtml+=		"<select name='Pensum' id='Pensum'><option value='-'>Cargando...</option></select>";
				cadenaHtml+=		"</td>";
				cadenaHtml+=	"</tr>";
				cadenaHtml+=	"<tr>";
				cadenaHtml+=		"<td><input type='button' onclick='equivalencia("+solicitud.getElementsByTagName('ID')[0].textContent+")' value='Solicitar Equivalencia'></td>";
				cadenaHtml+=		"<td><input type='button' onclick='rechazar("+solicitud.getElementsByTagName('ID')[0].textContent+")' value='Rechazar'></td>";
				cadenaHtml+=	"</tr>";
				petPensum(solicitud.getElementsByTagName('ID')[0].textContent);
			}else if((tipo=='5')||(tipo=='6')||(tipo=='7')){
				cadenaHtml+=	"<tr>";
				cadenaHtml+=		"<td>Motivo</td><td>"+solicitud.getElementsByTagName('Motivo')[0].textContent+"</td>";
				cadenaHtml+=	"</tr>";
				cadenaHtml+=	"<tr>";
				cadenaHtml+=		"<td><input type='button' onclick='cancelarMatricula("+solicitud.getElementsByTagName('ID')[0].textContent+")' value='Cancelar Matricula'></td>";
				cadenaHtml+=		"<td><input type='button' onclick='rechazar("+solicitud.getElementsByTagName('ID')[0].textContent+")' value='Rechazar'></td>";
				cadenaHtml+=	"</tr>";

			}
		}
		divContenedor.innerHTML=cadenaHtml;
	}
}

function equivalencia(id){
	var pensum=document.getElementById('Pensum').value;
	if(pensum=="-"){
		alert("Debe seleccionar el pensum a cursar");
	}else {
		var ruta="../controladores/cor_Bandeja.php";
		conexionTrans=crearXMLHttpRequest();
		conexionTrans.onreadystatechange = respTrans;
		conexionTrans.open('POST',ruta, true);
		conexionTrans.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("equivalencia")+"&ID="+encodeURIComponent(id)+"&Pensum="+encodeURIComponent(pensum);
		solicitud.innerHTML='<div><img gif src="imagenes/29.gif"></div>';
		//ejecuto el envio
		conexionTrans.send(envio);
	}
}
function rechazar(id){
	if(confirm("Desea Rechazar la Solicitud")){	
		var ruta="../controladores/cor_Bandeja.php";
		conexionTrans=crearXMLHttpRequest();
		conexionTrans.onreadystatechange = respTrans;
		conexionTrans.open('POST',ruta, true);
		conexionTrans.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("rechazar")+"&ID="+encodeURIComponent(id);
		solicitud.innerHTML='<div><img gif src="imagenes/29.gif"></div>';
		//ejecuto el envio
		conexionTrans.send(envio);
	}
}
function cancelarMatricula(id){
	if(confirm("Desea Cancelar la Matricula del Solicitante")){	
		var ruta="../controladores/cor_Bandeja.php";
		conexionTrans=crearXMLHttpRequest();
		conexionTrans.onreadystatechange = respTrans;
		conexionTrans.open('POST',ruta, true);
		conexionTrans.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("cancelarMatricula")+"&ID="+encodeURIComponent(id);
		solicitud.innerHTML='<div><img gif src="imagenes/29.gif"></div>';
		//ejecuto el envio
		conexionTrans.send(envio);
	}
}
function respTrans(){	
	if(conexionTrans.readyState == 4){		
		var xml=conexionTrans.responseXML;
		var divContenedor=document.getElementById('capaContenido');
		var mensaje=xml.getElementsByTagName('mensaje')[0].textContent;
		divContenedor.innerHTML="<h3 style='background:green' onclick='this.parentNode.parentNode.removeChild(this.parentNode)'>"+mensaje+"</h3>";
		peticionPaginacion();
	}
}
//-------------------------------------------------Manejo de combos------------------------------------------------
function petPensum(id){
	var ruta="../controladores/cor_Bandeja.php";
	conexionCombos=crearXMLHttpRequest();
	conexionCombos.onreadystatechange = respPensum;
	conexionCombos.open('POST',ruta, true);
	conexionCombos.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("construirComboPensum")+"&ID="+encodeURIComponent(id);
	conexionCombos.send(envio);
}
function respPensum(){
	if(conexionCombos.readyState == 4){		
		var xml=conexionCombos.responseXML;
		//delcaro el combo donde voy a construir las opciones
		var combo=document.getElementById('Pensum');
		//remuevo la opcion 'Cargando...'
		combo.removeChild(combo.firstChild);
		//Creo una nueva opcion
		var opcion=document.createElement('option');
		opcion.value='-';
		opcion.textContent='Seleccione un Pensum';
		//le anexo la opcion creada al combo
		combo.appendChild(opcion);
		//declaro las opciones contenida en el xml
		var Opciones=xml.getElementsByTagName('Opciones')[0].childNodes;
		//creo una opcion para cada elemento dentro del xml
		for(var x=0;x<Opciones.length;x++){
			opcion=document.createElement('option');
			opcion.value=Opciones[x].getElementsByTagName('ID')[0].textContent;
			opcion.textContent=Opciones[x].getElementsByTagName('Nombre')[0].textContent;
			combo.appendChild(opcion);
		}
	}
}
function petRevisar(id){
	solicitud=abrirCapas();
	var frame=document.createElement("iframe");
	frame.src='pdf/PDF_Solicitudes.php?id='+id;
	frame.id="frame";
	solicitud.innerHTML="";
	solicitud.appendChild(frame);
	solicitud.id="capaContenidoPDF";
}
//---------------------------------------------------------------Manejo de capas
function abrirCapas(){
	construirCapaExterior();
	var capaContenido=construirCapaContenido();
	return capaContenido;
}
function cerrarCapas(){
	destruirCapaExterior();
	destruirCapaContedido();
}
function construirCapaContenido(){
	var contenido=document.createElement('div');
	contenido.id='capaContenido';
	contenido.innerHTML=contenido;
	document.body.insertBefore(contenido,document.body.firstChild);
	return contenido;
}
function construirCapaExterior(){
	var capa=document.createElement('div');
	capa.id="exterior";
	capa.style.width=window.innerWidth+"px";
	capa.style.height=parseInt(window.innerWidth+200)+"px";
	capa.onclick=function(){cerrarCapas()};
	document.body.insertBefore(capa,document.body.firstChild);
	//paso las capas a fixed
	document.getElementById('cuerpoCabecera').style.position="fixed";
	document.getElementById('cuerpoPie').style.position="fixed";
	document.getElementById('menu').style.position="fixed";
	document.getElementById('contenedor').style.position="fixed";
	document.body.style.width="100%";
}
function destruirCapaContedido(){
	var contenido=document.getElementById("capaContenido")||document.getElementById("capaContenidoPDF");
	contenido.parentNode.removeChild(contenido);
}
function destruirCapaExterior(){
	var capa=document.getElementById('exterior');
	capa.parentNode.removeChild(capa);
	document.getElementById('cuerpoCabecera').style.position="inherit";
	document.getElementById('cuerpoPie').style.position="inherit";
	document.getElementById('menu').style.position="inherit";
	document.getElementById('contenedor').style.position="inherit";
}
function boton(){
	var contenido=abrirCapas();
}
