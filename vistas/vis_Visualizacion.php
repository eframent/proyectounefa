<?php
	session_start();
	$bloques=$_SESSION["Bloques"];
	$ambientes=$_SESSION["Ambientes"];
	$tipoAmbientes=$_SESSION["tipoAmbientes"];
	$bloquesOcupados=$_SESSION["BloquesOcupados"];
	$horas=$_SESSION["horas"];
	$horasD=$_SESSION["horasD"]['existentes'];
	$topeHorasD=$_SESSION["horasD"]['tope'];
	unset($_SESSION["Bloques"]);
	unset($_SESSION["Ambientes"]);
	unset($_SESSION["tipoAmbientes"]);
	unset($_SESSION["BloquesOcupados"]);
	unset($_SESSION["horas"]);
	$dias=Array("Lunes","Martes","Miecoles","Jueves","Viernes","Sabado","Domingo");
	$cantidadDeAmbientes=count($ambientes);
	$cantidadDeBloques=count($bloques);
	$cantidadDeTipos=count($tipoAmbientes);
?>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/horarios.css">
	<link rel="stylesheet" type="text/css" href="css/mensajes.css">
	<style type="text/css">
		div[selectorDias]{
			margin-left: 6px;
			margin-bottom: -15px;
			margin-top: 4px;
		}

		div[tipoAmbiente]{
			height: auto;
			border: none;
			box-shadow: none;
			margin-top: -5px;

		}

		div[selectorDias] input[type="button"]{
			border-radius:5px 5px 0 0; 
			margin-left: -12px;
			border:1px solid black;
			border: none;
			width: auto;
			font-size: 12px;
			background: midnightblue;
			color: white;
			padding: 15px;
		}

		div[selectorDias] input[type="button"]:first-child{
			margin-left: -7px;
		}

		div[tipoAmbiente] input[type="button"]{			
			margin-left: -1px;
			border:1px solid black;
			height: 30px;
			border: none;
			width: 33%;
			font-size: 10px;
			background: silver;
			color: white;
			border-radius: 0px;
			cursor: pointer;
			padding: 0;
		}


		div[tipoAmbiente] input[type="button"]:hover{
			background: #e2e2e2;
			color: rgb(28, 69, 131);
		}

		div[cantidadHoras]{
			max-width: 300px;
			border:1px solid rgb(222, 222, 222);
			border-radius: 5px;
			height: 80px;	
			float: left;
			margin: 20px 0px 0px 10px;
			box-shadow: 0px 0px 10px rgba(189, 189, 189, 0.4);
			overflow: visible;
			color:rgb(28, 69, 131);
			font-size: 12px;
		}

		fieldset{
			border: none;
			box-shadow: none;
		}

		fieldset legend{
			font-size: 12px;
			margin-top: 5px;
			background: #e2e2e2;
			color: rgb(28, 69, 131);
			margin-left: 10px;
		}

		h2{
			margin: 5px 0 0 100px;
			background: rgb(28, 69, 131);
			color: white;
			width: 150px;
			text-align: center;
			font-size: 18px;
			padding: 5px;
			border-radius: 5px 5px 0 0;
		}

		h5{
			font-size: 12px;
			margin-top: -13px;
			background: none repeat scroll 0% 0% rgb(226, 226, 226);
			color: rgb(28, 69, 131);
			margin-left: 10px;
			margin-right: 20px;
			border: 1px solid rgb(221, 221, 221);
			border-radius: 3px;
			box-shadow: 0px 0px 10px rgba(189, 189, 189, 0.4);
			padding: 5px 10px;
		}
		.cant{
			color:#2980b9;
			font-size: 20px;
			text-align: center;
			margin: 0px auto;
			font-weight: bold;
		}
		#tope{
			width: 55px;
			border:none;
			background:inherit;
			font-size: 12px;
			margin:0px auto;
			padding: 5px 10px;
			text-indent: 0;

		}

		div[operaciones]{
			margin-top: -32px;
			position: fixed;
			margin-left: 90%;
		}

		div[operaciones] div{
			float: left;
			margin-left: 2px;
		}

		div[operaciones] input[type="button"]{
			border-radius:5px 5px 0 0; 
			border:1px solid black;
			border: none;
			width:32px;
			font-size: 12px;
			color: white;
			cursor: pointer;
			padding: 15px;
			height: 36px;
			margin-top: 11px;
		}

		div[operaciones] input[type="button"]:hover{
			cursor: pointer;
		}

		td.td{
			background:white; 
			border:none;
			box-shadow:none;
			width: 30%;
		}

		div[tooltics-ope]{
			position: absolute;
			background: #1BA39C;
			margin: -5px 0px 0px 8px;
			width: 1px;
			overflow: hidden;
			transition:all 0.5s;
			height: 0px;
			border-radius: 3px 3px 0px 3px;
			color: white;
			font-size: 11px;
		}

		.cancelar{
			margin-right: 30px;
			background-image: url('imagenes/bl32.png');
			background-repeat: no-repeat;
			background-position: 0px -254px; 
			background-color: FireBrick;
		}
		.guardar{
			background-image: url('imagenes/bl32.png');
			background-repeat: no-repeat;
			background-position: -96px -160px; 
			background-color: Forestgreen;
		}

		.cancelar:hover+div[tooltics-ope]{
			background-color: FireBrick;
		}

		.guardar:hover+div[tooltics-ope]{
			background-color:  Forestgreen;
		}


		.guardar:hover+div[tooltics-ope], .cancelar:hover+div[tooltics-ope]{
			width: 50px;
			height: 15px;
			margin: -60px 0px 0px -50px;
			padding: 5px;
		}


		.bso{
			width:40px; 
			float:left;
			margin-left: 10px;
			height: 40px;
			text-align: center;
			border-radius:3px;
			box-shadow: none;
		}

		.bloqueado{
			background: url("imagenes/iconos/blanco/close.png") no-repeat;
			background-size: 20px 20px;
			background-position: center;
			margin-left: 5px;
			background-color: Maroon; 
		}

		.seleccionado{
			background: url("imagenes/iconos/blanco/selec.png") no-repeat;
			background-size: 20px 20px;
			background-position: center;
			background-color: Forestgreen;
		}

		.ocupado{
			background: url("imagenes/icon-blancos/ban.png") no-repeat;
			background-size: 25px 25px;
			background-position: 9px 8px;
			background-color: #D35400;
		}

		.docente{
			background: url("imagenes/iconos/blanco/user.png") no-repeat;
			background-size: 20px 20px;
			background-position: center;
			background-color: FireBrick;
		}

		div[tooltics]{
			position: absolute;
			background: #1BA39C;
			margin: 5px 0px 0px 8px;
			width: 1px;
			overflow: hidden;
			transition:all 0.5s;
			height: 0px;
			border-radius: 3px 3px 3px 0px;
			color: white;
			font-size: 11px;
		}

		.seleccionado:hover>div[tooltics]{
			background-color: inherit;
			height: 30px;
			margin: -38px 0px 0px 35px;
		}

		.bloqueado:hover>div[tooltics]{
			background-color: inherit;
			height: 30px;
			margin: -38px 0px 0px 35px;
		}

		.ocupado:hover>div[tooltics]{
			background-color: inherit;
			height: 40px;
			margin: -48px 0px 0px 35px;

		}

		.docente:hover>div[tooltics]{
			background-color: inherit;
			height: 40px;
			margin: -48px 0px 0px 35px;

		}

		.bloqueado:hover>div[tooltics], .seleccionado:hover>div[tooltics], .ocupado:hover>div[tooltics], .docente:hover>div[tooltics]{
			width: 150px;
			padding: 3px;
		}

		fieldset[leyenda]{
			width: 200px;
			float: left;
		}

	</style>
	<link rel="stylesheet" type="text/css" href="css/formulario.php">

