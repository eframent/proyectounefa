<?php
include_once("../CORE/cls_ConexionPos.php");

class  cls_Listado extends  cls_Conexion{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}

	/********* Funcion Obtener Formulario *********/
	public function f_SetsForm($pa_Form){	
		$this->aa_Form=$pa_Form;			
	}										
	/**********************************************/

	/********* Funcion Retornar Formulario ********/
	public function	f_GetsForm(){			
		return $this->aa_Form;				
	}										
	/**********************************************/

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	public function f_Buscar(){	
			$usuarios=Array();
			$liI=1;
			$cont=0;
			$lb_Enc=false;
			if(($this->aa_Form['Fecha_ini']!="")&&($this->aa_Form['Fecha_fin']!="")){
				$fecha="WHERE fecha BETWEEN '".$this->aa_Form['Fecha_ini']."' AND '".$this->aa_Form['Fecha_fin']."' AND";
				$cont=1;
			} 
			//$hora=($this->aa_Form['Hora']=="")?"":" hora LIKE '%".$this->aa_Form['Hora']."%'";	
			$usuarioT=" nombre_usu LIKE '%".$this->aa_Form['Usuario']."%'";	
			$Op=($this->aa_Form['Op']=="")?"":" AND operacion LIKE '%".$this->aa_Form['Op']."%'";	
			if($cont==0){
				$fecha="WHERE";
			}
			$ls_Sql="SELECT * FROM bitacora $fecha $usuarioT $Op";		
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){	
				$lb_Enc=true;																						
			}
			//cantidad de paginas en la paginacions			
			$this->aa_Form['cantidadReg']=$this->f_Registro($lr_Tabla);
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();	
			$ls_Sql="SELECT *,fecha(fecha) AS fecha_t FROM bitacora $fecha $usuarioT $Op ORDER BY fecha DESC,hora";								
			$this->f_Con();
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$elementos[$liI][0]=$la_Tupla['nombre_usu'];													
				$elementos[$liI][1]=$la_Tupla['operacion'];													
				$elementos[$liI][2]=$la_Tupla['fecha_t'];													
				$elementos[$liI][3]=$la_Tupla['tabla'];													
				$elementos[$liI][4]=$la_Tupla['hora'];													
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['elementos']=$elementos;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;	
	}																												
	/**********************************************************************************************************************/

}
?>
