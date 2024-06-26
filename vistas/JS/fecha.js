function fechahoy(){
 var fecha = new Date();	
 var dia = fecha.getDay();
 var mes = fecha.getMonth();
 var ano = fecha.getFullYear();
 var dia_num = fecha.getDate();
 var dia_act;
 var mes_act;
 //Calcular dia
	 switch(dia){
		case 0:
		 dia_act = "Domingo";
		break;
		case 1:
		 dia_act = "Lunes";
		break;
		case 2:
		 dia_act = "Martes";
		break;
		case 3:
		 dia_act = "Miercoles";
		break;
		case 4:
		 dia_act = "Jueves";
		break;
		case 5:
		 dia_act = "Viernes";
		break;
		case 6:
		 dia_act = "Sabado";
		break;
	 }
	 //calcular mes
	  switch(mes){
		case 0:
		 mes_act = "Enero";
		break;
		case 1:
		 mes_act = "Febrero";
		break;
		case 2:
		  mes_act = "Marzo";
		break;
		case 3:
		  mes_act = "Abril";
		break;
		case 4:
		  mes_act = "Mayo";
		break;
		case 5:
		  mes_act = "Junio";
		break;
		case 6:
		  mes_act = "Julio";
		break;
		case 7:
		 mes_act = "Agosto";
		break;
		case 8:
		 mes_act = "Septiembre";
		break;
		case 9:
		  mes_act = "Octubre";
		break;
		case 10:
		  mes_act = "Noviembre";
		break;
		case 11:
		  mes_act = "Diciembre";
		break;
	 }
	 $("#fecha").text(dia_act+", "+dia_num+" de "+mes_act+" del "+ano);
}

$(document).ready(function(){
	fechahoy();						   						   
});