<?php
   /*
   *      corTransAcomp.php
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
   require_once("../clases/clsTransAcomp.php");
   require_once("../clases/cls_Docente.php");
   if(array_key_exists(txtoperacion,$_POST))
   {
	   $liNumero=$_POST["txtnumero"];
	   $lsCedula=$_POST["txtcedula"];
	   $lsCurso=$_POST["txtcurso"];
	   $lsCarrera=$_POST["txtcarrera"];
	   $lsSemestre=$_POST["txtsemestre"];
	   $lsMateria=$_POST["txtmateria"];
	   $lsFechaeva=$_POST["txtfechaeva"];
	   $lsHoraeva=$_POST["txthoraeva"];
	   $lsnombreva=$_POST["txtnombreva"];
	   $lsidtipo=$_POST["txttipo"];
	   $lsOperacion=$_POST["txtoperacion"];
	   $lsHacer=$_POST["txthacer"];
	   $lscmb=$_POST["txtcmb"];
	   $lsvalor=$_POST["txtvalor"];
	   $pg=$_POST["txtpagina"]; //recive la pagina que le manda la vista
	   for ($liJ=0;$liJ<10;$liJ++)
	   {
		  if(($_POST["cmbdocente$liJ"]!="-") and ($_POST["cmbdocente$liJ"]!="")){
			  $_SESSION["detalle"][$liJ][0]=$_POST["cmbdocente$liJ"];
			  $_SESSION["detalle"][$liJ][1]=$_POST["cmbcarrera$liJ"];
			  $_SESSION["detalle"][$liJ][2]=$_POST["cmbseccion$liJ"];
			  $_SESSION["detalle"][$liJ][3]=$_POST["cmbsemestre$liJ"];
		  }
	   }
	   $lobjTransAcomp= new clsTransAcomp();
	   $lobjTransAcomp->fSetiNumero($liNumero);
	   $lobjTransAcomp->fSetsCedula($lsCedula);
	   $lobjTransAcomp->fSetsTipo($lsidtipo);
	   $lobjTransAcomp->fSetsFechaeva($lsFechaeva);
	   $lobjTransAcomp->fSetsHoraeva($lsHoraeva);
	   $lobjTransAcomp->fSetsvalor($lsvalor);
   }
   
   if ($lsOperacion=="nuevo")
   {
	   $liNumero=$lobjTransAcomp->fNuevo();
	   $liHay=0;
	   header("location: ../vistas/visTransAcomp.php?liNumero=$liNumero&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion&lsidtipo=$lsidtipo&lsnombreva=$lsnombreva");
   }
   
   if ($lsOperacion=="buscar")
   {
	  $liHay=0;
	  $lbEnc=$lobjTransAcomp->fBuscar();
	  if ($lbEnc)
	  {
		 $lsCedula=$lobjTransAcomp->fGetsCedula();
		 $lsTipo=$lobjTransAcomp->fGetsTipo();
		 $lsFechaeva=$lobjTransAcomp->fGetsFechaeva();
		 $lsHoraeva=$lobjTransAcomp->fGetsHoraeva();
		 $_SESSION["detalle"]=$lobjTransAcomp->fGetaDetalle();
		 $liHay=1;
	  }
	  header("location: ../vistas/visTransAcomp.php?liNumero=$liNumero&lsCedula=$lsCedula&lsFechaeva=$lsFechaeva&lsHoraeva=$lsHoraeva&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion&lsidtipo=$lsidtipo&lsnombreva=$lsnombreva&lscmb=$lscmb");
   }
   if ($lsOperacion=="incluir")
   {
	  $llHecho=$lobjTransAcomp->fIncluir();  
	   if ($llHecho==1)
	  {
		 $lsHacer="Listo";
	  }else if($llHecho==2){
		 $lsMen="1";
	  }
   }
   if ($lsOperacion=="modificar")
   {
	  $llHecho=$lobjTransAcomp->fModificar();
	  if ($llHecho)
	  {
		 $lsHacer="Listo";
	  }
   }
   if ($lsOperacion=="busqueda"){
	   $_SESSION['matriz']=$lobjTransAcomp->fBusqueda($pg);//recibo la busqueda para los docentes
   }
   if ($lsOperacion=="eliminar")
   {
	  $llHecho=$lobjTransAcomp->fEliminar();   
	  if ($llHecho)
	  {
		 $lsHacer="Listo";
	  }
   }
   if (($lsOperacion!="buscar")&&($lsOperacion!="nuevo"))
   {
	   if ($lsOperacion=="busqueda"){
			header("location: ../vistas/visTransAcomp.php?pg=$pg&buscar&lsvalor=$lsvalor&lsidtipo=$lsidtipo&lsnombreva=$lsnombreva&lsMen=$lsMen&liNumero=$liNumero");
		}else{
			header("location: ../vistas/visTransAcomp.php?lsHacer=$lsHacer&lsOperacion=$lsOperacion&lsidtipo=$lsidtipo&lsnombreva=$lsnombreva&lsMen=$lsMen");
		}
   }
   
   
   
?>
