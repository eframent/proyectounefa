function armar(obj){
	obj.classList.add("girar");
	setTimeout(function(){obj.classList.add('fondo');},900);
	obj.onclick=function(){
		desarmar(this);
	}
}		
function desarmar(obj){
	obj.classList.remove('girar');
	obj.classList.remove('fondo');
	obj.onclick=function(){
		armar(this);
	}
}