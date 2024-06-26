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
	<h1>Reporte Bitacora de Acceso</h1>
	<table id="resultados">
				<tr>
					<td>N.</td>
					<td>Usuario</td>
					<td>IP de Acceso</td>
					<td>Operacion</td>
					<td>Fecha</td>
					<td>Hora</td>
				</tr>
				<?php 
					for ($i=1; $i <= count($la_Campos['elementos']); $i++) { 
						echo "
							<tr>
								<td>".$i."</td>
								<td>".$la_Campos['elementos'][$i][0]."</td>
								<td>".$la_Campos['elementos'][$i][3]."</td>
								<td><div op>".$la_Campos['elementos'][$i][1]."</div></td>
								<td>".$la_Campos['elementos'][$i][2]."</td>
								<td>".$la_Campos['elementos'][$i][4]."</td>
							</tr>
						";
					}
				?>
			</table>
</body>
</html>