//			Maestro.inicio.js Version 0.1 ---
String.prototype.stripTags = function() {
	return this.replace(/<\/?[^>]+>/gi, '');
}
form=document.form1;
var camBus;
var camSec;
var peticion = null;
var cont=1;
f_Inicio();
	function f_Inicio()
       {
       	  f_inicializar();
		  if (form.Operacion.value!="buscar")
		  {
			 if (form.Hacer.value=="Listo")
		     {
				 if (form.Operacion.value=="incluir")
				 { 
					f_MostrarMensaje("Registro Incluido con Exito","Info","","30px");
				 }
				 else if (form.Operacion.value=="modificar")
				 {
					f_MostrarMensaje("Registro Modificado con Exito","Info","","30px");
				 }
				 else if (form.Operacion.value=="eliminar")
				 {
					f_MostrarMensaje("Registro Eliminado con Exito","Info","","30px");
				 }
	         }
	         if (form.Hacer.value!="Listo"&&form.Hacer.value!="")
	         {
				f_MostrarMensaje("No se pudo realizar la operación","Error","","30px")
			 }
			 f_Cancelar();
	      }
	      else
	      {
			 if ((form.Hay.value==1)&&(form.Hacer.value!="incluir"))
			 {
				 f_Existe();
		     }
		     else if ((form.Hay.value==0)&&(form.Hacer.value!="incluir"))
		     {
				f_Cancelar();
				f_MostrarMensaje("Registro no Existe","Error","","30px");
		     }
		     else if ((form.Hay.value==1)&&(form.Hacer.value=="incluir"))
			 {
				 f_Existe();
		     }
		     else if ((form.Hay.value==0)&&(form.Hacer.value=="incluir"))
		     {
				form.Operacion.value="incluir";
				fActivar_Campos();
				form.Nuevo.disabled=true;
				form.Buscar.disabled=true;
				form.Modificar.disabled=true;
				form.Eliminar.disabled=true;
				f_Precargar(laNombre,laValor);
				form[camSec].focus();
		     } 
		  }
	   }
	   function f_inicializar(){
	 		f_Motor_Validaciones();
	   		var combos = document.getElementsByTagName("select");
	   		for(var x=0;x<combos.length;x++){
	   			if(combos[x].getAttribute("dependiente")=="dependiente"){
	   				for(var y=1;y<combos[x].options.length;y++){
						combos[x].options[y].style.display="none";
					}
	   			}
	   		}
       		if(form[6].type=="text"){
       			camBus=6;
       			camSec=7;
       		}else{
       			camBus=7;
       			camSec=8;
       		}
       		f_ManejoDeTransacciones();
       }
       function fDesactivar_Campos(psFuncion){
       		for(var x=6;x<form.length;x++){
       				if(form[x].type!="fieldset"){
       					form[x].disabled=true;
       				}
				}
				f_Botones(psFuncion,"activar");
       }
       function fActivar_Campos(psFuncion){
       		for(var x=6;x<form.length;x++){
					form[x].disabled=false;
				}
				f_Botones(psFuncion,"desbloquear");
       }
       function f_Existe()
       {
       	
       	  fDesactivar_Campos("existe");
	   }
       function f_Nuevo()
       {
		   form.Hacer.value="incluir";
		   fActivar_Campos("nuevo");
		   form[camBus].focus();
		   f_Precargar(laNombre,laValor);
       }
       function f_Cancelar()
       {
       		//esto es si el maestro posee el agregar
       	   	if(form.Columnas){
       	   		if(form.Columnas.value!=""){
       	   			var columnas=parseInt(form.Columnas.value);
       	   			var filas=0;
       	   			if((form.Filas.value=="")||(form.Filas.value==0)){
       	   				filas=parseInt(1);
       	   			}else{
       	   				filas=parseInt(form.Filas.value);
       	   			}
       	   			for(var y=0;y<columnas;y++){
       	   				eliminar(form.elements["newCamp0-0"]);
       	   			}
       	   		}
       	   	}
       	   for(var x=0;x<form.length;x++){
       	   		if((form[x].type=="text")||(form[x].type=="textarea")||(form[x].type=="hidden")||(form[x].type=="password")){
       	   			form[x].value="";
       	   		}else if((form[x].type=="radio")||(form[x].type=="checkbox")){
       	   			form[x].checked=false;
       	   		}else if(form[x].type=="select-one"){
       	   			form[x].value="-";
       	   		}
       	   }
		   form.Hay.value=0;
		   fDesactivar_Campos("cancelar");
       }
       function f_Buscar()
       {
       	   fDesactivar_Campos("buscar");
		   form[camBus].disabled=false;
		   form[camBus].focus();

	   }
	   function f_Modificar()
       {
		   form.Operacion.value="modificar";
		   fActivar_Campos("modificar");
		   form[camBus].disabled=true;
		   form[camSec].focus();

       } 
       function f_Eliminar()
       {

		  if (confirm("Desea Eliminar"))
		  {
			 form[camBus].disabled=false;
			 form.Operacion.value="eliminar";
			 form.submit();
		  }
		  else
		  {
			 f_Cancelar();  
		  }
	   }
	   function f_PerderFocus()
	   {
		  if (form[camBus].value!="")
		  {
			 form.Operacion.value="buscar";
			 form[camBus].value=form[camBus].value.toUpperCase();
			 form.submit();
		  }
		  else
		  {
		  	 form[camBus].focus();
		  }
       }
       function f_PerderFocusCombo(combo)
	   {
		  if (combo.value!="-")
		  {
			 form.Operacion.value="buscar";
			 form.submit();
		  }
		  else
		  {
		  	 combo.focus();
		  }
       }
       function f_Guardar()
       {

		  if(f_Validar()){
		  		fActivar_Campos("guardar");
		  		f_Revisar();
				form.submit();
			}
	   }
	   function f_Listar(pg,valor)
       {
		   form.pg.value=pg; 
		   valor=document.form2.txtval.value;
		   form.valor.value=valor;
		   form.Operacion.value="lista";
		   fActivar_Campos();
		   form.submit();
	   }
	   function f_Precargar(paName,paValue){
	   		for(var y=0;y<paValue.length;y++){
	   			paValue[y]=paValue[y].toLowerCase();
	   		}
	   		for(var x=0;x<paName.length;x++){
	   			if(paValue[x]=="checked"){
	   				form.elements[paName[x]].checked=true;
	   			}else if((paValue[x]=="deshabilitado")||(paValue[x]=="disabled")||(paValue[x]=="desactivado")||(paValue[x]=="bloqueado")){
	   				form.elements[paName[x]].disabled=true;	
	   			}else {
	   				form.elements[paName[x]].value=paValue[x].toUpperCase();
	   			}
	   		}
	   }
	   function cargar(x){
			if(x==1){
				document.getElementById("abrirPop").click();
			}

			cargarLegend();
		}

		function f_ListaDependiente(padre,hijo){
			var hijo = document.getElementById(hijo);
			for(var x=1;x<hijo.options.length;x++){
				hijo.options[x].style.display="none";
				if(hijo.options[x].className=="hijo "+padre.options[padre.selectedIndex].value){
					hijo.options[x].style.display="block";
				}
			}
		}	
	 	function f_Botones(psFuncion,psEstado){
			 if(psEstado=="activar"){
				if ((psFuncion=="cancelar")){
					form.Nuevo.disabled=false;	
					form.Buscar.disabled=false;
					form.Listar.disabled=false;
				}
				if ((psFuncion=="existe") || (psFuncion=="buscar")){
						form.Cancelar.disabled=false;
				}
				if ((psFuncion=="existe")){
						form.Modificar.disabled=false;
						form.Eliminar.disabled=false;
				}
				if(psFuncion=="guardar"){
					form.Nuevo.disabled=false;	
					form.Buscar.disabled=false;
					form.Listar.disabled=false;
					form.Eliminar.disabled=true;
					form.Modificar.disabled=true;
					form.Cancelar.disabled=true;
				}
			}else if(psEstado=="desbloquear"){
				if ((psFuncion=="nuevo") || (psFuncion=="modificar")){
					form.Nuevo.disabled=true;
					form.Eliminar.disabled=true;
					form.Modificar.disabled=true;
					form.Buscar.disabled=true;
				}
			}
		}
	   function mostrar(){
	   		if (cont==1) {
				document.getElementById("css3menu1").style.display="block";
				cont++;
	   		}else{
				document.getElementById("css3menu1").style.display="none";
				cont--;
	   		}
		}
