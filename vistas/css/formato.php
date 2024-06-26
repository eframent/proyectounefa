<?php
	require_once('predeterminado.php');
	header('content-type:text/css');

	echo <<<FINCSS

		img#logo{
			display: none;
		}

		.Error, .Info, .Alerta{	
			font-family:arial;
			font-weight: bold;
			font-size: 18px;
			width: 700px;
			text-align: center;
			z-index: 10;
			color: white;
			margin-bottom:2px;
			left:-24%;
		}

		.Error{
			background-color: #CF000F;
		}

		.Info{
			background: #03A678;
		}
		.Alerta{
			background-color: #F39C12;
		}

		.Alerta:first-child,.Info:first-child,.Error:first-child{
			margin-top:100px;
		}

		#capaExteriorMensaje{
			background: rgba(0,0,0,0.70);
			width: 100%;
			min-height:100%;
			z-index: 9;
			position:absolute;
			top: -0%;
			content: "";
		}

body{
	margin:0px;
	padding:0px;
}

#btnBuscar{
	height: 32px;
	width: 32px;
	background: url("../imagenes/opa-icons-blue32.png") no-repeat;
	background-position:-384px -128px;
	transform:scale(1.23);
	padding:0px;
	border:1px solid silver;
	margin-left:-3px;
	border-radius:0px 10px 10px 0px;
}

#btnBuscar:disabled{	
	background: url("../imagenes/blg32.png") no-repeat;
	background-position:-384px -128px;
}

#btnBuscar:hover{
	border: 1px solid MidnightBlue;
	border-radius:5px;
}

[validar]{
	background: url('../imagenes/ast.png') no-repeat;
	background-position:right;
	background-size:8px 8px;
}

div{
	width: 100%;
	$marauto
	height: auto;
}

div[Cabecera]{
	height: 35px;
	margin-top: -0px;
}

div[Menu]{
	height: 30px;
	min-height: 30px;
	background-color:rgb(41,56,140);
	border-top:1px solid silver;
	z-index:1;
}

#logoUnefa{
	width:40px;
	height40px;
	float:left;
	margin-left:5px;
	margin-top:-35px;
}

div[Contenedor]{
	height: auto;
	min-height: 590px;
	box-shadow:none;
	border-radius:none;
	background: url("../imagenes/3.jpg") no-repeat;
	background-size:100% 100%;
	margin-bottom:40px;
}

div[formulario]{
	height: auto;
	min-height: 150px;
	margin: 0px auto;
	width:90%;
	$transicion;
	background:white;
	z-index:1;
	border: 1px solid silver;
}

.agrandar{
	$agrandar(1.1);
}


div[Botonera]{
	width: 90%;
	height: auto;
	min-height: 40px;
	margin-bottom: 2%; 
	$brdesno;
	$degradado(#C9F4EF,#C2ECE6,#BDF3EC);
	$transicion;
}

div[Pie]{
	height: 40px;
	background-color:rgb(41,56,140);
	border:none:
	left: 0px;
	position: fixed;
	right: 0px;
	bottom: 0px;
	margin-top:10px;
	z-index:1;
}

div[Pie] p{
  color: white;
  font-size: 12px;
  margin-top:11px;
  margin-left:5%;
}

div[Mostrar]{
	$oculto
}

.Proceso{
	width:700px;
	color:darkred;
	background: url('../imagenes/cerrado.jpg') no-repeat;
	background-size:70% 70%;
	background-position: 200px 90px;
	font-size: 100px;
	text-align:left;
	height:300px;
	margin-top:30px;
	border-radius:5px;
	text-shadow:3px 3px 0px silver;
}

h2{
	width:100%;
	height:30px;
	background: #DADFE1; 
	margin:0px;
	margin-bottom:20px;
	padding:5px 0px;
	font-size:25px;
	text-indent:100px;
	color:white;
	background-color: rgb(52, 152, 219);
	border-top: 1px solid rgb(112, 182, 229);
	border-bottom: 5px solid rgb(35, 114, 167);
}

input[type="button"]:first-child{
	margin-left:5px;
}


input[type="button"],input[type="submit"],input[type="reset"]{	
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.25);
	color: rgb(255, 255, 255);
	background-image: -moz-linear-gradient(center top , rgb(0, 136, 204), rgb(0, 85, 204));
    	background-repeat: repeat-x;
  	border:none;
  	padding: 7px 30px ;
  	font-size: 13px;
	line-height: 18px;
	border-radius: 4px;
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	margin:5px 0px 5px 0px;
}

input[type="button"]:hover,input[type="submit"]:hover{
	background-color: rgb(0, 85, 204);
	background-position: 0px -15px;
  	cursor:pointer;
}

input[type="button"]:disabled{
	border:0;
	background:#F9F9F9;	
	color:rgb(51, 51, 51);
	text-shadow: 0px 1px 1px rgba(255, 255, 255, 0.75);
	display:none;

}

