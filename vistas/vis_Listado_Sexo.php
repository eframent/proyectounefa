<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
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
			<h2>Constancia de Estudios</h2>
            <fieldset>
                <legend>Buscar:</legend>
                <table>
                    <tr>
                        <td align="right"><label>Sexo:</label></td>
                        <td>
                            <select name="sexo">
                                <option value="-">Seleccione</option>
                                <option value="M">Masculino</option>
                                <option value="F">Femenino</option>
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
         var sexo=f.sexo.value;
            if(f.sexo.value!="-"){
                window.location=("pdf/PDF_Lista_Sexo.php?buscar="+sexo);   
            }else{
                 alert("Debe Seleccionar Nacionalidad e Introducir su cedula ");    
            }
        }
    </script>
</html>
