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
	var ruta="../controladores/cor_Depuracion.php";
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
		var cadena=	"<h2>Listado de Estudiantes</h2>";
		//busco los estudiantes en el xml
		var estudiantes=xml.getElementsByTagName('estudiantes')[0].childNodes;
		for(var x=0;x<estudiantes.length;x++){
			estudiante=estudiantes[x];
			numeroIns=estudiante.getElementsByTagName('Numero')[0].textContent;
			cadena+="<aside>"+estudiante.getElementsByTagName('Cedula')[0].textContent+"</aside>";
			cadena+="<aside>"+estudiante.getElementsByTagName('Nombres')[0].textContent+"</aside>";
			cadena+="<aside>"+estudiante.getElementsByTagName('Apellidos')[0].textContent+"</aside>";
			cadena+="<aside mover><input type='button' value='Mover A:' name='movera' onclick='armarMovimiento(this,"+numeroIns+")'></aside>";
			cont++;
		}
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
//----------------------- Funciones Depuracion(Mover Estudiantes)---------------------------------------------
function armarMovimiento(obj,Numero){
	if(document.getElementById('ventanaModal')){
		cerrarVentana(document.getElementById('ventanaModal'));
	}
	crearVentana(obj);
	var ruta="../controladores/cor_Depuracion.php";
	conexionBasica=crearXMLHttpRequest();
	conexionBasica.onreadystatechange = materiasHTML;
	conexionBasica.open('POST',ruta, true);
	conexionBasica.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("buscarMaterias")+"&"+"Ins="+encodeURIComponent(Numero);
	conexionBasica.send(envio);
}
function materiasHTML(){
	var contenedor;
	if(conexionBasica.readyState == 4){
		//recivo el xml con los estudiantes
		var xml=conexionBasica.responseXML;
		//designo el div donde se agregan las Materias
		var divContenedor=document.getElementById('ventanaModal');;
		//variable para guarda las Materias donde se podra mover el estudiante
		var materia;
		//cadena donde se guardan todas las partes a agregar
		var cadena="";
		//busco los materias en el xml
		var materias=xml.getElementsByTagName('materias')[0].childNodes;
		//numero de inscripcion para el cambio
		var numeroIns=xml.getElementsByTagName('numero')[0].textContent;
		//codigo de la seccion de la materia para el cambio
		var pmCodigo;
		var estudiantesInscritos;
		var topeEstudiantes;
		cadena+="<CuerCab>Sección</CuerCab>";
		cadena+="<CuerCab>Materia</CuerCab>";
		cadena+="<CuerCab>Matricula/Tope</CuerCab>";
		cadena+="<CuerCab>Operación</CuerCab>";
		for(var x=0;x<materias.length;x++){
			materia=materias[x];
			estudiantesInscritos=materia.getElementsByTagName('Estudiantes')[0].textContent||0;
			topeEstudiantes=materia.getElementsByTagName('Tope')[0].textContent;
			pmCodigo=materia.getElementsByTagName('Codigo_M')[0].textContent;
			cadena+="<Cuer>"+materia.getElementsByTagName('Seccion')[0].textContent+"</Cuer>";
			cadena+="<Cuer>"+materia.getElementsByTagName('Nombre')[0].textContent+"</Cuer>";
			cadena+="<Cuer>"+estudiantesInscritos+"/"+topeEstudiantes+"</Cuer>";
			if(estudiantesInscritos==topeEstudiantes){
				cadena+="<Cuer>SECCION LLENA</Cuer><br>";
			}else{
				cadena+="<Cuer><input type='button' value='Mover:' name='movera' onclick='mover(this,"+numeroIns+","+pmCodigo+")'></Cuer><br>";	
			}
			
		}
		divContenedor.innerHTML+=cadena;
	}
}
//------------------------------- funciones Transaccionales Depuracion ---------------------------
function mover(obj,numeroIns,pmCodigo){
	var ruta="../controladores/cor_Depuracion.php";
	conexionBasica=crearXMLHttpRequest();
	conexionBasica.onreadystatechange = verificarOperacion;
	conexionBasica.open('POST',ruta, true);
	conexionBasica.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var envio="Operacion="+encodeURIComponent("mover")+"&"+"Ins="+encodeURIComponent(numeroIns)+"&"+"pmcodigo="+encodeURIComponent(pmCodigo);
	conexionBasica.send(envio);
}
function verificarOperacion(){
	if(conexionBasica.readyState == 4){
		var xml=conexionBasica.responseXML;
		alert(xml.getElementsByTagName('mensaje')[0].textContent);
		cerrarVentana(document.getElementById('ventanaModal'));
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