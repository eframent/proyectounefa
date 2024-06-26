<?php 
   /*
   *      visTransEva.php
   *      
   *      Copyright 2011 José Baldomero Silva Hernández <jobasiher@cantv.net>
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
   //MENU
   require_once("../clases/cls_Cuerpo.php");
   require_once("../clases/clsTabla.php");
   require_once("../clases/cls_Combo.php");
   require_once("../clases/clsbusqueda.php");
   
   $lsSql1="select * from semestre where (borrado='I') order by idsemestre";
   $lsSql2="select * from carrera where (borrado='I') order by codesp";
   $lsSql3="select * from materia where (borrado='I') order by codmat";
   
   
  
   $lobjCombo= new cls_Combo();
   $lobjTabla=new clsTabla();
   $lobj_Cuerpo= new cls_Cuerpo();
   $lobjbusqueda= new clsbusqueda();
   $proceso=$lobj_Cuerpo->f_Proceso("AUTOEVALUACION");
   $lsNombre_eva=$_GET["lsNombre_eva"];
   $lsidtipo=$_GET["lsidtipo"];
   $liNumero=$_GET["liNumero"];
   $lsCedula=($_GET["lsCedula"]!="")?$_GET["lsCedula"]:$_SESSION['usuario']['Cedula'];
   $lsCurso=$_GET["lsCurso"];
   $lsCarrera=$_GET["lsCarrera"];
   $lsSemestre=$_GET["lsSemestre"];
   $lsMateria=$_GET["lsMateria"];
   $lsFechaeva=$_GET["lsFechaeva"];
   $lsHoraeva=$_GET["lsHoraeva"];
   $lsnombreva=$_GET["lsnombreva"];
   $lsidtipo=$_GET["lsidtipo"];
   $laDetalle=$_SESSION["detalle"];//se recive la matriz con el datelle de formulario
   $laNota=$_SESSION["notas"];//se recive la matriz con el datelle de nota
   $liHay=$_GET["liHay"];
   $lsa=$_GET["lsa"];
   $lsMen=$_GET["lsMen"];
   $lsHacer=$_GET["lsHacer"];
   $lsOperacion=$_GET["lsOperacion"];
   $laValor=Array();
   $lsSql="select * from valoracion where (idtipo_eva='$lsidtipo')";
   //buscaqueda
   $laValor=$lobjbusqueda->fbusqueda2($lsSql,"idvaloracion","valor_real","","","");
   if ($lsHacer=="incluir")
   {
	  $lsCedula=$_SESSION["usuario"]["Cedula"];
	  $lsFechaeva=date('d/m/Y');
	  $lsHoraeva=date('h:i:s');
   }
   if ($lsa=="1")
   {
	  $lsCedula=$_SESSION["usuario"]['Cedula'];
   }
   $lobj_Cuerpo->f_Redireccion();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<title>Unefa</title>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<meta name="keywords" content="jquery, ajax, menu, desplegable, dropdown, php" />
			<link rel="Shortcut Icon" href="imagenes/logo_unefa.gif" type="image/x-icon" />   <!--Ícono que aparece en la pestaña de la página-->
			<link rel="stylesheet" type="text/css" href="css/formato.css"/>
			<script src="jquery.min.js"></script>
			<script type="text/javascript" src="JS/fecha.js" ></script>
			<?php  $lobj_Cuerpo->f_Librerias();?>
			<script>
			function cargar(x){
			if(x==1)	
			document.getElementById("abrirPop").click();
			}
			</script>
			
		</head>
			
		<body onload="cargar(<?php  if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">		
		<?php  $lobj_Cuerpo->f_Cabecera();?>
		<?php  $lobj_Cuerpo->f_Menu();?>
				<center>
				<div id="tit_cont1"><br><h2><?php  print ($lsnombreva); ?></h2></div>
				<div id="contenido2">
					
						  <FORM method="POST" name="form1" action="../controladores/corTransEva.php">
							  <INPUT type="hidden" name="txtoperacion" value="<?php  print($lsOperacion);?>">
							  <INPUT type="hidden" name="txthay" value="<?php  print($liHay);?>">
							  <INPUT type="hidden" name="txtfilas"  value="<?php  print($lsFilas);?>">
							  <INPUT type="hidden" name="txtnombreva" value="<?php  print($lsnombreva);?>" >
							  <INPUT type="hidden" name="txttipo"  value="<?php  print($lsidtipo);?>">
							  <INPUT type="hidden" name="txthacer" value="<?php  print($lsHacer);?>">
							  <br>
							  <center>
							  <TABLE width="70%" cellspacing="0" border="0" cellpadding="0" align="center">
								 <tr>
									<td align="right"></td>
									<td><INPUT type="hidden" name="txtnumero" onblur="fPerderFocusNumero()" tabindex="1" value="<?php  print($liNumero);?>" > </td>
									<td align="right">Cedula:</td>
									<td><INPUT type="text" name="txtcedula" tabindex="2" value="<?php print($lsCedula);?>" ></td>
								 </tr>
								 <tr>
								 	<td align='right'><?php  if($lsidtipo!="1"){print("");}else{print("Curso:");}?></td>
									<td> 
										<INPUT type="text" name='txtcurso' tabindex='3' value='<?php  print($lsCurso);?>' style="<?php  if($lsidtipo!="1"){print("display: none;");}else{print("display: block;");}?>" >
									</td>
									<td align="right">Carrera:</td>
									<td>
										<select name="txtcarrera" tabindex="4" ><option value="-" selected="selected">Seleccione</option><?php  $lobjCombo->fGenerar($lsSql2,"codesp","nombre",$lsCarrera,"")?></select>
									</td>
								 </tr>
								  <tr>
									<td align="right">Semestre:</td>
									<td>
										<select name="txtsemestre" tabindex="5" ><option value="-" selected="selected">Seleccione</option><?php  $lobjCombo->fGenerar($lsSql1,"idsemestre","nombre",$lsSemestre,"")?></select>
										 
									</td>
									<td align="right">Materia(s):</td>
									<td>
										<select name="txtmateria" tabindex="6" ><option value="-" selected="selected">Seleccione</option><?php  $lobjCombo->fGenerar($lsSql3,"codmat","nommat",$lsMateria,"")?></select>
									</td>
								</tr>
								 <tr>
									 <td align="right">Fecha:</td>
									<td><INPUT type="text" name="txtfechaeva" id="txtfechaeva" tabindex="7" value="<?php print($lsFechaeva);?>"> </td>
									<td align="right">Hora:</td>
									<td><INPUT type="text" name="txthoraeva" id="txthoraeva" tabindex="8" value="<?php print($lsHoraeva);?>"></td>							 
								 </tr>
							  </TABLE>
							  <br>
							  <br>
							  
							  <?php 
								 $laCombos=Array();
								 $laValoracion=Array();
								 $laAspectos2=Array();
								 $laAspectos=Array();
								 $laDocentes2=Array();
								 $laDocentes=Array();
								 $lsSql="select * from valoracion where (idtipo_eva='$lsidtipo') and (borrado='I') order by idvaloracion";// el sql para el combo de las valoraciones de este tipo de evaluacion
								 $laCombos=$lobjCombo->fTabla($lsSql,"idvaloracion","nombre","","valor_real","");
								 $lsSql="select * from  aspectosevaluativos where (idtipo='$lsidtipo') and  (borrado='I') order by idaspectos";//el sql para el arreglo que guarda los aspectos evaluativos correspondientes al tipo de evaluacion
								 $laAspectos2=$lobjCombo->fCampos($lsSql,"nombre","","idaspectos");
								 //busqueda
								 $lsSql=$lobjbusqueda->fTrans($lsidtipo,$lsCedula,$_SESSION["departamento"].".".$_SESSION["cargo"]);//sql para armar el arreglo de docentes a evaluar
								 $laDocentes2=$lobjCombo->fCampos($lsSql,"nombre1","apellido1","cedula");
								 for($liA=0;$liA<count($laAspectos2);$liA++){
								    $laAspectos[$liA]=$laAspectos2[$liA][0];
								 }
								 for($liV=0;$liV<count($laDocentes2);$liV++){
								    $laDocentes[$liV]=$laDocentes2[$liV][0];
								 }
								 
								 for($liA=0;$liA<=count($laAspectos);$liA++){
									 for ($liI=0;$liI<=count($laDocentes);$liI++)
									 {
										$laValoracion[$liA][$liI]="<select name='cmbcodigo$liI-$liA' id='cmbcodigo$liI-$liA'  onChange='fNotas($liI)' ><option value='-'>Valoración</option>";
										foreach ($laCombos as &$value){ $laValoracion[$liA][$liI].=$value;}
										$laValoracion[$liA][$liI].="</select>";
									 }
								 }
								 for($liA=0;$liA<count($laDocentes);$liA++){
									 $laMaestros[$liA]="<select name='cmbmaestros$liA' id='cmbmaestros$liA' onChange='fMaestros($liA)'  ><option value='-'>SELECIONAR TODO</option>";
									 foreach ($laCombos as &$value){ $laMaestros[$liA].=$value;}
									 $laMaestros[$liA].="</select>";
								 }
								 $lobjTabla->fPintar($laAspectos,$laDocentes,$laValoracion,"");
								  
							  ?>
							  </div>
							
							    <div botonera>
								<INPUT class='boton1' type='button' name='btnnuevo' value='Nuevo       ' tabindex='7' id='nuevo' onclick='fNuevo()'> </td>					   
								<INPUT class='boton2' type='button' name='btnguardar' value='Guardar           ' tabindex='8'id='guardar' onclick='fGuardar()'> </td >																
								<INPUT class='boton3' type='button' name='btncancelar' value='Cancelar          ' tabindex='9' id='cancelar' onclick='fCancelar()'> </td>												
								<INPUT class='boton4' type='button' name='btnbuscar' value='Buscar       ' tabindex='10' id='buscar' onclick='fBuscar()'> </td>										
								<INPUT class='boton5' type='button' name='btnmodificar' value='Modificar       ' tabindex='11' id='modificar' onclick='fModificar()'> </td>   
								<INPUT class='boton6' type='button' name='btneliminar' value='Eliminar       ' tabindex='12' id='eliminar' onclick='fEliminar()'> </td>
								
								
									<div id="impre" style="display: none;">
										<?php 
											if($lsidtipo==1){
												print ("<a href='../clslistados/pdfImpreAuto.php?lsidtipo=$lsidtipo&lsnombreva=$lsnombreva'><iNPUT class='boton7' type='button' name='btneliminar' value='Imprimir       ' tabindex='12'></a>");
											} else if($lsidtipo==2){
												print ("<a href='../clslistados/pdfImpreEstudiantes.php?lsidtipo=$lsidtipo&lsnombreva=$lsnombreva'><iNPUT class='boton7' type='button' name='btneliminar' value='Imprimir       ' tabindex='12'></a>");
											} else if($lsidtipo==3){
												print ("<a href='../clslistados/pdfImpreCoordinador.php?lsidtipo=$lsidtipo&lsnombreva=$lsnombreva'><iNPUT class='boton7' type='button' name='btneliminar' value='Imprimir       ' tabindex='12'></a>");
											} else if($lsidtipo==4){
												print ("<a href='../clslistados/pdfImpreAcompanamiento.php?lsidtipo=$lsidtipo&lsnombreva=$lsnombreva'><iNPUT class='boton7' type='button' name='btneliminar' value='Imprimir       ' tabindex='12'></a>");
											}
												
										?>
									</div> 
								</td>
								
			 		
							  </TABLE></div>
							  </center>
						   </FORM>
					<br/>
					
				</div>
				</div>

				<div id="mensajeses"></div>
		<?php  $lobj_Cuerpo->f_Pie();?>
	</body>
	<script type="text/javascript">
		proceso=<?php  print($proceso); ?>;
	</script>
	<script type="text/javascript" src="JS/gestionDeProcesos.js"></script>
	<script language="javascript">
	   fInicio();
       function fInicio()
       {
		   loF=document.form1;
			  loF=document.form1;
			  loF.txtfilas.value="<?php  print(count($laAspectos).".".count($laDocentes))?>";
			  if ((loF.txtoperacion.value!="buscar")&&(loF.txtoperacion.value!="nuevo"))
			  {
				 if (loF.txthacer.value=="Listo")
				 {
					 if (loF.txtoperacion.value=="incluir")
					 { 
						alert("Registro Incluido");
					 }
					 else if (loF.txtoperacion.value=="modificar")
					 {
						alert("Registro Modificado");
					 }
					 else if (loF.txtoperacion.value=="eliminar")
					 {
						alert("Registro Eliminado");
					 }
				 }
				 if (loF.txthacer.value!="Listo"&&loF.txthacer.value!="")
				 {
					<?php  
					if ($lsMen=="1"){
						print "alert('No se puede evaluar 2 veces al mismo docente')";
					}else{
						print "alert('No se pudo realizar la operación')";
					}
					?>	
				 }
				 fCancelar();
			  }
			  else if (loF.txtoperacion.value=="buscar")
			  {
				 if ((loF.txthay.value==1)&&(loF.txthacer.value!="incluir"))
				 {
					 fExiste();
					 fExiste2();
				 }
				 else if ((loF.txthay.value==0)&&(loF.txthacer.value!="incluir"))
				 {
					fCancelar();
					alert("Por favor realice la evaluación");
				 }
			  }
			  else if (loF.txtoperacion.value=="nuevo")
			  {
				  loF.txtoperacion.value="incluir";
				  loF.txtnumero.disabled=true;
				  loF.txtcedula.disabled=true;
				  loF.txtfechaeva.disabled=true;
				  loF.txthoraeva.disabled=true;
				  loF.btnguardar.disabled=false;
				  loF.btncancelar.disabled=false;
				  loF.btnnuevo.disabled=true;
				  loF.btnbuscar.disabled=true;
				  loF.btnmodificar.disabled=true;
				  loF.btneliminar.disabled=true;
				  for(liI=0;liI<<?php  print (count($laAspectos))?>;liI++)
				  {
					  for(liA=0;liA<<?php  print (count($laDocentes))?>;liA++)
					  {
							loF.elements["cmbcodigo"+liA+"-"+liI].disabled=false;
					  }
				  }
				  for(liV=0;liV<<?php  print (count($laDocentes))?>;liV++){
					loF.elements["txtnota"+liV].disabled=true;
				  }
				  loF.txtcedula.value="<?php  print($_SESSION["usuario"]["Cedula"])?>";
				  loF.txtcurso.focus();
			  }
	   }
       
       function fExiste()
       {
		  loF=document.form1;
		  loF.txtnumero.disabled=true;
		  loF.txtcedula.disabled=true;
		  loF.txtcurso.disabled=true;
		  loF.txtcarrera.disabled=true;
		  loF.txtsemestre.disabled=true;
		  loF.txtmateria.disabled=true;
		  loF.txtfechaeva.disabled=true;
		  loF.txthoraeva.disabled=true;
		  loF.btnguardar.disabled=true;
		  loF.btncancelar.disabled=false;
		  loF.btnnuevo.disabled=true;
		  loF.btnbuscar.disabled=true;
		  loF.btnmodificar.disabled=false;
		  loF.btneliminar.disabled=false;
		  loF.txtcedula.value="<?php  print($lsCedula);?>";
		  for(liI=0;liI<<?php  print (count($laDocentes)) ?>;liI++)
			  {
				  for(liA=0;liA<<?php  print (count($laAspectos))?>;liA++)
				  {
						loF.elements["cmbcodigo"+liI+"-"+liA].disabled=true;
				  }
			  }
			  for(liV=0;liV<<?php  print (count($laDocentes))?>;liV++){
				  loF.elements["txtnota"+liV].disabled=true;
			  }
		   document.getElementById("impre").style.display="block";
	   }
	   function fMaestros(liA){//Funcion que maneja los Combos Maestros
		   for(liV=0;liV<<?php  print (count($laAspectos))?>;liV++){
			   loF.elements["cmbcodigo"+liA+"-"+liV].value=loF.elements["cmbmaestros"+liA].value;
		   }
		   fNotas(liA);
	   }
	   function fExiste2()
       {
		  loF=document.form1;
          var laDetalle = new Array();
          var laNota = new Array();
		  
		  <?php 
				 for ($liI = 0; $liI < ((count($laDocentes))*(count($laAspectos))); $liI ++)
				 {
					print("\n laDetalle[$liI]= '".$laDetalle[$liI][1]."';");
				 }
				 for ($liA = 0; $liA < count($laDocentes); $liA ++)
				 {
					print("\n laNota[$liA]= '".$laNota[$liA][1]."';");
				 }
		  ?>
		  liV=0;
		  for(liI=0;liI<<?php  print (count($laDocentes)) ?>;liI++)
			  {
				  for(liA=0;liA<<?php  print (count($laAspectos))?>;liA++)
				  {
						loF.elements["cmbcodigo"+liI+"-"+liA].value=laDetalle[liV];
						liV++;
				  }
			  }
		   for(liI=0;liI<<?php  print (count($laDocentes)) ?>;liI++)
		   {
			  loF.elements["txtnota"+liI].value=laNota[liI];
	       }
	   }
       function fNuevo()
       {
		   loF=document.form1;
		   loF.txtoperacion.value="nuevo";
		   loF.txthacer.value="incluir";
		   loF.txtnumero.disabled=true;
		   loF.txtcedula.disabled=false;
		   loF.txtfechaeva.disabled=false;
		   loF.txthoraeva.disabled=false;
		   loF.btnguardar.disabled=false;
		   loF.btncancelar.disabled=false;
		   loF.btnnuevo.disabled=true;
		   loF.btnbuscar.disabled=true;
		   loF.btnmodificar.disabled=true;
		   loF.btneliminar.disabled=true;
		   for(liI=0;liI<<?php  print (count($laAspectos))?>;liI++)
			  {
				  for(liA=0;liA<<?php  print (count($laDocentes))?>;liA++)
				  {
						loF.elements["cmbcodigo"+liA+"-"+liI].disabled=true;
				  }
			  }
			  for(liV=0;liV<<?php  print (count($laDocentes))?>;liV++){
			   loF.elements["txtnota"+liV].disabled=true;
		   }
		   loF.submit();
       }
       
       function fCancelar()
       {
		   loF=document.form1;
		   loF.txtnumero.value="";
		   loF.txtcedula.value="";
		   loF.txtcurso.value="-";
		   loF.txtcarrera.value="-";
		   loF.txtsemestre.value="-";
		   loF.txtmateria.value="-";
		   loF.txtfechaeva.value="";
		   loF.txthoraeva.value="";
		   loF.txtoperacion.value="";
		   loF.txthacer.value="";
		   loF.txthay.value=0;
		   loF.txtnumero.disabled=true;
		   loF.txtcedula.disabled=true;
		   loF.txtcurso.disabled=true;
		   loF.txtcarrera.disabled=true;
		   loF.txtsemestre.disabled=true;
		   loF.txtmateria.disabled=true;
		   loF.txtfechaeva.disabled=true;
		   loF.txthoraeva.disabled=true;
		   loF.btnguardar.disabled=true;
		   loF.btncancelar.disabled=true;
		   loF.btnnuevo.disabled=false;
		   loF.btnbuscar.disabled=false;
		   loF.btnmodificar.disabled=true;
		   loF.btneliminar.disabled=true;
		   for(liI=0;liI<<?php  print (count($laAspectos))?>;liI++)
			  {
				  for(liA=0;liA<<?php  print (count($laDocentes))?>;liA++)
				  {
						loF.elements["cmbcodigo"+liA+"-"+liI].value="-";
						loF.elements["cmbcodigo"+liA+"-"+liI].disabled=true;
				  }
			  }
			 for(liV=0;liV<<?php  print (count($laDocentes))?>;liV++){
			   loF.elements["txtnota"+liV].disabled=true;
			   loF.elements["txtnota"+liV].value="";
		   }
		   document.getElementById("impre").style.display="none";
       }
       
       function fBuscar()
       {
		   loF=document.form1;
		   loF.txtnumero.disabled=false;
		   loF.txtnumero.focus();
		   loF.txtcedula.disabled=true;
		   loF.txtfechaeva.disabled=true;
		   loF.txthoraeva.disabled=true;
		   loF.btnguardar.disabled=true;
		   loF.btncancelar.disabled=false;
		   loF.btnnuevo.disabled=true;
		   loF.btnbuscar.disabled=true;
		   loF.btnmodificar.disabled=true;
		   loF.btneliminar.disabled=true;
	   }
	   
	   function fModificar()
       {
		   loF=document.form1;
		   loF.txtoperacion.value="modificar";
		   loF.txtfechaeva.value="<?php print(date('d/m/Y'));?>";
		   loF.txthoraeva.value="<?php print(date('h:i:s'));?>";
		   loF.txtcedula.disabled=true;
		   loF.txtcurso.disabled=false;
		   loF.txtcarrera.disabled=false;
		   loF.txtsemestre.disabled=false;
		   loF.txtmateria.disabled=false;
		   loF.txtfechaeva.disabled=false;
		   loF.txthoraeva.disabled=false;
		   loF.btnguardar.disabled=false;
		   loF.btncancelar.disabled=false;
		   loF.btnnuevo.disabled=true;
		   loF.btnbuscar.disabled=true;
		   loF.btnmodificar.disabled=true;
		   loF.btneliminar.disabled=true;
		   for(liI=0;liI<<?php  print (count($laAspectos))?>;liI++)
			  {
				  for(liA=0;liA<<?php  print (count($laDocentes))?>;liA++)
				  {
						loF.elements["cmbcodigo"+liA+"-"+liI].disabled=false;
				  }
			  }
			  for(liV=0;liV<<?php  print (count($laDocentes))?>;liV++){
			   loF.elements["txtnota"+liV].disabled=true;
		   }
		   loF.elements["cmbcodigo0-0"].focus();
       }
       
       function fEliminar()
       {
		  loF=document.form1;
		  if (confirm("Desea Eliminar"))
		  {
			 loF.txtnumero.disabled=false;
			 loF.txtoperacion.value="eliminar";
			 loF.submit();
		  }
		  else
		  {
			 fCancelar();  
		  }
	   }
	   
	   function fPerderFocusNumero()
	   {
		  loF=document.form1;
		  if (loF.txtnumero.value!="")
		  {
			 loF.txtoperacion.value="buscar";
			 loF.submit();
		  }
		  else
		  {
			 loF.txtnumero.focus();
		  }
       }
	   function fPerderFocusCedula()
	   {
		  loF=document.form1;
		  if (loF.txtcedula.value!="")
		  {
			 loF.txtoperacion.value="buscar2";
			 loF.txtnumero.disabled=false;
			 loF.submit();
		  }
		  else
		  {
			 loF.txtcedula.focus();
		  }
       }
       
       function fGuardar()
       {
		  <?php  
		   $laArreglo=Array();
		   $laDetNota=Array();
		   for($liV=0;$liV<count($laDocentes);$liV++){
			   $laDetNota[$liV][0]=$laDocentes2[$liV][1];
		   }
		   $_SESSION["notas"]=$laDetNota;
		   for($liA=0;$liA<count($laAspectos);$liA++){
			 for($liV=0;$liV<count($laDocentes);$liV++){
				$laArreglo[$liA][$liV][0]=$laAspectos2[$liA][1];
				$laArreglo[$liA][$liV][1]=$laDocentes2[$liV][1];
			  }
			}
			$_SESSION["detalle"]=$laArreglo;
		   ?>
		  loF=document.form1;
		  loF.txtnumero.disabled=false;
		  loF.txtcedula.disabled=false;
		  loF.txtfechaeva.disabled=false;
		  loF.txthoraeva.disabled=false;
		  for(liV=0;liV<<?php  print (count($laDocentes))?>;liV++){
				  loF.elements["txtnota"+liV].disabled=false;
		  }
		  if (fValidar())
		  {
		    loF.submit();
		  }
	   }
	   function fNotas(psAsp){
		   loF=document.form1;
          var laValor = new Array();
          var laValor1 = new Array();
          var laVal = parseInt("0");
		   <?php  
		   for ($liI = 0; $liI < count($laValor); $liI ++)
		   {
			   print("\n laValor[$liI]= '".$laValor[$liI][0]."';");
			   print("\n laValor1[$liI]= '".$laValor[$liI][1]."';");
		   }
		   $laVal=$laValor[0][1];
		   for ($liI = 0; $liI < count($laValor); $liI ++)
		   {
			   if($laValor[$liI][1]>$laVal){
				   $laVal=$laValor[$liI][1];
			   }
		   }
		   print("\n laVal= '$laVal';");
		   ?>
		   liNota=0;
		   liV=0;
		   for (liS=0;liS<<?php print(count($laAspectos));?>;liS++){
			   for (liV=0;liV<<?php  print(count($laValor));?>;liV++){
				   if (loF.elements["cmbcodigo"+psAsp+"-"+liS].value=="-"){
						liNota+=parseInt("0");
					}else if (loF.elements["cmbcodigo"+psAsp+"-"+liS].value==laValor[liV]){
						liNota+=parseInt(laValor1[liV]);
					}
			   }
		   }
		   liNotaF=parseInt((liNota*100)/(<?php  print(count($laAspectos));?> * laVal));
		   loF.elements["txtnota"+psAsp].value=liNotaF;
	   }
	   function fValidar()
	   {
		   lbBueno=false;
		   loF=document.form1;
		   if (loF.txtnumero.value=="")
		   {
			   alert("Numero en Blanco");
			   loF.txtnumero.focus();   
			   
		   }
		   else if (loF.txtcedula.value=="")
		   {
			   alert("Cedula en Blanco");
			   loF.txtcedula.focus();   
			  
		   }
		   else if (loF.txtfechaeva.value=="")
		   {
			   alert("Fecha en Blanco");
			   loF.txtfechaeva.focus();   
			   
		   }
		   else if (loF.txthoraeva.value=="")
		   {
			   alert("Hora en Blanco");
			   loF.txthoraeva.focus();   
			   
		   }
		   else if (!fValidarDetalle())
		   {
		      alert("No puede grabar una Evaluacion Incompleta");
		   }
		   else
		   {
			  lbBueno=true;
		   }
		   return lbBueno;
	   }
	   
	   
	   function fValidarDetalle()
	   {
		  lbDetalleCorrecto=false;
		  loF=document.form1;
		  licont=0;
		  for(liI=0;liI<<?php  print (count($laAspectos))?>;liI++)
		  {
			  for(liA=0;liA<<?php  print (count($laDocentes))?>;liA++)
			  {
				  if(loF.elements["cmbcodigo"+liA+"-"+liI].value=="-"){
					  licont++;
				  }
			  }
		  }
		  if (licont==0){
			  lbDetalleCorrecto=true;
		  }
		  return lbDetalleCorrecto;
	   }
	  
	   
    </script>
</html>
