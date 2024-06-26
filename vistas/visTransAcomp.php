<?php 
   /*
   *      visTransAcomp.php
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
   include_once("../clases/cls_Cuerpo.php");
   require_once("../clases/clsTabla.php");
   require_once("../clases/cls_Combo.php");
   require_once("../clases/clsbusqueda.php");
   
   $lobjCombo= new cls_Combo();
   $lobjTabla=new clsTabla();
   $lobj_Cuerpo= new cls_Cuerpo();
   $lobjbusqueda= new clsbusqueda();
   $laMatriz=$_SESSION['matriz'];//se recive la matriz con la busqueda
   $lsidtipo=$_GET["lsidtipo"];
   $liNumero=$_GET["liNumero"];
   $lsCedula=$_GET["lsCedula"];
   $lsFechaeva=$_GET["lsFechaeva"];
   $lsHoraeva=$_GET["lsHoraeva"];
   $lsnombreva=$_GET["lsnombreva"];
   $lsidtipo=$_GET["lsidtipo"];
   $laDetalle=$_SESSION["detalle"];//se recive la matriz con el datelle de formulario
   unset($_SESSION["detalle"]);
   $liHay=$_GET["liHay"];
   $lsa=$_GET["lsa"];
   $lscmb=$_GET["lscmb"];
   $lsHacer=$_GET["lsHacer"];
   $lsOperacion=$_GET["lsOperacion"];
   if ($lsHacer=="incluir")
   {
	  $lsFechaeva=date('d/m/Y');
	  $lsHoraeva=date('h:i:s');
   }
$lobj_Cuerpo->f_Redireccion();
   
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<title>Unefa</title>
			<meta http-equiv="content-type" content="text/html;charset=utf-8" />
			<meta name="keywords" content="jquery, ajax, menu, desplegable, dropdown, php" />
			<link rel="stylesheet" type="text/css" href="css/formato.css"/>
			
			<link rel="Shortcut Icon" href="imagenes/logo_unefa.gif" type="image/x-icon" />   <!--Ícono que aparece en la pestaña de la página-->
			 <script type="text/javascript" src="JS/fecha.js" ></script>
		<?php  $lobj_Cuerpo->f_Librerias();?>
			
			<script>
			function cargar(x){
	         if(x==1){
	           
	           document.getElementById("abrirPop").click();
			   document.form2.txtnumero1.value="<?php  print($liNumero)?>";
			   document.form2.txtvali.focus();
			   document.form2.txtvali.value="<?php  print($lsvalor);?>";
			   }
	       }
			</script>
			
		</head>
			
		<body onScroll="bajar();" onload="cargar(<?php  if(isset($_GET['buscar'])) echo 1;else echo 0;?>)">
		<?php  $lobj_Cuerpo->f_Cabecera();?>
		<?php  $lobj_Cuerpo->f_Menu();?>
		<div contenedor>
				<div id="formulario" style="width:90%; background:white; margin-top:10px;" >
					<h2><?php  print ($lsnombreva); ?></h2>
						  <FORM method="POST" name="form1" action="../controladores/corTransAcomp.php">
							  <INPUT type="hidden" name="txtoperacion" value="<?php  print($lsOperacion);?>">
							  <INPUT type="hidden" name="txthay" value="<?php  print($liHay);?>">
							  <INPUT type="hidden" name="txtfilas"  value="<?php  print($lsFilas);?>">
							  <INPUT type="hidden" name="txtnombreva" value="<?php  print($lsnombreva);?>" >
							  <INPUT type="hidden" name="txttipo"  value="<?php  print($lsidtipo);?>">
							  <INPUT type="hidden" name="txthacer" value="<?php  print($lsHacer);?>">
						<INPUT ar type='hidden' id='abrirPop' name='2'  >
						     <INPUT type="hidden" name="txtcmb" value="<?php  print($lscmb);?>"> <!-- cuadro de texto que guarda la pag actual -->
						     <INPUT type="hidden" name="txtpagina" value="<?php  print($pg);?>"> <!-- cuadro de texto que guarda la pag actual -->
						     <INPUT type="hidden" name="txtvalor" value="<?php  print($lsvalor);?>"><!-- controla los valores de busqueda-->
							  <TABLE width="70%" cellspacing="0" border="0" cellpadding="0" align="center">
								 <tr>
									<td align="right">Número:</td>
									<td colspan="3"><INPUT type="text" name="txtnumero" onblur="fPerderFocusNumero()" tabindex="1" value="<?php print($liNumero);?>" > </td>
								</tr>
								 <tr>
									 <td align="right">Fecha:</td>
									<td><INPUT type="text" name="txtfechaeva" id="txtfechaeva" tabindex="3" value="<?php print($lsFechaeva);?>"> </td>
									<td align="right">Hora:</td>
									<td><INPUT type="text" name="txthoraeva" id="txthoraeva" tabindex="4" value="<?php print($lsHoraeva);?>"></td>							 
								 </tr>
								<tr>
									<td align="right">Nombre:</td>
									<td> <select name="txtcedula" tabindex="13" id="txtcedula" ><option value="-" selected="selected">Seleccione</option><?php  $lobjCombo->fGenerar("select d.cedula_doc, p.nombre1, p.apellido1 from persona as p inner join docente as d ON (d.cedula_doc=p.cedula)","cedula_doc","nombre1",$lsCedula,"")?></select></td>
									<td align="right">Cédula:</td>
									<td> <INPUT type="text" name="txtced" size="11"  tabindex="3" value="<?php print($lsCedula);?>"><input type="button" value="buscar" name="btnbusqueda" onclick="fBusqueda('0')" class="btnbusq" title="Buscar" ></td>
								 </tr>
							  </TABLE>
							  <br>
							  <br>
							  <?php 
								 $laCombo=Array();
								 $laCombos=Array();
								 $laCarrera=Array();
								 $laSeccion=Array();
								 $laSemestres=Array();
								 $laDocentes=Array();
								 for($liI=0;$liI<10;$liI++){
									 $lsSql="select c.codesp, c.nombre from carrera as c
									 		 inner join planificacion_sec as ps ON(c.codesp=ps.codesp) 
											 inner join planificacion_materias as dp ON(dp.idplanificacion=ps.idplanificacion)
											 where(dp.cedula_docente='".$laDetalle[$liI][0]."')
											 group by c.codesp";// el sql para el combo de las carreras
									 $laCombo[$liI]=$lobjCombo->fTabla($lsSql,"codesp","nombre","","","");
								}
								 for($liA=0;$liA<10;$liA++){
									 $laCombos=$laCombo[$liA];
									 $laCarrera[$liA]="<select name='cmbcarrera$liA' id='cmbcarrera$liA' onchange='fBusk(this.name,this.value)'  ><option value='-'>Seleccione</option>";
									 foreach ($laCombos as &$value){ $laCarrera[$liA].=$value;}
									 $laCarrera[$liA].="</select>";
								 }
								 $lsSql="select * from seccion order by idseccion";// el sql para el combo de las secciones
								 $laCombos=$lobjCombo->fTabla($lsSql,"idseccion","nombre","","","");
								 for($liA=0;$liA<10;$liA++){
									 $laSeccion[$liA]="<select name='cmbseccion$liA' id='cmbseccion$liA'  ><option value='-'>Seleccione</option>";
									 foreach ($laCombos as &$value){ $laSeccion[$liA].=$value;}
									 $laSeccion[$liA].="</select>";
								 }
								 for($liI=0;$liI<10;$liI++){
									 $lsSql="select s.idsemestre, s.nombre from semestre as s
									 		 inner join planificacion_sec as ps ON(ps.semestre=s.idsemestre)
											 inner join planificacion_materias as dp ON(dp.idplanificacion=ps.idplanificacion)
											 where(dp.cedula_docente='".$laDetalle[$liI][0]."') and (ps.codesp='".$laDetalle[$liI][1]."')
										 	 group by idsemestre";//el sql para el arreglo que guarda los semestres
									 $laCombo[$liI]=$laCombos=$lobjCombo->fTabla($lsSql,"idsemestre","nombre","","","");
								}
								 for($liA=0;$liA<10;$liA++){
									 $laCombos=$laCombo[$liA];
									 $laSemestre[$liA]="<select name='cmbsemestre$liA' id='cmbsemestre$liA' ><option value='-'>Seleccione</option>";
									 foreach ($laCombos as &$value){ $laSemestre[$liA].=$value;}
									 $laSemestre[$liA].="</select>";
								 }
								 $lsSql="select p.nombre1,p.apellido1,p.cedula 
										 from persona as p 
										 inner join docente as d ON(d.cedula_doc=p.cedula)
										 where (d.borrado='I') ";//sql para armar el arreglo de docentes a evaluar
								 $laCombos=$lobjCombo->fTabla($lsSql,"cedula","nombre1","","apellido1","");
								 for($liA=0;$liA<10;$liA++){
									 $laDocentes[$liA]="<select name='cmbdocente$liA' id='cmbdocente$liA' onchange='fBuscarYaExiste(this.name,this.value)'  ><option value='-'>Seleccione</option>";
									 foreach ($laCombos as &$value){ $laDocentes[$liA].=$value;}
									 $laDocentes[$liA].="</select>";
								 }
								 $lobjTabla->fPintarAcomp($laDocentes,$laCarrera,$laSeccion,$laSemestre);
								  
							  ?>
							  </div>
							
							     <div  botonera style="width:90%;">  
									<INPUT type='button' name='btnnuevo' value='Nuevo       ' tabindex='7'  onclick='fNuevo()'> 				   
									<INPUT type='button' name='btnguardar' value='Guardar           ' tabindex='8'id='guardar' onclick='fGuardar()'> 															
									<INPUT type='button' name='btncancelar' value='Cancelar          ' tabindex='9' id='cancelar' onclick='fCancelar()'>												
									<INPUT type='button' name='btnbuscar' value='Buscar       ' tabindex='10' id='buscar' onclick='fBuscar()'>								
									<INPUT type='button' name='btnmodificar' value='Modificar       ' tabindex='11' id='modificar' onclick='fModificar()'> 
									<INPUT type='button' name='btneliminar' value='Eliminar       ' tabindex='12' id='eliminar' onclick='fEliminar()'> 
								</div>
							  </center>
						   </FORM>
					<br/>				
				</div>
				</div>

		<?php  $lobj_Cuerpo->f_Pie();?>
				<div id='capaPopUp'></div>
					<div id='popUpDiv'>
						<div titulo> 
							Listado y Paginacion
							<input type='button' id='cerrar' value='X' title='Cerrar' />
						</div>
						<div id='capaContent'>
											<form name="form2">
												<table id="tb1" border="1">
												<tr> 
													<th id="th">
															 Elija Representante
													</th>
												</tr>
													<tr align="left">
														<th height="35px" >
															
														<input type="text" name="txtvali" tabindex="2" size="30" maxlength="100" >
														<input type="hidden" name="txtnumero1" value="<?php  print($liNumero);?>" >
															<input type="button" class="buttom" name="btnbuscar1" value="Buscar" onclick="fBusqueda('0','0')">
															<a style="cursor:pointer;" onclick="window.parent.tb_remove(true);" title="Cerrar" ><img src='../imagenes/button.png' align='right'></a>
															
														</th>
															
													</tr>
													
												</table>
											</center>
											
												
											<center>
												<table id="tb2" border="1" >
													<tr>
													
														<th id="th">cedula</th>
														<th id="th">Nombres</th>
														<th id="th">Apellidos</th>
														<th id="th">Estatus</th>
														<th id="th">Nombre de Usuario</th>
													</tr>
													<?php  
													//echo count($laMatriz);
														$cantidad=8; // cantidad de resultados por página
														$num_reg=$_SESSION["num_reg"];
														$pages = intval(($num_reg-1) / $cantidad);// se calcula la cantidad de paginas a mostrar
														//se muestran los registros 
															$liI=0;
															$li1=0;
															$lio=buscar;
															$lih=incluir;
															for ($liI = 1; $liI <= count($laMatriz); $liI++){
																	printf("<tr>");
																	printf("<td id='dc' title='pulse si desea modificar'>");
																	echo '<a  href="'.$PHP_SELF.'?									
																					liNumero='.$liNumero.'&
																					lsCedula='.$laMatriz[$liI][0].'&
																					lsOperacion=nuevo&
																					liHay=0&
																					lsHacer=incluir&
																					lsnombreva='.$lsnombreva.'">'.
																					$laMatriz[$liI][0].'</a>'; //aqui es donde se arma el hipervinculo 
																	printf("</td>");
																	
																	printf("<td id='thhh'>");
																	printf($laMatriz[$liI][3]." ".$laMatriz[$liI][4]);// se muestra Nombres
																	printf("</td>");
																	
																	printf("<td id='thhh'>");
																	printf($laMatriz[$liI][5]." ".$laMatriz[$liI][6]);// apellidos
																	printf("</td>");
																	
																	printf("<td id='thhh'> ");
																	if($laMatriz[$liI][1]=="A"){
																		printf("Activo");		// se muestra Estatus
																	}else{
																		printf("Inactivo");
																	}
																	printf("</td>");
																	
																	printf("<td id='thhh'>");
																	printf($laMatriz[$liI][7]);// nombre de usuario
																	printf("</td>");
																		
															}  
														?>	
												</table>
											</center>
										
										<center>	<!-- se arma la paginacion-->
											<table  border="0" width="100%" cellpadding="0px" cellspacing="0px"
													 style="color: #fff;
															font-family: 'Helvetica', Arial, sans-serif;
															font-size: 13px;">
												<tr>
													<th width="50%" >
														<?php 
															// Creando los enlaces de paginación con su botonera
															if ($pg != 0) 
																{ 
																	
																	$url = $pg - 1; 
																	echo "<img title='anterior' src='../imagenes/izquierda.jpg' align='right' onclick='fBusqueda(".$url.",".'"'.$lsvalor.'"'.")'>"; // boton derecho
																	$url=0;
																	echo "<img title='primera pagina' src='../imagenes/overizquierda3.jpg' align='right' onclick='fBusqueda(".$url.",".'"'.$lsvalor.'"'.")'>"; // boton inicio
																} 
														?>
													</th>
														<?php 
															if (isset ($pages)){
																$lix=0;
																for ($lix=0;$lix<=$pages;$lix++){
																	if ($lix!=$pg){
																		echo "<button onclick='fBusqueda(".$lix.",".'"'.$lsvalor.'"'.")'>".($lix+1)."</button>";
																	}
																}
															}
														?>
														<th><img src='../imagenes/no-seleccionado.jpg'></th>
													<th width="50%" align="right">
														<?php 
															if ($pg < $pages) 
																{ 
																	$url = $pg + 1;
																	echo "<img title='siguiente' src='../imagenes/derecha.jpg' align='left' onclick='fBusqueda(".$url.",".'"'.$lsvalor.'"'.")'>"; // boton izquierdo
																	echo "<img title='ultima pagina' src='../imagenes/overderecha3.jpg' align='left' onclick='fBusqueda(".$pages.",".'"'.$lsvalor.'"'.")'>"; // boton final
																} 
														?>
													</th>
												</tr>
											</table><!-- se termina la paginacion-->
										</center>
									</form>
		 
		 </div>	<!--UP-->

	</body>
	<script language="javascript">
	   fInicio();
       function fInicio()
       {
		   
		  loF=document.form1;
		  if(loF.txtcmb.value=="1"){
			  loF.txtoperacion.value="nuevo";
			  fExiste2();
		  }
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
				alert("No se pudo realizar la operación")
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
				alert("Procedimiento no Existe");
		     }
		  }
		  else if (loF.txtoperacion.value=="nuevo")
		  {
			  loF.txtoperacion.value="incluir";
			  loF.txtnumero.disabled=true;
			  loF.txtcedula.disabled=true;
			  loF.txtced.disabled=true;
			  loF.txtfechaeva.disabled=true;
			  loF.txthoraeva.disabled=true;
			  loF.btnbusqueda.disabled=false;
			  loF.btnguardar.disabled=false;
			  loF.btncancelar.disabled=false;
			  loF.btnnuevo.disabled=true;
			  loF.btnbuscar.disabled=true;
			  loF.btnmodificar.disabled=true;
			  loF.btneliminar.disabled=true;
			  if(loF.txtcmb.value!="1"){
				  for(liI=0;liI<10;liI++)
				  {
					 loF.elements["cmbdocente"+liI].disabled=false;
					 loF.elements["cmbcarrera"+liI].disabled=false;
					 loF.elements["cmbseccion"+liI].disabled=false;
					 loF.elements["cmbsemestre"+liI].disabled=false;
					 loF.elements["cmbdocente"+liI].value="-";
					 loF.elements["cmbcarrera"+liI].value="-";
					 loF.elements["cmbseccion"+liI].value="-";
					 loF.elements["cmbsemestre"+liI].value="-";
				  }
			  }
			 
		  }
	   }
       
       function fExiste()
       {
		  loF=document.form1;
		  loF.txtnumero.disabled=true;
		  loF.txtcedula.disabled=true;
		   loF.txtced.disabled=true;
		  loF.txtfechaeva.disabled=true;
		  loF.txthoraeva.disabled=true;
		  loF.btnguardar.disabled=true;
		  loF.btnbusqueda.disabled=true;
		  loF.btncancelar.disabled=false;
		  loF.btnnuevo.disabled=true;
		  loF.btnbuscar.disabled=true;
		  loF.btnmodificar.disabled=false;
		  loF.btneliminar.disabled=false;
		  for(liI=0;liI<10;liI++)
		  {
			 loF.elements["cmbdocente"+liI].disabled=true;
			 loF.elements["cmbcarrera"+liI].disabled=true;
			 loF.elements["cmbsemestre"+liI].disabled=true;
			 loF.elements["cmbseccion"+liI].disabled=true;
	      }
	   }
	   
	   function fExiste2()
       {
		   
		  loF=document.form1;
          var laDocente = new Array();
          var laCarrera = new Array();
          var laSeccion = new Array();
          var laSemestre = new Array();
          <?php 
			 for ($liI = 0; $liI < 10; $liI ++)
			 {
			    print("\n laDocente[".$liI."] = '".$laDetalle[$liI][0]."';");
			    print("\n laCarrera[".$liI."] = '".$laDetalle[$liI][1]."';");
			    print("\n laSeccion[".$liI."] = '".$laDetalle[$liI][2]."';");
			    print("\n laSemestre[".$liI."] = '".$laDetalle[$liI][3]."';");
		     }
		  ?>
		  for(liI=0;liI<10;liI++)
		  {
			  loF.elements["cmbdocente"+liI].value=laDocente[liI];
			  loF.elements["cmbcarrera"+liI].value=laCarrera[liI];
			  loF.elements["cmbseccion"+liI].value=laSeccion[liI];
			  loF.elements["cmbsemestre"+liI].value=laSemestre[liI];
		  }
	   }
       function fNuevo()
       {
		   loF=document.form1;
		   loF.txtoperacion.value="nuevo";
		   loF.txthacer.value="incluir";
		   loF.txtnumero.disabled=true;
		   loF.txtfechaeva.disabled=false;
		   loF.txthoraeva.disabled=false;
		   loF.btnguardar.disabled=false;
		   loF.btncancelar.disabled=false;
		   loF.btnnuevo.disabled=true;
		   loF.btnbuscar.disabled=true;
		   loF.btnmodificar.disabled=true;
		   loF.btneliminar.disabled=true;
		   for(liI=0;liI<10;liI++)
		   {
			 loF.elements["cmbdocente"+liI].disabled=true;
			 loF.elements["cmbcarrera"+liI].disabled=true;
			 loF.elements["cmbseccion"+liI].disabled=true;
			 loF.elements["cmbsemestre"+liI].disabled=true;
	       }
		   loF.submit();
       }
       
       function fCancelar()
       {
		   loF=document.form1;
		   loF.txtnumero.value="";
		   loF.txtcedula.value="-";
		   loF.txtced.value="";
		   loF.txtfechaeva.value="";
		   loF.txthoraeva.value="";
		   loF.txtoperacion.value="";
		   loF.txthacer.value="";
		   loF.txthay.value=0;
		   loF.txtnumero.disabled=true;
		   loF.txtcedula.disabled=true;
		   loF.txtced.disabled=true;
		   loF.txtfechaeva.disabled=true;
		   loF.txthoraeva.disabled=true;
		   loF.btnguardar.disabled=true;
		   loF.btncancelar.disabled=true;
		   loF.btnnuevo.disabled=false;
		   loF.btnbusqueda.disabled=true;
		   loF.btnbuscar.disabled=false;
		   loF.btnmodificar.disabled=true;
		   loF.btneliminar.disabled=true;
		   for(liI=0;liI<10;liI++)
		   {
			 loF.elements["cmbdocente"+liI].value="-";
			 loF.elements["cmbcarrera"+liI].value="-";
			 loF.elements["cmbseccion"+liI].value="-";
			 loF.elements["cmbsemestre"+liI].value="-";
			 loF.elements["cmbdocente"+liI].disabled=true;
			 loF.elements["cmbcarrera"+liI].disabled=true;
			 loF.elements["cmbseccion"+liI].disabled=true;
			 loF.elements["cmbsemestre"+liI].disabled=true;
	       }
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
		   loF.txtfechaeva.disabled=false;
		   loF.txthoraeva.disabled=false;
		   loF.btnguardar.disabled=false;
		   loF.btnbusqueda.disabled=false;
		   loF.btncancelar.disabled=false;
		   loF.btnnuevo.disabled=true;
		   loF.btnbuscar.disabled=true;
		   loF.btnmodificar.disabled=true;
		   loF.btneliminar.disabled=true;
		   for(liI=0;liI<10;liI++)
		   {
			 loF.elements["cmbdocente"+liI].disabled=false;
			 loF.elements["cmbcarrera"+liI].disabled=false;
			 loF.elements["cmbseccion"+liI].disabled=false;
			 loF.elements["cmbsemestre"+liI].disabled=false;
	       }
		   loF.elements["cmbcodigo0"].focus();
       }
       function fBusqueda(pg){
		   loF=document.form1;
		   loF.txtpagina.value=pg; 
		   loF.txtnumero.disabled=false; 
		   valor=document.form2.txtvali.value;
		   loF.txtvalor.value=valor;
		   loF.txtoperacion.value="busqueda";
		   loF.txtnumero.value=document.form2.txtnumero1.value;
		   loF.submit();
		   
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
		  loF=document.form1;
		  loF.txtnumero.disabled=false;
		  loF.txtcedula.disabled=false;
		  loF.txtfechaeva.disabled=false;
		  loF.txthoraeva.disabled=false;
		  if (fValidar())
		  {
		     loF.submit();
		  }
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
		   else if (loF.txtcedula.value=="-")
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
		      alert("No puede grabar una Selección sin Detalle");
		   }
		   else if (fValidarDetalle2())
		   {
		      alert("No puede grabar una fila incompleta");
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
		  liFilas=10;
		  liI=0;
		  while ((liI<liFilas)&&(!lbDetalleCorrecto))
		  {
			  if (loF.elements["cmbdocente"+liI].value!="-")
			  {
				 lbDetalleCorrecto=true;
			  }
			  if (loF.elements["cmbcarrera"+liI].value!="-")
			  {
				 lbDetalleCorrecto=true;
			  }
			  if (loF.elements["cmbseccion"+liI].value!="-")
			  {
				 lbDetalleCorrecto=true;
			  }
			  if (loF.elements["cmbsemestre"+liI].value!="-")
			  {
				 lbDetalleCorrecto=true;
			  }
			  liI++;
		   }	
		   return lbDetalleCorrecto;
	   }
	   function fValidarDetalle2()
	   {
		  Guardar=false;
		  loF=document.form1;
		  liFilas=10;
		  liI=0;
		  while ((liI<liFilas)&&(!Guardar))
		  {
			  if (loF.elements["cmbdocente"+liI].value!="-")
			  {
				 if (loF.elements["cmbcarrera"+liI].value!="-")
				  {
					 if (loF.elements["cmbsemestre"+liI].value!="-")
					  {
						 if (loF.elements["cmbseccion"+liI].value!="-")
						  {
							 Guardar=false;
						  }
						  else if (loF.elements["cmbseccion"+liI].value=="-")
						  {
							 Guardar=true;
						  }
					  }
					  else if(loF.elements["cmbsemestre"+liI].value=="-")
					  {
						  Guardar=true;
					  }
				  }
				  else if(loF.elements["cmbcarrera"+liI].value=="-")
				  {
					 Guardar=true;
				  }
			  }
			  else if(loF.elements["cmbdocente"+liI].value=="-")
			  {
				  if (loF.elements["cmbcarrera"+liI].value!="-")
					  {
						 Guardar=true;
					  }
					  else if(loF.elements["cmbcarrera"+liI].value=="-")
					  {
						 if (loF.elements["cmbsemestre"+liI].value!="-")
						  {
							 Guardar=true;
						  }
						  else if(loF.elements["cmbsemestre"+liI].value=="-")
						  {
							  if (loF.elements["cmbseccion"+liI].value!="-")
							  {
								 Guardar=true;
							  }
							  else if (loF.elements["cmbseccion"+liI].value=="-")
							  {
								 Guardar=false;
							  }
						  }
					  }
			  }
			  liI++;
		   }	
		   return Guardar;
	   }
	   
	   function fBuscarYaExiste(psNombre,psValor)
	   {
		  lbEnc=false;
		  loF=document.form1;
		  liN=psNombre.substr(10,1);
		  liN=parseInt(liN);
		  liI=0;
		  while ((liI<liN)&&(!lbEnc))
		  {
		     if (loF.elements["cmbdocente"+liI].value==psValor)
		     {
				lbEnc=true;
				alert("No se puede evaluar Dos veces al mismo Docente");
				loF.elements["cmbdocente"+liN].value="-";
			    loF.elements["cmbdocente"+liN].focus();
		     }
		     
		     liI++;
		  }
		  if(loF.txtcedula.value==psValor){
			  alert("Un docente no puede evaluarse a sí mismo en este tipo de evaluación");
				loF.elements["cmbdocente"+liN].value="-";
			    loF.elements["cmbdocente"+liN].focus();
		  }
		  if(!lbEnc){
			  fBusk(psNombre,psValor);
		  }
		  
	   }
	   function fBusk(psNombre,psValue){
		   loF=document.form1;
		   if(loF.txtoperacion.value=="modificar"){
				  if ( loF.elements[psNombre].value!="-")
				  {
					 loF.txtcmb.value="2";
					 loF.txtnumero.disabled=false;
                     loF.txtcedula.disabled=false;
					 loF.txtfechaeva.disabled=false;
					 loF.txthoraeva.disabled=false;
					 loF.txtoperacion.value="buscar";
					 loF.submit();
				  }
				  else
				  {
					 loF.elements[psNombre].focus();
				  }
			}else if(loF.txtoperacion.value=="incluir"){
				  if (loF.elements[psNombre].value!="-")
				  {
					 loF.txtcmb.value="1";
					 loF.txtoperacion.value="buscar";
					 loF.txtnumero.disabled=false;
                     loF.txtcedula.disabled=false;
					 loF.txtfechaeva.disabled=false;
					 loF.txthoraeva.disabled=false;
					 loF.submit();
				  }
				  else
				  {
					 loF.psNombre.focus();
				  }
			  }
		}
    </script>
			 <?php unset($_SESSION['matriz']); // se elimina la variable para liberar espacio en el servidor?> 
			 <?php unset($_SESSION["num_reg"]);//se elimina la variable para que por cada pag cargada el numero de registros cargue de nuevo?>
</html>
