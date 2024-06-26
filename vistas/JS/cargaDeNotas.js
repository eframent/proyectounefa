var conexionBasica;
var materiaAbierta=[];
function detalleMateria(obj,pmCodigo){
	materiaAbierta=[obj,pmCodigo];
	var marco=obj.parentNode.nextSibling;
	var cadenaHTML;
	if(obj.parentNode.classList.contains('bajarCompleto')){
		obj.parentNode.classList.remove('bajarCompleto')
		obj.parentNode.classList.add('bajarField')
	}
	cadenaHTML="";
	cadenaHTML="<div detCabMat>";
	cadenaHTML+="<aside>Materia</aside>";
	cadenaHTML+=	"<aside>Nombre Docente</aside>";
	cadenaHTML+=	"<aside>Apellido Docente</aside>";
	cadenaHTML+=	"<aside>Tope Estudiantes</aside>";
	cadenaHTML+=	"<aside>Cant Estudiantes</aside>";
	cadenaHTML+="</div>";
	cadenaHTML+="<div detInfoMat>";
	cadenaHTML+=	"<aside>"+obj.textContent+"</aside>";
	cadenaHTML+=	"<aside>"+obj.getAttribute('nombredoc')+"</aside>";
	cadenaHTML+=	"<aside>"+obj.getAttribute('apellidodoc')+"</aside>";
	cadenaHTML+=	"<aside>"+obj.getAttribute('tope')+"</aside>";
	cadenaHTML+=	"<aside id='cant"+pmCodigo+"'></aside>";
	cadenaHTML+="</div>";
	cadenaHTML+="<div contenedorEst id='contenedor"+pmCodigo+"'>";
	cadenaHTML+="</div>";
	marco.innerHTML=cadenaHTML;
	var ruta="../controladores/cor_CargaNotas.php";
	conexionBasica=crearXMLHttpRequest();
	conexionBasica.onreadystatechange = estudiantesHTML;
	conexionBasica.open('POST',ruta, true);
	conexionBasica.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("buscarEstudiantes")+"&"+"pmcodigo="+encodeURIComponent(pmCodigo);
	conexionBasica.send(envio);  
}
function estudiantesHTML(){
	var contenedor;
	if(conexionBasica.readyState == 4){
		cont=0;
		//recivo el xml con los estudiantes
		var xml=conexionBasica.responseXML;
		//busco el id del contenedor dentro del xml
		var contenedor=xml.getElementsByTagName('contenedor')[0].textContent;
		//designo el div donde se agregan los estudiantes
		var divContenedor=document.getElementById('contenedor'+contenedor);
		//variable para guarda estudiante por estudiante
		var estudiante;
		//numero de inscripcion para el cambio
		var numeroIns="";
		//cadena donde se guardan todas las partes a agregar
		var cadena=	"<h2>Listado de Estudiantes<i class='icon icon-blue icon-print' title='Imprimir Nomina de Estudiantes' onclick='redireccionarReporte("+contenedor+")'></i> <label nota>Nota</label></h2><form>";
		//busco los estudiantes en el xml
		var estudiantes=xml.getElementsByTagName('estudiantes')[0].childNodes;
		for(var x=0;x<estudiantes.length;x++){
			estudiante=estudiantes[x];
			cedula=estudiante.getElementsByTagName('Cedula')[0].textContent;
			numeroIns=estudiante.getElementsByTagName('Numero')[0].textContent;
			cadena+="<aside>"+cedula+"</aside>";
			cadena+="<aside>"+estudiante.getElementsByTagName('Nombres')[0].textContent+"</aside>";
			cadena+="<aside>"+estudiante.getElementsByTagName('Apellidos')[0].textContent+"</aside>";
			cadena+="<aside input><input type='text' placeholder='Nota final' name='"+estudiante.getElementsByTagName('Cedula')[0].textContent+"' ";
			cadena+="value='"+(estudiante.getElementsByTagName('Nota')[0].textContent||0)+"' numeroIns='"+numeroIns+"' cedula='"+cedula+"'";
			cadena+="maxlength='3' onkeypress='return validar_numeros(event);'></aside>";
			cont++;
		}
		cadena+="<aside botones><input type='button' value='Guardar' onclick='guardarTotal(this)'></form></aside>";
		//coloca la cantidad de estudiantes en esta seccion
		document.getElementById("cant"+contenedor).textContent=cont;
		//Cambio al div de la seccion
		var divSeccion=divContenedor.parentNode.parentNode;
		divSeccion.classList.remove('bajarField');
		divSeccion.classList.add("bajarCompleto");
		var divTurno=divSeccion.parentNode;
		divTurno.classList.remove('crecerContenedor');
		divTurno.classList.add('crecerCompleto');
		divContenedor.innerHTML+=cadena;
	}
}
function redireccionarReporte(codigoPM){
	location.href="pdf/PDF_NomEstDoc.php?codigoPM="+codigoPM;
}
//------------------------------- funciones Transaccionales CargaNotas ---------------------------
function guardarTotal(obj){
	var ruta="../controladores/cor_CargaNotas.php";
	conexionBasica=crearXMLHttpRequest();
	conexionBasica.onreadystatechange = verificarOperacion;
	conexionBasica.open('POST',ruta, true);
	conexionBasica.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var formulario=obj.parentNode.parentNode;
	var envio="Operacion="+encodeURIComponent("guardar");
	var columnas=0;
	for(var x=0;x<formulario.length;x++){
		if(formulario[x].nodeName.toLowerCase()=="input"){
			if(formulario[x].type=="text"){
				formulario[x].nodeName;
				envio+="&numeroIns"+columnas+"="+formulario[x].getAttribute('numeroIns')+"&Nota"+columnas+"="+formulario[x].value;
				columnas++;
			}
		}
	}
	envio+="&Columnas="+columnas;
	conexionBasica.send(envio);
}
function verificarOperacion(){
	if(conexionBasica.readyState == 4){
		var xml=conexionBasica.responseXML;
		alert(xml.getElementsByTagName('mensaje')[0].textContent);
		detalleMateria(materiaAbierta[0],materiaAbierta[1]);
	}
}
//------------------------------- funciones Ventana Modal ----------------------------------------
function crearVentana(obj){	
	crearCapaExterior();
	var ventana=document.createElement('div');
	var contenido;
	var nombreEstudiante=obj.parentNode.previousSibling.previousSibling.textContent+" "+obj.parentNode.previousSibling.textContent;
	ventana.id="ventanaModal";
	ventana.style.marginTop=(parseInt(obj.offsetTop)+120)+"px";
	ventana.style.marginLeft=(parseInt(obj.offsetLeft)-300)+"px";	
	document.body.appendChild(ventana);
	contenido="<div cab>"+nombreEstudiante+"<input type='button' onclick='cerrarVentana(this.parentNode.parentNode)' value='X'></div>";
	ventana.innerHTML=contenido;
	setTimeout(function(){ventana.style.height="300px"},50);
	setTimeout(function(){ventana.style.overflow="auto"},1050);
}
function cerrarVentana(ventana){
	ventana.style.height="0px";
	setTimeout(function(){document.body.removeChild(ventana)},1001);
	setTimeout(function(){cerrarCapaExterior()},1010);
}
function crearCapaExterior(){
	var capa=document.createElement("div");
	capa.id="capaExterior";
	capa.onclick=function(){cerrarVentana(document.getElementById('ventanaModal'))}
	document.body.appendChild(capa);
}
function cerrarCapaExterior(){
	var capa=document.getElementById('capaExterior');
	document.body.removeChild(capa);
}