</head>

<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>);">
	<table >
		<tr>
			<td class="td" style="width:40%; background:white;">
				<fieldset style="width:300px;" leyenda>
					<legend>Ambientes</legend>
					<div tipoAmbiente>
						<?php
							for($indiceDeTipos = 0 ; $indiceDeTipos < $cantidadDeTipos ; $indiceDeTipos++){
								echo"<input type='button' onclick=(f_CambioDeTipo(this,'".$tipoAmbientes[$indiceDeTipos][0]."')) value='".$tipoAmbientes[$indiceDeTipos][1]."'>";
							}
						?>
					</div>
				</fieldset>
				<fieldset leyenda>
					<legend>Leyenda</legend>
					<div class="bso bloqueado">
						<div tooltics> Bloque de Hora bloqueado</div>
					</div>
					<div class="bso seleccionado">
						<div tooltics> Bloque de Hora seleccionado</div>
					</div>
					<div class="bso ocupado" onclick="f_Mensaje('Bloque de hora ocupado para esta seccion')" title="click aqui">
						<div tooltics> Bloque de Hora ocupado para esta seccion</div>
					</div>
					<div class="bso docente" onclick="f_Mensaje('Docente no esta disponible en bloque de hora seleccionada')" title="click aqui">
						<div tooltics> Docente no esta disponible en este bloque de hora</div>
					</div>
				</fieldset>
				<div cantidadHoras><h5>Estudiantes</h5>tope:&nbsp<div  class="cant"><input type="number" value="35" min="15" max="35" id="tope"  onkeypress="return validar_numeros(event);"></div></div>
				<div cantidadHoras><h5>Materia</h5>Horas: &nbsp<div id="cantHo" class="cant"><?php print($horas);?></div></div>
				<div cantidadHoras><h5 style="text-align:center" id="nombreDocente"></h5>Horas:&nbsp<div id="horasDocente" class="cant"><?php print($horasD);?></div></div>

			</td>
		</tr>
		</table>

				<div selectorTotal >
					<div selectorDias >
						<input type="button" onmouseover="f_ControlDeEfectos('mouseover','elemento',this)" onmouseout="f_ControlDeEfectos('mouseout','elemento',this)" id="inicio" onclick="f_Dia(1,this)" value="LUNES">
						<input type="button" onmouseover="f_ControlDeEfectos('mouseover','elemento',this)" onmouseout="f_ControlDeEfectos('mouseout','elemento',this)" onclick="f_Dia(2,this)" value="MARTES">
						<input type="button" onmouseover="f_ControlDeEfectos('mouseover','elemento',this)" onmouseout="f_ControlDeEfectos('mouseout','elemento',this)" onclick="f_Dia(3,this)" value="MIERCOLES">
						<input type="button" onmouseover="f_ControlDeEfectos('mouseover','elemento',this)" onmouseout="f_ControlDeEfectos('mouseout','elemento',this)" onclick="f_Dia(4,this)" value="JUEVES">
						<input type="button" onmouseover="f_ControlDeEfectos('mouseover','elemento',this)" onmouseout="f_ControlDeEfectos('mouseout','elemento',this)" onclick="f_Dia(5,this)" value="VIERNES">
						<input type="button" onmouseover="f_ControlDeEfectos('mouseover','elemento',this)" onmouseout="f_ControlDeEfectos('mouseout','elemento',this)" onclick="f_Dia(6,this)" value="SABADO">
						<input type="button" onmouseover="f_ControlDeEfectos('mouseover','elemento',this)" onmouseout="f_ControlDeEfectos('mouseout','elemento',this)" onclick="f_Dia(7,this)" value="DOMINGO">	
					</div>
					<div operaciones>
						<div><input type="button" class="guardar" title="Guardar" onclick="f_Enviar()"><div tooltics-ope> Guardar</div></div>
						<div><input type="button" class="cancelar" title="Cancelar" onclick="window.parent.document.getElementById('cerrar').click();"><div tooltics-ope> Cancelar</div></div>
					</div>
					<form name="form1" method="POST" action="../controladores/cor_Visualizacion.php">
							<input type="hidden" name="Operacion" >
							<input type="hidden" name="Docente" >
							<input type="hidden" name="Regimen" >
							<input type="hidden" name="Seccion" >
							<input type="hidden" name="Valor" id="Valor" value="<?php print($_GET['buscar']);?>" >
						</form>
					<table  id="horarios">
						<?php 
							echo"<tr>
									<td style='max-width:150px; width:150px;padding:0px 10px;'>Hora
									</td>";
							for($indiceDeAmbientes=0; $indiceDeAmbientes < $cantidadDeAmbientes; $indiceDeAmbientes++){
								echo"<td style='max-width:150px; width:150px;padding:0px 10px;' padre='".$ambientes[$indiceDeAmbientes][3]."'>".$ambientes[$indiceDeAmbientes][1]."</td>";
							}
							echo"</tr>";
							for ($indiceDeBloques=0; $indiceDeBloques < $cantidadDeBloques; $indiceDeBloques++) { 
								echo"<tr><td>".$bloques[$indiceDeBloques][1]."</td>";
								for($indiceDeAmbientes=0; $indiceDeAmbientes < $cantidadDeAmbientes; $indiceDeAmbientes++){
									echo"<td ><div activo='si' name='Bloques' editable='no' type='button' bloque=".$bloques[$indiceDeBloques][0]." ambiente=".$ambientes[$indiceDeAmbientes][0]."></div></td>";
								}
								echo"</tr>";
							}
						?>
					</table>
	</div>
