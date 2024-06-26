function f_Esconder(elemento,altoAntes,altoDespues,sobresaliente){
		var altoAntes= altoAntes || "35px";
		var altoDespues= altoDespues || "auto";
		var sobresaliente= sobresaliente || "hidden";
		var div=elemento.parentNode.parentNode;
		div.style.height= div.style.height || altoAntes;
		if(div.style.height!=altoAntes){
			div.style.height=altoAntes;
			div.style.overflow="hidden";
		}else{
			div.style.height=altoDespues;
			div.style.overflow=sobresaliente;
		}
	}