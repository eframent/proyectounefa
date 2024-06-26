
f_CargarLibrerias();
function f_CargarLibrerias(){
	var librerias= librerias || new Array("Mensajes.js","motorValidaciones.js","maestros.inicio.js","scroll.js","motorAjax.js");
	for(var x=0;x<librerias.length;x++){
		document.writeln("<script type='text/javascript' src='JS/"+librerias[x]+"'></script>");
	}
}