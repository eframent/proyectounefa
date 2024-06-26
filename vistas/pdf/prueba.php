<?php 
include_once("../../modulos/pdf/pdfhtml.php");

$html = 'Ahora puede imprimir fácilmente texto mezclando diferentes estilos: <b>negrita</b>, <i>itálica</i>,
<u>subrayado</u>, o ¡ <b><i><u>todos a la vez</u></i></b>!<br><br>También puede incluir enlaces en el
texto, como <a href="http://www.fpdf.org">www.fpdf.org</a>, o en una imagen: pulse en el logotipo.';

$pdf = new PDF();
// Primera página
$pdf->AddPage();
$pdf->SetFont('Arial','',20);
$pdf->Write(5,'Para saber qué hay de nuevo en este tutorial, pulse ');
$pdf->SetFont('','U');
$link = $pdf->AddLink();
$pdf->Write(5,'aquí',$link);
$pdf->SetFont('');
// Segunda página
$pdf->AddPage();
$pdf->SetLink($link);
$pdf->SetLeftMargin(45);
$pdf->SetFontSize(14);
$pdf->WriteHTML($html);
$pdf->Output();
?>