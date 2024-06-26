<?php
session_start();
include_once("../../CORE/cls_ConexionPos.php");

class  cls_Inscripcion extends  cls_Conexion{
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

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	public function fBuscar(){	
		$peraca=$_SESSION['peraca'];	
		$liI=0;
		$lb_Enc=false;
		$ls_Sql="SELECT a.cedula_est_pre From persona as p
				inner join alumno as a on(p.cedula=a.cedula_est_pre)
				inner join inscripcion_pre as ins on(a.cedula_est_pre=ins.cedula_est_pre)
				WHERE ins.peraca='$peraca' and a.estatus='A'
				group by a.cedula_est_pre 
				order by a.cedula_est_pre";
		$this->f_Con();	
		$laMatriz= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
			$laMatriz[$liI][0]=$la_Tupla['cedula_est_pre'];																				
			$liI++;
			$lb_Enc=true;																								
		}

		$ins=count($laMatriz);

		$ls_Sql="SELECT cedula_est_pre FROM alumno WHERE estatus='A'";
		$this->f_Con();	
		$liX=0;
		$lb_Enc=false;
		$laMatriz1= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
			$laMatriz1[$liX][0]=$la_Tupla['cedula_est_pre'];																				
			$liX++;
			$lb_Enc=true;																								
		}

		$total=count($laMatriz1);

		$noins=$total-$ins;

		$laMatriz2= array($total,$ins,$noins);
		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();

		return $laMatriz2;		           
	}									
	/**********************************************************************************************************************/

	/************************ Funcion Buscar Listado estidiantes inscritos ************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	public function fListar_Inscritos(){	
		$peraca=$_SESSION['peraca'];	
		$liI=0;
		$lb_Enc=false;
		$ls_Sql="SELECT p.nombre1,p.apellido1,p.sexo,p.telefono,p.c_electronico,a.cedula_est_pre From persona as p
				inner join alumno as a on(p.cedula=a.cedula_est_pre)
				inner join inscripcion_pre as ins on(a.cedula_est_pre=ins.cedula_est_pre)
				WHERE ins.peraca='$peraca' and a.estatus='A'
				group by p.nombre1,p.apellido1,p.sexo,p.telefono,p.c_electronico,a.cedula_est_pre 
				order by a.cedula_est_pre";
		$this->f_Con();	
		$laMatriz= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
			$laMatriz[$liI][0]=$la_Tupla['cedula_est_pre'];																				
			$laMatriz[$liI][1]=$la_Tupla['nombre1'];																				
			$laMatriz[$liI][2]=$la_Tupla['apellido1'];																				
			$laMatriz[$liI][3]=$la_Tupla['sexo'];																				
			$laMatriz[$liI][4]=$la_Tupla['telefono'];																				
			$laMatriz[$liI][5]=$la_Tupla['c_electronico'];																				
			$liI++;
			$lb_Enc=true;																								
		}

		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();

		return $laMatriz;		           
	}									
	/**********************************************************************************************************************/

	public function fListar_Total(){	
		$liI=0;
		$lb_Enc=false;
		$ls_Sql="SELECT a.cedula_est_pre,p.nombre1,p.apellido1, p.sexo, p.telefono, p.c_electronico 
				FROM alumno as a
				inner join persona as p on(a.cedula_est_pre=p.cedula)
				WHERE estatus='A'
				order by a.cedula_est_pre";
		$this->f_Con();	
		$laMatriz= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
			$laMatriz[$liI][0]=$la_Tupla['cedula_est_pre'];																				
			$laMatriz[$liI][1]=$la_Tupla['nombre1'];																				
			$laMatriz[$liI][2]=$la_Tupla['apellido1'];																				
			$laMatriz[$liI][3]=$la_Tupla['sexo'];																				
			$laMatriz[$liI][4]=$la_Tupla['telefono'];																				
			$laMatriz[$liI][5]=$la_Tupla['c_electronico'];																				
			$liI++;
			$lb_Enc=true;																								
		}

		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();

		return $laMatriz;		           
	}									
	/**********************************************************************************************************************/


	public function fInscritos_Carrera(){	
		$liI=0;
		$lb_Enc=false;
		$ls_Sql="SELECT c.nombre as carrera, count(*) as total from carrera as c
				inner join alumno as a on(c.codesp=a.codesp)
				WHERE a.estatus='A'
				group by c.nombre order by c.nombre";
		$this->f_Con();	
		$laMatriz= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
			$laMatriz[$liI][0]=$la_Tupla['carrera'];																				
			$laMatriz[$liI][1]=$la_Tupla['total'];																																								
			$liI++;
			$lb_Enc=true;																								
		}

		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();

		return $laMatriz;		           
	}									
	/**********************************************************************************************************************/
	
}
?>
