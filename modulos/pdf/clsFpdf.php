<?php

	require_once("fpdf.php");
	class clsFpdf extends FPDF
	{
		//Cabecera de página
		public function Header()
		{
			
			$this->SetY(20);
			//Logo
						//Logo
			$this->Image('../../vistas/imagenes/logo_unefa.gif',42,18,15);
			
			//Arial bold Italica 12
    			$this->SetFont('Arial','',10);
    		//Título
    			$this->Cell(0,5,utf8_decode('REPUBLICA BOLIVARIANA DE VENEZUELA'),0,1,'C');
    			$this->Cell(0,5,utf8_decode('MINISTERIO DEL PODER POPULAR PARA LA DEFENSA'),0,1,'C');
    			$this->Cell(0,5,utf8_decode('UNIVERSIDAD NACIONAL EXPERIMENTAL POLITECNICA'),0,1,'C');
    			$this->Cell(0,5,utf8_decode('DE LA FUERZA ARMADA NACIONAL'),0,1,'C');
    			$this->Cell(0,5,utf8_decode('NÚCLEO PORTUGUESA'),0,1,'C');
				

			$this->SetY(50);
						
		}

		//Pie de página
		public function Footer()
		{
			
			//Posición: a 2 cm del final
			$this->SetY(-20);
			//Arial italic 8
			$this->SetFont("Arial","I",6);
			//Dirección
			$this->Cell(0,5,utf8_decode("Carretera Nacional Vía Payara Sector Piedritas Blancas Edificio Pozo Blanco. Acarigua - Portuguesa"),0,1,"C");
			//Número de página
			$this->Cell(127,5,utf8_decode("Página ").$this->PageNo()."/{nb}".$lcFecha,0,0,"R");
			//Fecha
			$lcFecha=date("d/m/Y");
			$this->Cell(20,5,"Fecha: ".$lcFecha,0,0,"L");
		}
	}
?>
