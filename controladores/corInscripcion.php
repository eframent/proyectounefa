<?php
   /*
   *      corinscripcion.php
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
   require_once("../clases/clsInscripcion.php");
   require_once("../clases/clsEstudiante.php");
   if(array_key_exists(txtoperacion,$_POST))
   {
	   $liNumero=$_POST["txtnumero"];
	   $lsCedula=$_POST["txtcedula"];
	   
	   $lsFechaIns=$_POST["txtfechains"];
	   $lsHoraIns=$_POST["txthorains"];
	   $lsOperacion=$_POST["txtoperacion"];
	   $lsHacer=$_POST["txthacer"];
	   $lobjInscripcion= new clsInscripcion();
	   $lobjInscripcion->fSetiNumero($liNumero);
	   $lobjInscripcion->fSetsCedula($lsCedula);
	   $lobjInscripcion->fSetsFechaIns($lsFechaIns);
	   $lobjInscripcion->fSetsHoraIns($lsHoraIns);
	    for ($liI=0; $liI<7; $liI++)
	   {
		    if(($_POST["cmbsemestre$liI"]!="-") && ($_POST["cmbcodmat$liI"]!="-")){
			   $_SESSION["detalle"][$liI][0]=$_POST["cmbseccion$liI"];
			   $_SESSION["detalle"][$liI][1]=$_POST["cmbnommat$liI"];	   
			}
		}
   }
   if ($lsOperacion=="nuevo")
   {
	   $liNumero=$lobjInscripcion->fNuevo();
	   $liHay=0;
	   header("location: ../vistas/visInscripcion.php?liNumero=$liNumero&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion");
   }
   
   if ($lsOperacion=="buscar")
   {
	  $liHay=0;
	  $lbEnc=$lobjInscripcion->fBuscar();
	  if ($lbEnc)
	  {
		 $liNumero=$lobjInscripcion->fGetiNumero();
		 $lsCedula=$lobjInscripcion->fGetsCedula();
		 $lsFechaIns=$lobjInscripcion->fGetsFechaIns();
		 $lsHoraIns=$lobjInscripcion->fGetsHoraIns();
		 $_SESSION["detalle"]=$lobjInscripcion->fGetaDetalle();
		 
		 $liHay=1;
	  }
	  header("location: ../vistas/visInscripcion.php?liNumero=$liNumero&lsCedula=$lsCedula&lsFechaIns=$lsFechaIns&lsHoraIns=$lsHoraIns&laDetalle=$laDetalle&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion");
   }
   if ($lsOperacion=="buscar1"){
   		$liHay=0;
	  $lbEnc=$lobjInscripcion->fBuscar2();
	  if ($lbEnc)
	  {
		 $liNumero=$lobjInscripcion->fGetiNumero();
		 $lsCedula=$lobjInscripcion->fGetsCedula();
		 $lsFechaIns=$lobjInscripcion->fGetsFechaIns();
		 $lsHoraIns=$lobjInscripcion->fGetsHoraIns();
		 $_SESSION["detalle"]=$lobjInscripcion->fGetaDetalle();
		 
		 $liHay=1;
	  }
	  header("location: ../vistas/visInscripcion.php?liNumero=$liNumero&lsCedula=$lsCedula&lsFechaIns=$lsFechaIns&lsHoraIns=$lsHoraIns&laDetalle=$laDetalle&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion&&1");
   }
   if ($lsOperacion=="incluir")
   {
	  $llHecho=$lobjInscripcion->fIncluir();  
	 if ($llHecho==1)
	
	  {
		  
		 $lsHacer="Listo";
	  }else if ($llHecho==2){
		  
			$lsPle=1;
	  }else if($llHecho==3){
			$lsPle=2;
	  }
   }
   if ($lsOperacion=="modificar")
   {
	  $lobjInscripcion->fSetaDetalle(fMatriz($lobjInscripcion->fGetiFilas()));
	  $llHecho=$lobjInscripcion->fModificar();
	  if ($llHecho)
	  {
		 $lsHacer="Listo";
	  }
   }
   if ($lsOperacion=="eliminar")
   {
	  $lobjInscripcion->fSetaDetalle(fMatriz($lobjInscripcion->fGetiFilas()));
	  $llHecho=$lobjInscripcion->fEliminar();   
	  if ($llHecho)
	  {
		 $lsHacer="Listo";
	  }
   }
   if (($lsOperacion!="buscar")&&($lsOperacion!="nuevo")&&($lsOperacion!="buscar1"))
   {
	  header("location: ../vistas/visInscripcion.php?lsHacer=$lsHacer&lsOperacion=$lsOperacion&lsPle=$lsPle");
   }
   
   function fMatriz($piI)
   {
	   $laDetalle=array();
	   for ($liI=0;$liI<$piI;$liI++)
	   {
		  $laDetalle[$liI][0]=$_POST["cmbmaterialiI"];
	   }
	   return $laDetalle;
   }
   
?>
