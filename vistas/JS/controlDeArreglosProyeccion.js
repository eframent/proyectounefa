var arreglo=new Array();
var contAgregados=0;
var arregloPrevi=new Array();
function gestionarAgregar(bloquesAgregar){
	agregarArreglo(bloquesAgregar);
	agregar();
	var espacio=b-1;
	frame=document.getElementById('frame').contentWindow;
	document.getElementById("newCamp0-"+espacio).value=frame.MateriaAUtilizar;
	document.getElementById("newCamp1-"+espacio).value=frame.DocenteAUtilizar;
	document.getElementById("newCamp2-"+espacio).value=frame.document.getElementById("tope").value;
	document.getElementById("cmbcodmat").value="-";
	document.getElementById("docente").value="-";
	crearArregloPrevi();
	frame.f_ArmarPrevi();	
}
function agregarArreglo(bloquesAgregar){
	var lista=document.getElementsByTagName("div");
	var longitud=lista.length;
	var objAEliminar;
	for(var x=0;x<longitud;x++){
		if(lista[x].getAttribute("tipo")){
			if(lista[x].firstChild.value==bloquesAgregar[0][3]){
				objAEliminar=lista[x].firstChild;
				break;
			}
		}
	}
	if(objAEliminar){
		eliminar(objAEliminar);
	}
	arreglo[contAgregados]=bloquesAgregar;
	contAgregados++;
	f_ValidarComboMateria();
	document.getElementById("variable").value=arreglo;
	document.getElementById("Columnas").value=contAgregados;
	//alert(JSON.stringify(arreglo));
}
function buscarElemento(materia){
	var indice;
	for(var x=0;x<contAgregados;x++){
		if(arreglo[x][0][3]==materia){
			indice=x;
			break;
		}
	}
	return indice;
}
function eliminarElemento(materia){
	var indice=buscarElemento(materia);
	arreglo=crearArregloAuxiliar(indice,"arreglo",arreglo);
	contAgregados--;
	f_ValidarComboMateria();
}
function crearArregloAuxiliar(indice,condicion,arregloAUtilizar){
	condicion= condicion || "arreglo";
	var arrAux=new Array();
	var elemento= new Array();
	var y=0;
	var control=0;
	//guardo en un arreglo auxiliar el arreglo sin el elemnto no deseado
	for(var x=0;x<arregloAUtilizar.length;x++){
		if(x==indice){
			elemento=arregloAUtilizar[x];
		}else{	
			if(arregloAUtilizar[x]){
				arrAux[y]=arregloAUtilizar[x];
			}
			y++;
		}
	}
	if(condicion=="elemento"){
		return elemento;
	}else if(condicion=="arreglo"){
		return arrAux;
	}
}
function f_ValidarComboMateria(){
	//valido que solo me salgan los correspondientas a esta carrera y semestre
	f_ListaDependienteDoble('cmbcodesp','cmbsemestre','cmbcodmat');
	//guardao el nodo correspondienta al combo a validar
	var combo=document.getElementById("cmbcodmat");
	//recorro todo el arreglo pare verificar que no aparescan las materia ya agregadas
	for(var x=0;x<contAgregados;x++){
		//recorro todas las options del combo para comprar con las agregadas
		for(var y=0;y<combo.options.length;y++){
			if(combo.options[y].value==arreglo[x][0][3]){				
				combo.options[y].style.display="none";
			}
		}
	}
}
function recibirArreglo(condicion,materia){
	var indice=buscarElemento(materia);
	var  bloques;
	if(condicion=="anteriores"){
		bloques=crearArregloAuxiliar(indice,"arreglo",arreglo);
	}else{
		bloques=crearArregloAuxiliar(indice,"elemento",arreglo);
	}
	return bloques;
}
//-------------------------------Previsualizacion----------------------

function eliminarEl(oldElement){
	eliminar(oldElement);
	crearArregloPrevi();
	var src=document.getElementById('frame').src;
	if(src.contains("Visualizacion")){
		frame=document.getElementById('frame').contentWindow;
		frame.f_ArmarPrevi();		
	}
}
function crearArregloPrevi(elemento){
	var lista=document.getElementsByTagName("select");
	arregloPrevi=[];
	var docente="";
	var materia="";
	var ambiente="";
	//esta variable guarda el numero del registro agregado donde se encuentra el docente y la materia del espacio buscado
	var fragIdCampo="";
	//campo que guarda el valor del docente
	var campDocente;
	//ciclo para materias
	for(var x=0;x<arreglo.length;x++){
		//inicializo el espacio para cada materia
		arregloPrevi[x]=new Array();
		//ciclo para bloques por materia
		for(var z=0;z<arreglo[x].length;z++){
			//ciclo para encontrar el valor de la lista que contiene los valores buscados
			for(var y=0;y<lista.length;y++){
				if(arreglo[x][z][3]==lista[y].value){
					//guarda el valor de la materia
					materia=lista[y].options[lista[y].selectedIndex].textContent;
					//identifico el valor del id del registro donde se encuentra
					fragIdCampo=lista[y].name.substr(9,1);
					//identifico al campo donde esta el valor del docente
					campDocente=document.getElementById('newCamp1-'+fragIdCampo);
					//guardo el valor del docente
					docente=campDocente.options[campDocente.selectedIndex].textContent;
				}
			}
			//creo un espacio en el arreglo de la previsualizacion por cada uno del arreglo de guardado
			arregloPrevi[x][z]=new Array(arreglo[x][z][0],arreglo[x][z][1],arreglo[x][z][2],arreglo[x][z][3],docente,ambiente,materia,"","");
		}
	}
}