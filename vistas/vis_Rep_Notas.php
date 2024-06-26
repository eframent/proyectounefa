<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/reportes/cls_Rep_Notas.php");
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Nota= new cls_Notas();
$cedula=$_SESSION['usuario']['Cedula'];
$laMatriz=$lobj_Nota->fNotas($cedula);
//$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
//print('<pre>');
//print($_SESSION['usuario']['Cedula']);
//print('</pre>');

?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<style type="text/css">
		div#legendObligatorio{
			display: none;
		}

		div[formulario]{
			margin: 20px auto;
		}

		table.datos{
			width: 80%;
			margin: 0px auto;
			border:1px solid silver;
		}

		table{
			width: 80%;
			border-collapse: collapse;
			margin-bottom: 20px;
			border: 1px solid silver;
		}

		table tr{
			height: 30px;
		}

		tr:nth-child(even){
			background: silver;
		}

		tr:hover{
			cursor: pointer;
			background: rgb(52, 152, 219);
			color: white;
		}

		thead{
			background: grey;
			color: white;
			text-indent: 10px;
			height: 50px;
		}

		.icon-print{
			float: right;
			margin-right: 10px;
			cursor: pointer;
		}

		.cab-est{
			background: rgb(41, 56, 140);
			color: white;
		}

	</style>
</head>
<body onload="cargar(<?php if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Notas Finales <?php print($laMatriz[0][3]);?> <i onclick="imprimir();" class="icon32 icon-white icon-print"></i></h2>
			<table class="datos">
				<tr class="cab-est">
					<td colspan="3" align="center">Datos Estudiante.</td>
				</tr>
				<tr>
					<td>Cédula</td>
					<td>Nombre</td>
					<td>Aplellido</td>
				</tr>
				<?php
					echo "
					<tr>
						<td>".$laMatriz[0][0]."</td>
						<td>".$laMatriz[0][1]."</td>
						<td>".$laMatriz[0][2]."</td>
					</tr>
					";
				?>
			</table>
			<br>
			<table>
				<thead>
					<td align='center'>Nº</td>
					<td>Materia</td>
					<td align='center'>Semestre</td>
					<td align='center'>Nota Final</td>
				</thead>
			<?php 
				$x=1;
				for ($i=0; $i < count($laMatriz); $i++) { 
					echo "
						<tr>
							<td align='center'>".$x."</td>
							<td>".$laMatriz[$i][4]."</td>
							<td align='center'>".$laMatriz[$i][5]."</td>
							<td align='center'>".$laMatriz[$i][6]."</td>
						</tr>
					";
					$x++;
				}
			 ?>
			</table>
		
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script type="text/javascript">
	function imprimir(){
		location.href="pdf/pdf_Rep_Notas.php"
	}
</script>
</html>