</body>
<script type="text/javascript" src="JS/motorValidaciones"></script>
<script type="text/javascript" src="JS/Mensajes.js"></script>
<script type="text/javascript">
	var MateriaAUtilizar=window.parent.document.getElementById("cmbcodmat").value;
	var DocenteAUtilizar=window.parent.document.getElementById("docente").value;
	var topeHorasD="<?php print($topeHorasD);?>";
	var bloquesOcupados=new Array();
	var bloquesNuevos=new Array();
	var cont=0;
	var contBloques=0;
	var fondoCambio="RoyalBlue";
	var fondoAntes="MidnightBlue";
	var colorBloqueDocente='FireBrick';
	var colorMateriaAnterior='#D35400';
	var dias=["Lunes","Martes","Míercoles","Jueves","Víernes","Sabado","Domingo"];
	var horas=[<?php 
				for($b=0;$b<count($bloques);$b++){
					echo"'".$bloques[$b][1]."'";
					if($b!=count($bloques)-1){
						echo",";
					}
				}
				?>];
	var att=["bloque","dia","name"];
	var cont=new Array();
	var arreglo=new Array();
	<?php 
	for($d=0;$d<7;$d++){
		echo"cont[".$d."]=[";
		for($b=0;$b<count($bloques);$b++){
			echo"['".$bloques[$b][0]."','".($d+1)."','Bloques']";
			if($b!=count($bloques)-1){
				echo",";
			}
		}
		echo"];\n";
	} 
	?>
	<?php  
		for($lix=0;$lix<count($bloquesOcupados);$lix++){
			echo"\nbloquesOcupados[".$lix."]=new Array('".$bloquesOcupados[$lix][0]."','".$bloquesOcupados[$lix][1]."','".$bloquesOcupados[$lix][2]."','".$bloquesOcupados[$lix][3]."');";
		}
	?>
