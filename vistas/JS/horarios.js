
var boxShadowAntes="rgb(0, 0, 0) 0px 0px 3px 0px";
var boxShadows="1px 1px 10px ";
var borderAntes="none";
var borderCambio="1px solid ";
var mensajes=0;
//clase que contine los bloques de las materias que pertenece a frameinscripcion 
//y sirve de transporte de informacion entre el frame y la vista principal de inscripcion 
var materiasACambiar=function(){

	this.contadorDeMaterias=0,

	this.materias=new Array(),

	this.agregar= function(bloques){
		var agrego=false;
		if(!this.verificarMateria(bloques[0][3])){
			this.materias[this.contadorDeMaterias]=bloques;
			this.contadorDeMaterias++;	
			agrego=true;
		}else{
			setTimeout(function(){f_MostrarMensaje("Materia ya se encuentra agregada","Alerta",document.getElementById("Horario"),"50px");},50);
		}
		return agrego;
	},

	this.verificarMateria=function(valor){
		var validado=false;
		var longitud=this.materias.length;
		var bloques;
		var cantidadDeBloques;
		for(var m=0;m<longitud;m++){
			bloques=this.materias[m];
			cantidadDeBloques=bloques.length;
			for(var b=0;b<cantidadDeBloques;b++){
				if(bloques[b][3]==valor){
					validado=true;
					break;
				}
			}
		}
		return validado;
	},
	this.eliminarUltimo= function(){
		this.materias.pop();
		this.contadorDeMaterias--;
	},

	this.mostrar= function(){
		alert(this.materias);
	},

	this.sacar=function(materia){
		var cantidadDeMaterias=this.materias.length;
		var control=false;
		for(var x=0;x<cantidadDeMaterias;x++){
			if(!control){
				if(this.materias[x][0][3]==materia){
					control=true;
				}
			}
			if(control){
				if(x==cantidadDeMaterias-1){
					this.eliminarUltimo();
				}else{
					this.materias[x]=this.materias[x+1];					
				}
			}
		}

	},

	this.mostrarContador= function(){
		alert(this.contadorDeMaterias);
	},

	this.resultado = function(){
		return this.materias;
	}

};
//clase de la transaccion Inscripcion
var classInscripcion=function(){

	this.contadorMI=0,

	this.materiaAInscribir=new Array(),

	this.agregarMI=function(valor){
		if(!this.validarMI(valor)){
			this.materiaAInscribir[this.contadorMI]=valor;
			this.contadorMI++;
		}
	},
	this.validarMI=function(valor){
		var validado=false;
		for(var x=0;x<this.materiaAInscribir.length;x++){
			if(valor==this.materiaAInscribir[x]){
				validado=true;
				break;
			}
		}
		return validado;
	},
	this.sacarMI=function(valor){
		var control=false;
		for(var x=0;x<this.materiaAInscribir.length;x++){
			if(!control){
				if(this.materiaAInscribir[x]==valor){
					control=true;
				}
			}
			if(control){
				if(x==this.contadorMI-1){
					this.materiaAInscribir.pop();
					this.contadorMI--;
				}else{
					this.materiaAInscribir[x]=this.materiaAInscribir[x+1];
				}
			}
		}
	},
	this.resultado=function(){
		return this.materiaAInscribir;
	}
};
var objInscripcion= new classInscripcion();
var objetoControl= new materiasACambiar();

	function destruirHorario(){
		document.getElementById("Horario").parentNode.removeChild(document.getElementById("Horario"));
	}

	function construirHorario(ejeX,ejeY,atributos,contenido){
		var cantidadDeBloquesX=ejeX.length;
		var cantidadDeBloquesY=ejeY.length;
		var cantidadDeAtributos=atributos.length;
		var tablaPadre=document.createElement("table");
		var TR;
		var TD;
		var bloque;
		tablaPadre.id="Horario";
		TR=document.createElement("tr");
		TD=document.createElement("td");
		TD.textContent="Horarios";
		TD.id="primerTD";
		TR.appendChild(TD);
		//creo la cabecera 
		for(var indice=0;indice<cantidadDeBloquesX;indice++){
			TD=document.createElement("td");
			TD.textContent=ejeX[indice];
			TR.appendChild(TD);
		}
		tablaPadre.appendChild(TR);
		//creo el resto de la tabla que sera el horario
		for(var y=0;y<cantidadDeBloquesY;y++){
			TR=document.createElement("tr");
			TD=document.createElement("td");
			TD.textContent=ejeY[y];
			TR.appendChild(TD);
			for(var x=0;x<cantidadDeBloquesX;x++){
				TD=document.createElement("td");
				bloque=document.createElement("div");
				//le agrego los atributos pasados como parametros
				for(var a=0;a<cantidadDeAtributos;a++){
					bloque.setAttribute(atributos[a],contenido[x][y][a]);
				}
				TD.appendChild(bloque);
				bloque.parentNode.setAttribute('estado','vacio');
				TR.appendChild(TD);
			}
			tablaPadre.appendChild(TR);
		}
		return tablaPadre;
	}

	function llenarHorario(ocupados){
		var lista=document.getElementsByName("Bloques");
		var cantidadDeMaterias=ocupados.length;
		var cantidadDeBloques=lista.length;
		var bloque;
		for(var x=0;x<cantidadDeBloques;x++){
			for(var m=0;m<cantidadDeMaterias;m++){
				cantidadDeOcupados=ocupados[m].length;
				for(var o=0;o<cantidadDeOcupados;o++){
					if((lista[x].getAttribute("dia")==ocupados[m][o][0])&&(lista[x].getAttribute("bloque")==ocupados[m][o][1])){
						bloque=lista[x];
						bloque.parentNode.setAttribute('estado','lleno');
						bloque.setAttribute("ambiente",ocupados[m][o][2]);
						bloque.setAttribute("materia",ocupados[m][o][3]);
						bloque.setAttribute("docente",ocupados[m][o][4]);
						bloque.setAttribute("Amb",ocupados[m][o][5]);
						bloque.setAttribute("Nommat",ocupados[m][o][6]);
						bloque.setAttribute("PM",ocupados[m][o][7]);
						bloque.setAttribute("Credito",ocupados[m][o][8]);
						bloque.innerHTML="<div materia>"+ocupados[m][o][6]+"</div><div ambientes>"+ocupados[m][o][5]+"</div><div docente>"+ocupados[m][o][4]+"</div>";
						activarBloque(bloque);
					}
				}
			}
		}
	}

