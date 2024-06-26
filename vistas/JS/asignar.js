var campo;
var contenedor;
	function f_Asignar(){
		form=document.form1;
		var lista=document.getElementsByName("check");
		for(var x=0;x<lista.length;x++){
			if(document.getElementById("check"+x).checked==true){
				if(form.elements["campo"+x].parentNode.id=="uno"){
					campo=document.getElementById("campo"+x);
					document.getElementById("check"+x).checked=false;
					contenedor=campo.parentNode;
					contenedor.removeChild(campo);
					document.getElementById("dos").appendChild(campo);
				}
			}
		}
		f_Organizar();
	}
	function f_Revocar(){
		form=document.form1;
		var lista=document.getElementsByName("check");
		for(var x=0;x<lista.length;x++){
			if(document.getElementById("check"+x).checked==true){
				if(form.elements["campo"+x].parentNode.id=="dos"){
					campo=document.getElementById("campo"+x);
					document.getElementById("check"+x).checked=false;
					contenedor=campo.parentNode;
					contenedor.removeChild(campo);
					document.getElementById("uno").appendChild(campo);
				}
			}
		}
		f_Organizar();
	}
	function f_Mover(element){
		campo=element.parentNode;
		contenedor=campo.parentNode;
		if(contenedor.id=="uno"){
			contenedor.removeChild(campo);
			document.getElementById("dos").appendChild(campo);
		}else{
			contenedor.removeChild(campo);
			document.getElementById("uno").appendChild(campo);
		}
		f_Organizar();
	}
	function f_Organizar(){
		var modulos=document.getElementById("control").value;
		var lista=document.getElementsByName("check");
		for(var y=0;y<=modulos;y++){
			for(var x=0;x<lista.length;x++){
				campo=document.getElementById("campo"+x);
				contenedor=campo.parentNode;
				if(campo.getAttribute("padre")=="mod"+y){
					contenedor.removeChild(campo);
					contenedor.appendChild(campo);
				}
			}
		}
	}
	function f_MostrarElementos(elemento){
		var modulo=elemento.parentNode.getAttribute("padre");
		var lista=document.getElementsByName("check");
		for(var x=0;x<lista.length;x++){
			campo=document.getElementById("campo"+x);
			if((campo.getAttribute("padre")==modulo)&&(campo.parentNode.id=="uno")){
				if(campo.style.display=="none"){
					campo.style.display="block";
				}else{
					campo.style.display="none";
				}
			}
		}
		
	}
	function f_Limpiar(){
		form=document.form1;
		var lista=document.getElementsByName("check");
		for(var x=0;x<lista.length;x++){
			if(document.getElementById("campo"+x).parentNode.id=="dos"){
				campo=document.getElementById("campo"+x);
				document.getElementById("check"+x).checked=false;
				contenedor=campo.parentNode;
				contenedor.removeChild(campo);
				document.getElementById("uno").appendChild(campo);
			}
		}
		f_Organizar();
	}
	function f_buscar(value){
		value=value.toUpperCase();
		var lista=document.getElementsByName("check");
		var tamaño=value.length;
		for(var x=0;x<lista.length;x++){
			campo=document.getElementById("cam"+x);
			contenedor=campo.parentNode;
			if(tamaño==0){
				contenedor.style.display="block";
			}else if((campo.value.substring(0,tamaño)==value)&&(contenedor.parentNode.id=="uno")){
				if(contenedor.style.display=="none"){
					contenedor.style.display="block";
				}
			}else if(contenedor.parentNode.id!="dos"){
				contenedor.style.display="none";
			}
		}
		f_MostrarBoton();
	}
	function f_MostrarTodo(){
		var lista=document.getElementsByName("check");
		for(var x=0;x<lista.length;x++){
			campo=document.getElementById("campo"+x);
			if(campo.style.display=="none"){
				campo.style.display="block";
			}
		}
		f_MostrarBoton();
	}
	function f_Guardar(){
		if(cargo!="vacio"){
			var cadena="";
			var lista=document.getElementById("dos").childNodes;
			for(var x=1;x<lista.length;x++){
				cadena+=lista[x].getAttribute("tipo")+"-"+lista[x].getAttribute("codigo")+"/";
			}
			cadena=cadena.substring(0,cadena.length-1);
			var input=document.createElement("input");
			input.type="hidden";
			input.name="registros";
			input.value=cadena;
			var inputCargo=document.createElement("input");
			inputCargo.type="hidden";
			inputCargo.name="Cargo";
			inputCargo.value=cargo;
			var inputOperacion=document.createElement("input");
			inputOperacion.type="hidden";
			inputOperacion.name="Operacion";
			inputOperacion.value="Guardar";
			var enviar=document.createElement("form");
			enviar.method="POST";
			enviar.action="../controladores/cor_Asignar.php";
			enviar.appendChild(input);
			enviar.appendChild(inputCargo);
			enviar.appendChild(inputOperacion);
			document.body.appendChild(enviar);
			enviar.submit();
		}else{
			alert("Ningun Cargo seleccionado");
			location.href="vis_Cargo.php";
		}
	}
	function f_ComprobarLetras(){
		var campos=document.getElementsByTagName("fieldset");
		for(var c=0;c<campos.length;c++){
			if(campos[c].id!="ignoralo"){
				campos[c].firstChild.style.color=convertirHexToRgb(campos[c].getAttribute("fondo"));
			}
		}
	}

	function convertirHexToRgb(color){
		var R = hexToR(color);
		var G = hexToG(color);
		var B = hexToB(color);

		var saturacion=Math.round(((parseInt(R))+(parseInt(G))+(parseInt(B)))/3);
		if(saturacion>125){
			letras="#000000";
		}else{
			letras="#ffffff";
		}
		return letras;
	}

	function hexToR(h) {return parseInt((cutHex(h)).substring(0,2),16)}
	function hexToG(h) {return parseInt((cutHex(h)).substring(2,4),16)}
	function hexToB(h) {return parseInt((cutHex(h)).substring(4,6),16)}
	function cutHex(h) {return (h.charAt(0)=="#") ? h.substring(1,7):h}