<?php
   setlocale(LC_ALL,"es_VE.UTF8");
   session_start();   
   require_once("../../modulos/pdf/clsFpdf.php");
   require_once("../../clases/cls_ConstanciadeEst.php");

   $lobjPdf=new clsFpdf();
   $lobjPdf->AliasNbPages();
   $lobjPdf->AddPage("P","Letter");
   $lobjPdf->SetMargins(30,30,30);
   $lobjPdf->SetFont("arial","B",12);
    
   $lobjConstEst= new cls_ConstanciadeEst();
   $buscar=$_SESSION['reporte'];
   unset($_SESSION['reporte']);
   $lobjConstEst->fSetsbusqueda($buscar);
    $laMatriz=$lobjConstEst->fBusqueda();

      $mes=date("F");
			if ($mes=="January") $mes="Enero";
			if ($mes=="February") $mes="Febrero";
			if ($mes=="March") $mes="Marzo";
			if ($mes=="April") $mes="Abril";
			if ($mes=="May") $mes="Mayo";
			if ($mes=="June") $mes="Junio";
			if ($mes=="July") $mes="Julio";
			if ($mes=="August") $mes="Agosto";
			if ($mes=="September") $mes="Setiembre";
			if ($mes=="October") $mes="Octubre";
			if ($mes=="November") $mes="Noviembre";
			if ($mes=="December") $mes="Diciembre";
            
            $dia=date("d");
            if($dia<=9){
             $dia="al ".$dia." de ";   
            }else{
              $dia="a los ".$dia." dias de ";  
            }

     $lobjPdf->Ln();
     $lobjPdf->Ln();

     if (count($laMatriz)<1) {
     $lobjPdf->Ln(50);
     $lobjPdf->SetFont("arial","",20);
       $lobjPdf->MultiCell(0, 12, utf8_decode("Actualmente no podemos accesar a su Constancia de Estudios por favor comuniquese con el departamento de Control de Estudios"),0,"J",false);
     }else{
	   $lobjPdf->SetMargins(40,30,30);
	   $lobjPdf->Cell(0,6,utf8_decode("CONSTANCIA DE ESTUDIOS"),0,1,"C");
	   $lobjPdf->SetFont("arial","",10);
     $lobjPdf->Ln();
     $lobjPdf->Ln();
     $lobjPdf->MultiCell(0, 6, utf8_decode("        Quien Suscribe, TENIENTE CORONEL NÚCLEO PORTUGUESA MANUEL OMAR GONZÁLEZ BOSCÁN Decano del de la Universidad Nacional Experimental Politécnica de la Fuerza Armada, hace constar que el(la) ciudadano(a): ".$laMatriz[0][1]." ".$laMatriz[0][2]." ".$laMatriz[0][3]." ".$laMatriz[0][4].
                                        ", titular de la Cédula de Identidad Nº: ".$laMatriz[0][0].", es alumno(a) regular de esta Universidad y actualmente se encuentra cursando el semestre: ".$laMatriz[0][5].", en la carrera: ".$laMatriz[0][6].".

        Constancia que se expide a petición de la parte interesada en TURÉN ".$dia." ". $mes." del año ".date('Y')."."),0,"J",false);
     
     $lobjPdf->Ln();
     $lobjPdf->Ln();
     $lobjPdf->Ln();
     $lobjPdf->Ln();
     $lobjPdf->SetFont("arial","B",10);
     $lobjPdf->Cell(70,6,utf8_decode(""),0,0,"L");
     $lobjPdf->Cell(75,6,utf8_decode("___________________________________"),0,1,"C");
     $lobjPdf->Cell(70,6,utf8_decode(""),0,0,"L");
     $lobjPdf->Cell(75,6,utf8_decode("MANUEL OMAR GONZÁLEZ BOSCÁN"),0,1,"C");
     $lobjPdf->Cell(70,6,utf8_decode(""),0,0,"L");
     $lobjPdf->Cell(75,6,utf8_decode("TENIENTE CORONEL"),0,1,"C");
     $lobjPdf->Cell(70,6,utf8_decode(""),0,0,"L");
     $lobjPdf->Cell(75,6,utf8_decode("DECANO (E)"),0,1,"C");
     $lobjPdf->Ln();
     $lobjPdf->Ln();
     $lobjPdf->Ln();
     $lobjPdf->Ln();
     $lobjPdf->Cell(70,6,utf8_decode("Válido por tres(3) meses"),0,0,"L");
     $lobjPdf->Ln();
     $lobjPdf->Ln();
     $lobjPdf->SetFont("arial","",10);
     $lobjPdf->Cell(70,6,utf8_decode("MOGB/ASMG/JLJG/jdsa"),0,1,"L");
     $lobjPdf->SetFont("arial","B",10);
     $lobjPdf->Cell(70,6,utf8_decode("FORMA: CONSTAN8"),0,0,"L");
    }
    $lobjPdf->Output('Constancia de Estudio','I');

?>


