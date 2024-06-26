//			Motor de validaciones Version 0.0.1 --- 
var form=document.form1;
var dtCh= "-";
var minYear=1900;
var maxYear=2100;
var boxShadowAntes;
var boxShadows="1px 1px 10px red";
var borderAntes;
var borderCambio="1px solid red";

       function f_Motor_Validaciones(){
       		var lista= document.getElementsByTagName('input');
       		var cantidadDeElementos= lista.length;
       		for(var x=0;x<cantidadDeElementos;x++){
       			if(lista[x].getAttribute("validar")){
	       			if(lista[x].getAttribute("validar")=="solo numeros"){
	       				lista[x].onkeypress=function(event){ return validar_numeros(event);}
	       			}
	       			if(lista[x].getAttribute("validar")=="solo letras"){
	       				lista[x].onkeypress=function(event){ return validar_letras(event);}
	       			}
	       			if(lista[x].getAttribute("validar")=="contrasena1"){
	       				lista[x].onkeyup=function(){form.Contrasena1.style.background=(form.Contrasena.value==form.Contrasena1.value)?"#99CD9B":"#CD9A99";}
	       			}
       			}
       		}
       }
       function f_Revisar(){
			for( var x=6;x<form.length;x++){
				form[x].disabled=false;
				if((form[x].type=="text")||(form[x].type=="textarea")){
					form[x].value=form[x].value.stripTags();
					if(form[x].getAttribute('mayus')!="none"){
						form[x].value=form[x].value.toUpperCase();
					}
				}
			}
		}
		function f_Validar()
		{
			var contErrores=0;
			var mensaje="";
			var ok=0;
			var nombreRadio = "";
			var lb_Bueno=false;
			var Validar=0;
			var radio;
			var primerValorEnBlanco=form.length+1;
			for(var x=0;x<form.length;x++){
				if((form[x].getAttribute("validar"))&&(form[x].disabled!=true)){
					if((form[x].type=="text")||(form[x].type=="textarea")){
						if(form[x].value==""){
							Validar=1;
							mensaje="Campo "+form[x].name+" en Blanco";
							f_MostrarMensaje(mensaje,"Alerta");		
							objeto=form[x];
							f_ValidacionVisual(objeto);
						}
					}
					else if(form[x].type=="select-one"){
						if(form[x].value=="-"){
							Validar=1;
							mensaje="Selecione un "+form[x].name;
							f_MostrarMensaje(mensaje,"Alerta");
							objeto=form[x];
							f_ValidacionVisual(objeto);
						}
					}
					else if(form[x].type=="password"){
						if(form[x].value==""){
							Validar=1;
							mensaje="Ingrese "+form[x].name;
							f_MostrarMensaje(mensaje,"Alerta");
							objeto=form[x];
							f_ValidacionVisual(objeto);	
						}
					}
					else if(form[x].type=="radio"){
						if(nombreRadio!=form[x].name){
							ok=0;
							nombreRadio=form[x].name;
							radio=document.getElementsByName(nombreRadio);
							for(var z=0;z<radio.length;z++){
								if(radio[z].checked==true){
									ok=1;
								}
							}
							if(ok==0){					
								Validar=1;
								mensaje="Selecione un "+nombreRadio;
								f_MostrarMensaje(mensaje,"Alerta");
								objeto=form[x];
								f_ValidacionVisual(objeto);
							}
						}
					}
					if((form[x].getAttribute("validar").substr(0,5)=="fecha")&&(form[x].value!="")){
						if(!isDate(form[x].value)){
							Validar=1;
							objeto=form[x];
							f_ValidacionVisual(objeto);
						}else if(form[x].getAttribute("validar")=="fecha fin"){
							if(!f_fechaFin(form[x])){
								Validar=1;
								objeto=form[x];
								f_ValidacionVisual(objeto);
							}
						}
					}
				}
				else if((form[x].getAttribute("validar")=="Contrasena1")&&(form[x].disabled!=true)){
					if(form.Contrasena.value!=form.Contrasena1.value){
						Validar=1;
						mensaje="Contaseñas no coinsiden";
						f_MostrarMensaje(mensaje,"Alerta");
						objeto=form[x];
						f_ValidacionVisual(objeto);
					}
				}
			}
			if(Validar==0){
				lb_Bueno=true;
			}
			else if(Validar==1){
				
				
			}
			return lb_Bueno;
		}
		function validar_letras(e) { 
			tecla = e.which ||  e.keyCode ; 
			patron =/\D/;  
			te = String.fromCharCode(tecla); 
			return (patron.test(te) || tecla==8); 
		}  
		function validar_numeros(e) {
			tecla = e.which || e.keyCode;
			patron = /\d/;
			te = String.fromCharCode(tecla);
			return (patron.test(te) || tecla == 9 || tecla == 8  || tecla == 127 || tecla==17);
	 	}
		function isInteger(s){
			var i;
		    for (i = 0; i < s.length; i++){   
		        // Check that current character is number.
		        var c = s.charAt(i);
		        if (((c < "0") || (c > "9"))) return false;
		    }
		    // All characters are numbers.
		    return true;
		}

		function stripCharsInBag(s, bag){
			var i;
		    var returnString = "";
		    // Search through string's characters one by one.
		    // If character is not in bag, append to returnString.
		    for (i = 0; i < s.length; i++){   
		        var c = s.charAt(i);
		        if (bag.indexOf(c) == -1) returnString += c;
		    }
		    return returnString;
		}

		function daysInFebruary (year){
			// February has 29 days in any year evenly divisible by four,
		    // EXCEPT for centurial years which are not also divisible by 400.
		    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
		}
		function DaysArray(n) {
			for (var i = 1; i <= n; i++) {
				this[i] = 31
				if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
				if (i==2) {this[i] = 29}
		   } 
		   return this
		}

		function isDate(dtStr){
			var daysInMonth = DaysArray(12)
			var pos1=dtStr.indexOf(dtCh)
			var pos2=dtStr.indexOf(dtCh,pos1+1)
			var strDay=dtStr.substring(0,pos1)
			var strMonth=dtStr.substring(pos1+1,pos2)
			var strYear=dtStr.substring(pos2+1)
			strYr=strYear
			if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
			if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
			for (var i = 1; i <= 3; i++) {
				if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
			}
			month=parseInt(strMonth)
			day=parseInt(strDay)
			year=parseInt(strYr)
			if (pos1==-1 || pos2==-1){
				f_MostrarMensaje("El formato debe ser  : dd-mm-yyyy","Alerta");
				return false
			}
			if (strMonth.length<1 || month<1 || month>12){
				f_MostrarMensaje("Por favor introduzca un mes valido","Alerta");
				return false
			}
			if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
				f_MostrarMensaje("Por favor introduzca un dia valido","Alerta");
				return false
			}
			if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
				f_MostrarMensaje("Por favor introduzca el año en 4 digitos y que este entre "+minYear+" and "+maxYear,"Alerta");
				return false
			}
			if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
				f_MostrarMensaje("Por favor introduzca una fecha valida","Alerta");
				return false
			}
			return true
		}
		function f_fechaFin(obj){
			var fechaFin=obj.value.split(dtCh);
			var fechaInicio= new Array();
			var lista=document.getElementsByTagName('input');
			for (var x=0, y=lista.length;x<y;x++){
				if(lista[x].getAttribute("validar")=="fecha inicio"){
					fechaInicio=lista[x].value.split(dtCh);
					break;
				}
			}
			var fecha1= new Date(fechaInicio[2],fechaInicio[1],fechaInicio[0]);
			var fecha2= new Date(fechaFin[2],fechaFin[1],fechaFin[0]);
			if((isValidDate(fecha1))&&(isValidDate(fecha2))){
				if(fecha1>fecha2){
					f_MostrarMensaje("La fecha inicio no puede ser mayor a la fecha final","Alerta");
					lb_Bueno=false;
				}else{
					lb_Bueno=true;
				}
			}else{
				f_MostrarMensaje("formato de fechas invalido","Alerta");
				lb_Bueno=false;
			}
			return lb_Bueno;
		}
		function isValidDate(d) {
			if ( Object.prototype.toString.call(d) !== "[object Date]" )
				return false;
			return !isNaN(d.getTime());
		}

		function f_ValidacionVisual(objeto){
			boxShadowAntes=(window.getComputedStyle(objeto).boxShadow=="")?"none":objeto.style.boxShadow;
			borderAntes=(window.getComputedStyle(objeto).border=="")?"none":objeto.style.border;
			objeto.style="transition:box-shadow 0.5s";
			f_Cambio(objeto,boxShadows,borderCambio);
			setTimeout((function(objeto,boxShadowAntes,borderAntes){return function(){f_Cambio(objeto,boxShadowAntes,borderAntes);}})(objeto,boxShadowAntes,borderAntes), 500); 
			setTimeout((function(objeto,boxShadows,borderCambio){return function(){f_Cambio(objeto,boxShadows,borderCambio);}})(objeto,boxShadows,borderCambio), 1000); 
			setTimeout((function(objeto,boxShadowAntes,borderAntes){return function(){f_Cambio(objeto,boxShadowAntes,borderAntes);}})(objeto,boxShadowAntes,borderAntes), 1500);
			setTimeout((function(objeto,boxShadows,borderCambio){return function(){f_Cambio(objeto,boxShadows,borderCambio);}})(objeto,boxShadows,borderCambio), 2000); 
			setTimeout((function(objeto,boxShadowAntes,borderAntes){return function(){f_Cambio(objeto,boxShadowAntes,borderAntes);}})(objeto,boxShadowAntes,borderAntes), 2500);
			setTimeout((function(objeto,boxShadows,borderCambio){return function(){f_Cambio(objeto,boxShadows,borderCambio);}})(objeto,boxShadows,borderCambio), 3000); 
			setTimeout((function(objeto,boxShadowAntes,borderAntes){return function(){f_Cambio(objeto,boxShadowAntes,borderAntes);}})(objeto,boxShadowAntes,borderAntes), 3500);
		}
		function f_Cambio(obj,propiedad,propiedad2){
			obj.style.boxShadow=propiedad;
			obj.style.border=propiedad2;
		}

