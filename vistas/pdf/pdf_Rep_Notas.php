<?php
   setlocale(LC_ALL,"es_VE.UTF8");
   session_start();   
   require_once("../../modulos/pdf/clsFpdf.php");
   include_once("../../clases/reportes/cls_Rep_Notas.php");

   $lobjPdf=new clsFpdf();
   $lobjPdf->AliasNbPages();
   $lobjPdf->AddPage("P","Letter");
   $lobjPdf->SetMargins(30,30,30);
   $lobjPdf->SetFont("arial","B",12);
    
   $lobjConstEst= new cls_Notas();
    $cedula=$_SESSION['usuario']["Cedula"];
    $laMatriz=$lobjConstEst->fNotas($cedula);

    if (count($laMatriz)>=1) {
  
       $lobjPdf->Ln();
       $lobjPdf->Ln();
  	   $lobjPdf->SetMargins(40,30,30);
  	   $lobjPdf->Cell(0,6,utf8_decode("Notas Finales."),0,1,"C");
       $lobjPdf->Ln();
    
       $lobjPdf->Cell(145,6,utf8_decode("Estudiante."),1,1,"C");

       $lobjPdf->SetFont("arial","B",12);
       $lobjPdf->Cell(25,6,utf8_decode("Cédula"),1,0,"C");
       $lobjPdf->Cell(60,6,utf8_decode("Nombre"),1,0,"C");
       $lobjPdf->Cell(60,6,utf8_decode("Apellido"),1,1,"C");

       $lobjPdf->SetFont("arial","",12);
       $lobjPdf->Cell(25,6,utf8_decode($laMatriz[0][0]),1,0,"C");
       $lobjPdf->Cell(60,6,utf8_decode($laMatriz[0][1]),1,0,"C");
       $lobjPdf->Cell(60,6,utf8_decode($laMatriz[0][2]),1,1,"C");
       $lobjPdf->Ln();

       $lobjPdf->Cell(25,6,utf8_decode("Carrera:"),0,0,"C");
       $lobjPdf->Cell(120,6,utf8_decode($laMatriz[0][3]),0,1,"L");
       $lobjPdf->Ln();

       $lobjPdf->Cell(10,6,utf8_decode("#"),1,0,"C");
       $lobjPdf->Cell(85,6,utf8_decode("Materia"),1,0,"C");
       $lobjPdf->Cell(25,6,utf8_decode("Semestre"),1,0,"C");
       $lobjPdf->Cell(25,6,utf8_decode("Nota Final"),1,1,"C");
       $x=1;
       for ($lix=0; $lix < count($laMatriz); $lix++) { 
         $lobjPdf->SetFont("arial","",10);
         $lobjPdf->Cell(10,6,utf8_decode($x),1,0,"C");
         $lobjPdf->Cell(85,6,utf8_decode($laMatriz[$lix][4]),1,0,"C");
         $lobjPdf->Cell(25,6,utf8_decode($laMatriz[$lix][5]),1,0,"C");
         $lobjPdf->Cell(25,6,utf8_decode($laMatriz[$lix][6]),1,1,"C");
         $x++;
        }        
    }else{
       $lobjPdf->MultiCell(0,6,utf8_decode("No se Encomtraron Estudiantes"),0,"C",false);
    }

     //print_r($laMatriz);
  $lobjPdf->Output('Notas Finales','I');
?>