//------------------------------------------------------- Inscripcion ----------------------------------------------------
	
	//funcion que se encarga del llenado individual de cada bloque
	function activarBloque(bloque){
		var lista=document.getElementsByName("Bloques");
		var cantidadDeBloques=lista.length;
		var padre;
		var bloqueCompuesto;
		var componente;
		for(var x=0;x<cantidadDeBloques;x++){
			if(lista[x].getAttribute("dia")==bloque.getAttribute("dia")){
				if(lista[x].getAttribute("materia")){
					if((lista[x].getAttribute('ambiente')==bloque.getAttribute('ambiente'))&&(lista[x].getAttribute("materia")==bloque.getAttribute("materia"))&&((lista[x].getAttribute("bloque")==bloque.getAttribute("bloque")-1))){
						padre=bloque.parentNode;
						//remuevo el bloque del TD al que pertece
						padre.parentNode.removeChild(padre);
						//se lo agrego al bloque superior para juntarlos
						lista[x].parentNode.appendChild(bloque);
						//le aumento el rowspan al TD al cual le asigne para que la tabla mantenga su integridad
						lista[x].parentNode.rowSpan=lista[x].parentNode.childNodes.length;
						//dependiendo de la cantidad de bloques que compongan al compuesto se reparte la informacion
						if(lista[x].parentNode.rowSpan==2){
							bloqueCompuesto=lista[x].parentNode;
							componente=bloqueCompuesto.firstChild
							componente.innerHTML="<div materia>"+componente.getAttribute("Nommat")+"</div><div ambientes>"+componente.getAttribute("Amb")+"</div>";
							bloque.innerHTML="<div docente>"+bloque.getAttribute("docente")+"</div>";
						}else if(lista[x].parentNode.rowSpan==3){
							bloqueCompuesto=lista[x].parentNode;
							componente=bloqueCompuesto.firstChild
							componente.innerHTML="<div materia>"+componente.getAttribute("Nommat")+"</div>";
							componente=componente.nextSibling;
							componente.innerHTML="<div ambientes>"+componente.getAttribute("Amb")+"</div>";
							bloque.innerHTML="<div docente>"+bloque.getAttribute("docente")+"</div>";
						}else if(lista[x].parentNode.rowSpan>3){
							bloque.textContent="-";
						}
					}
				}
			}
		}
	}
	//funcion que pasa el bloque seleccionado horario de secciones al horario personal
	function guardarBloques(bloqueSelecionado,horario){
		var bloques;
		var cantidadDeBloques;
		var contadorDeBloquesAnadidos=0;
		var bloquesAnadidos=new Array();

		//variables de recorrido del horario
		var filas=horario.childNodes;
		var cantidadDeFilas=filas.length;
		var celdas;
		var cantidadDeCeldas;
		//fin variables de recorrido
		
		//recorro el horario fila por fila
		for(var f=0;f<cantidadDeFilas;f++){
			//asigno la cantidad de celdas hijas de esta fila
			celdas=filas[f].childNodes;
			cantidadDeCeldas=celdas.length;
			for(var c=0;c<cantidadDeCeldas;c++){
				if((celdas[c].lastChild.nodeName=="DIV")&&(celdas[c].lastChild.getAttribute("materia")==bloqueSelecionado.lastChild.getAttribute("materia"))){
					//asigno los hijos del TD para crear el arreglo
					bloques=celdas[c].childNodes;
					//designo la cantidad de bloques
					cantidadDeBloques=bloques.length;
					//recorro todos los bloques para añadirlos al arreglo					
					for(var b=0;b<cantidadDeBloques;b++){
						//agrego el bloque al arreglo
						bloquesAnadidos [ contadorDeBloquesAnadidos ]=[bloques[b].getAttribute("dia"),bloques[b].getAttribute("bloque"),bloques[b].getAttribute("ambiente"),bloques[b].getAttribute("materia"),bloques[b].getAttribute("docente"),bloques[b].getAttribute("Amb"),bloques[b].getAttribute("Nommat"),bloques[b].getAttribute("PM"),bloques[b].getAttribute("Credito")];
						//le sumo el que agregue al contador
						contadorDeBloquesAnadidos++;
					}
				}
			}
		}
		if(!validarBloques(window.parent.document.getElementById("Horario"),bloquesAnadidos)){				
			if(objetoControl.agregar(bloquesAnadidos)){
				//agrego el codigo de la planificacion del bloque añadido
				setTimeout(function(){f_MostrarMensaje("Materia Agregada","Info",document.getElementById("Horario"))},10);						
				objInscripcion.agregarMI(bloquesAnadidos[0][7]);
				window.parent.materiasAInscribir=objInscripcion.resultado();
				window.parent.arreglo=objetoControl.resultado();
				window.parent.llenar();
				window.parent.activarRetorno(window.parent.document.getElementById("Horario"));
			}
		}
	}
	//funcion que se encarga de validar que las materias no choquen a la hora de selecionar un bloque	
	function validarBloques(horario,bloques){
		
		var validado=false;
		var objeto;
		if(horario!==null){
			//variables de recorrido del horario
			var filas=horario.childNodes;
			var cantidadDeFilas=filas.length;
			var celdas;
			var cantidadDeCeldas;
			var bloquesHora;
			var cantidadDeBloquesHora;
			//fin variables de recorrido
			
			//recorro el horario fila por fila
			for(var f=0;f<cantidadDeFilas;f++){
				//asigno la cantidad de celdas hijas de esta fila
				celdas=filas[f].childNodes;
				cantidadDeCeldas=celdas.length;
				for(var c=0;c<cantidadDeCeldas;c++){
					//pregunto si la celda contiene un div o es solo uno de texto
					if((celdas[c].lastChild.textContent!="")&&(celdas[c].lastChild.nodeName!="#text")){
						//asigno los bloques de hora que contiene la celda
						bloquesHora=celdas[c].childNodes;
						cantidadDeBloquesHora=bloquesHora.length;
						//recorro todos lo bloques horas
						for(var bh=0;bh<cantidadDeBloquesHora;bh++){
							//ahora por cada bloque hora recorro todos los bloques que voy a asignar 
							for(var b=0;b<bloques.length;b++){
								//comparo si el bloque de hora se encuentra en el mismo dia que el uno de los bloques que voy a asignar
								if(bloques[b][0]==bloquesHora[bh].getAttribute("dia")){
									//comparo si el bloque de hora se encuentra en el mismo espacio de hora que el bloque que voy a asignar
									if(bloques[b][1]==bloquesHora[bh].getAttribute("bloque")){
										//el bloque esta ocuapdo
										validado=true;
										if(mensajes==0){
											mensajes++;
											setTimeout(function(){f_MostrarMensaje("Bloque ya se encuentra ocupado, verifique su horario","Alerta",document.getElementById("Horario"),"60px");},10);
											setTimeout(function(){mensajes=0;},300);
										}										
										objeto=celdas[c];
										activarStyle(objeto,horario,"DarkRed");
										setTimeout((function(objeto,horario){return function(){desactivarStyle(objeto,horario);}})(objeto,horario), 500); 
										setTimeout((function(objeto,horario){return function(){activarStyle(objeto,horario,"DarkRed");}})(objeto,horario), 1000); 
										setTimeout((function(objeto,horario){return function(){desactivarStyle(objeto,horario);}})(objeto,horario), 1500);
										setTimeout((function(objeto,horario){return function(){activarStyle(objeto,horario,"DarkRed");}})(objeto,horario), 2000); 
										setTimeout((function(objeto,horario){return function(){desactivarStyle(objeto,horario);}})(objeto,horario), 2500);
										setTimeout((function(objeto,horario){return function(){activarStyle(objeto,horario,"DarkRed");}})(objeto,horario), 3000); 
										setTimeout((function(objeto,horario){return function(){desactivarStyle(objeto,horario);}})(objeto,horario), 3500);
										break;
									}
								}
							}
						}
					}	
				}
			}
		}
		return validado;
	}
	//funcion que activa el retorno en el horario personal
 	function activarRetorno(horarioPersonal){
		var filas=horarioPersonal.childNodes;
		var cantidadDeFilas=filas.length;
		var celdas;
		var cantidadDeCeldas;
		for(var f=0;f<cantidadDeFilas;f++){
			celdas=filas[f].childNodes;
			cantidadDeCeldas=celdas.length;
			for(var c=0;c<cantidadDeCeldas;c++){
				if((celdas[c].lastChild.nodeName=="DIV")&&(celdas[c].lastChild.textContent!="")){
					celdas[c].onclick=function(){regresarBloques(this)};
				}
			}
		}
	}
	//funcion que borra el bloque selecionado del horario personal y rearmar el mismo 
	function regresarBloques(contenedor){
		var bloque=contenedor.lastChild;
		var ventana=document.getElementById("frame").contentWindow;
		//saco de la materias a inscribir el codigo de la planificacion de materia del bloque regresado 
		ventana.objInscripcion.sacarMI(bloque.getAttribute("PM"));
		//lo reflejo en la ventana padre
		materiasAInscribir=ventana.objInscripcion.resultado();
		//saco la materia del arreglo de vizualizacion
		ventana.objetoControl.sacar(bloque.getAttribute("materia"));
		//lo reflejo en la ventan padre
		arreglo=ventana.objetoControl.resultado();
		//lleno el horario
		llenar();
		// activo el retorno en los bloques de la ventana padre
		setTimeout(function(){f_MostrarMensaje("Materia retirada con exito","Info",document.getElementById("Horario"))},10);		
		activarRetorno(document.getElementById("Horario"));
	}
	//funcion que activa el cambio entre horario de secciones y el personal
	function activarCambio(tablaHorario){
		var filas=tablaHorario.childNodes;
		var cantidadDeFilas=filas.length;
		var celdas;
		var cantidadDeCeldas;
		for(var f=0;f<cantidadDeFilas;f++){
			celdas=filas[f].childNodes;
			cantidadDeCeldas=celdas.length;
			for(var c=0;c<cantidadDeCeldas;c++){
				if((celdas[c].lastChild.nodeName=="DIV")&&(celdas[c].lastChild.textContent!="")){
					celdas[c].onclick=function(){guardarBloques(this,tablaHorario)};
					celdas[c].onmouseover=function(){validarOver(this,tablaHorario)};
					celdas[c].onmouseout=function(){desactivarStyle(this,tablaHorario)};
				}
			}
		}
	}
	//valida si los bloques estan ocupados
	function validarOver(bloque,tablaHorario,color){
		var horario=window.parent.document.getElementById("Horario");
		var validado=false;
		var bloques=new Array();
		var celdasARevisar=obtenerHermanos(bloque,tablaHorario);
		var cantidadDeCeldas=celdasARevisar.length;
		var bloquesArevisar=new Array();
		var cantidadDeBloques;
		var indiceBloques=0;
		for(var y=0;y<cantidadDeCeldas;y++){
			bloquesARevisar=celdasARevisar[y].childNodes;
			cantidadDeBloques=bloquesARevisar.length;
			for(var x=0;x<cantidadDeBloques;x++){
				bloques[indiceBloques]=[bloquesARevisar[x].getAttribute("dia"),bloquesARevisar[x].getAttribute("bloque"),bloquesARevisar[x].getAttribute("ambiente"),bloquesARevisar[x].getAttribute("materia"),bloquesARevisar[x].getAttribute("docente"),bloquesARevisar[x].getAttribute("Amb"),bloquesARevisar[x].getAttribute("Nommat"),bloquesARevisar[x].getAttribute("PM"),bloquesARevisar[x].getAttribute("Credito")];
				indiceBloques++;
			}
		}
		if(horario!==null){
			//variables de recorrido del horario
			var filas=horario.childNodes;
			var cantidadDeFilas=filas.length;
			var celdas;
			var cantidadDeCeldas;
			var bloquesHora;
			var cantidadDeBloquesHora;
			//fin variables de recorrido
			
			//recorro el horario fila por fila
			for(var f=0;f<cantidadDeFilas;f++){
				//asigno la cantidad de celdas hijas de esta fila
				celdas=filas[f].childNodes;
				cantidadDeCeldas=celdas.length;
				for(var c=0;c<cantidadDeCeldas;c++){
					//pregunto si la celda contiene un div o es solo uno de texto
					if((celdas[c].lastChild.textContent!="")&&(celdas[c].lastChild.nodeName!="#text")){
						//asigno los bloques de hora que contiene la celda
						bloquesHora=celdas[c].childNodes;
						cantidadDeBloquesHora=bloquesHora.length;
						//recorro todos lo bloques horas
						for(var bh=0;bh<cantidadDeBloquesHora;bh++){
							//ahora por cada bloque hora recorro todos los bloques que voy a asignar 
							for(var b=0;b<bloques.length;b++){
								//comparo si el bloque de hora se encuentra en el mismo dia que el uno de los bloques que voy a asignar
								if(bloques[b][0]==bloquesHora[bh].getAttribute("dia")){
									//comparo si el bloque de hora se encuentra en el mismo espacio de hora que el bloque que voy a asignar
									if(bloques[b][1]==bloquesHora[bh].getAttribute("bloque")){
										//el bloque esta ocuapdo
										validado=true;
										break;
									}
								}
							}
						}
					}	
				}
			}
		}
		if(!validado){
			activarStyle(bloque,tablaHorario,"MidnightBlue");
		}else{
			activarStyle(bloque,tablaHorario,"DarkRed")
		}
	}
	//funcion encargadad de activar los efectos visales dentro de los horarios
	function activarStyle(bloque,tablaHorario,color){
		var filas=tablaHorario.childNodes;
		var cantidadDeFilas=filas.length;
		var celdas;
		var cantidadDeCeldas;
		for(var f=0;f<cantidadDeFilas;f++){
			celdas=filas[f].childNodes;
			cantidadDeCeldas=celdas.length;
			for(var c=0;c<cantidadDeCeldas;c++){
				if((celdas[c].lastChild.nodeName=="DIV")&&(celdas[c].lastChild.textContent!="")){
					if(celdas[c].lastChild.getAttribute("materia")==bloque.lastChild.getAttribute("materia")){
						celdas[c].style="transition:box-shadow 0.5s";
						f_Cambio(celdas[c],boxShadows+color,borderCambio+color);
					}
				}
			}
		}
	}
	//funcion encargada de desactivar los efectos visuales dentro de los horarios
	function desactivarStyle(bloque,tablaHorario){
		var filas=tablaHorario.childNodes;
		var cantidadDeFilas=filas.length;
		var celdas;
		var cantidadDeCeldas;
		for(var f=0;f<cantidadDeFilas;f++){
			celdas=filas[f].childNodes;
			cantidadDeCeldas=celdas.length;
			for(var c=0;c<cantidadDeCeldas;c++){
				if((celdas[c].lastChild.nodeName=="DIV")&&(celdas[c].lastChild.textContent!="")){
					if(celdas[c].lastChild.getAttribute("materia")==bloque.lastChild.getAttribute("materia")){
						celdas[c].style="transition:box-shadow 0.5s";
						f_Cambio(celdas[c],boxShadowAntes,borderAntes);
					}
				}
			}
		}
	}
	function f_Cambio(obj,propiedad,propiedad2){
		obj.style.boxShadow=propiedad;
		obj.style.border=propiedad2;
	}
	//funcion que me trae todos los TD con los que comparta materia con el bloque(TD selecionado)
	function obtenerHermanos(bloque,tablaHorario){		
		var hermanos=new Array();
		var cantidadHermanos=0;

		//variables de recorrido
		var filas=tablaHorario.childNodes;
		var cantidadDeFilas=filas.length;
		var celdas;
		var cantidadDeCeldas;
		//fin variables de recorrido
		for(var f=0;f<cantidadDeFilas;f++){
			celdas=filas[f].childNodes;
			cantidadDeCeldas=celdas.length;
			for(var c=0;c<cantidadDeCeldas;c++){
				if((celdas[c].lastChild.nodeName=="DIV")&&(celdas[c].lastChild.textContent!="")){
					if(celdas[c].lastChild.getAttribute("materia")==bloque.lastChild.getAttribute("materia")){
						hermanos[cantidadHermanos]=celdas[c];
						cantidadHermanos++;
					}
				}
			}
		}
		return hermanos;
	}