<?php
include("../modulos/LISTAR/clases/cls_Paginacion.php");
class cls_Cuerpo extends cls_Paginacion{
	public function f_Cabecera(){
		echo "
			<div Cabecera id='cuerpoCabecera'>
				<img src='imagenes/br2.png') width='400px' height='35px' style='margin-left:50px'/>
			</div>	
		      ";
	}
	public function f_Botonera(){
		echo "
			<div Botonera>
				<input type='button' name='Nuevo' value='Nuevo' onclick='f_Nuevo();'/><i class='icon icon-white icon-add'></i>
				<input type='button' name='Guardar' value='Guardar' onclick='f_Guardar();'/><i class='icon icon-white icon-save'></i>
				<input type='button' name='Cancelar' value='Cancelar' onclick='f_Cancelar();'/><i class='icon icon-white icon-remove'></i>
				<input type='button' name='Buscar' value='Buscar' onclick='f_Buscar();'/><i class='icon icon-white icon-search'></i>
				<input type='button' name='Modificar' value='Modificar' onclick='f_Modificar();'/><i class='icon icon-white icon-edit'></i>
				<input type='button' name='Eliminar' value='Eliminar' onclick='f_Eliminar();'/><i class='icon icon-white icon-trash'></i>
				<input type='button' name='Listar' value='Listar' onclick='f_Listar(0,\"\");'><i class='icon icon-white icon-document'></i>
			</div>	
		      ";
	}
	public function f_Pie(){
		echo "
			<div Pie id='cuerpoPie'>
				<p>Carretera Nacional Via Payara Sector Piedritas Blancas Edificio Pozo Blanco, Acarigua - Portuguesa.</p>
			</div>	
		      ";
	}
	public function f_Librerias(){
		echo "
			<meta http-equiv='Refresh' >
	     	<meta http-equiv='content-type' content='text/html;charset=utf-8' />
			<link type='text/css' rel='stylesheet' href='css/formato.php'>
			<link type='text/css' rel='stylesheet' href='css/formulario.php'>
			<script src='JS/jquery-1.3.2.min.js' type='text/javascript'></script><!-- contiene el jquery necesario para el popUp -->
    		<link rel='stylesheet' type='text/css' href='css/poput.css' /><!-- contiene el css del popUp-->		   
    		<script type='text/javascript' src='JS/csspopup.js'></script>
			<script language='javascript' src='JS/barra.div.js'></script><!-- barra de herramientas -->
			<link rel='stylesheet' type='text/css' href='css/icons.css'>

		";
	}
	public function f_Control($la_Campos){
		echo "
		<input type='hidden' name='Operacion' value='".$la_Campos['Operacion']."'/>
		<input type='hidden' name='Hacer' value='".$la_Campos['Hacer']."'/>
		<input type='hidden' name='Hay' value='".$la_Campos['Hay']."'/>
		<INPUT type='hidden' id='abrirPop' name='2'> <!-- el id abrir pop--> 
		<INPUT type='hidden' name='pg' value='".$la_Campos['pg']."'> 
		<INPUT type='hidden' name='valor' value='".$la_Campos['valor']."'>
			";
	}
	public function f_Redireccion($direccion){
		if(array_key_exists(usuario,$_SESSION))
		{
			if(($direccion!="")&&($direccion!='estudiante')&&($direccion!="docente")){
				$lb_Enc=false;
				$Nombre=$_SESSION['usuario']['Cargo'];
			   	$ls_Sql="SELECT s.*,m.* FROM permiso AS p 
					INNER JOIN submodulo AS s ON(s.sub_codigo=p.fk_sub_codigo)
					INNER JOIN modulo AS m ON(m.mod_codigo=s.fk_mod_codigo)
					WHERE (p.fk_car_codigo=(
						SELECT car_codigo FROM cargo 
						WHERE(car_nombre='$Nombre')
					)) 
					AND (m.mod_estatus<>'B') 
					AND (s.sub_estatus<>'B')
					AND (s.sub_ruta='$direccion')
					ORDER by m.mod_nombre, s.sub_nombre";
				$this->f_Con();
				$lrTb=$this->f_Filtro($ls_Sql);
				if($laTupla=$this->f_Arreglo($lrTb))
		        {
					$lb_Enc=true;
				}
				$this->f_Cierra($lrTb);
				$this->f_Des();
				if(!$lb_Enc){
			 		header('location: vis_Salir.php?ruta='.substr($direccion, 4));
				}
			}else if($direccion=='estudiante'){
				if($_SESSION['usuario']['Tipo']!='3'){
					header('location: vis_Salir.php?ruta=____zonaEstudiante');
				}
			}else if($direccion=="docente"){
				if($_SESSION['usuario']['Tipo']!='2'){
					print("entro");
					//header('location: vis_Salir.php?ruta=____zonaDocente');
				}
			}
		}else{
			header('location: vis_Salir.php');
		}
	}
	public function f_Proceso($psNombreProceso)
	{
		$lb_Enc=0;
		include_once("../clases/cls_Proceso.php");
		$lobjProceso= new cls_Proceso();
		$lb_Enc=$lobjProceso->f_ComprobarPro($psNombreProceso);
		return $lb_Enc;
	}
}

	
?>
