<?php 
	session_start();
	$laSecciones=$_SESSION["secciones"];
	$contSec=0;
	$contMat=0;
	$contBlo=0;
	$cont=0;
?>
<html>
<head>
	<title></title>
	<script type="text/javascript" src="JS/Mensajes.js"></script>
	<link rel="stylesheet" type="text/css" href="css/horarios.css">
	<link rel="stylesheet" type="text/css" href="css/mensajes.css">
	     	<meta http-equiv='content-type' content='text/html;charset=utf-8' />
	     	
<style type="text/css">
	div[secciones]{
		overflow: hidden;
		width: 100%;
		max-width: 1200px;
		height: 32px;
		border: 1px solid MidnightBlue;
		border-radius: 10px 10px 0px 0px;
		margin: 0px auto;
	}
	div[contenedor]{
		overflow: hidden;
		width: 92%;
		height: 32px;
		float:left;
		background-color: white;
	}
	#botones{
		overflow: hidden;
		width: 4000px;
		height: 32px;
		float:left;
		margin: 0px;
		background-color: white;

	}
	.elementos{
		height: 100%;
		border:none;
		background-color: MidnightBlue;
		color:white;
		width: 100px;	
	}
	.marquesina{
		background-color: MidnightBlue;
		background-position: center;
		width: 32px;
		height: 100%;
		border:none;
		z-index: 3;	
		transition:all 0.5s;	
	}
	.marquesina:hover{
		background-color: RoyalBlue;
		color: MidnightBlue;
	}
	.derecha{
		background: url("imagenes/iconos/point-right.png") no-repeat;
		float: right;
	}
	.izquierda{
		background: url("imagenes/iconos/point-left.png") no-repeat;
		float:left;
	}
	input.marquesina{
		min-width: 36px
	}
</style>
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>);">
	<form name="form1" action="../controladores/cor_FrameInscrip.php" method="POST">
		<input type="hidden" name="Operacion"  >

		<div secciones>
			<input type="button" class="marquesina izquierda"  onmouseover="marquesinaOver('izquierda')" onmouseout="marquesinaOut()" >
			<div contenedor>
				<div id="botones" ></div>
			</div>
			<input type="button" class="marquesina derecha" onmouseover="marquesinaOver('derecha')" onmouseout="marquesinaOut()" >
		</div>
		<div id="contenedorDeHorario"></div>
	</form>
</body>
<script type="text/javascript">
	//colores de marquesina
	var fondoBotonesAntes="MidnightBlue";
	var fondoBotonesCambio="RoyalBlue";
	var secciones=new Array();
	var controlSecciones=-1;
	//variable que maneja el movimiento de la marquesina
	var movimiento;
	var tamanoDeMarquesina=11;
	var cantidadDeBotones;
	var tamanoDeBotones;
	<?php 
		if(count($laSecciones)>0){
			echo"secciones=[\n\t";
			for($s=0;$s<count($laSecciones);$s++){
				if($s==0){
					echo"[\n\t\t ";
				}
				$contSec++;
				for($m=0;$m<count($laSecciones[$s]);$m++){
					if($m==0){
						echo"[\n\t\t\t ";
					}
					$contMat++;
					for($b=0;$b<count($laSecciones[$s][$m]);$b++){
						if($b==0){
							echo"[ ";
						}
						$contBlo++;
						for($a=0;$a<count($laSecciones[$s][$m][$b]);$a++){
							echo '"'.$laSecciones[$s][$m][$b][$a].'"';
							if($a!=count($laSecciones[$s][$m][$b])-1){
								echo",";
							}
						}
						if($b==count($laSecciones[$s][$m])-1){
							echo" ]\n\t\t";
						}else{
							echo" ],\n\t\t\t[";
						}
					}
					if($m==count($laSecciones[$s])-1){
						echo" ]\n\t";
					}else{
						echo" ],[\n\t\t\t";
					}
				}
				if($s==count($laSecciones)-1){
					echo" ]";
				}else{
					echo" ],[\n\t\t";
				}
			}
			echo"];";
		}
	?>
	var arreglo=new Array();

	function cargar(bool){
		var enc;
		if(bool==1){
			form=document.form1;
			form.Operacion.value="Listar";
			form.submit();
		}else{
			var ventanaPadre=window.parent;
			var bloquesInscritos=ventanaPadre.bloquesInscritos;
			if(bloquesInscritos.length>0){
				for(var x=0;x<bloquesInscritos.length;x++){
					enc=objetoControl.agregar(bloquesInscritos[x]);
					objInscripcion.agregarMI(bloquesInscritos[x][0][7]);
				}
			}
			var horario=construirHorario(ventanaPadre.dias,ventanaPadre.horas,ventanaPadre.att,ventanaPadre.cont);
			document.getElementById("contenedorDeHorario").appendChild(horario);
			ventanaPadre.materiasAInscribir=objInscripcion.resultado();
			llenarHorario(arreglo);
			activarCambio(horario);
			armarBotones();
		}
	}
