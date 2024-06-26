<?php
	session_start();
	$la_Campos=$_SESSION['matris'];
	//print_r($la_Campos);
	$tipo=$_GET['x'];
	header("Content-type: application/vnd.ms-$tipo");
    header("Content-Disposition: attachment; filename=Reporte-Bitacora$tipo");
    header("Pragma: no-cache");
    header("Expires: 0");
   	unset($_SESSION['matris']);
?>

<html>
<head>
	<title></title>
	<meta charset="utf-8">
</head>
<body>
	<h1><?php print("LISTADO DE ESTUDIANTES ".$la_Campos['Matriz'][1][3]); ?></h1>
	<table id="resultados">
				<tr>
					<td>N.</td>
					<td>Cédula</td>
					<td>Nombre</td>
					<td>Apellido</td>
					<td>Seccion</td>
				</tr>
				<?php 
					for ($i=1; $i <= count($la_Campos['Matriz']); $i++) { 
						echo "
							<tr>
								<td>".$i."</td>
								<td>".$la_Campos['Matriz'][$i][0]."</td>
								<td>".$la_Campos['Matriz'][$i][1]."</td>
								<td>".$la_Campos['Matriz'][$i][2]."</td>
								<td>".$la_Campos['Matriz'][$i][6]."-".$la_Campos['Matriz'][$i][5]."</td>
							</tr>
						";
					}
				?>
			</table>
</body>
</html>