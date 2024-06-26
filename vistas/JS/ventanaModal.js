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