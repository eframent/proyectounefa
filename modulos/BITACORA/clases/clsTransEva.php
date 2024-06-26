<?php
   /*
   *      clsevaluacion.php
   *      
   *      Copyright 2012 José Baldomero Silva Hernández <jobasiher@cantv.net>
   *      
   *      Este programa es software libre, puede redistribuirlo y / o modificar
   *      Bajo los términos de la GNU Licensia Pública General(GPL) publicada por
   *      La Fundación de Software Libre(FSF), bien de la versión 2 o cualquier versión posterior.
   *      
   *      Este programa se distribuye con la esperanza de que sea útil,
   *      Pero SIN NINGUNA GARANTÍA, incluso sin la garantía implícita de
   *      COMERCIALIZACIÓN o IDONEIDAD PARA UN PROPÓSITO PARTICULAR.
   */
	require_once("cls_Docente.php");
	class clsTransEva extends cls_Bitacora
	{
		private $aiNumero;
		private $asCedula;
		private $asTipo;
		private $asNombre;
		private $asApellido;
		private $asCurso;
	    private $asCarrera;
	    private $asSemestre;
	    private $asMateria;
		private $asFechaeva;
		private $asHoraeva;
		private $aaDetalle;
		private $aaDetalleNota;
   	    private $aiFilas;
   	    private $aiContador;
		
		public function __construct()
		{
			$this->aiNumero=0;
			$this->asTipo="";
			$this->asCedula="";
			$this->asCurso="";
			$this->asCarrera="";
			$this->asSemestre="";
			$this->asMateria="";
			$this->asFechaeva="";
			$this->asHoraeva="";
			$this->aiFilas="";
		    $this->aiContador=0;
		    $this->aaDetalle=array();
		    $this->aaDetalleNota=array();
		}
		
		public function __destruct()
		{
		}
		
		public function fSetiNumero($piNumero)
		{
			$this->aiNumero=$piNumero;
		}
		
		public function fSetsFilas($psFilas)
		{
			$this->aiFilas=$psFilas;
		}
		
		public function fSetsCurso($psCurso)
		{
			$this->asCurso=$psCurso;
		}
		
		public function fSetsCarrera($psCarrera)
		{
			$this->asCarrera=$psCarrera;
		}
		
		public function fSetsCedula($psCedula)
		{
			$this->asCedula=$psCedula;
		}
		
		public function fSetsSemestre($psSemestre)
		{
			$this->asSemestre=$psSemestre;
		}
		
		public function fSetsMateria($psMateria)
		{
			$this->asMateria=$psMateria;
		}
		
		public function fSetsFechaeva($psFechaeva)
		{
			$this->asFechaeva=$psFechaeva;
		}
		
		public function fSetsHoraeva($psHoraeva)
		{
			$this->asHoraeva=$psHoraeva;
		}
		
		public function fSetsTipo($psTipo)
		{
			$this->asTipo=$psTipo;
		}
		
		public function fSetaDetalle($paDetalle)
	    {
		   $this->aaDetalle=$paDetalle;
	    }
	    
		public function fGetiNumero()
		{
			return $this->aiNumero;
		}
		
		public function fGetsCedula()
		{
			return $this->asCedula;
		}
		
		public function fGetsCurso()
		{
			return $this->asCurso;
		}
		
		public function fGetsCarrera()
		{
			return $this->asCarrera;
		}
		
		public function fGetsSemestre()
		{
			return $this->asSemestre;
		}
		
		public function fGetsMateria()
		{
			return $this->asMateria;
		}
		
		public function fGetsNombre()
		{
			return $this->asNombre;
		}
		
		public function fGetsApellido()
		{
			return $this->asApellido;
		}
		
		public function fGetsFechaeva()
		{
			return $this->asFechaeva;
		}
		
		public function fGetsHoraeva()
		{
			return $this->asHoraeva;
		}
		
		public function fGetaDetalle()
	    {
	  	   return $this->aaDetalle;
	    }
	    
		public function fGetaDetalleNota()
	    {
	  	   return $this->aaDetalleNota;
	    }
	    
	    public function fGetiFilas()
		{
			return $this->aiFilas;
		}
	    
		public function fBuscar()
		{
			$lbEnc=false;
			$lsSql="select *, date_format(fechaeva,'%d/%m/%Y') as fechaeva from evaluacion where(numero=$this->aiNumero) and (idtipo=$this->asTipo) and(peraca='".$_SESSION['peraca']."'))";
			$this->f_Con();
			$lrTb=$this->f_Filtro($lsSql);
			if($laTupla=$this->f_Arreglo($lrTb))
			{
				$this->aiNumero=$laTupla["numero"];
				$this->asCedula=$laTupla["cedula"];
				$this->asCurso=$laTupla["curso"];
				$this->asCarrera=$laTupla["carrera"];
				$this->asSemestre=$laTupla["termino"];
				$this->asMateria=$laTupla["materia"];
				$this->asTipo=$laTupla["idtipo"];
				$this->asFechaeva=$laTupla["fechaeva"];
				$this->asHoraeva=$laTupla["horaeva"];
				$lbEnc=true;
			}
			$this->f_Cierra($lrTb);
			$this->f_Des();
			$this->aiContador=0;
			if($lbEnc){
			    $lsSql="select * from detalleevaluacion where (numero=$this->aiNumero) order by cedula";
			    $this->f_Con();
				$lrTb=$this->f_Filtro($lsSql);
				while($laTupla=$this->f_Arreglo($lrTb))
		  	    {
					$this->aaDetalle[$this->aiContador][0]=$laTupla["idaspecto"];
					$this->aaDetalle[$this->aiContador][1]=$laTupla["idvaloracion"];
					$this->aaDetalle[$this->aiContador][2]=$laTupla["cedula"];
					$this->aiContador++;
			    }
			    $this->f_Cierra($lrTb);
				$this->f_Des();
				$this->aiContador=0;
			    $lsSql="select * from detalle_nota where (numero=$this->aiNumero) order by cedula";
			    $this->f_Con();
				$lrTb=$this->f_Filtro($lsSql);
				while($laTupla=$this->f_Arreglo($lrTb))
		  	    {
					$this->aaDetalleNota[$this->aiContador][0]=$laTupla["cedula"];
					$this->aaDetalleNota[$this->aiContador][1]=$laTupla["nota"];
					$this->aiContador++;
			    }
			    $this->f_Cierra($lrTb);
				$this->f_Des();

			}
			return $lbEnc;
        }
		public function fBusqueda()
		{
			$lbEnc=false;
			$lsSql="select * from evaluacion where(cedula='".$_SESSION['usuario']['Cedula']."') and (idtipo=$this->asTipo) and (peraca='".$_SESSION['peraca']."')";
			$this->f_Con();
			$lrTb=$this->f_Filtro($lsSql);
			if($laTupla=$this->f_Arreglo($lrTb))
			{
				$this->aiNumero=$laTupla["numero"];
				$this->asCedula=$laTupla["cedula"];
				$this->asCurso=$laTupla["curso"];
				$this->asCarrera=$laTupla["carrera"];
				$this->asSemestre=$laTupla["termino"];
				$this->asMateria=$laTupla["materia"];
				$this->asTipo=$laTupla["idtipo"];
				$this->asFechaeva=$laTupla["fechaeva"];
				$this->asHoraeva=$laTupla["horaeva"];
				$lbEnc=true;
			}
			$this->f_Cierra($lrTb);
			$this->f_Des();
			if($lbEnc){
				
				$this->aiContador=0;
			    $lsSql="select * from detalleevaluacion where (numero='$this->aiNumero') order by cedula";
			    $this->f_Con();
				$lrTb=$this->f_Filtro($lsSql);
				while($laTupla=$this->f_Arreglo($lrTb))
		  	    {
					$this->aaDetalle[$this->aiContador][0]=$laTupla["idaspecto"];
					$this->aaDetalle[$this->aiContador][1]=$laTupla["idvaloracion"];
					$this->aaDetalle[$this->aiContador][2]=$laTupla["cedula"];
					$this->aiContador++;
			    }
			    $this->f_Cierra($lrTb);
				$this->f_Des();
				$this->aiContador=0;
			    $lsSql="select * from detalle_nota where (numero='$this->aiNumero') order by cedula";
			    $this->f_Con();
				$lrTb=$this->f_Filtro($lsSql);
				while($laTupla=$this->f_Arreglo($lrTb))
		  	    {
					$this->aaDetalleNota[$this->aiContador][0]=$laTupla["cedula"];
					$this->aaDetalleNota[$this->aiContador][1]=$laTupla["nota"];
					$this->aiContador++;
			    }
			    $this->f_Cierra($lrTb);
				$this->f_Des();

			}
			return $lbEnc;
        }
	
		public function fIncluir()
		{
			$liy=explode(".",$this->aiFilas);
			$filas=$liy[0];
			$columnas=$liy[1];
			$this->aaDetalle=$_SESSION["detalle"];
			$this->aaDetalleNota=$_SESSION["notas"];
			unset($_SESSION["detalle"]);
			unset($_SESSION["notas"]);
			$lbHecho=false;
			$lbEnc=false;
			$lnA=0;
			$this->f_Con();
			$lsSql="select d.numero from evaluacion as e inner join detalle_nota as d ON(e.numero=d.numero) where (e.cedula='$this->asCedula') and (e.peraca='".$_SESSION['peraca']."') and (e.idtipo='$this->asTipo') and (d.cedula='".$this->aaDetalleNota[$lnA][0]."') and (e.numero=d.numero)";
			$lrTb=$this->f_Filtro($lsSql);
			while($laTupla=$this->f_Arreglo($lrTb))
	  	    {
				$lbEnc=true;
			}
			if(!$lbEnc){
				$this->f_Begin();
				$this->asFechaeva=$this->fFechaBD($this->asFechaeva);
				$lsSql="insert into evaluacion (numero,cedula,fechaeva,horaeva,idtipo,curso,carrera,termino,materia,peraca)values($this->aiNumero,'$this->asCedula','$this->asFechaeva','$this->asHoraeva','$this->asTipo','$this->asCurso','$this->asCarrera','$this->asSemestre','$this->asMateria','".$_SESSION['peraca']."')";
				$lbHecho=$this->f_Ejecutar($lsSql);
				if ($lbHecho)
				{
					for ($lnA=0;$lnA<$filas;$lnA++)
					 {
						for ($lnV=0;$lnV<$columnas;$lnV++)
						 {
							if ($this->aaDetalle[$lnA][$lnV][0]!="-")
							{
							   $lsSql="insert into detalleevaluacion (numero,idaspecto,idvaloracion,cedula) values ($this->aiNumero,'".$this->aaDetalle[$lnA][$lnV][0]."','".$this->aaDetalle[$lnA][$lnV][2]."','".$this->aaDetalle[$lnA][$lnV][1]."')";
							   $lbHecho2=$this->f_Ejecutar($lsSql);
							   if (!$lbHecho2)
							   {
								   $lbHecho=false;
							   }
							}
						 }
					 }
					 for ($lnA=0;$lnA<$columnas;$lnA++){
						 
						 $lsSql="insert into detalle_nota (numero,nota,cedula) values ($this->aiNumero,'".$this->aaDetalleNota[$lnA][1]."','".$this->aaDetalleNota[$lnA][0]."')";
						 $lbHecho3=$this->f_Ejecutar($lsSql);
						 if (!$lbHecho3)
						 {
							$lbHecho=false;
						 }
					 }
				}
				if ($lbHecho)
				{
				  $this->f_Commit();
				}
				else
				{
				   $this->f_RollBack();
				}
			}
      	    $this->f_Des();
			if ($lbHecho){
				$liHecho=1;
			}else if (($lbHecho==false)&&($lbEnc==true)){
				$liHecho=2;
			}else if (($lbHecho==false)&&($lbEnc==false)){
				$liHecho=0;
			}
      	    return $liHecho;
       }
      
       public function fModificar()
	   {
	 		$liy=explode(".",$this->aiFilas);
			$filas=$liy[0];
			$columnas=$liy[1];
			$this->aaDetalle=$_SESSION["detalle"];
			$this->aaDetalleNota=$_SESSION["notas"];
			unset($_SESSION["notas"]);
			unset($_SESSION["detalle"]);
			$lbHecho=false;
			$this->f_Con();
			$this->f_Begin();
			$this->asFechaeva=$this->fFechaBD($this->asFechaeva);
			$lsSql="update evaluacion set fechaeva='$this->asFechaeva',horaeva='$this->asHoraeva',curso='$this->asCurso',carrera='$this->asCarrera',termino='$this->asSemestre',materia='$this->asMateria' where (numero=$this->aiNumero)";
			$lbHecho=$this->f_Ejecutar($lsSql);
			if ($lbHecho)
			{
				$lsSql="delete from detalleevaluacion where (numero=$this->aiNumero)";
				$lbHecho=$this->f_Ejecutar($lsSql);
				if ($lbHecho)
			    {
					for ($lnA=0;$lnA<$filas;$lnA++)
					 {
						for ($lnV=0;$lnV<$columnas;$lnV++)
						 {
							if ($this->aaDetalle[$lnA][$lnV][0]!="-")
							{
								
							   $lsSql="insert into detalleevaluacion (numero,idaspecto,idvaloracion,cedula) values ($this->aiNumero,'".$this->aaDetalle[$lnA][$lnV][0]."','".$this->aaDetalle[$lnA][$lnV][2]."','".$this->aaDetalle[$lnA][$lnV][1]."')";
							   $lbHecho2=$this->f_Ejecutar($lsSql);
							   if (!$lbHecho2)
							   {
								   $lbHecho=false;
							   }
							}
						 }
					 }
					 $lsSql="delete from detalle_nota where (numero=$this->aiNumero)";
					 $lbHecho4=$this->f_Ejecutar($lsSql);
					 if ($lbHecho4){
						for($lnA=0;$lnA<$columnas;$lnA++){
							$lsSql="insert into detalle_nota (numero,nota,cedula) values ($this->aiNumero,'".$this->aaDetalleNota[$lnA][1]."','".$this->aaDetalleNota[$lnA][0]."')";
							$lbHecho3=$this->f_Ejecutar($lsSql);
							if (!$lbHecho3)
							{
								$lbHecho=false;
							}
						}
				    }
				 }
		    }
		    if ($lbHecho)
      	    {
      	       $this->f_Commit();
		    }
      	    else
      	    {
      	       $this->f_RollBack();
		    }
			$this->f_Des();
			return $lbHecho;
		}
		
		public function fEliminar()
		{
			$lbHecho=false;
			$lsSql="delete from detalleevaluacion where (numero=$this->aiNumero)";
			$this->f_Con();
			$lbHecho=$this->f_Ejecutar($lsSql);
			if ($lbHecho)
			{
				$lsSql="delete from evaluacion where (numero=$this->aiNumero)";
				$lbHecho=$this->f_Ejecutar($lsSql);
			}
			if ($lbHecho)
      	    {
      	       $this->f_Commit();
		    }
      	    else
      	    {
      	       $this->f_RollBack();
		    }
			$this->f_Des();
			return $lbHecho;
		}
		
		public function fNuevo()
		{
			$lb_Enc=false;
			$lb_Enc=$this->fBusqueda();
			if($lb_Enc){
				print("encontro");
			}else{
			    $lsSql="select max(numero) as mayor from evaluacion";
			    $this->f_Con();
				$lrTb=$this->f_Filtro($lsSql);
				if($laTupla=$this->f_Arreglo($lrTb))
				{
					  $this->aiNumero=$laTupla["mayor"]+1;
				}
				$this->f_Cierra($lrTb);
				$this->f_Des();
			}
			return $lb_Enc;
		}
	}			
?>
