//-------------------------------------------- Mensajes 0.0.1 ----------------------------------------
	   function f_CrearMensaje(psMensaje,psTipo){
	   		var newMensaje=document.createElement("div");
	   		newMensaje.id="mensaje";
	   		var newTexto=document.createTextNode(psMensaje);
	   		newMensaje.appendChild(newTexto);
	   		newMensaje.addEventListener("click",function(){f_OcultarMensaje(newMensaje)},false);
	   		newMensaje.className=psTipo;
	   		newMensaje.style.height="0px";
	   		newMensaje.style.padding="20px";
	   		newMensaje.style.overflow="hidden";
	   		newMensaje.style.cursor="pointer";
	   		return newMensaje;
	   }
	   function f_MostrarMensaje(psMensaje,psTipo,psDestino,psTamano,psCapa){
	   		var destino= document.getElementById("capaExteriorMensaje");
	   		var newMensaje = f_CrearMensaje(psMensaje,psTipo);
	   		psTamano=psTamano || "20px";
	   		psCapa='si';
	   		if(psCapa.toLowerCase()=="si"){
	   			if(!document.getElementById("capaExteriorMensaje")){
	   				crearCapa();
	   			}
	   		}
	   		setTimeout(function(){document.getElementById("capaExteriorMensaje").appendChild(newMensaje)},10);
	   		setTimeout(function(){ver(newMensaje,psTamano)},30);
	   		setTimeout(function(){f_OcultarMensaje(newMensaje)},7000);
	   }
	   function ver(newMensaje,psTamano){
	   		newMensaje.style.transition = "height 0.5s linear 0s";
	   		newMensaje.style.height=psTamano;
	   }
	   function f_OcultarMensaje(newMensaje){
	   		newMensaje.style.transition = "height 0.5s linear 0s";
	   		newMensaje.style.height="0px";
	   		setTimeout(function(){newMensaje.parentNode.removeChild(newMensaje);},600);
	   		if(document.getElementById('capaExteriorMensaje')){
	   			setTimeout(function(){cerrarCapa()},510);	
	   		}
	   		
	   }
	   function crearCapa(){
	   		var capa=document.createElement('div');
	   		capa.id="capaExteriorMensaje";
	   		document.body.style.position="fixed";
	   		document.body.style.width="100%";
	   		document.body.parentNode.insertBefore(capa,document.body);
	   }
	   function cerrarCapa(){
	   		var capa=document.getElementById('capaExteriorMensaje');
	   		document.body.parentNode.removeChild(capa);
	   		document.body.style.position="inherit";
	   }	