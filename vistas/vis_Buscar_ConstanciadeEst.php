<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$lobj_Cuerpo->f_Redireccion();

$msg=$_GET['msg'];
?>
<html>
<head>
	<?php $lobj_Cuerpo->f_Librerias();?>
	<title>Registro</title>
</head>
<body onload="f_Inicio()">
	<?php $lobj_Cuerpo->f_Cabecera();?>
	<?php $lobj_Cuerpo->f_Menu();?>
	<div Contenedor>
        <form name="form1" action="../controladores/cor_ConstanciadeEst.php" method="POST">
        <?php $lobj_Cuerpo->f_Control($la_Campos); ?>
		<div formulario>
			<h2>Constancia de Estudios</h2>
            <fieldset>
                <legend>Buscar:</legend>
                <table>
                    <tr>
                        <td align="right"><label>Cedula:</label></td>
                        <td>
                            <select name="nac">
                                <option value="-">Seleccione</option>
                                <option value="V-">Venezolano</option>
                                <option value="E-">Extrangero</option>
                            </select>
                            <input type="text" name="Cedula" placeholder="Cédula" validar="solo numeros" />
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
    <script type="text/javascript" src="JS/Mensajes.js"></script>
    <script type="text/javascript" src="JS/motorValidaciones.js"></script>
    <script type="text/javascript" languaje="javasript">
        f=document.form1;
        function f_Inicio(){
            var mensaje="<?php print($msg); ?>";
            if(mensaje!=""){
                setTimeout(function(){f_MostrarMensaje(mensaje,"Error");},10);
            }
        }
        function enviar(){
            if(f.Cedula.value!="" && f.nac.value!="-"){
                 f.submit();
            }else{
                 alert("Debe Seleccionar Nacionalidad e Introducir su Numero de cedula ");    
            }
        }
    </script>
</html>
