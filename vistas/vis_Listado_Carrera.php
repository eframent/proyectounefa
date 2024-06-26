<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
$lsSql="select * from carrera where (borrado='I') order by codesp";
$lobj_Cuerpo->f_Redireccion();
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
</head>
<body>
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
        <form name="form1" action="" method="POST">
        <?php $lobj_Cuerpo->f_Control($la_Campos); ?>
		<div formulario>
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
                        </td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td><input type="button" value="Buscar" onclick="enviar();"/></td>
                    </tr>
                </table>
            </fieldset>
		</div>
		</form>
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
    </script>
</html>
