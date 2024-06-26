<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
include_once("../clases/reportes/cls_Inscripcion.php");
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Ins= new cls_Inscripcion();
$matriz=$lobj_Ins->fInscritos_Carrera();
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
$lsSql="select * from carrera where (borrado='I') and nombre!='Generico' order by codesp";
//$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
//print('<pre>');
//print_r($matriz);
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
		            text: 'Detalle de Estudiantes Inscritos por Carrera.'
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
		                ['<?php print($matriz[0][0]); ?>', <?php print($matriz[0][1]); ?>],
		                ['<?php print($matriz[1][0]); ?>', <?php print($matriz[1][1]); ?>],
		                ['<?php print($matriz[2][0]); ?>', <?php print($matriz[2][1]); ?>],
		                ['<?php print($matriz[3][0]); ?>', <?php print($matriz[3][1]); ?>],
		                ['<?php print($matriz[4][0]); ?>', <?php print($matriz[4][1]); ?>],
		                ['<?php print($matriz[5][0]); ?>', <?php print($matriz[5][1]); ?>],
		            ]
		        }]
		    });
		});
	</script>
	<script src="JS/highcharts.js"></script>
	<script src="JS/modules/exporting.js"></script>
	<style type="text/css">
		div[tabla]{
			width: 350px;
			height: auto;
			margin: -390px 0px 0px 20px;
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

		div#legendObligatorio{
			display: none;
		}

		div[formulario]{
			margin-top: 20px;
		}

		form{height: 0px;overflow: hidden;transition:all 0.5s;}

		input[value='Listado de estudiantes por carrera']{
			margin-left: 40%;
			transition:all 0.5s;
		}

		legend{
			font-size: 12px;
		}

		form h2{
			font-size: 14px;
			height: auto;
		}

		input[value='X']{
			float: right;
			margin-top: -25px;
			padding: 3px;
		}

		#cerrar{
			margin-left: -40px !important;
			display: none;
		}
	</style>
</head>
<body >
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
		<div formulario>
			<h2>Reporte Estudiantes</h2>
			<div id="container" style="min-width: 310px; height: 400px; max-width: 700px; margin: 0 auto;margin-left:350px"></div>
			<div tabla>
				<table border="1">
					<tr >
						<td class="est" colspan="2">Estudiantes Inscritos</td>
					</tr>
					<tr>
						<td>Carrera</td>
						<td>Total</td>
					</tr>
					<?php 
						for ($i=0; $i < count($matriz); $i++) { 
							echo "
							<tr>
								<td>".$matriz[$i][0]."</td>
								<td>".$matriz[$i][1]."</td>
							</td>
							";
						}
					?>
				</table>
			</div>
			<input type="button" id="buscar" name="buscar" value='Listado de estudiantes por carrera' onclick="buscar();">
	        <input type="button" id="cerrar" value='X' onclick='cerrar()'>

			 <form id='form' name="form1" action="" method="POST">
	        <?php $lobj_Cuerpo->f_Control($la_Campos); ?>
				<h2>Listado de estudiantes por carrera</h2>
	            <fieldset>
	                <legend>Buscar:</legend>

	                <table>
	                    <tr>
	                        <td align="right"><label>Carrera:</label></td>
	                        <td>
	                            <select  name="carrera">
	                                <option value="-" selected="selected">Seleccione una Carrera</option>
	                                <?php $lobjCombo->fGenerar($lsSql,"nombre","nombre",$la_Campos['Carrera'],"")?>
	                            </select>
	                      		<input type="button" value="Buscar" onclick="enviar();"/>
	                      	</td>
	                    </tr>
	                </table>
	            </fieldset>
			</form>
			</div>
		</div>
	</div>
	<?php $lobj_Cuerpo->f_Pie();?>
</body>
 <script type="text/javascript" languaje="javasript">
        f=document.form1;
        function enviar(){
         var carrera=f.carrera.value;
            if(f.carrera.value!="-"){
                window.location=("pdf/PDF_Lista_carrera.php?buscar="+carrera);   
            }else{
                 alert("Debe Seleccionar una Carrera ");    
            }
        }

        function buscar(){
        	document.getElementById('form').style.height='200px';
        	document.getElementById('buscar').style.display='none';
        	document.getElementById('cerrar').style.display='block';
        }

        function cerrar(){
        	document.getElementById('buscar').style.display='block';
        	document.getElementById('form').style.height='0px';
        	document.getElementById('cerrar').style.display='none';
        }
    </script>
</html>