//--------------------------------------------Arranque de la transaccion -------------------------------------------------
	//Esta funcion es la que arranca el proceso... donde se reciven los datos de Proyecion
	function cargar(bool){
		if(bool==1){
			form=document.form1;
			form.Operacion.value="Listar";
			form.Docente.value=window.parent.document.getElementById("docente").value;
			form.Regimen.value=window.parent.document.getElementById("cmbregimen").value;
			form.Seccion.value=window.parent.seccion;
			form.submit();
		}else{
			var padre=window.parent;
			var tamano;
			var control;
			document.getElementById("nombreDocente").textContent+=window.parent.document.getElementById("docente").options[window.parent.document.getElementById("docente").selectedIndex].textContent;
			padre.document.getElementById("docente").value="-";
			padre.document.getElementById("cmbcodmat").value="-";
			//Recibo los bloques armados que se encuentren en el Arreglo de proyeccion
			var bloquesAnteriores=window.parent.recibirArreglo("anteriores",MateriaAUtilizar);
			var bloquesAModificar=window.parent.recibirArreglo("modificar",MateriaAUtilizar);
			bloquesNuevos=bloquesAModificar;
			//cargo los bloques ocupados en materias agregadas
			//recorro el arreglo bloques anteriores
			for(var x=0;x<bloquesAnteriores.length;x++){
				//si el bloque existe continuo
				if(bloquesAnteriores[x]!==undefined){
					//guardo el tamaño de este espacio del arreglo
					tamano=bloquesAnteriores[x].length;
					//recorro este espacio del arreglo
					for(var y=0;y<tamano;y++){
						//asigo 0 al valor de control
						control=0;
						//recorro los bloques ocupados en busca de si este espacio de bloquesAteriores sen encuentra dentro de el
						for(var z=0;z<bloquesOcupados.length;z++){
							//verifico que el bloque ocupado sea el espacio del bloquesAnteriores
							if((bloquesOcupados[z][0]==bloquesAnteriores[x][y][0])&&(bloquesOcupados[z][1]==bloquesAnteriores[x][y][1])&&(bloquesOcupados[z][2]==bloquesAnteriores[x][y][2])){
								//si es el mismo le coloco el valor de tipo de bloque, que es 2, 
								//esto significa que esta ocupado en esta misma seccion pero otra materia
								bloquesOcupados[z][3]="2";
								//asigno 1 al valor de control para que no añada el bloque, ya que este ya esta en el arreglo
								control=1;
							}
						}
						//si el campo no fue encontrado continuo 
						if(control!=1){
							var tipoDeBloque=verificarTipoDeBloque(bloquesAnteriores[x][y]);
							//agrego el espacio de bloquesAnteriores al arreglo de bloquesOcupados
							bloquesOcupados[bloquesOcupados.length]=new Array(bloquesAnteriores[x][y][0],bloquesAnteriores[x][y][1],bloquesAnteriores[x][y][2],tipoDeBloque);
						}						
					}
				}
			}
			//cargo los bloques de la materia a modificar
			for(var x=0;x<bloquesAModificar.length;x++){
				if(bloquesAModificar[x]!==undefined){
					//armo el arreglo de bloques a Modificar para posteriormente validarlos
					control=0;
					for(var y=0;y<bloquesOcupados.length;y++){
						if((bloquesOcupados[y][0]==bloquesAModificar[x][0])&&(bloquesOcupados[y][1]==bloquesAModificar[x][1])&&(bloquesOcupados[y][2]==bloquesAModificar[x][2])){
							bloquesOcupados[y][3]="1";
							control=1;
						}
					}
					if(control!=1){
						bloquesOcupados[bloquesOcupados.length]=new Array(bloquesAModificar[x][0],bloquesAModificar[x][1],bloquesAModificar[x][2],'1');	
					}
					document.getElementById('cantHo').textContent=parseInt(document.getElementById('cantHo').textContent)-1;
				}
			}
			//document.getElementById("nombreDocente").textContent+=window.parent.document.getElementById("docente").options[window.parent.document.getElementById("docente").selectedIndex].textContent;
			f_Dia(1,document.getElementById('inicio'));
			//con esta funcion evaluo si el docente ya esta guardado en el arreglo temporal con sus horas
			f_EvaluarHorasDocente();
		}
	}
	function verificarTipoDeBloque(bloque){
		//valor a retornar
		var tipo=2;
		//declaro la ventana padre como variable para poder utilizarla
		var padre=window.parent;
		//creo un arreglo con todos los combos de la ventana padre
		var lista=padre.document.getElementsByTagName('select');
		//creo un ciclo para recorrer el arreglo y buscar los valores agregados que usen el mismo docente a utilizar
		for(var x=0;x<lista.length;x++){
			//pregunto si el valor de el combo es el mismo del docente que voy a utilizar
			if(lista[x].value==DocenteAUtilizar){
				//guardo el numero valor agregado ya que este me servira para encontrar el tipo de bloque
				var numero=lista[x].name.substr(9,1);
			}
		}
		//creo un segundo ciclo para saber la materia del bloque agregado que se encontro con aterioridad
		for(var x=0;x<lista.length;x++){
			//pregunto si el valor es el mismo
			if(lista[x].name.substr(9,1)==numero){
				if(lista[x].value==bloque[3]){
					tipo=3;
				}
			}
		}
		return tipo;

	}
	function f_Dia(num,obj){
		f_OcuparBloques(num);
		f_ControlDeEfectos("click","barra",obj);
	}
	function f_OcuparBloques(dia){
		var lista=document.getElementsByName("Bloques");
		var longitud=lista.length;
		var cantidadDeBloquesOcupados=bloquesOcupados.length;
		var elemento;
		var tdNuevo;
		var hijos;
		var padre;
		var indice;
		var longitudDeHijos;
		for(var i=0;i<longitud;i++){
			lista[i].setAttribute("activo","si");
		}
		//recorro todos los bloques para realizarle todas las operaciones correspondientes
		for(var x=0;x<longitud;x++){
			//si la cantidad de bloques ocupados es 0 los colocos todos como desocupados
			if(cantidadDeBloquesOcupados==0){
				lista[x].onclick=function(){ f_ActivaBloque(this,dia);}
				lista[x].style.background="grey";
				lista[x].setAttribute("editable",'no');
			}else{
				//recorro el arreglo de bloques ocupados
				for(var y=0;y<cantidadDeBloquesOcupados;y++){
					//si el dia en el que estoy parado coinside con el dia del bloque ocupado perteneciente a la vuelta
					if(dia==bloquesOcupados[y][0]){
						//averigua si el espacio de la lista coinside con el bloque ocupado de la vuelta
						if((lista[x].getAttribute("bloque")==bloquesOcupados[y][1])&&(lista[x].getAttribute("ambiente")==bloquesOcupados[y][2])){
							//lo desactivo
							lista[x].onclick="";
							//pregunto que tipo de bloque es: 
							//0=a bloque perteneciente a otra seccion,
							//1=pertenece a esta misma materia de esta misma seccion
							//2=pertenece a otra materia de esta seccion
							//3=docente ocupado
							if(bloquesOcupados[y][3]=="0"){
								lista[x].style.background="url(imagenes/iconos/blanco/close.png) no-repeat";	
								lista[x].style.backgroundPosition="center";
								lista[x].style.backgroundColor='Maroon';
								lista[x].setAttribute("activo","no");	
							}else if(bloquesOcupados[y][3]=="1"){
								f_ActivaBloque(lista[x],dia,"cambiodia");
							}else if(bloquesOcupados[y][3]=="2"){	
								f_ActivaBloque(lista[x],dia,"materiaAnterior");
							}else if(bloquesOcupados[y][3]=="3"){
								f_ActivaBloque(lista[x],dia,"bloqueDocente");
							}
							break;
						}else{
							if(lista[x].getAttribute("activo")!="si"){
								if(lista[x].getAttribute("tipobloqueo")=="docente"){
									lista[x].onclick=function(){f_Mensaje("Docente no esta disponible en bloque de hora seleccionada")};
								}else if(lista[x].getAttribute("tipobloqueo")=="materia"){
									lista[x].onclick=function(){f_Mensaje("Bloque de hora ocupado para esta seccion")};
								}else if(lista[x].getAttribute("tipobloqueo")=="cambiodia"){
									lista[x].onclick="";
								}
							}else{
								lista[x].onclick=function(){ f_ActivaBloque(this,dia);}	
							}
							lista[x].style.background="grey";
							lista[x].setAttribute("editable",'no');
						}
					}else{
						if(lista[x].getAttribute("activo")!="si"){
							if(lista[x].getAttribute("tipobloqueo")=="docente"){
								lista[x].onclick=function(){f_Mensaje("Docente no esta disponible en bloque de hora seleccionada")};
							}else if(lista[x].getAttribute("tipobloqueo")=="materia"){
								lista[x].onclick=function(){f_Mensaje("Bloque de hora ocupado en materias previas")};
							}else if(lista[x].getAttribute("tipobloqueo")=="cambiodia"){
								lista[x].onclick="";
							}
						}else{
							lista[x].onclick=function(){ f_ActivaBloque(this,dia);}	
						}
						lista[x].style.background="grey";
						lista[x].setAttribute("editable",'no');
					}
				}
			}
		}
		if(document.getElementById('cantHo').textContent=="0"){
			desabilitarTodo();
		}
	}
