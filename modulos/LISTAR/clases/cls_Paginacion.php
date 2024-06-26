<?PHP 
include_once("../clases/cls_Menu.php");
class cls_Paginacion extends cls_Menu  {
	public function f_Listar($laMatriz,$laNombres,$pg,$lsvalor,$purl,$activarUrl=1){
		echo "<div id='capaPopUp'></div>
					<div id='popUpDiv'>
						<div titulo> 
							Listado y Paginacion
							<input type='button' id='cerrar' value='X' title='Cerrar' />
						</div>
						<div id='capaContent'>
				<center>
		            <form name='form2'>
						<table tabla1>
							<tr >
								<td align='left'>
										<input type='text' name='txtval' tabindex='2' size='30' maxlength='100' value='$lsvalor'>
										<input type='button' name='btnbuscar1' value='Buscar' onclick='f_Listar(0,\"\")';>
								</td>
							</tr>
						</table>
						<table tabla2 >
							<tr>";
							if(count($laNombres)>6){
								$tope=6;
							}
							else
							{
								$tope=count($laNombres);
							}
							for($lia=0;$lia<$tope;$lia++){
								echo" <th id='th' align='left'>".$laNombres[$lia]."</th>";
							}
							unset($lia);
							echo"	
							</tr>";
								//echo count($laMatriz);
								$cantidad=8; // cantidad de resultados por página
								$num_reg=$_SESSION["num_reg"];
								unset($_SESSION["num_reg"]);
								$pages = intval(($num_reg-1) / $cantidad);// se calcula la cantidad de paginas a mostrar
								//se muestran los registros 
								$liI=0;
								$cadena="";
								for ($liI = 1; $liI <= count($laMatriz); $liI++){
									if($liI%2==0){
										printf("<tr par>");
									}else{
										printf("<tr  impar> ");
									}
									printf("<td id='dc' title='pulse si desea modificar'>");
									for($lia=0;$lia<count($laNombres);$lia++){
										$cadena.=$laNombres[$lia]."=".$laMatriz[$liI][$lia]."&";
									}
									$imprimir=(($activarUrl==1)&&(strpos($cadena,"#")===false))?"<a href='../modulos/LISTAR/clases/cls_Listar.php?".$cadena."url=".$purl."'>".$laMatriz[$liI][0]."</a>":$laMatriz[$liI][0];
									printf($imprimir);
									printf("</td>");
									for($lia=1;$lia<$tope;$lia++){
										printf("<td id='thhh'>");
										printf($laMatriz[$liI][$lia]);// se muestra Nombre
										printf("</td>");
									}
								}  	
						echo"
						</table>
					</center>
					<center>	<!-- se arma la paginacion-->
						<table  border='0' width='100%' cellpadding='0px' cellspacing='0px'
								style='color: #fff;
								font-family: 'Helvetica', Arial, sans-serif;
								font-size: 13px;'>
							<tr>";
										if (isset ($pages))
										{
											$lix=0;
											if(($pg!=0)&&($pg!=1)&&($pg!=2)){
												echo "<input pg type='button' onclick='f_Listar(0,\"$lsvalor\")' value='1'>  ... ";
											}
											for ($lix=0;$lix<=$pages;$lix++){
												if (($lix>=$pg-2)&&($lix<=$pg+2)){
													echo "<input pg type='button' onclick='f_Listar($lix,\"$lsvalor\")' value='".($lix+1)."'>";
												}
											}
											if(($pg!=$pages-2)&&($pg!=$pages-1)&&($pg!=$pages)){
												echo " ... <input pg type='button' onclick='f_Listar($pages,\"$lsvalor\")' value='".($pages+1)."'>";
											}
										}
								echo"		
							</tr>
							<tr>
								<th align='left' style='color:black' >
									Ir a pagina:<input type='text' size='3' onblur='if(!isNaN(this.value)){f_Listar(this.value-1,\"$lsvalor\");}'>
								</th>
							</tr>
						</table><!-- se termina la paginacion-->
					</form>
				</center>
			</div>	
		</div><!-- UP-->";
		}	
} 
?>