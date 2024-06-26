<?php
include_once("../../CORE/cls_ConexionPos.php");

class  cls_Solicitudes extends  cls_Conexion{
		private $asbusqueda;

		public function __construct(){
			$this->asbusqueda="";
			$this->aa_Form=array();
		}

	/********* Funcion Obtener Busqueda   *********/
	public function fSetsbusqueda($psbusqueda){
		$this->asbusqueda=$psbusqueda;		
	}										
	/**********************************************/

	/********* Funcion Retornar Busqueda   ********/
	public function	fGetsbusqueda(){		
		return $this->asbusqueda;			
	}										
	/**********************************************/

	/********* Funcion Obtener Formulario *********/
	public function f_SetsForm($paForm){		
		$this->aa_Form=$paForm;				
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
	public function fBusqueda(){		
		$liI=0;				        	
		$ls_Sql="SELECT p.cedula, (p.nombre1 ||' '||p.nombre2) as nombres, (p.apellido1||' '||p.apellido2) as apellidos, 
					p.telefono,	p.c_electronico, c.nombre as carrera,s.nombre as semestre,per.nombre FROM persona as p
					inner join alumno as a on(p.cedula=a.cedula_est_pre)
					inner join carrera as c on(a.codesp=c.codesp)
					inner join semestre as s on(a.semestre=s.idsemestre)
					left join peraca as per on(per.estatus='A')
					where (a.cedula_est_pre='$this->asbusqueda')";
		$this->f_Con();	
			$laMatriz= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	
			$laMatriz [$liI] [0]=$la_Tupla["cedula"];        	   									    			
			$laMatriz [$liI] [1]=$la_Tupla["nombres"];    	
			$laMatriz [$liI] [2]=$la_Tupla["apellidos"];        		         								   	
			$laMatriz [$liI] [3]=$la_Tupla["telefono"];        	    									    		
			$laMatriz [$liI] [4]=$la_Tupla["c_electronico"];        	    									    
			$laMatriz [$liI] [5]=$la_Tupla["carrera"];        		        								    	
			$laMatriz [$liI] [6]=$la_Tupla["semestre"];    	
			$laMatriz [$liI] [7]=$la_Tupla["nombre"];    	
			$liI++; 		            
		}								
		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();					
		return $laMatriz;		           
	}									
	/**********************************************************************************************************************/

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	public function fBuscartipo($id){		
		$liI=0;				        	
		$ls_Sql="SELECT per.nombre as periodo,cursante.nombre AS carreracursante, cambio.nombre AS carreracambio,r.tipo_turno,s.*,p.* FROM solicitud AS s
		INNER JOIN persona AS p ON(s.solicitante=p.cedula)
		LEFT JOIN regimen AS r ON(r.idregimen=s.regimen)
		LEFT JOIN carrera AS cambio ON(cambio.codesp=s.codesp)
		INNER JOIN alumno AS e ON(e.cedula_est_pre=s.solicitante)
		INNER JOIN carrera AS cursante ON(cursante.codesp=e.codesp)
		LEFT JOIN peraca AS per ON(per.estatus='A')
		WHERE s.idsoli='$id'";
		$this->f_Con();	
		$laMatriz= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	
			$laMatriz [$liI] [0]=$la_Tupla["cedula"];        	   									    			
			$laMatriz [$liI] [1]=$la_Tupla["idtipo"]; 
			$laMatriz [$liI] [2]=$la_Tupla["nombre1"]; 
			$laMatriz [$liI] [3]=$la_Tupla["apellido1"]; 
			$laMatriz [$liI] [4]=$la_Tupla["motivo"];        		         								   	
			$laMatriz [$liI] [5]=$la_Tupla["carreracursante"];        		         								   	
			$laMatriz [$liI] [6]=$la_Tupla["periodo"];        		         								   	
			$laMatriz [$liI] [7]=$la_Tupla["fecha"];        	    									    		 	 		            
			$laMatriz [$liI] [8]=$la_Tupla["c_electronico"];        	    									    		 	 		            
			$laMatriz [$liI] [9]=$la_Tupla["telefono"];        	    									    		 	 		            
			$laMatriz [$liI] [10]=$la_Tupla["carreracambio"];        	    									    		 	 		            
			$laMatriz [$liI] [11]=$la_Tupla["tipo_turno"];        	    									    		 	 		            
		}								
		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();

		return $laMatriz;		           
	}									
	/**********************************************************************************************************************/
	
}
?>
