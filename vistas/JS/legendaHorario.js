
	function construirLegenda(tipo){
		tipo=tipo||'estudiante';
		//debe existir un div con un id legenda
		var legenda=document.getElementById("legenda");
		//y un arreglo contodos los bloques concernientes llamado arreglo
		var bloques=arreglo;
		if(document.getElementById("tablaLegenda")){
			legenda.removeChild(document.getElementById("tablaLegenda"));
		}
		var controlDia=-1;
		var controlAmbiente=-1;

		var cantidadDias=0;
		var cantidadAmbientes=0;

		//construccion de tabla
		if(tipo=="docente"){
			var cabecera=new Array("Materia","Dias","Ambientes");
		}else if(tipo=="estudiante"){
			var cabecera=new Array("Materia","Docente","Dias","Ambientes");
		}
		var tabla=document.createElement("table");
		tabla.id="tablaLegenda";

		var TR=document.createElement("tr");
		var TD;
		//contruccion de cabecera
		for(var c=0;c<cabecera.length;c++){
			TD=document.createElement("td");
			TD.textContent=cabecera[c];
			TR.appendChild(TD);
		}
		TR.firstChild.id="primero";
		tabla.appendChild(TR);
		for(var m=0;m<bloques.length;m++){
			TR=document.createElement("tr");
			//Materia
			TD=document.createElement("td");
			TD.textContent=bloques[m][0][6];
			TR.appendChild(TD);
			//Docente
			if(tipo!="docente"){
				TD=document.createElement("td");
				TD.textContent=bloques[m][0][4];
				TR.appendChild(TD);
			}
			controlDia=-1;
			cantidadDias=0;
			cantidadAmbientes=0;
			for(var b=0;b<bloques[m].length;b++){
				if(bloques[m][b][0]!=controlDia){
					if(cantidadDias>0){
						tabla.appendChild(TR);
						for(var j=0;j<cantidadDias;j++){
							if(j!=0){									
								TR=TR.previousSibling;
							}								
							for(var i=0;i<2;i++){
								TD=TR.childNodes[i];
								if(TD.getAttribute("crecer")!="no"){
									TD.rowSpan=parseInt(parseInt(cantidadDias)+1);
								}
							}
						}
						TR=document.createElement("tr");
					}
					cantidadDias++;
					controlDia=bloques[m][b][0];
					controlAmbiente=-1;

					TD=document.createElement("td");

					switch(parseInt(controlDia)){
						case 1:
							TD.textContent="Lunes";
							break;
						case 2:
							TD.textContent="Martes";
							break;
						case 3:
							TD.textContent="Miercoles";
							break;
						case 4:
							TD.textContent="Jueves";
							break;
						case 5:
							TD.textContent="Viernes";
							break;
						case 6:
							TD.textContent="Sabado";
							break;
						case 7:
							TD.textContent="Domingo";
							break;
					}
					TD.setAttribute("crecer","no");
					TR.appendChild(TD);
				}
				if(bloques[m][b][2]!=controlAmbiente){

					cantidadAmbientes++;
					controlAmbiente=bloques[m][b][2];

					TD=document.createElement("td");
					TD.textContent=bloques[m][b][5];
					TD.setAttribute("crecer","no");
					TR.appendChild(TD);
				}
			}
			tabla.appendChild(TR);
		}
		legenda.appendChild(tabla);
	}