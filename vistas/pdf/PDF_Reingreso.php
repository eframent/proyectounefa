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
   $Fecha= date('d/m/Y');
													
     $lobjPdf->Ln();
	   $lobjPdf->SetMargins(40,30,30);
	   $lobjPdf->Cell(0,6,utf8_decode("SOLICITUD DE REINGRESO"),0,1,"C");
	   $lobjPdf->SetFont("arial","B",10);
     $lobjPdf->Ln();
     $lobjPdf->MultiCell(0, 6, utf8_decode("DE ESTUDIANTE: ".$laMatriz[0][0]." MATRICULA: "),0,"L",false);
     $lobjPdf->MultiCell(0, 6, utf8_decode("PARA EL SECRETARIO GENERAL DE LA UNEFA"),0,"L",false);
     $lobjPdf->MultiCell(0, 6, utf8_decode("ASUNTO: REINGRESO."),0,"L",false);
     $lobjPdf->SetFont("arial","",10);
     $lobjPdf->Ln();
     $lobjPdf->MultiCell(0, 6, utf8_decode("  Tengo el agrado de dirigirme a usted, con la finalidad de solicitar formalmente".
                                            " el reingreso a esta casa de estudio donde cursaba: ".$laMatriz[0][5]." en el Término/Semestre: ".$laMatriz[0][6].
                                            " Turno: ______________."),0,"J",false);
     $lobjPdf->Ln();
     $lobjPdf->MultiCell(0, 6,utf8_decode("Dicha solicitud obedece a motivos que a continuación expongo:__________________________________________________________________".
                                          "________________________________________________________________________________________________________________________________".
                                          "_________________________________________________________________________________________________________________________________".
                                          "__________________________________________________________________________________________________________________________________".
                                          "___________________________________________________________________________."),0,"J",false);
     $lobjPdf->Cell(0,6,utf8_decode("Atentamente: ".$laMatriz[0][2]." ".$laMatriz[0][1]),0,1,"L");
     $lobjPdf->Cell(0,6,utf8_decode("Correo Electrónico: ".$laMatriz[0][4]),0,1,"L");
     $lobjPdf->Cell(0,6,utf8_decode("Telefono: ".$laMatriz[0][3]),0,1,"L");
     $lobjPdf->Ln();
     $lobjPdf->SetFont("arial","B",8);
     $lobjPdf->Cell(0,6,utf8_decode("SOLO PARA SER LLENADO POR ESTUDIANTES QUE DESEEN CAMBIO DE CARRERA:"),0,1,"L");
     $lobjPdf->SetFont("arial","",8);
     $lobjPdf->MultiCell(0, 6, utf8_decode("CARRERA: _______________________________ RÉGIMEN: ______________________"),0,"L",false);
     $lobjPdf->SetFont("arial","B",8);
     $lobjPdf->MultiCell(0, 6, utf8_decode("Solo para uso de la División de Secretaria:"),0,"L",false);
     $lobjPdf->SetFont("arial","",8);
     $lobjPdf->MultiCell(0, 6, utf8_decode("Nombre, Apellido Y Cédula de Identidad del Funcionario Receptor: ___________________________________________________________________________________________"),0,"L",false);
     $lobjPdf->MultiCell(0, 6, utf8_decode("Fecha: ".$Fecha."   Índice Académico: ________________________________________________"),0,"L",false);
     $lobjPdf->Ln();
     $lobjPdf->SetFont("arial","",8);
     $lobjPdf->MultiCell(0, 6, utf8_decode("NOTA: Anexar fotocopias del carne estudiantil o cédula de identidad y constancia de inscripción, Record Académico Original (Constancia de Notas Copia de la Matriz curricular para los CPP-Postgrado) soportes que sustente la solicitud.
Esta planilla debe ir sin enmienda, ser llenada en su totalidad."),1,"L",false);
     $lobjPdf->Output('Planila de Retiro','I');
?>
