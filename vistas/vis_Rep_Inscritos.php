<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/reportes/cls_Inscripcion.php");
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Ins= new cls_Inscripcion();
$matriz=$lobj_Ins->fBuscar();
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));

?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
	<script type="text/javascript" src="JS/jquery-1.8.2.js"></script>
	<script type="text/javascript">
		$(function () {

		    // Make monochrome colors and set them as default for all pies
		    Highcharts.getOptions().plotOptions.pie.colors = (function () {
		        var colors = [],
		            base = Highcharts.getOptions().colors[0],
		            i;

		        for (i = 0; i < 10; i += 1) {
		            // Start out with a darkened base color (negative brighten), and end
		            // up with a much brighter color
		            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
		        }
		        return colors;
		    }());

		    // Build the chart
		    $('#container').highcharts({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false
		        },
		        title: {
		            text: 'Hay <?php print($matriz[0]); ?> Estudiante Activos en la Extensión.'
		        },
		        tooltip: {
		            pointFormat: '{series.name} <b>:{point.percentage:.1f}%</b>'
		        },
		        plotOptions: {
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                    style: {
		                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                    }
		                }
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: ' ',
		            data: [
		                ['Inscritos ', <?php print($matriz[1]); ?>],
		                ['Sin inscribir ', <?php print($matriz[2]); ?>],
		            ]
		        }]
		    });
		});
	</script>
	<script src="JS/highcharts.js"></script>
	<script src="JS/modules/exporting.js"></script>
	<style type="text/css">
		div[tabla]{
			width: 150px;
			height: auto;
			margin: -390px 0px 0px 50px;
			position: absolute;
		}

		div[tabla] table{
			border-collapse: collapse;
		}

		div[tabla] table{
			border-collapse: collapse;
			border: 1px solid silver;

		}
		
		div[tabla] table tr td{
			border: 1px solid silver;
			border-collapse: collapse;
			border-bottom: 1px solid silver;
			color: grey;
			font-size: 12px;
		}

		div[tabla] table tr td.est{
			border-bottom: 1px solid silver;
			background: grey;
			color: white;
			text-align: center;
			font-size: 16px;
		}

		text[style="cursor:pointer;color:#909090;font-size:9px;fill:#909090;"]{
			display: none;
		}

		div[style="box-shadow: 3px 3px 10px rgb(136, 136, 136); border: 1px solid rgb(160, 160, 160); background: none repeat scroll 0% 0% rgb(255, 255, 255); padding: 5px 0px;"]{
			width: 200px;
			float: right;
			overflow: hidden;
		}

		div[style="cursor: pointer; padding: 0px 10px; background: none repeat scroll 0% 0% transparent; color: rgb(48, 48, 48); font-size: 11px;"]:hover{
			padding: 15px;
			width: auto;
		}

		input[name="enviar"]{
			margin-left: 40%;
		}
	</style>
</head>
<body >
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Reporte Estudiantes</h2>
			<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
			<div tabla>
				<table border="1">
					<tr >
						<td class="est" colspan="2">Estudiantes</td>
					</tr>
					<tr>
						<td><a href="vis_Listado_Inscritos.php">Inscritos</a></td>
						<td><?php print($matriz[1]); ?></td>
					</tr>
					<tr>
						<td>Sin Inscribir</td>
						<td><?php print($matriz[2]); ?></td>
					</tr>
					<tr>
						<td><a href="vis_Rep_Total_Estudiantes.php">Total</a></td>
						<td><?php print($matriz[0]); ?></td>
					</tr>
				</table>
			</div>
			<input type="button" name="enviar" value="Detallar por Carrera" onclick="enviar();">
		</div>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
<script type="text/javascript">
	function enviar(){
		location.href="vis_Rep_Inscritos_Carrera.php";
	}
</script>
</html>