//------------------------------------------------ MARQUSINA-----------------------------------
	function armarBotones(){		
		cantidadDeBotones=secciones.length;
		var boton;
		var regimen;
		for(var x=0;x<cantidadDeBotones;x++){
			boton=document.createElement("input");
			boton.type="button";
			if(secciones[x][0][0][13]=="1"){
				regimen="Nocturno";
			}else{
				regimen="Diurno";
			}
			boton.value=regimen+":"+secciones[x][0][0][9]+"-"+secciones[x][0][0][12];
			boton.setAttribute("seccion",x);
			boton.className="elementos";
			boton.title=regimen;
			boton.onmouseover=function(){cambio(this,fondoBotonesCambio);};
			boton.onmouseout=function(){cambio(this,fondoBotonesAntes);};
			boton.onclick=function(){
								cambioSeccion(this);
								controlCambioMarquesina(this);
							};
			document.getElementById("botones").appendChild(boton);
		}
		tamanoDeBotones=window.getComputedStyle(boton).width;
		tamanoDeBotones=tamanoDeBotones.substr(0,tamanoDeBotones.length-2);
	}
	function cambio(obj,color){
		obj.style.transition="all 0.5s";
		obj.style.backgroundColor=color;
	}
	function controlCambioMarquesina(elemento){
		var contenedor=elemento.parentNode.childNodes;
		var cantidadDeHijos=contenedor.length;
		for(var e=0;e<cantidadDeHijos;e++){
			contenedor[e].style.backgroundColor=fondoBotonesAntes;
			contenedor[e].style.marginLeft="0px";
			contenedor[e].style.marginRight="0px";
			contenedor[e].onmouseover=function(){cambio(this,fondoBotonesCambio);};
			contenedor[e].onmouseout=function(){cambio(this,fondoBotonesAntes);};
			if(contenedor[e].getAttribute("seccion")==controlSecciones){
				contenedor[e].style.backgroundColor=fondoBotonesCambio;
				contenedor[e].style.marginLeft="5px";
				contenedor[e].style.marginRight="5px";
				contenedor[e].onmouseover="";
				contenedor[e].onmouseout="";
			}
		}
	}
	function marquesinaOver(direccion){
		var divContenedor=document.getElementById("botones");
		var margen=window.getComputedStyle(divContenedor).marginLeft;
		if(direccion=="derecha"){
			movimiento=setInterval(function(){
										var margen=window.getComputedStyle(divContenedor).marginLeft;
										var limite=tamanoDeBotones*cantidadDeBotones-(tamanoDeMarquesina*tamanoDeBotones);
										if(cantidadDeBotones>tamanoDeMarquesina){
											if(margen.substr(0,margen.length-2)>limite*(-1)+15){
												divContenedor.style.marginLeft=margen.substr(0,margen.length-2)-1+"px";
											}
										}
									},10);
		}else if(direccion=="izquierda"){
			movimiento=setInterval(function(){
										var margen=window.getComputedStyle(divContenedor).marginLeft;
										if(margen.substr(0,margen.length-2)<0){
												divContenedor.style.marginLeft=parseInt(parseInt(margen.substr(0,margen.length-2))+1)+"px";
										}
									},10);
		}
	}
	function marquesinaOut(){
		clearInterval(movimiento);
	}
//--------------------------------------------------------------  FIN MARQUESINA ----------------------------------------------------
	function cambioSeccion(obj){
		num=obj.getAttribute("seccion");
		controlSecciones=num;
		arreglo=secciones[num];
		destruirHorario();
		var ventanaPadre=window.parent;
		var horario=construirHorario(ventanaPadre.dias,ventanaPadre.horas,ventanaPadre.att,ventanaPadre.cont);
		document.getElementById("contenedorDeHorario").appendChild(horario);
		llenarHorario(arreglo);
		activarCambio(horario);
	}
</script>
<script type="text/javascript" src="JS/horarios.js"></script>
<?php 
	unset($_SESSION["secciones"]);
?>
</html>