//-------------------------------------------------------- ACTIVAR BLOQUE ----------------------------------------------------------------------------------
	function f_ActivaBloque(obj,dia,origen){
		origen=origen || "click";
		var lista=document.getElementsByName("Bloques");
		var longitud=lista.length;
		var padre;
		var cantidadDeBloquesOcupados=bloquesOcupados.length;
		var bloqueCompuesto;
		var hijo;
		//compruebo que el bloque no este previamente Activado
		if(document.getElementById('horasDocente').textContent==topeHorasD){
			alert("llego al tope");
			desabilitarTodo();	
		}else{
			if(obj.style.backgroundColor!="blue"){
				//asigno el padre que seria un arreglo con todos los TD del TR al que pertence el bloque 
				padre=obj.parentNode.parentNode.childNodes;
				//desactivo todos los bloque pertenecientes a padre(leer comentario anterior)
				for(var z=0;z<padre.length;z++){
					hijo=padre[z].lastChild;
					//pregunto si el espacio sea un nodo valido
					if(hijo.nodeName!="#text"){
						hijo.setAttribute("activo","no");
						if(origen=="bloqueDocente"){
							//le cambio en  onclick a vacio para que no se active al click
							hijo.onclick=function(){f_Mensaje("Docente no esta disponible en bloque de hora seleccionada")};
							//coloco el atributo tipobloqueo
							hijo.setAttribute("tipobloqueo","docente");
						}else if(origen=="materiaAnterior"){						
							//le cambio en  onclick a vacio para que no se active al click
							hijo.onclick=function(){f_Mensaje("Bloque de hora ocupado en materias previas")};
							//coloco el atributo tipobloqueo
							hijo.setAttribute("tipobloqueo","materia");
						}else if(origen=="cambiodia"){
							//coloco el atributo tipobloqueo
							hijo.setAttribute("tipobloqueo","cambiodia");
							//verifico que el elemento sea el que activo la funcion
							if(obj==hijo){
								//le cambio en  onclick a vacio para que no se active al click
								hijo.onclick=function(){f_DesactivarBloque(this,dia)};
								hijo.setAttribute("activo","si");
							}
						}else if(origen=="click"){
							//coloco el atributo tipobloqueo
							hijo.setAttribute("tipobloqueo","click");
							//verifico que el elemento sea el que activo la funcion
							if(obj==hijo){
								//le cambio en  onclick a vacio para que no se active al click
								hijo.onclick=function(){f_DesactivarBloque(this,dia)};
								hijo.setAttribute("activo","si");
							}else{
								hijo.onclick="";
							}
						}
					}
				}
				//reviso si el elemento se encuentra dentro de los bloques ocupados con aterioridad
				var cont=f_BuscarElemento(bloquesOcupados,obj,dia);
				//pregunto si el bloque seleccionado NO se encuentra entre los bloques ocupados 
				if(cont==0){
					//lo añado dentro de los bloques ocupados con el 1 que significa misma materia misma seccion
					bloquesOcupados[bloquesOcupados.length]=new Array(dia,obj.getAttribute("bloque"),obj.getAttribute("ambiente"),"1");
					//lo agrego al arreglo de bloques nuevos para ser guardados en la base de datos
					bloquesNuevos[bloquesNuevos.length]=new Array(dia,obj.getAttribute("bloque"),obj.getAttribute("ambiente"),MateriaAUtilizar);
					//aumento el contador de bloques
					contBloques++;
					//pregunto para ver si es elegido en esta vista o pertenece a uno elegido en visualizaciones anteriores
					if(origen=="click"){	
						obj.style.background="url(imagenes/iconos/blanco/selec.png) no-repeat";
						obj.style.backgroundPosition="center";
						obj.style.backgroundColor="Forestgreen";
						obj.setAttribute("editable",'si');
					}else if(origen=="bloqueDocente"){
						obj.style.background="url(imagenes/iconos/blanco/user.png) no-repeat";
						obj.style.backgroundPosition="center";
						obj.style.backgroundColor=colorBloqueDocente;
					}else if(origen=="materiaAnterior"){
						obj.style.background="url(imagenes/icon-blancos/ban.png) no-repeat";
						obj.style.backgroundPosition="center";
						obj.style.backgroundSize="40px 40px";
						obj.style.backgroundColor=colorMateriaAnterior;
					}
				}else{
					if(origen=="cambiodia"){	
						obj.style.background="url(imagenes/iconos/blanco/selec.png) no-repeat";
						obj.style.backgroundPosition="center";
						obj.style.backgroundColor="Forestgreen";
						obj.setAttribute("editable",'si');
					}else if(origen=="bloqueDocente"){
						obj.style.background="url(imagenes/iconos/blanco/user.png) no-repeat";
						obj.style.backgroundPosition="center";
						obj.style.backgroundColor=colorBloqueDocente;
					}else if(origen=="materiaAnterior"){
						obj.style.background="url(imagenes/icon-blancos/ban.png) no-repeat";
						obj.style.backgroundPosition="center";
						obj.style.backgroundSize="40px 40px";
						obj.style.backgroundColor=colorMateriaAnterior;
					}
				}
			}else{
				//obj.style.backgroundColor="grey";
			}
		
			//si las horas asignadad son mayores o iguales al 80% de las horas correspondientes a su dedicacion
			if(parseInt(document.getElementById('horasDocente').textContent)>=parseInt((parseInt(topeHorasD)*0.8)-1)){
				//cambio de propiedad
				document.getElementById('horasDocente').parentNode.firstChild.style.color="red";
				document.getElementById('horasDocente').style.color="red";
			}else{
				//cambio de propiedad 
				document.getElementById('horasDocente').parentNode.firstChild.style.color="forestgreen";
				document.getElementById('horasDocente').style.color="forestgreen";
			}
			if(parseInt(document.getElementById('cantHo').textContent)>0){
				if((origen=="click") && (cont==0)){
					//se reduce el contador de horas disponibles
					document.getElementById('cantHo').textContent=parseInt(document.getElementById('cantHo').textContent)-1;
					document.getElementById('horasDocente').textContent=parseInt(document.getElementById('horasDocente').textContent)+1;
				}
			}
			if(document.getElementById('cantHo').textContent=="0"){
				desabilitarTodo();
			}
		}
	}
