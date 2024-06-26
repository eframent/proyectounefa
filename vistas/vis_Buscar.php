<?php
session_start();
include_once("../clases/cls_Cuerpo.php");
$lobj_Cuerpo= new cls_Cuerpo();
$laMatriz=$_SESSION["matriz"];
unset($_SESSION["matriz"]);
$la_Campos=$_SESSION["Campos"];
unset($_SESSION["Campos"]);
$laNombres=Array("Cedula","Primer Nombre","Segundo Nombre","Primer Apellido","Segundo SApellido");
$lsvalor=$la_Campos["valor"];

?>
<html>
<head>

	<?php $lobj_Cuerpo->f_Librerias();
		  if(isset($_GET['buscar'])){echo"<script type='text/javascript'>var buscar=1;</script>";}else{echo"<script type='text/javascript'>var buscar=0;</script>";}
	?>
	<title></title>
</head>
<body onload="f_inicio()">
<?php
		echo"<center>
		            <form name='form2' action='../controladores/cor_Buscar.php' method='POST'>
						<table tabla1>
							<tr >
								<td align='left'>
										<input type='hidden' name='pg' value='".$la_Campos['pg']."'>
										<input type='hidden' name='Operacion' value='".$la_Campos['Operacion']."'>
										<input type='text' name='valor' tabindex='2' size='30' maxlength='100' value='$lsvalor'>
										<input type='button' class='buttom' name='btnbuscar1' value='Buscar' onclick='f_Listar(0,\"\")';>
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
									printf("<p onclick='f_Cambio(this)' numero='$liI'>".$laMatriz[$liI][0]."</p>");
									printf("</td>");
									for($lia=1;$lia<$tope;$lia++){
										printf("<td id='thhh'>");
										printf("<p id='".$laNombres[$lia]."$liI'>".$laMatriz[$liI][$lia]."</p>");// se muestra Nombre
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
				</center>";
?>

</body>

<script type="text/javascript">
	function f_inicio(){
		if(buscar==1){
			f_Listar(0,"");
		}
	}
	var form=document.form2;
	function f_Listar(pg,valor){
		form.pg=pg;
		form.Operacion.value="Listar";
		form.submit();
	}
	function f_Cambio(obj){
		window.parent.document.getElementById("docente").value=obj.textContent;
		window.parent.document.getElementById("cerrar").click();
	}
</script>
</html>