<?php
   /*
   *      clsevaluadores.php
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
	session_start();
	require_once("cls_Docente.php");
	class clsTransAcomp extends cls_Bitacora
	{
		private $aiidevaluadores;
		private $asCedula;
		private $asTipo;
		private $asNombre;
		private $asApellido;
		private $asFechaeva;
		private $asHoraeva;
		private $aaDetalle;
   	    private $aiContador;
		private $asvalor;
		
		public function __construct()
		{
			$this->aiidevaluadores=0;
			$this->asTipo="";
			$this->asCedula="";
			$this->asFechaeva="";
			$this->asHoraeva="";
		    $this->aiContador=0;
			$this->asvalor="";
		    $this->aaDetalle=array();
		}
		
		public function __destruct()
		{
		}
		
		public function fSetiNumero($piNumero)
		{
			$this->aiidevaluadores=$piNumero;
		}
		
		
		public function fSetsCarrera($psCarrera)
		{
			$this->asCarrera=$psCarrera;
		}
		
		public function fSetsCedula($psCedula)
		{
			$this->asCedula=$psCedula;
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
		
		public function fSetsvalor($psvalor)
		{
			$this->asvalor=$psvalor;
		}
		
		public function fSetaDetalle($paDetalle)
	    {
		   $this->aaDetalle=$paDetalle;
	    }
	    
		public function fGetiNumero()
		{
			return $this->aiidevaluadores;
		}
		
		public function fGetsCedula()
		{
			return $this->asCedula;
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
		
		public function fGetsTipo()
		{
			return $this->asTipo;
		}
		
		public function fGetaDetalle()
	    {
	  	   return $this->aaDetalle;
	    }
	    
		public function fGetsvalor()
		{
			return $this->asvalor;
		}
		public function fBuscar()
		{
			$lbEnc=false;
			$lsSql="select * from evaluadores where(idevaluadores='$this->aiidevaluadores') order by idevaluadores";
			$this->f_Con();
			$lrTb=$this->f_Filtro($lsSql);
			if($laTupla=$this->f_Arreglo($lrTb))
			{
				$this->aiidevaluadores=$laTupla["idevaluadores"];
				$this->asCedula=$laTupla["cedula"];
				$this->asTipo=$laTupla["idtipo"];
				$this->asFechaeva=$laTupla["fechaeva"];
				$this->asHoraeva=$laTupla["horaeva"];
				$lbEnc=true;
			}
			$this->f_Cierra($lrTb);
			$this->f_Des();
			$this->aiContador=0;
		    $lsSql="select * from detalle_evaluadores where (idevaluadores='$this->aiidevaluadores') order by idevaluadores";
			$this->aiContador=0;
		    $this->f_Con();
			$lrTb=$this->f_Filtro($lsSql);
			while($laTupla=$this->f_Arreglo($lrTb))
	  	    {
				$this->aaDetalle[$this->aiContador][0]=$laTupla["cedula"];
				$this->aaDetalle[$this->aiContador][1]=$laTupla["codesp"];
				$this->aaDetalle[$this->aiContador][2]=$laTupla["seccion"];
				$this->aaDetalle[$this->aiContador][3]=$laTupla["semestre"];
				$this->aiContador++;
				$lbEnc=true;
		    }
		    $this->f_Cierra($lrTb);
			$this->f_Des();
			$this->aiContador=0;
			return $lbEnc;
        }
	
		public function fIncluir()
		{
			$this->aaDetalle=$_SESSION["detalle"];
			unset($_SESSION["detalle"]);
			$lbHecho=false;
			$lbEnc=false;
			$this->asTipo=4;
			$lnA=0;
			$this->f_Con();
			$this->f_Begin();
			$this->asFechaeva=$this->fFechaBD($this->asFechaeva);
			$lsSql="insert into evaluadores (idevaluadores,cedula,fechaeva,horaeva,idtipo,peraca)values('$this->aiidevaluadores','$this->asCedula','$this->asFechaeva','$this->asHoraeva','$this->asTipo','".$_SESSION['peraca']."')";
			$lbHecho=$this->f_Ejecutar($lsSql);
			if ($lbHecho)
			{
				for ($lnA=0;$lnA<count($this->aaDetalle);$lnA++)
				 {
					if ($this->aaDetalle[$lnA][0]!="-")
					{
						$lsSql="insert into detalle_evaluadores (idevaluadores,codesp,seccion,semestre,observaciones,cedula) values ('$this->aiidevaluadores','".$this->aaDetalle[$lnA][1]."','".$this->aaDetalle[$lnA][2]."','".$this->aaDetalle[$lnA][3]."','','".$this->aaDetalle[$lnA][0]."')";
						$lbHecho2=$this->f_Ejecutar($lsSql);
						if (!$lbHecho2)
						{
						   $lbHecho=false;
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
      
       public function fModificar()
	   {
			$this->aaDetalle=$_SESSION["detalle"];
			unset($_SESSION["detalle"]);
			$lbHecho=false;
			$this->f_Con();
			$this->f_Begin();
			$this->asFechaeva=$this->fFechaBD($this->asFechaeva);
			$lsSql="update evaluadores set fechaeva='$this->asFechaeva',horaeva='$this->asHoraeva',curso='$this->asCurso',carrera='$this->asCarrera',termino='$this->asSemestre',materia='$this->asMateria' where (idevaluadores=$this->aiidevaluadores)";
			$lbHecho=$this->f_Ejecutar($lsSql);
			if ($lbHecho)
			{
				$lsSql="delete from detalle_evaluadores where (idevaluadores=$this->aiidevaluadores)";
				$lbHecho=$this->f_Ejecutar($lsSql);
				if ($lbHecho)
			    {
					for ($lnA=0;$lnA<10;$lnA++)
					 {
						if ($this->aaDetalle[$lnA][0]!="-")
						{
						   $lsSql="insert into detalle_evaluadores (idevaluadores,cedula,codesp,seccion,semestre,materia) values ($this->aiidevaluadores,'".$this->aaDetalle[$lnA][0]."','".$this->aaDetalle[$lnA][1]."','".$this->aaDetalle[$lnA][2].",'".$this->aaDetalle[$lnA][3]."','1')";
						   $lbHecho2=$this->f_Ejecutar($lsSql);
						   if (!$lbHecho2)
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
			$lsSql="delete from detalle_evaluadores where (idevaluadores=$this->aiidevaluadores)";
			$this->f_Con();
			$lbHecho=$this->f_Ejecutar($lsSql);
			if ($lbHecho)
			{
				$lsSql="delete from evaluadores where (idevaluadores=$this->aiidevaluadores)";
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
		public function fBusqueda($pg){
			$laBusqueda=Array();
			$lobjDocente= new cls_Docente;
			$laForm=Array();
			$laForm["pg"]=$pg;
			$laForm["valor"]=$this->asvalor;
			$lobjDocente->f_SetsForm($laForm);
			$laBusqueda=$lobjDocente->fListarTrans();
			$this->asvalor=$laForm['valor'];
			return $laBusqueda;
			
		}
		public function fNuevo()
		{
		    $lsSql="select max(idevaluadores) as mayor from evaluadores";
		    $this->f_Con();
			$lrTb=$this->f_Filtro($lsSql);
			if($laTupla=$this->f_Arreglo($lrTb))
			{
				  $liAux=$laTupla["mayor"]+1;
			}
			$this->f_Cierra($lrTb);
			$this->f_Des();
			return $liAux;
		}
	}			
?>