//-------------------------------------------------------- FIN ACTIVAR BLOQUE ------------------------------------------------------------------------------
	function f_DesactivarBloque(obj,dia){
		var fila;
		var control;
		//delcaro el inidice
		var indice=0;
		//coloco el indice como el espacio donde se encuentra dentro de los bloques ocupados
		indice=f_BuscarElemento(bloquesOcupados,obj,dia,"indice");
		//utilizando el indice lo elimino del arreglo de bloques ocupados
		bloquesOcupados=eliminarElemento(bloquesOcupados,indice);
		//coloco el indice como el espacio donde se encuentra dentro de los bloques Nuevos
		indice=f_BuscarElemento(bloquesNuevos,obj,dia,"indice");
		//utilizando el indice lo elimino del arreglo de bloques nuevos
		bloquesNuevos=eliminarElemento(bloquesNuevos,indice);
		//le cambio el fonod para identificar que esta disponible de nuevo
		obj.style.background="grey";
		obj.setAttribute("editable",'no');
		//modifico los contadores de horas del docente y la materia
		document.getElementById('cantHo').textContent=parseInt(document.getElementById('cantHo').textContent)+1;
		document.getElementById('horasDocente').textContent=parseInt(document.getElementById('horasDocente').textContent)-1;
		//hago la validacion visual
		if(parseInt(document.getElementById('horasDocente').textContent)>=parseInt((parseInt(topeHorasD)*0.8)-1)){
			//cambio de propiedad
			document.getElementById('horasDocente').parentNode.firstChild.style.color="red";
			document.getElementById('horasDocente').style.color="red";
		}else{
			//cambio de propiedad 
			document.getElementById('horasDocente').parentNode.firstChild.style.color="forestgreen";
			document.getElementById('horasDocente').style.color="forestgreen";
		}
		//reviso la tabla entera para activar los correctos
		tabla=obj.parentNode.parentNode.parentNode.childNodes;
		for(var f=0;f<tabla.length;f++){
			control=0;
			//hago una revision de todos los elemento de es tr para verificar que se activen los correctos
			fila=tabla[f].childNodes;
			//reviso que no exista ninguna validacion activa en la fila(tr)
			for(var c=0;c<fila.length;c++){
				//inicializo la variable de validacion
				hijo=fila[c].lastChild;
				//pregunto si el espacio sea un nodo valido
				if(hijo){
					if(hijo.nodeName!="#text"){
						if((hijo.style.backgroundColor.toLowerCase()==colorMateriaAnterior)||(hijo.style.backgroundColor.toLowerCase()==colorBloqueDocente)||(hijo.style.backgroundColor.toLowerCase()=="forestgreen")){
							control=1;		
						}
					}
				}
			}
			if(control==0){
				for(var c=0;c<fila.length;c++){
					hijo=fila[c].lastChild;
					//pregunto si el espacio sea un nodo valido
					if(hijo){
						if(hijo.nodeName!="#text"){
							if(hijo.style.backgroundColor=="grey"){
								//le activo el onclick por si desea seleccionarce de nuevo
								hijo.onclick=function(){f_ActivaBloque(this,dia)};
							}
						}
					}
				}
			}
		}
		
	}
	function eliminarElemento(arr,indice,condicion){
		condicion= condicion || "arreglo";
		var arrAux=new Array();
		var elemento= new Array();
		var y=0;
		//guardo en un arreglo auxiliar el arreglo sin el elemento no deseado
		for(var x=0;x<arr.length;x++){
			if(x==indice){
				elemento=arr[x];
			}else{	
				if(arr[x]){
					arrAux[y]=arr[x];
				}
				y++;
			}
		}
		if(condicion=="elemento"){
			return elemento;
		}else if(condicion=="arreglo"){
			return arrAux;
		}
	}
	function f_BuscarElemento(arr,obj,dia,condicion){
		var cont=0;
		var indice=-1;
		condicion=condicion || "existe";
		//recorro todos los bloques ocupados para verificar si el bloque selecionado ya se encuentra dentro de los bloques ocupados
		for(var y=0;y<arr.length;y++){
			if((arr[y][0]==dia)&&(arr[y][1]==obj.getAttribute("bloque"))&&(arr[y][2]==obj.getAttribute("ambiente"))){
				cont++;
				indice=y;
				break;
			}
		}
		if(condicion=="indice"){
			return indice;
		}else if(condicion=="existe"){
			return cont;
		}
	}
	function f_Mensaje(mensaje){
		if(document.getElementById("mensaje")){
			if(document.getElementById("mensaje").textContent!=mensaje){
				f_MostrarMensaje(mensaje,"Alerta",document.getElementById("horarios"),"60px");
			}
		}else{
			f_MostrarMensaje(mensaje,"Alerta",document.getElementById("horarios"),"60px");
		}
	}
