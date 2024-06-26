<?php
   setlocale(LC_ALL,"es_VE.UTF8");
   session_start();   
   require_once("../../modulos/pdf/mc_table.php");

   $lobjPdf=new PDF_MC_Table();
   $lobjPdf->AliasNbPages();
   $lobjPdf->AddPage("P","Letter");
   $lobjPdf->SetAutoPageBreak(1,20);
   $lobjPdf->SetMargins(30,30,30);
   $lobjPdf->SetFont("arial","B",12);
   $la_Campos=$_SESSION['matris'];
   //unset($_SESSION['matris']);

    if (count($la_Campos['Matriz'])>=1) {
  
       $lobjPdf->Ln();
       $lobjPdf->Ln();
  	   $lobjPdf->SetMargins(20,20,20);
  	   $lobjPdf->Cell(0,6,utf8_decode("LISTADO DE ESTUDIANTES ".$la_Campos['Matriz'][1][3]),0,1,"C");
       $lobjPdf->SetFont("arial","",12);
       $lobjPdf->Ln();
       $lobjPdf->SetFont("arial","B",12);
       $lobjPdf->Cell(10,6,utf8_decode("Nº"),1,0,"C");
       $lobjPdf->Cell(25,6,utf8_decode("Cédula"),1,0,"C");
       $lobjPdf->Cell(30,6,utf8_decode("Nombre"),1,0,"C");
       $lobjPdf->Cell(30,6,utf8_decode("Apellido"),1,0,"C");
       $lobjPdf->Cell(80,6,utf8_decode("Seccion"),1,1,"C");
       $lobjPdf->SetWidths(array(10,25,30,30,80));
       $lobjPdf->SetAligns(array('C','C','C','C','C'));
       for ($lix=1; $lix <= count($la_Campos['Matriz']); $lix++) { 
         $lobjPdf->SetFont("arial","",10);
         $lobjPdf->Row(array(utf8_decode($lix),utf8_decode($la_Campos['Matriz'][$lix][0]),utf8_decode($la_Campos['Matriz'][$lix][1]),utf8_decode($la_Campos['Matriz'][$lix][2]),utf8_decode($la_Campos['Matriz'][$lix][6].' - '.$la_Campos['Matriz'][$lix][5]))); 
        }        
      }else{
        $lobjPdf->MultiCell(0,6,utf8_decode("No se Encomtraron Estudiantes Inscritos en esta Carrera"),0,"C",false);
      }
     //print_r($laMatriz);
  $lobjPdf->Output('Listado de estudiantes por carrera y semestre','I');
?>
