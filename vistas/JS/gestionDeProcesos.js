gestionDeProceso();
function gestionDeProceso(){
	var posterior;
	var elemento;
	if(!proceso){
		var lista=document.getElementsByTagName('div');
		var ciclos=lista.length;
		for(var x=0;x<ciclos;x++){
			if(lista[x].getAttribute("Contenedor")){
				lista[x].style.display="none";
				elemento=lista[x]; 
				posterior=elemento.nextSibling;
			}
		}
		var nuevoContenedor=crearDivContenedor();
		posterior.parentNode.insertBefore(nuevoContenedor,posterior);
	}
}
function crearDivContenedor(){
	var div=document.createElement("div");
	var contenido=document.createElement("div");
	div.style.height="auto";
	div.style.minHeight="370px";
	contenido.textContent="Proceso";
	contenido.className="Proceso";
	div.appendChild(contenido);
	return div;
}