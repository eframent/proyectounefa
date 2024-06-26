<?php
   /*
   *      corTransEva.php
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
   require_once("../clases/clsTransEva.php");
   require_once("../clases/cls_Docente.php");
   if(array_key_exists(txtoperacion,$_POST))
   {
	   $liNumero=$_POST["txtnumero"];
	   $lsCedula=$_POST["txtcedula"];
	   $lsCurso=$_POST["txtcurso"];
	   $lsCarrera=$_POST["txtcarrera"];
	   $lsSemestre=$_POST["txtsemestre"];
	   $lsMateria=$_POST["txtmateria"];
	   $lsFilas=$_POST["txtfilas"];
	   $lsFechaeva=$_POST["txtfechaieva"];
	   $lsHoraeva=$_POST["txthoraeva"];
	   $lsnombreva=$_POST["txtnombreva"];
	   $lsidtipo=$_POST["txttipo"];
	   $lsOperacion=$_POST["txtoperacion"];
	   $lsHacer=$_POST["txthacer"];
	   $liy=explode(".",$lsFilas);
	   $liA=$liy[0];
	   $liV=$liy[1];
	   for ($liI=0;$liI<$liA;$liI++)
	   {
		  for ($liJ=0;$liJ<$liV;$liJ++)
		  {
			$_SESSION["detalle"][$liI][$liJ][2]=$_POST["cmbcodigo$liJ-$liI"];
			$_SESSION["notas"][$liJ][1]=$_POST["txtnota$liJ"];
		  }
	   }
	   $lobjTransEva= new clsTransEva();
	   $lobjTransEva->fSetiNumero($liNumero);
	   $lobjTransEva->fSetsCedula($lsCedula);
	   $lobjTransEva->fSetsFilas($lsFilas);
	   $lobjTransEva->fSetsTipo($lsidtipo);
	   $lobjTransEva->fSetsCurso($lsCurso);
	   $lobjTransEva->fSetsCarrera($lsCarrera);
	   $lobjTransEva->fSetsSemestre($lsSemestre);
	   $lobjTransEva->fSetsMateria($lsMateria);
	   $lobjTransEva->fSetsFechaeva($lsFechaeva);
	   $lobjTransEva->fSetsHoraeva($lsHoraeva);
   }
   
   if ($lsOperacion=="nuevo")
   {
	    $liHay=0;
		$lsOperacion="nuevo";
		$lbEnc=$lobjTransEva->fNuevo();
		if ($lbEnc)
		{
			$lsCedula=$lobjTransEva->fGetsCedula();
			$lsCurso=$lobjTransEva->fGetsCurso();
			$lsCarrera=$lobjTransEva->fGetsCarrera();
			$lsSemestre=$lobjTransEva->fGetsSemestre();
			$lsMateria=$lobjTransEva->fGetsMateria();
			$lsFechaeva=$lobjTransEva->fGetsFechaeva();
			$lsHoraeva=$lobjTransEva->fGetsHoraeva();
			$_SESSION["detalle"]=$lobjTransEva->fGetaDetalle();
			$_SESSION["notas"]=$lobjTransEva->fGetaDetalleNota();
			$lsOperacion="buscar";
			$lsHacer="buscar";
			$liHay=1;
		}
		$liNumero=$lobjTransEva->fGetiNumero();
		header("location: ../vistas/visTransEva.php?liNumero=$liNumero&lsCedula=$lsCedula&lsCurso=$lsCurso&lsCarrera=$lsCarrera&lsSemestre=$lsSemestre&lsMateria=$lsMateria&lsFechaeva=$lsFechaeva&lsHoraeva=$lsHoraeva&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion&lsidtipo=$lsidtipo&lsnombreva=$lsnombreva");
   }
   
   if ($lsOperacion=="buscar")
   {
	  $liHay=0;
	  $lbEnc=$lobjTransEva->fBuscar();
	  if ($lbEnc)
	  {
		 $lsCedula=$lobjTransEva->fGetsCedula();
		 $lsCurso=$lobjTransEva->fGetsCurso();
		 $lsCarrera=$lobjTransEva->fGetsCarrera();
		 $lsSemestre=$lobjTransEva->fGetsSemestre();
		 $lsMateria=$lobjTransEva->fGetsMateria();
		 $lsFechaeva=$lobjTransEva->fGetsFechaeva();
		 $lsHoraeva=$lobjTransEva->fGetsHoraeva();
		 $_SESSION["detalle"]=$lobjTransEva->fGetaDetalle();
		 $_SESSION["notas"]=$lobjTransEva->fGetaDetalleNota();
		 $liHay=1;
	  }
	  header("location: ../vistas/visTransEva.php?liNumero=$liNumero&lsCedula=$lsCedula&lsCurso=$lsCurso&lsCarrera=$lsCarrera&lsSemestre=$lsSemestre&lsMateria=$lsMateria&lsFechaeva=$lsFechaeva&lsHoraeva=$lsHoraeva&liHay=$liHay&lsHacer=$lsHacer&lsOperacion=$lsOperacion&lsidtipo=$lsidtipo&lsnombreva=$lsnombreva");
   }
   if ($lsOperacion=="incluir")
   {
	  $llHecho=$lobjTransEva->fIncluir();  
	   if ($llHecho==1)
	  {
		 $lsHacer="Listo";
	  }else if($llHecho==2){
		 $lsMen="1";
	  }
   }
   if ($lsOperacion=="modificar")
   {
	  $llHecho=$lobjTransEva->fModificar();
	  if ($llHecho)
	  {
		 $lsHacer="Listo";
	  }
   }
   if ($lsOperacion=="eliminar")
   {
	  $llHecho=$lobjTransEva->fEliminar();   
	  if ($llHecho)
	  {
		 $lsHacer="Listo";
	  }
   }
   if (($lsOperacion!="buscar")&&($lsOperacion!="nuevo"))
   {
	   if ($lsOperacion=="busqueda"){
		   
	   }else{
		   header("location: ../vistas/visTransEva.php?lsHacer=$lsHacer&lsOperacion=$lsOperacion&lsidtipo=$lsidtipo&lsnombreva=$lsnombreva&lsMen=$lsMen");
	   }
   }
   
   
   
?>
