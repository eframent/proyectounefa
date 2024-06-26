<?php
    session_start();
    extract($_POST);
    if ($action == "upload") {{}
        //cargamos el archivo al servidor con el mismo nombre
        //solo le agregue el sufijo bak_ 
        $archivo = $_FILES['excel']['name'];
        $tipo = $_FILES['excel']['type'];
        if($tipo=="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"){
            $destino = "bak_" . $archivo;
            if (copy($_FILES['excel']['tmp_name'], $destino)){
               $mensaje="Archivo Cargado Con Éxito";
               if (file_exists("bak_" . $archivo)) {
                   /** Clases necesarias */
                   require_once('../modulos/PHPExcel/PHPExcel.php');
                   require_once('../modulos/PHPExcel//PHPExcel/Reader/Excel2007.php');
                   // Cargando la hoja de cálculo
                   $objReader = new PHPExcel_Reader_Excel2007();
                   $objPHPExcel = $objReader->load("bak_" . $archivo);
                   $objFecha = new PHPExcel_Shared_Date();
                   // Asignar hoja de excel activa
                   $objPHPExcel->setActiveSheetIndex(0);
                   //conectamos con la base de datos 
                   // Llenamos el arreglo con los datos  del archivo xlsx
                   $i=2;
                   while($objPHPExcel->getActiveSheet()->getCell('A' . $i)->getCalculatedValue()!=""){
                       $_DATOS_EXCEL[$i]['Rusnies'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('A' . $i)->getCalculatedValue());
                       $_DATOS_EXCEL[$i]['Cedula'] = $objPHPExcel->getActiveSheet()->getCell('B' . $i)->getCalculatedValue();
                       $_DATOS_EXCEL[$i]['Nombres'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('C' . $i)->getCalculatedValue());
                       $_DATOS_EXCEL[$i]['RamaE'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('D' . $i)->getCalculatedValue());
                       $_DATOS_EXCEL[$i]['Grado'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('E' . $i)->getCalculatedValue());
                       $_DATOS_EXCEL[$i]['IA'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('F' . $i)->getCalculatedValue());
                       $_DATOS_EXCEL[$i]['Telefonos'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('G' . $i)->getCalculatedValue());
                       $_DATOS_EXCEL[$i]['Correo'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('H' . $i)->getCalculatedValue());
                       $_DATOS_EXCEL[$i]['Prom'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('I' . $i)->getCalculatedValue());
                       $_DATOS_EXCEL[$i]['Pos'] = strtoupper($objPHPExcel->getActiveSheet()->getCell('J' . $i)->getCalculatedValue());
                       $i++;
                   }
               }
               //si por algo no cargo el archivo bak_ 
               else {
                   echo "Necesitas primero importar el archivo";
               }
            }
            else{
                $mensaje="Error Al Cargar el Archivo";
            }
        }else{
            $mensaje="Error Al Cargar el Archivo, Extension de Archivo Incorrecto(xlsx)";
        }
        $_SESSION['Importacion']['STATUS']=$mensaje;
        if($mensaje=="Archivo Cargado Con Éxito"){
            $_SESSION['Importacion']['DATA']=$_DATOS_EXCEL;
        }
        unlink($destino);
        header("location: ../vistas/vis_Previ.php");
    }
    ?>