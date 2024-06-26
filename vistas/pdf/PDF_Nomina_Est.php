<?php
   require_once("../../modulos/pdf/clsFpdf.php");
   //require_once("../../clases/cls_Solicitudes.php");
 //  session_start();
   $lobjPdf=new clsFpdf();
   $lobjPdf->AliasNbPages();
   $lobjPdf->AddPage("P","Letter");
   $lobjPdf->SetMargins(30,30,30);
   $lobjPdf->SetFont("arial","B",12);
   //$lobjConstEst= new cls_Solicitudes();
  // $buscar=$_SESSION['usuario']['Cedula'];
  // $lobjConstEst->fSetsbusqueda($buscar);
   //$laMatriz=$lobjConstEst->fBusqueda();
   $Fecha= date('d/m/Y');
													
     $lobjPdf->Ln();
	   $lobjPdf->Cell(0,6,utf8_decode("Listado de Notas"),0,1,"C");
	   $lobjPdf->SetFont("arial","B",10);
     $lobjPdf->Ln();
     $lobjPdf->Cell(20, 6, utf8_decode("Codigo:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,0,"L");
     $lobjPdf->Cell(20, 6, utf8_decode("Materia:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,0,"L");
     $lobjPdf->Cell(20, 6, utf8_decode("Creditos:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,1,"L");

     $lobjPdf->Cell(20, 6, utf8_decode("Periodo:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,0,"L");
     $lobjPdf->Cell(20, 6, utf8_decode("Carrera:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,0,"L");
     $lobjPdf->Cell(20, 6, utf8_decode("Seccion:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,1,"L");

     $lobjPdf->Cell(20, 6, utf8_decode("Pensun:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,0,"L");
     $lobjPdf->Cell(20, 6, utf8_decode("Regimen:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,0,"L");
     $lobjPdf->Cell(20, 6, utf8_decode("Semestre:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,1,"L");

     $lobjPdf->Cell(20, 6, utf8_decode("Profesor:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,0,"L");
     $lobjPdf->Cell(20, 6, utf8_decode("C.I :"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,0,"L");
     $lobjPdf->Cell(20, 6, utf8_decode("Horas:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("___________"),0,1,"L");

     $lobjPdf->Cell(20, 6, utf8_decode("Codesp:"),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("_________"),0,1,"L");
     $lobjPdf->Ln();


     $lobjPdf->Cell(131, 6, utf8_decode(""),0,0,"C");
     $lobjPdf->Cell(30, 6, utf8_decode("Notas Finales"),1,1,"C");
     $lobjPdf->Cell(131, 6, utf8_decode(""),0,0,"C");
     $lobjPdf->Cell(12, 6, utf8_decode("Teoria"),1,0,"C");
     $lobjPdf->Cell(18, 6, utf8_decode("Definitiva"),1,1,"C");
     $lobjPdf->Cell(8, 6, utf8_decode("N°"),1,0,"C");
     $lobjPdf->Cell(20, 6, utf8_decode("Cedula"),1,0,"C");
     $lobjPdf->Cell(80, 6, utf8_decode("Nombres y Pellidos"),1,0,"C");
     $lobjPdf->Cell(23, 6, utf8_decode("Condicion"),1,0,"C");
     $lobjPdf->Cell(12, 6, utf8_decode("100%"),1,0,"C");
     $lobjPdf->Cell(18, 6, utf8_decode("100%"),1,1,"C");


     $lobjPdf->Ln();
     $lobjPdf->Cell(30, 6, utf8_decode("_____________"),0,0,"L");
     $lobjPdf->Cell(75, 6, utf8_decode("Nombre:_____________________ "),0,0,"L");
     $lobjPdf->Cell(75, 6, utf8_decode("Nombre:_____________________ "),0,1,"L");
     $lobjPdf->Cell(30, 6, utf8_decode("Profesor "),0,0,"L");
     $lobjPdf->Cell(75, 6, utf8_decode("Jefe de Carrera"),0,0,"L");
     $lobjPdf->Cell(60, 6, utf8_decode("Funcionario Receptor de Secretaría"),0,1,"L");
     $lobjPdf->Cell(30, 6, utf8_decode("C.I:__________"),0,0,"L");
     $lobjPdf->Cell(75, 6, utf8_decode("C.I:_______________ "),0,0,"L");
     $lobjPdf->Cell(60, 6, utf8_decode("C.I:_______________ "),0,1,"L");
 
     $lobjPdf->Ln();
     $lobjPdf->Cell(30, 6, utf8_decode("N: Normal"),0,1,"L");
     $lobjPdf->Cell(30, 6, utf8_decode("S: Suficiencia"),0,1,"L");
     $lobjPdf->Cell(30, 6, utf8_decode("R: Reparacion"),0,1,"L");
     $lobjPdf->Cell(30, 6, utf8_decode("P: Repitencia"),0,0,"L");
     $lobjPdf->Cell(130, 6, utf8_decode("Fecha de Recepcion: ___/___/___"),0,1,"R");
     $lobjPdf->Cell(30, 6, utf8_decode("E: Equivalencia"),0,0,"L");
     $lobjPdf->Cell(130, 6, utf8_decode("Hora : __________"),0,1,"R");
     $lobjPdf->Cell(30, 6, utf8_decode("L: Paralelo Por Repitencia"),0,1,"L");
     $lobjPdf->Cell(30, 6, utf8_decode("G: Pendiente"),0,1,"L");
     $lobjPdf->Cell(30, 6, utf8_decode("I: Intensivo"),0,1,"L");
     $lobjPdf->Cell(30, 6, utf8_decode("J: Nivelacion"),0,1,"L");


     
     $lobjPdf->Output('Nomina Estudiante','I');
?>
