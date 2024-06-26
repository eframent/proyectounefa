<?php
   setlocale(LC_ALL,"es_VE.UTF8");
   session_start();   
   require_once("../../modulos/pdf/mc_table.php");

   $lobjPdf=new PDF_MC_Table();
   $lobjPdf->AliasNbPages();
   $lobjPdf->AddPage("L","Letter");
   $lobjPdf->SetAutoPageBreak(1,20);
   $lobjPdf->SetMargins(30,30,30);
   $lobjPdf->SetFont("arial","B",12);
   $la_Campos=$_SESSION['matris'];
   unset($_SESSION['matris']);

    if (count($la_Campos['elementos'])>=1) {
  
       $lobjPdf->Ln();
       $lobjPdf->Ln();
  	   $lobjPdf->SetMargins(20,20,20);
  	   $lobjPdf->Cell(0,6,utf8_decode("Reporte Bitacora de Acceso"),0,1,"C");
       $lobjPdf->SetFont("arial","",12);
       $lobjPdf->Ln();
       $lobjPdf->SetFont("arial","B",12);
       $lobjPdf->Cell(10,6,utf8_decode("Nº"),1,0,"C");
       $lobjPdf->Cell(25,6,utf8_decode("Usuario"),1,0,"C");
       $lobjPdf->Cell(30,6,utf8_decode("IP de Acceso"),1,0,"C");
       $lobjPdf->Cell(130,6,utf8_decode("Operacion"),1,0,"C");
       $lobjPdf->Cell(20,6,utf8_decode("Hora"),1,0,"C");
       $lobjPdf->Cell(25,6,utf8_decode("Fecha"),1,1,"C");
       $lobjPdf->SetWidths(array(10,25,30,130,20,25));
       $lobjPdf->SetAligns(array('C','C','C','C','C','C'));
       for ($lix=1; $lix <= count($la_Campos['elementos']); $lix++) { 
         $lobjPdf->SetFont("arial","",10);
         $lobjPdf->Row(array(utf8_decode($lix),utf8_decode($la_Campos['elementos'][$lix][0]),utf8_decode($la_Campos['elementos'][$lix][3]),utf8_decode($la_Campos['elementos'][$lix][1]),utf8_decode($la_Campos['elementos'][$lix][4]),utf8_decode($la_Campos['elementos'][$lix][2]))); 
        }        
      }else{
        $lobjPdf->MultiCell(0,6,utf8_decode("No se Encomtraron Datos Para Imprimir"),0,"C",false);
      }
     //print_r($laelementos);
  $lobjPdf->Output('Reporte Bitacora','I');
?>