//-------------------------------------Enviar-----------------------------------------------------------------------------------
	//envia los datos llenados en la ventana modal a un arreglo en la ventana padre para continuar la transaccion
	function f_Enviar(){
		if(document.getElementById('cantHo').textContent!="0"){
			f_MostrarMensaje("Debe utilizar todos los bloques de horas de la materia","Alerta",document.getElementById("horarios"),"60px");	
		}else{
			if(document.getElementById('tope').value==""){
				f_MostrarMensaje("Debe colocar el tope de estudianes","Alerta",document.getElementById("horarios"),"50px");	
			}else{					
				var padre=window.parent;
				//envio datos al arreglo donde esta la ventana padre
				padre.gestionarAgregar(bloquesNuevos);
				f_GestionarArregloDocente();
				//armo el previsaulizacion del horario de la seccion en la ventana padre
				bloquesNuevos=[];
				padre.document.getElementById("cerrar").click();
			}
		}
	}
//-----------------------gestion de arreglo temporal de doncentes -----------------------------------
	function f_EvaluarHorasDocente(){
		var padre=window.parent;
		var arregloTemporalDocentes=padre.arregloDocentes;
		var tamano=arregloTemporalDocentes.length;
		//recorro el arreglo temporal en busca de docente seleccionado
		for(var d=0;d<tamano;d++){
			//si se encuentra se sobrescribe las horas de base de datos por las temporales
			if(arregloTemporalDocentes[d][0]==DocenteAUtilizar){
				document.getElementById('horasDocente').textContent=arregloTemporalDocentes[d][1];
				break;
			}
		}
	}
	function f_GestionarArregloDocente(){
		var padre=window.parent;
		var arregloTemporalDocentes=padre.arregloDocentes;
		var tamano=arregloTemporalDocentes.length;
		var cont=0;
		var docenteAgregado=new Array();
		for(var d=0;d<tamano;d++){
			//si se encuentra se sobrescribe los datos del arreglo por los resultantes de esta agregacion
			if(arregloTemporalDocentes[d][0]==DocenteAUtilizar){
				arregloTemporalDocentes[d][0]=DocenteAUtilizar;
				arregloTemporalDocentes[d][1]=document.getElementById('horasDocente').textContent;
				cont++;
				break;
			}
		}
		if(cont==0){
			docenteAgregado=[DocenteAUtilizar,document.getElementById('horasDocente').textContent];
			arregloTemporalDocentes.push(docenteAgregado);
		}
	}
