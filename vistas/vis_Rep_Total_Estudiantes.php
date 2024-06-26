<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/reportes/cls_Inscripcion.php");
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Ins= new cls_Inscripcion();
$matriz=$lobj_Ins->fListar_Total();
//$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Listado Estudiantes Inscritos</title>
	<style type="text/css">
		div#legendObligatorio{
			display: none;
		}

		div[formulario]{
			margin-top: 10px;
		}

		table{
			width: 95%;
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
			background: grey;
			color: white;
		}

		thead{
			background: grey;
			color: white;
			text-indent: 10px;
			height: 50px;
		}


	</style>
</head>
<body >
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Listado total de estudiantes activos</h2>
			<table>
				<thead>
					<td>Nº</td>
					<td>Cédula</td>
					<td>Nombre</td>
					<td>Apellido</td>
					<td>Sexo</td>
					<td>Telefono</td>
					<td>E-mail</td>
				</thead>
			<?php 
				$x=1;
				for ($i=0; $i < count($matriz); $i++) { 
					echo "
						<tr>
							<td>".$x."</td>
							<td>".$matriz[$i][0]."</td>
							<td>".$matriz[$i][1]."</td>
							<td>".$matriz[$i][2]."</td>
							<td>".$matriz[$i][3]."</td>
							<td>".$matriz[$i][4]."</td>
							<td>".$matriz[$i][5]."</td>
						</tr>
					";
					$x++;
				}
			 ?>
			</table>
		</div>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
</html>
