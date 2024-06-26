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
   require_once("../clases/clsplaniseccion.php");
   if(array_key_exists(txtoperacion,$_POST))
   {
	   $liNumero=$_POST["txtnumero"];
	   $lsfechapla=$_POST["txtfechapla"];
	   $lshorapla=$_POST["txthorapla"]; 
       $lsperaca=$_POST["cmbperaca"]; 
	   $lscodesp=$_POST["cmbcodesp"];
	   $lssemestre=$_POST["cmbsemestre"]; 
       $lsseccion=$_POST["cmbseccion"];
       $lsregimen=$_POST["cmbregimen"];
	   $lsOperacion=$_POST["txtoperacion"];
	   $lsHacer=$_POST["txthacer"];
	   $lscmb=$_POST["txtcmb"];
	   
	   for ($liI=0; $liI<7; $liI++)
	   {
		    if(($_POST["cmbcedula_doc$liI"]!="-") && ($_POST["cmbcodmat$liI"]!="-")&&($_POST["txttope$liI"]!="")){
			   $_SESSION["detalle"][$liI][0]=$_POST["cmbcedula_doc$liI"];
			   $_SESSION["detalle"][$liI][1]=$_POST["cmbcodmat$liI"];
			   $_SESSION["detalle"][$liI][2]=$_POST["txttope$liI"];	   
			}
		}
	
		$lobjplaniseccion= new clsplaniseccion();
	   $lobjplaniseccion->fSetiNumero($liNumero);
	   $lobjplaniseccion->fSetsfechapla($lsfechapla);
	   $lobjplaniseccion->fSetshorapla($lshorapla);
	   $lobjplaniseccion->fSetsperaca($lsperaca);
	   $lobjplaniseccion->fSetscodesp($lscodesp);
	   $lobjplaniseccion->fSetssemestre($lssemestre);
	   $lobjplaniseccion->fSetsseccion($lsseccion);
	   $lobjplaniseccion->fSetsregimen($lsregimen);
		}
   
   if ($lsOperacion=="nuevo")
   {
	   $liNumero=$lobjplaniseccion->fNuevo();
	   $liHay=0;
	   header("location: ../vistas/visplaniseccion.php?liNumero=$liNumero&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion");
   }
   
   if ($lsOperacion=="buscar")
   {
	  $liHay=0;
	  $lbEnc=$lobjplaniseccion->fBuscar();
	  if ($lbEnc)
	  {
		 $lsfechapla=$lobjplaniseccion->fGetsfechapla();
		 $lshorapla=$lobjplaniseccion->fGetshorapla();
		 $lsperaca=$lobjplaniseccion->fGetsperaca();
		 $lscodesp=$lobjplaniseccion->fGetscodesp();
		 $lssemestre=$lobjplaniseccion->fGetssemestre();
		 $lsseccion=$lobjplaniseccion->fGetsseccion();  
		 $lsregimen=$lobjplaniseccion->fGetsregimen();
		 $_SESSION["detalle"]=$lobjplaniseccion->fGetaDetalle();
		 $liHay=1;
	  }
	  header("location: ../vistas/visplaniseccion.php?liNumero=$liNumero&lsfechapla=$lsfechapla&lshorapla=$lshorapla&lsperaca=$lsperaca&lscodesp=$lscodesp&lssemestre=$lssemestre&lsseccion=$lsseccion&lsregimen=$lsregimen&laDetalle=$laDetalle&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion&lscmb=$lscmb");
   }
   if ($lsOperacion=="incluir")
   {
	  $llHecho=$lobjplaniseccion->fIncluir();  
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
	  $llHecho=$lobjplaniseccion->fModificar();
	 
	  if ($llHecho)
	  {
		 $lsHacer="Listo";
	  }
   }
   if ($lsOperacion=="eliminar")
   {
	  $llHecho=$lobjplaniseccion->fEliminar();   
	  if ($llHecho)
	  {
		 $lsHacer="Listo";
	  }
   }
   if (($lsOperacion!="buscar")&&($lsOperacion!="nuevo"))
   {
	  header("location: ../vistas/visplaniseccion.php?lsHacer=$lsHacer&lsOperacion=$lsOperacion&lsPle=$lsPle");
   }
   
?>