//---------------------------------fin de gestion de docente -------------------------------------------
	function desabilitarTodo(){
		var horario = document.getElementById("horarios");
		var filas=horario.childNodes[1].childNodes;
		var celdas;
		var cantidadDeFilas=filas.length;
		var cantidadDeCeldas;
		for(var f=1;f<cantidadDeFilas;f++){
			if(filas[f].nodeName!="#text"){
				celdas=filas[f].childNodes;
				cantidadDeCeldas=celdas.length;
				for(var c=0;c<cantidadDeCeldas;c++){
					if(celdas[c].nodeName!="#text"){
						if(celdas[c].lastChild.nodeName=="DIV"){
							if(celdas[c].lastChild.getAttribute('editable')=="no"){
								celdas[c].lastChild.onclick="";
								celdas[c].lastChild.setAttribute("activo","no");
							}
						}
					}
				}
			}
		}
	}

	//funcion que me retorna el indice en cual se encuentra el objeto o nodo dentro de la lista de nodos
	function indiceObjeto(obj,arreglo){
		var arr = Array.prototype.slice.call(arreglo.childNodes); // Now it's an Array.
		return arr.indexOf(obj);
	}

	function f_ControlDeEfectos(evento,tipo,obj){
		var contenedor;
		var longitud;
		var objeto;
		var dias=0;
		switch(evento){
			case "mouseover":
				if(tipo=="elemento"){
					obj.style.transition="all 0.5s";
					obj.style.backgroundColor=fondoCambio;
				}
				break;
			case "mouseout":
				if(tipo=="elemento"){
					obj.style.transition="all 0.5s";
					obj.style.backgroundColor=fondoAntes;					
				}
				break;
			case "click":
				if(tipo=="barra"){
					contenedor=obj.parentNode.childNodes;
					longitud=contenedor.length;
					for(var x=0;x<longitud;x++){
						if(contenedor[x].nodeName!="#text"){
							dias++;
							if(obj==contenedor[x]){
								obj.style.transition="all 0.5s";
								obj.style.backgroundColor=fondoCambio;
								contenedor[x].onmouseover="";
								contenedor[x].onmouseout="";
								contenedor[x].onclick="";
							}else{
								objeto=contenedor[x];
								objeto.style.transition="all 0.5s";
								objeto.style.backgroundColor=fondoAntes;
								objeto.onmouseover=(function(objeto){return function(){f_ControlDeEfectos('mouseover','elemento',objeto)}})(objeto);
								objeto.onmouseout=(function(objeto){return function(){f_ControlDeEfectos('mouseout','elemento',objeto)}})(objeto);
								objeto.onclick=(function(objeto,dias){return function(){f_Dia(dias,objeto)}})(objeto,dias);
							}
						}
					}
				}
		}
	}
	function f_CambioDeTipo(obj,id){
		var lista=document.getElementsByTagName("td");
		var longitud=lista.length;
		var contModificados=0;
		var control;
		for(var x=0;x<longitud;x++){
			if(lista[x].getAttribute("padre")==id){
				if(lista[x].style.maxWidth=="150px"){
					lista[x].style.maxWidth="0px";
					lista[x].style.minWidth="0px";
					obj.style.border="1px solid red";
				}else{
					lista[x].style.maxWidth="150px";
					lista[x].style.minWidth="auto";
					obj.style.border="none";
				}
			}
		}
	}
//-------------------------------------------Horario de Previsualizacion-----------------
function f_ArmarPrevi(){
	var padre=window.parent;
	if(padre.arreglo.length==padre.arregloPrevi.length){
		f_ArmarHorario();
	}
}
function f_ArmarHorario(){
	var padre=window.parent;
	padre.document.getElementById("contenedorHorario").style.transition="all 1s";
	padre.document.getElementById("contenedorHorario").style.height="470px";
		if(padre.document.getElementById("Horario")){
			padre.document.getElementById("Horario").parentNode.removeChild(padre.document.getElementById('Horario'));
		}
		var horario=padre.construirHorario(dias,horas,att,cont);
		var contenedor=padre.document.getElementById("contenedorHorario");
		contenedor.appendChild(horario);
		if(padre.arregloPrevi.length>0){
			padre.llenarHorario(padre.arregloPrevi);
		}
}
</script>
</html>