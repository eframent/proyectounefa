var conexionBusquedaPrincipal;
var control=0;
//---------------------------------Efectos-------------------------------------------------------------
function desaparecer(elemento,duracion){
	duracion=duracion||'0.5s'
	elemento.style.transition="all "+duracion;
	elemento.style.height="0px";
}
//--------------------------------Agregar y destruir elementos-----------------------------------------
function construirElementoBusqueda(tipo){
	var elementoAnterior;
	if(control==0){
		control=1;
		if(document.getElementById('aula')){
			elementoAnterior=document.getElementById('aula');
		}else if(document.getElementById('docente')){
			elementoAnterior=document.getElementById('docente');
		}else if(document.getElementById('seccion')){
			elementoAnterior=document.getElementById('seccion');
		}
		var elementoBusqueda=document.createElement('div');
		var cadena="";
		if(tipo=='aula'){
			elementoBusqueda.id="aula";
			cadena="<input type='text' name='Nombre' placeholder='Aula'>";
			cadena+="<label lupa onclick='enviarBusqueda(\"aula\",this)'><i class='icon icon-white icon-search'></i></label>";
			elementoBusqueda.innerHTML=cadena;
		}else if(tipo=="docente"){
			elementoBusqueda.id="docente";
			cadena="<input type='text' name='Cedula' placeholder='Cedula'>";
			cadena+="<input type='text' name='Nombre1' placeholder='Primer Nombre'>";
			cadena+="<input type='text' name='Nombre2' placeholder='Segundo Nombre'>";
			cadena+="<input type='text' name='Apellido1' placeholder='Primer Apellido'>";
			cadena+="<input type='text' name='Apellido2' placeholder='Segundo Apellido'>";
			cadena+="<label lupa onclick='enviarBusqueda(\"docente\",this)'><i class='icon icon-white icon-search'></i></label>";
			elementoBusqueda.innerHTML=cadena;
		}else if(tipo=="seccion"){
			elementoBusqueda.id="seccion";
			cadena="<input type='text' name='Carrera' placeholder='Carrera'>";
			cadena+="<input type='text' name='Semestre' placeholder='Semestre'>";
			cadena+="<input type='text' name='Seccion' placeholder='Seccion'>";
			cadena+="<input type='text' name='Regimen' placeholder='Regimen'>";
			cadena+="<label lupa onclick='enviarBusqueda(\"seccion\",this)'><i class='icon icon-white icon-search'></i></label>";
			elementoBusqueda.innerHTML=cadena;
		}
		elementoBusqueda.style.height="0px";
		elementoBusqueda.style.overflow="hidden";
		if(elementoAnterior){
			desaparecer(elementoAnterior);
			setTimeout(function(){
						destruirHTML(elementoAnterior);
					},500);
		}else{
			control=0;
		}
		document.busqueda.appendChild(elementoBusqueda);
		setTimeout(function(){
				elementoBusqueda.style.transition="all 0.5s";
				elementoBusqueda.style.height="35px";
			},450);

	}
}
function destruirHTML(elemento){
	elemento.parentNode.removeChild(elemento);
	control=0;
}
function f_construirContenedorResultado(){
	if(document.getElementById('resultado')){
		elementoAnterior=document.getElementById('resultado');
		desaparecer(elementoAnterior,'1s');
		setTimeout(function(){
						destruirHTML(elementoAnterior);
					},1000);
	}
	var elementoNuevo=document.createElement('div');
	elementoNuevo.id='resultado';
	document.busqueda.parentNode.insertBefore(elementoNuevo,document.getElementById('ultimo'));
	setTimeout(function(){
			elementoNuevo.style.transition="all 1s";
			elementoNuevo.style.height="500px";
			elementoNuevo.style.overflow="auto";

		},950);
	return elementoNuevo;
}
//--------------------------------------Manejo de Peticiones y Respuestas --------------------------------
function enviarBusqueda(tipo,elemento){
	elemento.onclick="";
	elemento.id='buscar';
	var ruta="../controladores/cor_Rep_Horario.php";
	var formulario=document.busqueda;
	conexionBusquedaPrincipal=crearXMLHttpRequest();
	conexionBusquedaPrincipal.onreadystatechange = respuestaBusqueda;
	conexionBusquedaPrincipal.open('POST',ruta, true);
	if(tipo=='docente'){

		conexionBusquedaPrincipal.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("buscarElementos");
		envio+="&Cedula="+encodeURIComponent(formulario.Cedula.value.toUpperCase());
		envio+="&Nombre1="+encodeURIComponent(formulario.Nombre1.value.toUpperCase());
		envio+="&Nombre2="+encodeURIComponent(formulario.Nombre2.value.toUpperCase());
		envio+="&Apellido1="+encodeURIComponent(formulario.Apellido1.value.toUpperCase());
		envio+="&Apellido2="+encodeURIComponent(formulario.Apellido2.value.toUpperCase());
		envio+="&busqueda="+encodeURIComponent("docente");

	}else if(tipo=="aula"){

		conexionBusquedaPrincipal.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("buscarElementos");
		envio+="&Nombre="+encodeURIComponent(formulario.Nombre.value.toUpperCase());
		envio+="&busqueda="+encodeURIComponent("aula");

	}else if(tipo=="seccion"){

		conexionBusquedaPrincipal.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("buscarElementos");
		envio+="&Carrera="+encodeURIComponent(formulario.Carrera.value.toUpperCase());
		envio+="&Semestre="+encodeURIComponent(formulario.Semestre.value.toUpperCase());
		envio+="&Seccion="+encodeURIComponent(formulario.Seccion.value.toUpperCase());
		envio+="&Regimen="+encodeURIComponent(formulario.Regimen.value.toUpperCase());
		envio+="&busqueda="+encodeURIComponent("seccion");

	}
	conexionBusquedaPrincipal.send(envio);  
}
function respuestaBusqueda(){
	var clase;
	if(conexionBusquedaPrincipal.readyState == 4){	
		//recivo el xml con los usuarios
		var xml=conexionBusquedaPrincipal.responseXML;
		//construyo el elemento que contendra el resultado
		var divContenedor=f_construirContenedorResultado();
		//variable para guarda elemento por elemento
		var elemento;
		//variable que guarda el tipo de busqueda
		var tipo=xml.getElementsByTagName('tipo')[0].textContent;
		//cadenaHtml donde se guardan todas las partes a agregar
		var cadenaHtml="";
		//busco los elementos en el xml
		var elementos=xml.getElementsByTagName('elementos')[0].childNodes;
		for(var x=0;x<elementos.length;x++){
			elemento=elementos[x];
			if(tipo=="aula"){

				cadenaHtml+="<div resultadoBusqueda elemento='busqueda' onclick='buscarHorario(this)'";
					cadenaHtml+="codigo='"+elemento.getElementsByTagName('Codigo')[0].textContent+"' tipo='"+tipo+"'>";
					cadenaHtml+="<div superior='superior'>"+elemento.getElementsByTagName('Nombre')[0].textContent+"</div>";
					cadenaHtml+="<div inferior='inferior'><i class='icon32 icon-white icon-aula'></i></div>";
				cadenaHtml+="</div>";

			}else if(tipo=="docente"){

				cadenaHtml+="<div resultadoBusqueda elemento='busqueda' onclick='buscarHorario(this)'";
					cadenaHtml+="codigo='"+elemento.getElementsByTagName('Cedula')[0].textContent+"' tipo='"+tipo+"'>";
					cadenaHtml+="<div superior='superior'>"+elemento.getElementsByTagName('Nombres')[0].textContent+"</div>";
					cadenaHtml+="<div inferior='inferior'><i class='icon32 icon-white icon-user'></i></div>";
				cadenaHtml+="</div>";

			}else if(tipo=='seccion'){

				cadenaHtml+="<div resultadoBusquedaseccion elemento='busqueda' onclick='buscarHorario(this)'";
					cadenaHtml+="codigo='"+elemento.getElementsByTagName('Codigo')[0].textContent+"' tipo='"+tipo+"'>";
					cadenaHtml+="<div superior='superior'>"+elemento.getElementsByTagName('Carrera')[0].textContent+"";
					cadenaHtml+="-"+elemento.getElementsByTagName('Semestre')[0].textContent+"";
					cadenaHtml+="-"+elemento.getElementsByTagName('Turno')[0].textContent+"";
					cadenaHtml+="-"+elemento.getElementsByTagName('Seccion')[0].textContent+"</div>";
					cadenaHtml+="<div inferior='inferior'><i class='icon32 icon-white icon-contacts'></i></div>";
				cadenaHtml+="</div>";

			}
			cont++;
		}
		divContenedor.innerHTML=cadenaHtml;	
		document.getElementById('buscar').onclick=function(){enviarBusqueda(tipo,this)};	
	}
}
function buscarHorario(elemento){
	var tipo=elemento.getAttribute('tipo');
	var valorBusqueda=elemento.getAttribute('codigo');
	var lista=document.getElementsByTagName('div');

	for(var x=0;x<lista.length;x++){
		if(lista[x].getAttribute('elemento')=="busqueda"){
			lista[x].id="";
			lista[x].onclick=function(){abrirOtroHorario(this)};
		}
	}
	//escondo todos los elementos hijos y creo los botones de funcionamiento del titulo
	lista=elemento.childNodes;
	for(var x=0;x<lista.length;x++){
		if(lista[x].nodeName!="#text"){
			if(lista[x].getAttribute('superior')=='superior'){

				lista[x].id="tituloHorario";
				//creo el boton de cerrar horario
				var botonCerrar=document.createElement('i');
				botonCerrar.type="button";
				botonCerrar.id="botonCerrarHorario";
				botonCerrar.onclick=function(){cerrarHorario(this)}
				botonCerrar.classList.add('icon');
				botonCerrar.classList.add('icon-red');
				botonCerrar.classList.add('icon-close');
				var objeto=lista[x];
				setTimeout((function(objeto,botonCerrar){return function(){objeto.appendChild(botonCerrar);}})(objeto,botonCerrar), 1000); 
			}else{
				lista[x].style.display='none';
			}
		}
	}
	//asigno el identficador del contenedorHorarion
	elemento.id="contenedorHorario";
	var ruta="../controladores/cor_Rep_Horario.php";
	var formulario=document.busqueda;
	conexionBusquedaPrincipal=crearXMLHttpRequest();
	conexionBusquedaPrincipal.onreadystatechange = respuestaHorario;
	conexionBusquedaPrincipal.open('POST',ruta, true);
	if(tipo=='docente'){

		conexionBusquedaPrincipal.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("buscarHorario");
		envio+="&Cedula="+encodeURIComponent(valorBusqueda);
		envio+="&busqueda="+encodeURIComponent("docente");

	}else if(tipo=="aula"){

		conexionBusquedaPrincipal.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("buscarHorario");
		envio+="&CodigoAula="+encodeURIComponent(valorBusqueda);
		envio+="&busqueda="+encodeURIComponent("aula");

	}else if(tipo=="seccion"){

		conexionBusquedaPrincipal.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var envio="Operacion="+encodeURIComponent("buscarHorario");
		envio+="&Codigo="+encodeURIComponent(valorBusqueda);
		envio+="&busqueda="+encodeURIComponent("seccion");

	
	}
	conexionBusquedaPrincipal.send(envio);  
}
function respuestaHorario(){
	var clase;
	if(conexionBusquedaPrincipal.readyState == 4){	
		//recivo el xml con los usuarios
		var xml=conexionBusquedaPrincipal.responseXML;
		//variable para guarda elemento por elemento
		var divContenedor=document.getElementById('contenedorHorario');
		//variable que guarda el tipo de busqueda
		var tipo=xml.getElementsByTagName('tipo')[0].textContent;
		//cadenaHtml donde se guardan todas las partes a agregar
		var cadenaHtml="";
		//contenedor de bloques
		var bloque;
		//comienza las construccion de los arreglos para la construccion de horarios
		var att=["bloque","dia","name"];
		var cont=new Array();	
		var dias=["Lunes","Martes","Míercoles","Jueves","Víernes","Sabado","Domingo"];
		var bloques=xml.getElementsByTagName('bloques')[0].childNodes;
		var horas=[];
		//arreglos Horas, bloques y cont 
		for(var y=0;y<dias.length;y++){
			cont[y]=[];
			for(var x=0;x<bloques.length;x++){
				bloque=bloques[x];
				horas[x]=bloque.getElementsByTagName('Nombre')[0].textContent;
				cont[y][x]=[bloque.getElementsByTagName('Codigo')[0].textContent,(y+1),'Bloques']
			}
		}

		var bloquesOcupados=[];
		var materias=xml.getElementsByTagName('ocupados')[0].childNodes;
		var bloquesXML=[];
		//elementos de cada bloque
		var dia;
		var codigoBloque;
		var codigoAmbiente;
		var codigoMateria;
		var nombreDocente;
		var nombreAmbiente;
		var nombreMateria;
		var codigoSeccionPla;
		var unidades;
		//bloques Ocupados
		for(var x=0;x<materias.length;x++){
			bloquesOcupados[x]=[];
			bloquesXML=materias[x].childNodes;
			for(var y=0;y<bloquesXML.length;y++){
				//guardo los valores del XML dentro de las variables
				dia=bloquesXML[y].getElementsByTagName('Dia')[0].textContent||"";
				codigoBloque=bloquesXML[y].getElementsByTagName('CodigoBloque')[0].textContent||"";
				codigoAmbiente=bloquesXML[y].getElementsByTagName('CodigoAmbiente')[0].textContent||"";
				codigoMateria=bloquesXML[y].getElementsByTagName('CodigoMateria')[0].textContent||"";
				nombreDocente=bloquesXML[y].getElementsByTagName('NombreDocente')[0].textContent||"";
				nombreAmbiente=bloquesXML[y].getElementsByTagName('NombreAmbiente')[0].textContent||"";
				nombreMateria=bloquesXML[y].getElementsByTagName('NombreMateria')[0].textContent||"";
				codigoSeccionPla=bloquesXML[y].getElementsByTagName('CodigoSeccionPla')[0].textContent||"";
				unidades=bloquesXML[y].getElementsByTagName('Unidades')[0].textContent||"";
				//guardo todos los valoes en el arreglo
				bloquesOcupados[x][y]=[dia,codigoBloque,codigoAmbiente,codigoMateria,nombreDocente,nombreAmbiente,nombreMateria,codigoSeccionPla,unidades];

			}

		}
		//luego de tener los arreglos llenos creo el horario
		var horario=construirHorario(dias,horas,att,cont);
		//y lo lleno con los bloques ocupados
		divContenedor.appendChild(horario);
		divContenedor.style.transition="all 1s";
		divContenedor.style.width="1000px";
		divContenedor.style.height=(50+(bloques.length*65))+"px";
		divContenedor.style.background="white";
		llenarHorario(bloquesOcupados);
	}
}
function cerrarHorario(botonCerrar){
	//identificadores a tomar en cuenta contenedorHorario->div, tituloHorario->titulo, botonCerrarHorario->boton a destruir
	var contenedorHorario=document.getElementById('contenedorHorario');
	var horario=document.getElementById('Horario');
	var titulo=document.getElementById('tituloHorario');
	botonCerrar.parentNode.removeChild(botonCerrar);
	//cambios sobre el contenedor
	if(contenedorHorario.getAttribute('tipo')!="seccion"){	
		contenedorHorario.style.width="85px";
		contenedorHorario.style.height="85px";
	}else{
		contenedorHorario.style.width="125px";
		contenedorHorario.style.height="125px";
	}

	contenedorHorario.style.background='#34495e';
	//destruyo el horario
	horario.parentNode.removeChild(horario);
	//cambios sobre titulo
	titulo.id="";
	//activo los elementos faltantes dentro del contenedor y le quito el id
	contenedorHorario.id="";
	var lista=contenedorHorario.childNodes
	for(var x=0;x<lista.length;x++){
		if(lista[x].style.display=="none"){
			lista[x].style.display="block";
		}
	}
	//luego activo el eneto click sobre los demas resultados de la busqueda
	lista=document.getElementsByTagName('div');

	for(var x=0;x<lista.length;x++){
		if((lista[x].getAttribute('elemento')=="busqueda")&&(lista[x]!=contenedorHorario)){
			lista[x].id="";
			lista[x].onclick=function(){buscarHorario(this)};
		}
	}
	//activo el contendorHorario con unas milesimas de diferencia
	setTimeout(function(){
		contenedorHorario.onclick=function(){buscarHorario(this)};
	},100);
}
function abrirOtroHorario(elemento){
	cerrarHorario(document.getElementById('botonCerrarHorario'));
	setTimeout(function(){buscarHorario(elemento)},600);
}