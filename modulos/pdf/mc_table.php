<?php
require('fpdf.php');

class PDF_MC_Table extends FPDF
{
	
	public function Header()
		{
			
			$this->SetY(20);
			//Logo
						//Logo
			$this->Image('../../vistas/imagenes/logo_unefa.gif',20,18,15);
			
			//Arial bold Italica 12
    			$this->SetFont('Arial','I',10);
    		//Título
    			$this->Cell(0,5,utf8_decode('REPUBLICA BOLIVARIANA DE VENEZUELA'),0,1,'C');
    			$this->Cell(0,5,utf8_decode('MINISTERIO DEL PODER POPULAR PARA LA DEFENSA'),0,1,'C');
    			$this->Cell(0,5,utf8_decode('UNIVERSIDAD NACIONAL EXPERIMENTAL POLITECNICA'),0,1,'C');
    			$this->Cell(0,5,utf8_decode('DE LA FUERZA ARMADA'),0,1,'C');
    			$this->Cell(0,5,utf8_decode('NÚCLEO PORTUGUESA'),0,1,'C');
				

			$this->SetY(50);
						
		}
		
var $widths;
var $aligns;

function SetWidths($w)
{
	//Set the array of column widths
	$this->widths=$w;
}

function SetAligns($a)
{
	//Set the array of column alignments
	$this->aligns=$a;
}

function Row($data)
{
	//Calculate the height of the row
	$nb=0;
	for($i=0;$i<count($data);$i++)
		$nb=max($nb,$this->NbLines($this->widths[$i],$data[$i]));
	$h=5*$nb;
	//Issue a page break first if needed
	$this->CheckPageBreak($h);
	//Draw the cells of the row
	for($i=0;$i<count($data);$i++)
	{
		$w=$this->widths[$i];
		$a=isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
		//Save the current position
		$x=$this->GetX();
		$y=$this->GetY();
		//Draw the border
		$this->Rect($x,$y,$w,$h);
		//Print the text
		$this->MultiCell($w,5,$data[$i],0,$a);
		//Put the position to the right of the cell
		$this->SetXY($x+$w,$y);
	}
	//Go to the next line
	$this->Ln($h);
}

function CheckPageBreak($h)
{
	//If the height h would cause an overflow, add a new page immediately
	if($this->GetY()+$h>$this->PageBreakTrigger)
		$this->AddPage($this->CurOrientation);
}

function NbLines($w,$txt)
{
	//Computes the number of lines a MultiCell of width w will take
	$cw=&$this->CurrentFont['cw'];
	if($w==0)
		$w=$this->w-$this->rMargin-$this->x;
	$wmax=($w-2*$this->cMargin)*1000/$this->FontSize;
	$s=str_replace("\r",'',$txt);
	$nb=strlen($s);
	if($nb>0 and $s[$nb-1]=="\n")
		$nb--;
	$sep=-1;
	$i=0;
	$j=0;
	$l=0;
	$nl=1;
	while($i<$nb)
	{
		$c=$s[$i];
		if($c=="\n")
		{
			$i++;
			$sep=-1;
			$j=$i;
			$l=0;
			$nl++;
			continue;
		}
		if($c==' ')
			$sep=$i;
		$l+=$cw[$c];
		if($l>$wmax)
		{
			if($sep==-1)
			{
				if($i==$j)
					$i++;
			}
			else
				$i=$sep+1;
			$sep=-1;
			$j=$i;
			$l=0;
			$nl++;
		}
		else
			$i++;
	}
	return $nl;
}

//Pie de página
		public function Footer()
		{
			
			//Posición: a 2 cm del final
			$this->SetY(-50);
			//Arial italic 8
			$this->SetFont("Arial","I",6);
			//Dirección
			$this->Cell(30,6,utf8_decode("_____________________________"),0,0,"C");
			$this->Cell(50,6,utf8_decode(" "),0,0,"L");
			$this->Cell(30,6,utf8_decode("_____________________________"),0,0,"C");
			$this->Cell(50,6,utf8_decode(" "),0,0,"L");
			$this->Cell(30,6,utf8_decode("_____________________________"),0,1,"C");
			$this->Cell(30,6,utf8_decode("COORDINADOR(A) DE PLANIFICACION"),0,0,"C");
			$this->Cell(50,6,utf8_decode(" "),0,0,"L");
			$this->Cell(30,6,utf8_decode("SELLO"),0,0,"C");
			$this->Cell(50,6,utf8_decode(" "),0,0,"L");
			$this->Cell(30,6,utf8_decode("JEFE ACADEMICO"),0,1,"C");
			
			$this->Ln();
			$this->Cell(0,5,utf8_decode("Carretera Nacional Vía Payara Sector Piedritas Blancas Edificio Pozo Blanco. Acarigua - Portuguesa"),0,1,"C");
			//Número de página
			$this->Cell(0,5,utf8_decode("Página ").$this->PageNo()."/{nb}",0,1,"C");
			//Fecha
			$lcFecha=date("d/m/Y");
			$this->Cell(0,3,$lcFecha,0,0,"C");
		}

}
?>