//--------------------------------------  TRANSACCIONES --------------------------------------------
	 	function f_ManejoDeTransacciones(){
	 		//esto es si el maestro posee el agregar
	 		var x=0;
       	   	if(form.Columnas){
       	   		if(form.Columnas.value!=""){
       	   			var columnas=parseInt(form.Columnas.value);
       	   			var filas=0;
       	   			if((form.Filas.value=="")||(form.Filas.value==0)){
       	   				filas=parseInt(1);
       	   			}else{
       	   				 filas=parseInt(form.Filas.value)
       	   			}
       	   			for(var y=0;y<columnas;y++){
       	   				agregar();
       	   				for(var z=0;z<filas;z++){
       	   					form.elements["newCamp"+z+"-"+y].value=laCamposAgregados[x];
       	   					x++;
       	   				}
       	   			}
       	   		}
       	   	}
	 	}
//--------------------------------------  AJAX ---------------------------------------------------
		function inicializa_xhr() {
		  if (window.XMLHttpRequest) {
		    return new XMLHttpRequest(); 
		  } else if (window.ActiveXObject) {
		    return new ActiveXObject("Microsoft.XMLHTTP"); 
		  } 
		}
		function validarAJAX(campo, funcion,tabla){
			if((campo.value!="")&&(campo.value.length>=3)){
				peticion = inicializa_xhr();
			  	if(peticion) {
			    	peticion.onreadystatechange = funcion;
				    var url="http://localhost/en_desarrollo/newUnefa-APP/modulos/AJAX/controladores/controlador_AJAX.php?";
				    var parametros="nombreTabla="+tabla.toLowerCase();
				    parametros+="&codigo="+campo.value.toUpperCase();
				    parametros+="&nombre="+campo.id.toLowerCase();
				    parametros+="&operacion=validacion";
				    url+="&nocache="+Math.random();
				    peticion.open("POST", url, true);
				    peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				    peticion.send(parametros);
			  	}
			}else{
		      	campo.focus();
		      	var newMensaje = f_CrearMensaje("el Campo debe poseer al menos 3 caracteres","Alerta","","60px");
		      	campo.parentNode.insertBefore(newMensaje,campo.nextSibling);
		      	setTimeout('f_OcultarMensaje()',3000);
			}
		}

		function Peticiones() {
		  peticion = inicializa_xhr();
		  if(peticion) {
		     //peticion
		  }
		}

		function cargarCombos(idCombo,codCombo,nameCombo){
		    peticion.onreadystatechange = muestraCombos;
		    var url="http://localhost/en_desarrollo/newUnefa-APP/modulos/AJAX/controladores/controlador_AJAX.php?";
		    var parametros="nombreTabla="+idCombo;
		    parametros+="&codigo="+codCombo;
		    parametros+="&nombre="+nameCombo;
		    url+="&nocache="+Math.random();
		    peticion.open("POST", url, true);
		    peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    peticion.send(parametros);
		}

		function cargarLegend(){
			document.getElementById("legendObligatorio").style.marginTop="5px";
		}

		function cerrarObligatorio(){
			document.getElementById("legendObligatorio").style.marginTop="-300px";
		}