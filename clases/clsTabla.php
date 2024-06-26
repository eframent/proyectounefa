<?php
   /*
   *      clsTabla.php
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
   class clsTabla
   {
	  public function __construct()
	  {
	  }
	  
	  public function __destruct()
	  {
	  }
	  
      public function fPintar($paAspectos,$paDocentes,$paValoracion,$paMaestros)
	  {
		  //paAspectos es un arreglo que guarda los aspectos evaluativos
		  //paDocentes es un arreglo q guarda los docentes a evaluar
	      //paValoracion es un arreglo que guarda el codigo html de un combo de valoracion generado desde la base de datos
		  for ($liD=0;$liD<count($paDocentes);$liD++)
			{
				$laNota[$liD]="<input type='text' name='txtnota$liD' >";//donde se guarada la nota final  
				$laObserv[$liD]="<textarea name='txtobserv$liD'  tabindex='2'  rows='5' cols='15' maxlength='160'></textarea>";//donde va las observaciones
			}
			
			print "<div id='voladora'>";
				print "<table id='formato'  style='float:left;'>";
					print "<tr>";
						print "<td  colspan=2 id='nombre'>";	
							print "Nombre Docente";
						print "</td>";
					print "</tr>";
					print "<tr>";
						print "<td id='numero'>";
							print "N°";
						print "</td>";
						print "<td id='titulo-aspectos' >";
							print "Aspectos Evaluativos";
						print "</td>";
					print "</tr>";
					for($liA=0;$liA<count($paAspectos);$liA++){
						print "<tr>";
							print "<td id='numero'>";//numero de aspectos
								print ($liA+1);
							print "</td>";
							print "<td id='aspectos'>";//aspectos evaluativos
								print ($paAspectos[$liA]);
							print "</td>";
						print "</tr>";
					}
					print "<tr>";
						print "<td align=right style='height:40px; background: white;'></td>";
						print "<td align=right style='height:40px; background: white;'  > Nota Total:</td>";
						
						print "</tr>";
					print "</table>";
			print "</div>";
/***********************************************TABLA 2********************************************************/				
			print "<div name='new' >";	
				print "<table  style='width:10%' >";
						print "<tr>";
							for($lii=0;$lii<count($paDocentes);$lii++)
							{
								print "<td id='nombreu'>";//docente
									print ($paDocentes[$lii]);
								print "</td>";
							}	
						print "</tr>";
						print "<tr>";
							for ($lia=0;$lia<count($paDocentes);$lia++)
							{
								print "<td align=center id='valoracion1'>";
									print ($paMaestros[$lia]);
								print "</td>";
							}
						print "</tr>";
						for($liA=0;$liA<count($paAspectos);$liA++){
							print "<tr>";
								for($liV=0;$liV<count($paDocentes);$liV++){
									print "<td id='valoracion'>";//valoraciones
									print ($paValoracion[$liA][$liV]);
									print "</td>";
								}
							print "</tr>";
						}
						print "<tr>";
							for ($liO=0;$liO<count($paDocentes);$liO++)
							{
								print "<td align=center id='valoracion1'>";
									print ($laNota[$liO]);
								print "</td>";
							}
						print "</tr>";
				print "</table>";	
			print "</div>";	
   }
      public function fPintarAcomp($paDocentes,$paCarrera,$paSeccion,$paSemestre)
	  {
		   print "<table   align='center' width='100%' >";
				print "<tr align='center'><td id='titulo'>Docente</td><td id='titulo-aspectos1'>Carrera</td><td id='titulo-aspectos1' >Semestre</td><td id='titulo1'>Seccion</td></tr>";
				for($liI=0;$liI<10;$liI++){
					print "<tr>";
						print "<td id='numero'>".$paDocentes[$liI]."</td>";
						print "<td id='numero'>".$paCarrera[$liI]."</td>";
						print "<td id='numero'>".$paSemestre[$liI]."</td>";
						print "<td id='numero'>".$paSeccion[$liI]."</td>";
					print "</tr>";
				}
			print "</table>";
	  }
   public function fPintarPlani($paCedula_doc,$paCodmat,$paTope){
	   print "<table align='center' width='80%'  border='1px pointer' class='plani'>";
			print "<tr>";
				print"<td align='center' bgcolor='#BCE6E9' class='plani'>";
					print "<br>Selecione Docente<br>";
				print"</td>";
				print"<td align='center' bgcolor='#BCE6E9' class='plani'>";
					print "<br>Selecione Materia<br>";
				print"</td>";
				print"<td align='center' bgcolor='#BCE6E9'class='plani'>";
					print "<br>Tope de estudiantes<br>";
				print"</td>";
			print"</tr>";
			for ( $liI=0;$liI<7;$liI++){
				print "<tr>";
					print "<td align='center' class='td'>";
						print ($paCedula_doc[$liI]);
					print "</td>"; 
					print "<td align='center' class='td'>";
						print ($paCodmat[$liI]);
					print "</td>"; 
					print "<td align='center'class='td'>";
						print ($paTope[$liI]);
					print "</td>"; 
				print "</tr>";
			}
		print"</table>";
	   
   }

   
    public function fPintarNota($pscedula_est_pre,$psnotdef,$pscondicion){
	   print "<table align='center' width='95%' border='1px' class='tabla'>";
			print "<tr>";
				print"<td align='center'>";
					print "<b>Cedula</b>";
				print"</td>";
				print"<td align='center'>";
					print "<b>Nombre y Apellido</b>";
				print"</td>";
				print"<td align='center'>";
					print "<b>Nota Definitiva</b>";
				print"</td>";
				print"<td align='center'>";
					print "<b>Condición</b>";
				print"</td>";
			print"</tr>";
			for ( $liI=0;$liI<count($pscedula_est_pre);$liI++){
				print "<tr>";
					print "<td>";
						print ($pscedula_est_pre[$liI][0]);
					print "</td>"; 
					print "<tr>";
					print "<td>";
						print ($pscedula_est_pre[$liI][1]);
					print "</td>"; 
					
						print ($psnotdef[$liI]);
					print "</td>"; 
					print "<td>";
						print ($pscondicion[$liI]);
					print "</td>"; 
				print "</tr>";
			}
		print"</table>";
	   
   }
    public function fPintarIns($paSemestre,$paCodmat,$paResultado,$paCon){
	   print "<table  class='tabla'>";
			print "<tr>";
				print"<td>";
					print "Semestre";
				print"</td>";
				print"<td>";
					print "Materia";
				print"</td>";
				print"<td>";
					print "Código de Materia";
				print"</td>";
				print"<td>";
					print "Crédito";
				print"</td>";
				print"<td>";
					print "Sección";
				print"</td>";
			print"</tr>";
			for ( $liI=0;$liI<9;$liI++){
				print "<tr>";
					print "<td>";
						print ($paSemestre[$liI]);
					print "</td>"; 
					print "<td>";
						print ($paCodmat[$liI][2]);
					print "</td>"; 
					print "<td>";
						print ($paCodmat[$liI][1]);
					print "</td>"; 
					print "<td>";
						print ($paCodmat[$liI][0]);
					print "</td>"; 
					print "<td>";
						print ($paResultado[$liI]);
					print "</td>"; 
					print "<td>";
						print ($pCon[$liI]);
					print "</td>"; 
				print "</tr>";
				
				
			}
	  
				print "</tr>";
	   
   }
}
?>
