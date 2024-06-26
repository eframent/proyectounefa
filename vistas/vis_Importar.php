<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
include_once("../clases/cls_Combo.php");
$lobjCombo= new cls_Combo();
$lobj_Cuerpo->f_Redireccion();
$mensaje=$_SESSION['Error'];
unset($_SESSION['Error']);
$proceso=$lobj_Cuerpo->f_Proceso("IMPORTACION CINU");
$lobj_Cuerpo->f_Redireccion(basename($_SERVER['PHP_SELF']));
?>
<html>
<head>
    <?php $lobj_Cuerpo->f_Librerias();?>
    <link rel="stylesheet" type="text/css" href="css/upload.css">
    <title>Importar Listado de Estudiantes</title>
    <style type="text/css">
        #field2{
            float: right;
            width: 45%;
            margin-top: -235px;
            transition:margin 2s;
            margin-right: -700px;
        }

        h8{
            font-size: 20px;
            color:white;
            font-weight: bold;
            border:2px solid rgb(20, 30, 143);
            border-radius: 100px;
            padding: 3px;
            background: none repeat scroll 0% 0% rgb(134, 217, 212);
        }
        p{
            transition:all 1s ;
            cursor: pointer;
            padding: 5px;
        }
        div#legendObligatorio{
            display: none !important;
        }
    </style>
</head>
<body onload="mostrar();" >
    <?php $lobj_Cuerpo->f_Cabecera();?>
    <?php $lobj_Cuerpo->f_Menu();?>
    <div Contenedor=" ">        
             <!-- FORMULARIO PARA SOICITAR LA CARGA DEL EXCEL -->
        <div formulario style="overflow:hidden;">
        <h2>Importar</h2>
        <form name="importa" method="post" action="../controladores/cor_Importar.php" enctype="multipart/form-data" >
            <fieldset style="width:40%; margin-left:30px;">
                <legend>Selecciona Archivo:</legend>
                <input id="uploadBtn" onMouseOver="over1('p1');"  onMouseOut="over2('p1')" type="file" name="excel" class="btn" /><br>
                <input type='button' onclick="validar()" name='enviar' id="inport" onMouseOver="over1('p2');"  onMouseOut="over2('p2')"  class="btn margen"   value="Importar" style="width:auto; margin-left:230px" />
                <input type="hidden" value="upload" name="action" /><br><br><br>
                
            </fieldset>
            <fieldset id="field2">
                <legend>Instrucciones</legend>
                <p id="p1" onMouseOver="document.getElementById('uploadBtn').style.boxShadow='1px 1px 5px black';" onMouseOut="document.getElementById('uploadBtn').style.boxShadow='0px 1px 3px rgba(0, 0, 0, 0.5), 0px 0px 3px rgb(31, 153, 219) inset';"><h8>1</h8> Seleccionar el Archivo a cargar teniendo en cuenta de respetar que la extensión del archivo debe ser xlsx o excel 2007 o mayor</p><br>
                <p id="p2" onMouseOver="document.getElementById('inport').style.boxShadow='1px 1px 5px black';" onMouseOut="document.getElementById('inport').style.boxShadow='0px 1px 3px rgba(0, 0, 0, 0.5), 0px 0px 3px rgb(31, 153, 219) inset';"><h8>2</h8> Presione el botón importar para continuar con la previsualización</p>
            </fieldset>
        </form><br>
        </div>
    </div>
    <?php $lobj_Cuerpo->f_Pie();?>
</body>
    <script type="text/javascript">
        proceso=<?php print($proceso); ?>;
    </script>
    <script type="text/javascript" src="JS/gestionDeProcesos.js"></script>
<script src="JS/Mensajes.js"></script>
<script type="text/javascript">

    function over1(name){
        document.getElementById(name).style.boxShadow='1px 1px 5px blue';
        document.getElementById(name).style.borderRadius='10px';
    }

    function over2(name){
        document.getElementById(name).style.boxShadow='none';
        document.getElementById(name).style.borderRadius='none';
    }

    function mostrar(){
        document.getElementById("field2").style.marginRight="20px";
    }

    <?php 
        if(isset($_GET['listo'])){
            echo'f_MostrarMensaje("Importación Realizada con éxito","Info");';
        }else if(isset($_GET['fallo'])){
            echo'f_MostrarMensaje("'.$mensaje.'","Error");';
        }
    ?>
    function validar(){
        form=document.importa;
        if(ValidarArchivo()){
            form.submit();
        }
    }
    function GetExtension(Filename) {
        var I = Filename.lastIndexOf(".");
        return (I > -1) ? Filename.substring(I + 1, Filename.length).toLowerCase() : "";
    }

    function ValidarArchivo() {
        var form = document.importa;

        var Ext = "";

        if ( form.excel.value == "")
        {
            f_MostrarMensaje("No has seleccionado ningún Archivo","Alerta");
            return false;
        }
        if (form.excel.value != "") {
            Ext = GetExtension(form.excel.value);
            if (Ext != "xlsx"){
                f_MostrarMensaje("El archivo tiene una extensión no válida","Alerta");
                return false;
            }
            else
            {
                return true; 
            }
        }
    } 
</script>