input[type='radio']{
	width:0px;
}
/********************************************************************************************************************/
/******************************************************** <-MENU-> **************************************************/
/********************************************************************************************************************/

ul#css3menu1{
	font-size:0;
	display:inline-block;
	padding:0;
	margin-top:0px;
	width:96%;
}

ul#css3menu1,ul#css3menu1 ul{
	$susbrayadono;
	padding:0;
	background-color:rgb(41,56,140);
	border-width:0px;
	border-style:solid;
	border-color:rgb(41,56,140);

	}
	
ul#css3menu1 ul{
	$oculto;
	position:absolute;
	background-color:rgb(41,56,140);
	border-color:rgb(41,56,140);
	transition:all 0.5s;
	}
	
ul#css3menu1 li:hover>*{
	$visible;
	}
	
ul#css3menu1 li{
	position:relative;
	$visible;
	float:left;
	}

ul#css3menu1 li ul{
	width:200px;
}
	
ul#css3menu1 li:hover{
	z-index:1;}
	
ul#css3menu1 ul ul{
	position:absolute;
	left:100%;
	top:0;
	}
		

ul#css3menu1>li{
	margin:0;
	text-transform:capitalize;
	}
	
ul#css3menu1 ul>li{
	margin:0px 0 0;
	width:auto;	
 }	

ul#css3menu1 a{
	display:block;
	$susbrayadono;
	font-size:12px;
	color:#ffffff;
	cursor:pointer;
	width:auto;
	padding:5px 10px;
	border-width:0;
	border-color:transparent; 
	text-align:left;
	}
	
ul#css3menu1 ul li{
	float:none;
	transition:all 0.5s;
}

ul#css3menu1 li a label{
	padding:0px !important;
	float:none !important;
}
	
ul#css3menu1 ul a{
	$lizquierda;
	}
	
ul#css3menu1 li:hover>a{
	background:#E5E5E5;
	border: none;
	color:rgb(41,56,140);
	transition:all 0.5s;
	$susbrayadono;
	}
	
ul#css3menu1 li.topmenu>a{
 	margin-top:3px;
	font-size:12px;
	color:#ffffff;
	$susbrayadono;
	transition:all 0.5s;
	}
	
ul#css3menu1 li.topmenu:hover>a{
	background:#E5E5E5;
	border: none;
	border-radius: 3px;
	color:rgb(41,56,140);
	$susbrayadono;
	$br3
}


div[perfil]{
	float:right;
	margin-top:2.5px;
	padding:2px;
	border:1px solid transparent;
	width:16px;
	height:16px;
	border-radius:4px;
	z-index:99;
	margin-right:5px;
}

div[perfil]:hover{
	border:1px solid silver;
}

div[cont-perfil]{
	position: absolute;
	background: white;
	margin: 2px 50px 0px -130px;
	width: 180px;
	overflow: hidden;
	transition:all 0.5s;
	height: 200px;
	color: grey;
	font-size: 10px;
	border: 1px solid rgba(100, 100, 100, 0.4);
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.25);
	display:none;
}

div[cont-perfil] h3{
	background-color: rgb(41, 56, 140);
	margin-top:0px;
	color:white;
	padding: 5px 0px;
	text-indent:20px;
}

div[cont-perfil] li{
	list-style:none;
	padding:5px 10px;
	width:100%;
	margin-left:-10px;
}

div[cont-perfil] li:hover{
	cursor:pointer;
}

div[cont-perfil] li.division{
	height:1px;
	background:silver;
	margin-top:5px;
	margin-left:5px;
	margin-right:5px;
	margin-bottom:5px;
	padding:0px;
}

div[cont-perfil] li a{
	color:grey !important;
}

div[cont-perfil] li a:hover{
	text-decoration:underline;
	color: rgb(41, 56, 140);
}

div[perfil]:hover>div[cont-perfil]{
	display:block;
}

/********************************************************************************************************************/
/******************************************************** <-FIN MENU-> **********************************************/
/********************************************************************************************************************/

div#info{
	background:#95a5a6;
	height:20px;
	color:white;
	padding:2px 0px;
}

div#info label{
	background: none repeat scroll 0% 0% rgb(149, 165, 166);
	height: 17px;
	font-size: 12px;
	margin: 2px 0px 0px 10px;
	padding: 0px 15px 0px 0px;
}

i.hora{
	width:30px !important;
	height:30px !important;
	background:url('../imagenes/icon-blancos/reloj.png') no-repeat;
	background-position:left;
	background-size:20px 20px;
	padding:4px 0px 4px 22px;
}

