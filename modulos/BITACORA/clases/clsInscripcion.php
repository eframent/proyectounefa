<?php
   /*
   *      clsInscripcion.php
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
  
	require_once("../clases/clsEstudiante.php");
	class clsInscripcion extends clsModelo
	{
		private $aiNumero;
		private $asCedula;
		private $asFechaIns;
		private $asHoraIns;
		private $aaDetalle;
   	    private $aiFilas;
   	    private $aiContador;
		
		public function __construct()
		{
			$this->aiNumero=0;
			$this->asCedula="";
			$this->asHoraIns="";
			$this->aiFilas=10;
		    $this->aiContador=0;
		    $this->aaDetalle=array();
		}
		
		public function __destruct()
		{
		}
		
		public function fSetiNumero($piNumero)
		{
			$this->aiNumero=$piNumero;
		}
		public function fSetsCedula($psCedula)
		{
			$this->asCedula=$psCedula;
		}
		
		public function fSetsFechaIns($psFechaIns)
		{
			$this->asFechaIns=$psFechaIns;
		}
		
		public function fSetsHoraIns($psHoraIns)
		{
			$this->asHoraIns=$psHoraIns;
		}
		
		public function fSetaDetalle($paDetalle)
	    {
		   $this->aaDetalle=$paDetalle;
	    }
	    
	    
      //************************************GET*********************************************
		public function fGetiNumero()
		{
			return $this->aiNumero;
		}
		public function fGetsCedula()
		{
			return $this->asCedula
			;
		}
		
		public function fGetsFechaIns()
		{
			return $this->asFechaIns;
		}
		
		public function fGetsHoraIns()
		{
			return $this->asHoraIns;
		}
		
		public function fGetaDetalle()
	    {
	  	   return $this->aaDetalle;
	    }
	    
	    public function fGetiFilas()
		{
			return $this->aiFilas;
		}
	    
		public function fBuscar()
		{	
			
			$lbEnc=false;
			$lsSql="select *, date_format(fecha_inscrip,'%d/%m/%Y') as fecha_inscrip from inscripcion_pre where(num_inscripcion=$this->aiNumero)";
			$this->Funcion_Conectar();
			$lrTb=$this->fFiltro($lsSql);
			if($laRow=$this->fArreglo($lrTb))
			{
				$this->aiNumero=$laRow["num_inscripcion"];
				$this->asCedula=$laRow["cedula_est_pre"];
				$this->asFechaIns=$laRow["fecha_inscrip"];
				$this->asHoraIns=$laRow["hora"];
				$lbEnc=true;
			}
			$this->fCFiltro($lrTb);
			$this->fDesconect();
		    $lsSql="select * from detalle_inscrip_pre where (num_inscripcion=$this->aiNumero)";
		    $this->Funcion_Conectar();
		    $this->aiContador=0;
			$lrTb=$this->fFiltro($lsSql);
			 while($laRow=$this->fArreglo($lrTb))
	  	    { 
				$this->aaDetalle[$this->aiContador][0]=$laRow["num_inscrip_pre"];
				$this->aaDetalle[$this->aiContador][1]=$laRow["codmat"];
				$this->aaDetalle[$this->aiContador][2]=$laRow["idplanificacion"];
				
				$this->aiContador++;  
		    }         
		    $this->fCFiltro($lrTb);
			$this->fDesconect();
			
		    return $lbEnc;
        }
		public function fBuscar2()
		{	
			$lbEnc=false;
			$lsSql="select *, date_format(fecha_inscrip,'%d/%m/%Y') as fecha_inscrip from inscripcion_pre where (cedula_est_pre='".$_SESSION["usuario"]."') and (peraca='".$_SESSION["peraca"]."')";
			print($lsSql);
			$this->Funcion_Conectar();
			$lrTb=$this->fFiltro($lsSql);
			if($laRow=$this->fArreglo($lrTb))
			{
				$this->aiNumero=$laRow["num_inscripcion"];
				$this->asCedula=$laRow["cedula_est_pre"];
				$this->asFechaIns=$laRow["fecha_inscrip"];
				$this->asHoraIns=$laRow["hora"];
				$lbEnc=true;
			}
			$this->fCFiltro($lrTb);
			$this->fDesconect();
		    $lsSql="select * from detalle_inscrip_pre where (num_inscripcion=$this->aiNumero)";
		    $this->Funcion_Conectar();
		    $this->aiContador=0;
			$lrTb=$this->fFiltro($lsSql);
			 while($laRow=$this->fArreglo($lrTb))
	  	    { 
				$this->aaDetalle[$this->aiContador][0]=$laRow["num_inscrip_pre"];
				$this->aaDetalle[$this->aiContador][1]=$laRow["codmat"];
				$this->aaDetalle[$this->aiContador][2]=$laRow["idplanificacion"];
				
				$this->aiContador++;  
		    }         
		    $this->fCFiltro($lrTb);
			$this->fDesconect();
			
		    return $lbEnc;
        }
		public function fIncluir()
		{	
			$this->aaDetalle=$_SESSION['detalle'];
			unset($_SESSION['detalle']);
			$lbHecho=false;
			$lbEnc=false;
			$this->funcion_Conectar();
			$this->fBegin();
			$this->asFechaIns=$this->fFechaBD($this->asFechaIns);
			$lsSql="select num_inscripcion from inscripcion_pre where (cedula_est_pre='".$_SESSION["usuario"]."') and (peraca='".$_SESSION["peraca"]."')";
			$lrTb=$this->fFiltro($lsSql);
			if($laRow=$this->fArreglo($lrTb))
			{
				$lbEnc=true;
			} 
			if(!$lbEnc){
			$lsSql="insert into inscripcion_pre (num_inscripcion,cedula_est_pre,fecha_inscrip,hora,peraca)values('$this->aiNumero','$this->asCedula','$this->asFechaIns','$this->asHoraIns','".$_SESSION["peraca"]."')";
			$lbHecho=$this->fEjecutar($lsSql);
			if ($lbHecho)
			{
				for ($lnI=0;$lnI<count($this->aaDetalle);$lnI++)
				 {
					if ($this->aaDetalle[$lnI][0]!="-")
					{
					   $lsSql="insert into detalle_inscrip_pre (num_inscripcion, codmat,idplanificacion) values ('$this->aiNumero','".$this->aaDetalle[$lnI][1]."','".$this->aaDetalle[$lnI][0]."')";
					   $lbHecho2=$this->fEjecutar($lsSql);
					  
					   if (!$lbHecho2)
					   {
						   $lbHecho=false;
					   }
					}
				 }
		    }
		    if ($lbHecho)
      	    {
      	      $this->fCommit();
		    }
      	    else
      	    {
      	       $this->fRollBack();
				}
		    }
      	    $this->fDesconect();
      	    if (($lbHecho==true)&&($lbEnc==false)){
					$liHecho=1;
		 		}else if (($lbHecho==false)&&($lbEnc==true)){
					$liHecho=2;
				}else if (($lbHecho==false)&&($lbEnc==false)){
					$liHecho=3;
				}
      	    return $liHecho;
       }
      
       public function fModificar()
	   {
	 		$lbHecho=false;
			$this->Funcion_Conectar();
			$this->fBegin();
			$this->asFechaIns=$this->fFechaBD($this->asFechaIns);
			$lsSql="update inscripcion_pre set fecha_inscrip='$this->asFechaIns',hora='$this->asHoraIns' where (num_inscripcion=$this->aiNumero)";
			$lbHecho=$this->fEjecutar($lsSql);
			if ($lbHecho)
			{
				$lsSql="delete from detalle_inscrip_pre where (num_inscripcion=$this->aiNumero)";
				$lbHecho=$this->fEjecutar($lsSql);
				if ($lbHecho)
			    {
					for ($lnI=0;$lnI<$this->aiFilas;$lnI++)
					 {
						if ($this->aaDetalle[$lnI][0]!="-")
						{
						   $lsSql="insert into detalle_inscrip_pre (num_inscripcion,codmat) values ($this->aiNumero,'".$this->aaDetalle[$lnI][0]."')";
						   $lbHecho2=$this->fEjecutar($lsSql);
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
      	       $this->fCommit();
		    }
      	    else
      	    {
      	       $this->fRollBack();
		    }
			$this->fDesconect();
			return $lbHecho;
		}
		
		public function fEliminar()
		{
			$lbHecho=false;
			$lsSql="delete from detalle_inscrip_pre where (num_inscripcion=$this->aiNumero)";
			$this->funcion_Conectar();
			$lbHecho=$this->fEjecutar($lsSql);
			if ($lbHecho)
			{
				$lsSql="delete from inscripcion_pre where (num_inscripcion=$this->aiNumero)";
				$lbHecho=$this->fEjecutar($lsSql);
			}
			if ($lbHecho)
      	    {
      	       $this->fCommit();
		    }
      	    else
      	    {
      	       $this->fRollBack();
		    }
			$this->fDesconect();
			return $lbHecho;
		}
		
		public function fNuevo()
		{
		    $lsSql="select max(num_inscripcion) as mayor from inscripcion_pre";
		    $this->Funcion_Conectar();
			$lrTb=$this->fFiltro($lsSql);
			if($laRow=$this->fArreglo($lrTb))
			{
				  $liAux=$laRow["mayor"]+1;
			}
			$this->fCFiltro($lrTb);
			$this->fDesconect();
			return $liAux;
		}
	}			
?>
