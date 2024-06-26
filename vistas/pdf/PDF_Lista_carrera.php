<?php
   setlocale(LC_ALL,"es_VE.UTF8");
   session_start();   
   require_once("../../modulos/pdf/clsFpdf.php");
   require_once("../../clases/cls_Lista_Carrera.php");

   $lobjPdf=new clsFpdf();
   $lobjPdf->AliasNbPages();
   $lobjPdf->AddPage("P","Letter");
   $lobjPdf->SetAutoPageBreak(1,50);
   $lobjPdf->SetMargins(30,30,30);
   $lobjPdf->SetFont("arial","B",12);
    
   $lobjConstEst= new cls_Carrera();
    $buscar=$_GET["buscar"];
   $lobjConstEst->fSetsbusqueda($buscar);
    $laMatriz=$lobjConstEst->fBusqueda();

    if (count($laMatriz)>=1) {
  
       $lobjPdf->Ln();
       $lobjPdf->Ln();
  	   $lobjPdf->SetMargins(30,30,30);
  	   $lobjPdf->Cell(0,6,utf8_decode("LISTADO DE ESTUDIANTES ".$laMatriz[0][5]),0,1,"C");
       $lobjPdf->Ln();
    
       $lobjPdf->SetFont("arial","B",12);
       $lobjPdf->Cell(10,6,utf8_decode("#"),1,0,"C");
       $lobjPdf->Cell(25,6,utf8_decode("Cédula"),1,0,"C");
       $lobjPdf->Cell(60,6,utf8_decode("Nombres"),1,0,"C");
       $lobjPdf->Cell(60,6,utf8_decode("Apellidos"),1,1,"C");
       $n=1;
       for ($lix=0; $lix < count($laMatriz); $lix++) { 
         $lobjPdf->SetFont("arial","",10);
         $lobjPdf->Cell(10,6,utf8_decode($n),1,0,"C");
         $lobjPdf->Cell(25,6,utf8_decode($laMatriz[$lix][0]),1,0,"C");
         $lobjPdf->Cell(60,6,utf8_decode($laMatriz[$lix][1]." ".$laMatriz[$lix][2]),1,0,"C");
         $lobjPdf->Cell(60,6,utf8_decode($laMatriz[$lix][3]." ".$laMatriz[$lix][4]),1,1,"C");
         $n++;
        }        
    }else{
       $lobjPdf->MultiCell(0,6,utf8_decode("No se Encomtraron Estudiantes"),0,"C",false);
    }
     //print_r($laMatriz);
  $lobjPdf->Output('Constancia de Estudio','I');
?>