i.user{
	width:30px !important;
	height:30px !important;
	background:url('../imagenes/icon-blancos/user.png') no-repeat;
	background-position:left;
	background-size:18px 18px;
	padding:4px 0px 4px 22px;
}
/********************************************************************************************************************/
/******************************************************** <-LEGENDA -> **********************************************/
/********************************************************************************************************************/
#legendObligatorio{
	background:#1abc9c;
	width:90%;
	height:auto;
	border-radius:1px;
	transition:all 0.5s;
	margin-bottom:5px !important; 
	color:white;
	margin:0px auto;
	text-indent:20px;
	padding:5px 0px;
}

span.obligatorio{
	background: url('../imagenes/ast.png') no-repeat;
	background-position:center;
	padding:5px 10px;
}
/********************************************************************************************************************/
/******************************************************** <-FIN LEGENDA-> *******************************************/
/********************************************************************************************************************/
input[type='button'].inicio{
	width:30px;
	height:30px;
	background: url("../imagenes/icon-blancos/home.png") no-repeat;
	background-position: center;
	background-size:20px 20px;
	margin: 0px 5px;
	float:left;
	padding:0px;
}

input[type='button'].inicio:hover{
	background: url("../imagenes/icon-blancos/home.png") no-repeat;
	background-position: center;
	background-size:20px 20px;
	border: 1px solid silver;
}

input[type='button'].atras{
	width:30px;
	height:30px;
	background: url("../imagenes/icon-blancos/arrow-left.png") no-repeat;
	background-position: center;
	background-size:20px 20px;
	margin: 0px 1px 0px 5px;
	float:left;
	padding:0px;
}

input[type='button'].atras:hover{
	background: url("../imagenes/icon-blancos/arrow-left.png") no-repeat;
	background-position: center;
	background-size:20px 20px;
	border:1px solid silver;
}

input[type='button'].cerrar_se{
	float:right;
	width:16px;
	height:16px;
	background: url("../imagenes/icon-blancos/cerrar-sesion.png") no-repeat;
	background-position: center;
	background-size:16px 16px;
	padding:12px;
	margin:0px;
	margin-top:2px;
	margin-left:2px;
	border:1px solid transparent;

}

.right{
	float:right !important;
}


input[type='button'].cerrar_se:hover{
	background: url("../imagenes/icon-blancos/cerrar-sesion.png") no-repeat;
	background-position: center;
	background-size:16px 16px;
	border:1px solid silver;
}

div[Menu] a{
	text-decoration:none;
	cursor:pointer;
}

div[Menu] span{
	float:right;
	margin:7px 40px 10px 0px;
	color:white;
	text-decoration:none;
}


/*************************************************************************************/
/*****************************ESTILO DE LA TABLA DEL LISTAR***************************/
/*************************************************************************************/
table[tabla1]{
	width: 1000px;
	height: 35px;
}

table[tabla2]{
	width: 1000px;
	height: 200px;
}

div[titulo]{
	width: 100%;
	padding: 5px;
	$centrado;
	$negrita;
	font-size: 25px;
	background: none repeat scroll 0% 0% rgb(28, 69, 131);
	border: 0px;
	color: rgb(255, 255, 255);
	$sombrano;
}

th{
	background: #EAEAEA;
	padding: 5px;
	border-bottom: 1px solid black;
	color: #084B8A;
	$negrita;
	font-size: 20px;
}

table[tabla2] tr{
	background:#D8DEFE;
	color: #084B8A;
}

table[tabla2] td{
	padding: 5px;
}

table tr[impar]{
	background:#D8DEFE;
}

table tr[par]{
	background: #f2f2f2;
}

table[tabla2] tr:hover{
	background: white;
}	

input[name="txtval"]{
	$bordes rgb(46, 154, 254);
	padding:8px;
	width: 300px;
}

input[name="btnbuscar1"]{
	$bordes rgb(46, 154, 254);
	padding:8px;
	background: none repeat scroll 0% 0% rgb(28, 69, 131);
	color: rgb(255, 255, 255);
}
 
input[name="btnbuscar1"]:hover{
	background-color: rgb(153, 179, 255);
	color:  rgb(28, 69, 131);
}

input[id="cerrar"]{
	background: red;
	color: white;
	$bordes grey;
	float: right;
	margin:-3px 8px 0px 0px;
	width: 35px;
	height: 30px;
	$negrita;
}

input[pg]{
	width: 50px;
	height: 30px;
	border-radius: 5px;
	$mderecho 5px;
	box-shadow: 1px 1px 5px 1px inset black;
}

input[id="cerrar"]:hover{
	background: white;
	color: red;
	$bordes red;
}

td[codigo]{
	$negrita;
	font-size: 20px;
}

#capaContent a{
	$susbrayadono;
	color: rgb(28, 69, 131);
}

#capaContent a:visited{
	color: red;
}

table[tabla2] tr:last-child{
	border-bottom: 1px solid black;
}

/****************************FIN ESTILO LISTAR************************************************/
FINCSS;
?>