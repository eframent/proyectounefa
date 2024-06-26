<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$la_listados=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Campo=$_SESSION["Matri"];
$tamano=count($la_Campo);
unset($_SESSION["Matri"]);
$la_Nombres=Array("Codigo","Nombre","Titulo","Estatus");
$lobj_Cuerpo->f_Redireccion();
$proceso=$lobj_Cuerpo->f_Proceso("CONFIRMACION CINU");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<link rel="stylesheet" type="text/css" href="css/upload.css">
	<link rel="stylesheet" type="text/css" href="css/importar.css">
	<style type="text/css">
		#con{
			height:0px; 
			overflow:hidden; 
			transition:height 1.5s linear 0s;
			width: auto;
			border: 0px;
			margin: 20px;
			border-radius: 5px;
			clear: both;
		}

		table{
			margin: 5px;
			width: auto;
		}
		
		table tr td input[type="text"]{
			border:none;
			margin:0px;
		}
		table tr td {
			text-align: center;
		}

		input[id="ver"]{
			margin-left: 50%;
		}

		input[id="sig"]{
			margin-left: 50%;
			width: auto;
		}

		input[id="Cerr"]{
			width: auto;
			float: right;
			margin-top: -30px;
		}

        h7{
            font-size: 20px;
            color:white;
            font-weight: bold;
            border:2px solid rgb(20, 30, 143);
            border-radius: 100px;
            padding: 3px;
            background: none repeat scroll 0% 0% rgb(134, 217, 212);
        }
        p{
            transition:all 1s ;
            cursor: pointer;
            padding: 5px;
        }

        #field2{
            float: right;
            margin-top: -105px;
            transition:margin 2s;
            margin-right: 20px;
        }

        div#legendObligatorio{
			display: none !important;
		}

		input[type="text"]{
			width: 100px;
		}
	</style>

	<script>
		laNombre=new Array("Estatus1","Estatus1","Estatus2");
		laValor=new Array("checked","bloqueado","bloqueado");

		function mostrar(){
       	 	document.getElementById("field2").style.marginRight="20px";
   		}

   		function cerrar(){
       	 	document.getElementById("field2").style.marginTop="-700px";
   		}
	</script>
</head>
<body >
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor=" ">
		<div formulario style="overflow:hidden;">
			<h2>Confirmacion CINU</h2>
		<form name="form1" action="../controladores/cor_Confirmar_CINU.php" method="POST">
			<?php $lobj_Cuerpo->f_Control($la_Campos); ?>

			<fieldset style="width:400px">
				<legend>Listado de CINU</legend>
				<input type='button' name='ver' id='ver' class="btn" value='ver' onclick='f_crear();'>
			</fieldset>
			<fieldset id="field2">
                <legend>Instrucciones</legend>
                <input type="button" id="Cerr" value="cerrar" onclick="cerrar();"> 
                <p><h8>1</h8> Presiona ver para que se cargue de 35 en 35 los estudiantes para seleccinar quien aprobo y quien no aprobo CINU </p>
                <p><h8>2</h8> Se presiona el boton siguiente para realizar el guardado </p>
                <p><h8>3</h8> Si presiona ver y no existe la data CINU no se mostrara nada</p>
            </fieldset>
			
		
			<div name='Confirmacion' id='con'>
				<?php
					echo("<table align='center'>");
						echo("<tr>
									<td>
										Cedula
									</td>
									<td colspan='2'>
										Nombres
									</td>
									<td colspan='2'>
										Apellidos
									</td>
									<td>
										Aprobado/Reprobado
									</td>
							  </tr>");
						for ($x=0;$x<$tamano;$x++){
							echo"
								<tr>
									
									<td>
										<input type='text' disabled name='cedula$x' value='".$la_Campo[$x][0]."' size='5'>
									</td>
									<td>
										<input type='text' disabled name='nombre1$x' value='".$la_Campo[$x][1]."' size='5'>
									</td>
									<td>
										<input type='text' disabled name='nombre2$x' value='".$la_Campo[$x][2]."' size='5'>
									</td>
									<td>";
										if($la_Campo[$x][3]!=""){
											echo"<input type='text' disabled name='apellido1$x' value='".$la_Campo[$x][3]."' size='5'>";
										}
										echo"
									</td>
									<td>";
										if($la_Campo[$x][4]!=""){
											echo"<input type='text' disabled name='apellido2$x' value='".$la_Campo[$x][4]."' size='5'>";
										}
										echo"
									</td>
									<td>
										<input Style='margin-left:40px;' type='radio' name='Confirmacion$x' checked='checked' value='A' id='Confirmacion1'>
										<input Style='margin-left:30px;'type='radio' name='Confirmacion$x' value='R'id='Confirmacion2'>
									</td>
								</tr>
							";
						}
						echo"</table>";
				?>
					<input type='button' name='ver' id='sig' class="btn" value='siguiente' onclick='f_Siguiente();' >
			</div>
		</div>
			
		</form>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
	<script type="text/javascript">
		proceso=<?php print($proceso); ?>;
	</script>
	<script type="text/javascript" src="JS/gestionDeProcesos.js"></script>
<script>
	<?php 
		if($tamano<21){
			$resto=100;
		}else{
			$resto=0;
		}
		if($tamano>=1){
			echo"setTimeout(function(){document.getElementById('con').style.height='".($tamano*44.285714286+$resto)."px';},500);";
		}
	 ?>

	function f_crear(){
			document.form1.Operacion.value="buscar";
			document.form1.submit();

		}
	function f_Siguiente(){
		var x=0;
		while(  x<<?php print($tamano);?>){
				document.form1.elements["cedula"+x].disabled=false;
				document.form1.elements["nombre1"+x].disabled=false;
				document.form1.elements["nombre2"+x].disabled=false;
				if(document.form1.elements["apellido1"+x]){
					document.form1.elements["apellido1"+x].disabled=false;
				}
				if(document.form1.elements["apellido2"+x]){
					document.form1.elements["apellido2"+x].disabled=false;	
				}				
				x++;
		}
		document.form1.Operacion.value="incluir";
		document.form1.submit();
	}
</script>
</html>
