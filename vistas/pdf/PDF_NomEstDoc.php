<?php
   setlocale(LC_ALL,"es_VE.UTF8");
   session_start();   
   require_once("../../modulos/pdf/clsFpdf.php");
   include_once("../../clases/reportes/cls_Rep_Notas.php");

   $lobjPdf=new clsFpdf();
   $lobjPdf->AliasNbPages();
   $lobjPdf->AddPage("P","Letter");
   $lobjPdf->SetAutoPageBreak(1,50);
   $lobjPdf->SetMargins(30,30,30);
   $lobjPdf->SetFont("arial","B",12);
    
   $lobjConstEst= new cls_Notas();
   $pmcodigo=$_GET["codigoPM"];
   $laMatriz=$lobjConstEst->f_Nomina_Estudiantes($pmcodigo);

    if (count($laMatriz)>=1) {
       $lobjPdf->Ln();
       $lobjPdf->Ln();
  	   $lobjPdf->SetMargins(30,30,30);
       $lobjPdf->Cell(0,6,utf8_decode('Carrera: '.$laMatriz[0]['Carrera']),0,1,"L");
       $lobjPdf->SetFont("arial","",12);
       $lobjPdf->Cell(0,6,utf8_decode('Materia: '.$laMatriz[0]['Materia']),0,1,"L");
       $lobjPdf->Cell(30,6,utf8_decode('Semestre: '.$laMatriz[0]['Semestre']),0,0,"L");
       $lobjPdf->Cell(30,6,utf8_decode('Seccion: '.$laMatriz[0]['Seccion']),0,1,"L");
       $lobjPdf->Ln();
    
       $lobjPdf->SetFont("arial","B",12);
       $lobjPdf->Cell(10,6,utf8_decode("#"),1,0,"C");
       $lobjPdf->Cell(25,6,utf8_decode("Cédula"),1,0,"C");

       $lobjPdf->Cell(50,6,utf8_decode("Nombres"),1,0,"C");
       $lobjPdf->Cell(50,6,utf8_decode("Apellidos"),1,0,"C");
       $lobjPdf->Cell(20,6,utf8_decode("Nota"),1,1,"C");
       $n=1;
       for ($lix=0; $lix < count($laMatriz); $lix++) { 
         $lobjPdf->SetFont("arial","",10);
         $lobjPdf->Cell(10,6,utf8_decode($n),1,0,"C");
         $lobjPdf->Cell(25,6,utf8_decode($laMatriz[$lix]['Cedula']),1,0,"C");
         $lobjPdf->Cell(50,6,utf8_decode($laMatriz[$lix]['Nombres']),1,0,"C");
         $lobjPdf->Cell(50,6,utf8_decode($laMatriz[$lix]['Apellidos']),1,0,"C");
         $lobjPdf->Cell(20,6,utf8_decode(''),1,1,"C");
         $n++;
        }        
    }else{
       $lobjPdf->MultiCell(0,6,utf8_decode("No se Encomtraron Estudiantes"),0,"C",false);
    }
     //print_r($laMatriz);
  $lobjPdf->Output('Constancia de Estudio','I');
?>
