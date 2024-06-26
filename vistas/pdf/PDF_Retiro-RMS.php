<?php
   setlocale(LC_ALL,"es_VE.UTF8");
   require_once("../../modulos/pdf/clsFpdf.php");
   require_once("../../clases/cls_Solicitudes.php");
   session_start();
   $lobjPdf=new clsFpdf();
   $lobjPdf->AliasNbPages();
   $lobjPdf->AddPage("P","Letter");
   $lobjPdf->SetMargins(30,30,30);
   $lobjPdf->SetFont("arial","B",12);
   $lobjConstEst= new cls_Solicitudes();
   $buscar=$_SESSION['usuario']['Cedula'];
   $lobjConstEst->fSetsbusqueda($buscar);
   $laMatriz=$lobjConstEst->fBusqueda();
    $Fecha=date("d/m/Y");

													
     $lobjPdf->Ln();
	   $lobjPdf->SetMargins(40,30,30);
	   $lobjPdf->Cell(0,6,utf8_decode("SOLICITUD DE RETIRO POR MOTIVO DE SERVICIOS (RMS)"),0,1,"C");
	   $lobjPdf->SetFont("arial","B",10);
     $lobjPdf->Ln();
     $lobjPdf->MultiCell(0, 6, utf8_decode("DE ESTUDIANTE: ".$laMatriz[0][0]." MATRICULA: ______________"),0,"L",false);
     $lobjPdf->MultiCell(0, 6, utf8_decode("PARA EL SECRETARIO GENERAL DE LA UNEFA"),0,"L",false);
     $lobjPdf->MultiCell(0, 6, utf8_decode("ASUNTO:  SOLICITUD DE RETIRO POR MOTIVO DE SALUD."),0,"L",false);
     $lobjPdf->SetFont("arial","",10);
     $lobjPdf->Ln();
     $lobjPdf->MultiCell(0, 6, utf8_decode("  Tengo el agrado de dirigirme a usted, con la finalidad de solicitar formalmente el retiro solicitud de retiro por motivos de Salud (RMS)."),0,"J",false);
     $lobjPdf->Ln();
     $lobjPdf->MultiCell(0, 6,utf8_decode("Dicha solicitud obedece a motivos que a continuación expongo:__________________________________________________________________".
                                          "________________________________________________________________________________________________________________________________".
                                          "_________________________________________________________________________________________________________________________________".
                                          "___________________________________________________________________________."),0,"J",false);
     $lobjPdf->Cell(0,6,utf8_decode("Atentamente: ".$laMatriz[0][2]." ".$laMatriz[0][1]),0,1,"L");
     $lobjPdf->Ln();
     $lobjPdf->SetFont("arial","",8);
     $lobjPdf->Cell(40,6,utf8_decode("Carrera o Programa:"),1,0,"L");
     $lobjPdf->Cell(55,6,utf8_decode($laMatriz[0][5]),1,0,"L");
     $lobjPdf->Cell(20,6,utf8_decode("Matricula:"),1,0,"L");
     $lobjPdf->Cell(30,6,utf8_decode(""),1,1,"L");
     $lobjPdf->Cell(40,6,utf8_decode("Período Academico:"),1,0,"L");
     $lobjPdf->Cell(55,6,utf8_decode($laMatriz[0][7]),1,0,"L");
     $lobjPdf->Cell(20,6,utf8_decode("Semestre"),1,0,"L");
     $lobjPdf->Cell(30,6,utf8_decode($laMatriz[0][6]),1,1,"L");
     $lobjPdf->Cell(40,6,utf8_decode("Núcleo:"),1,0,"L");
     $lobjPdf->Cell(55,6,utf8_decode(""),1,0,"L");
     $lobjPdf->Cell(20,6,utf8_decode("Fecha:"),1,0,"L");
     $lobjPdf->Cell(30,6,utf8_decode($Fecha),1,1,"L");
     $lobjPdf->Cell(40,6,utf8_decode("Correo Electronico:"),1,0,"L");
     $lobjPdf->Cell(55,6,utf8_decode($laMatriz[0][4]),1,0,"L");
     $lobjPdf->Cell(20,6,utf8_decode("Telefono:"),1,0,"L");
     $lobjPdf->Cell(30,6,utf8_decode($laMatriz[0][3]),1,1,"L");
     $lobjPdf->Ln();
     $lobjPdf->SetFont("arial","B",8);
     $lobjPdf->MultiCell(0, 6, utf8_decode("Solo para uso de la División de Secretaria:"),0,"L",false);
     $lobjPdf->SetFont("arial","",8);
     $lobjPdf->MultiCell(0, 6, utf8_decode("Nombre, Apellido Y Cédula de Identidad del Funcionario Receptor: ___________________________________________________________________________________________"),0,"L",false);
     $lobjPdf->MultiCell(0, 6, utf8_decode("Fecha: ".$Fecha.".   Índice Académico: ________________________________________________"),0,"L",false);
     $lobjPdf->Ln();
     $lobjPdf->SetFont("arial","",8);
     $lobjPdf->MultiCell(0, 6, utf8_decode("NOTA: Anexar fotocopias del carne estudiantil o cédula de identidad, Record Académico y constancia de inscripción e informe médico original.
Esta planilla debe ir sin enmienda, ser llenada en su totalidad."),1,"L",false);
     $lobjPdf->SetFont("arial","",10);
     $lobjPdf->Cell(146,6,utf8_decode("FORMA: PLANILLA RMS01"),0,1,"R");
     $lobjPdf->Output('Planilla de Retiro por RMS','I');
?>
