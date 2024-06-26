<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
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
		            text: 'Browser market shares at a specific website, 2014'
		        },
		        tooltip: {
		            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
		            name: 'Browser share',
		            data: [
		                ['Firefox',   45.0],
		                ['IE',       26.8],
		                {
		                    name: 'Chrome',
		                    y: 12.8,
		                    sliced: true,
		                    selected: true
		                },
		                ['Safari',    8.5],
		                ['Opera',     6.2],
		                ['Others',   0.7]
		            ]
		        }]
		    });
		});
	</script>
	<script src="JS/highcharts.js"></script>
	<script src="JS/modules/exporting.js"></script>
</head>
<body >
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Poblacion Estudiantil</h2>
			<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>

		</div>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
</html>
