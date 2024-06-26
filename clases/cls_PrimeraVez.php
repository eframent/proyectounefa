<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_PrimeraVez extends  cls_Bitacora{
		private $aa_Form;

		public function __construct(){
			$this->aa_Form=Array();
		}

	/********* Funcion Obtener Formulario *********/
	/**/public function f_SetsForm($pa_Form){	/**/
	/**/	$this->aa_Form=$pa_Form;			/**/
	/**/}										/**/
	/**********************************************/

	/********* Funcion Retornar Formulario ********/
	/**/public function	f_GetsForm(){			/**/
	/**/	return $this->aa_Form;				/**/
	/**/}										/**/
	/**********************************************/

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	/**/public function f_Buscar(){																						/**/
	/**/	$lb_Enc=false;																								/**/
	/**/	$ls_Sql="SELECT p.*, c.idciudad, par.idparroquia, m.idmunicipio, es.idestado,fecha(p.fecha_nac) AS fecha_nac FROM persona AS p ";/**/
	/**/	$ls_Sql.="FULL OUTER JOIN ciudad AS c ON(c.idciudad=p.idciudad) ";											/**/
	/**/	$ls_Sql.="FULL OUTER JOIN parroquia AS par ON(c.idparroquia=par.idparroquia) ";								/**/
	/**/	$ls_Sql.="FULL OUTER JOIN municipio AS m ON(par.idmunicipio=m.idmunicipio) ";								/**/
	/**/	$ls_Sql.="FULL OUTER JOIN estado AS es ON(m.idestado=es.idestado) ";										/**/
	/**/	$ls_Sql.="WHERE (p.cedula='".$_SESSION['usuario']['Cedula']."') ";											/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$la_Cedula = explode('-',$la_Tupla ["cedula"]);															/**/
	/**/		$this->aa_Form['Cedula']=$la_Cedula[1];																	/**/
	/**/		$this->aa_Form['Nacio']=$la_Cedula [0];																	/**/
	/**/		$this->aa_Form['Nombre1']=$la_Tupla["nombre1"];															/**/
	/**/		$this->aa_Form['Nombre2']=$la_Tupla["nombre2"];															/**/
	/**/		$this->aa_Form['Apellido1']=$la_Tupla["apellido1"];														/**/
	/**/		$this->aa_Form['Apellido2']=$la_Tupla["apellido2"];														/**/
	/**/		$this->aa_Form['Fecha_Nac']=$la_Tupla["fecha_nac"];														/**/
	/**/		$this->aa_Form['Lugar_Nac']=$la_Tupla["lugar_naci"];													/**/
	/**/		$this->aa_Form['Estado_civ']=$la_Tupla["edociv"];														/**/
	/**/		$this->aa_Form['Sexo']=$la_Tupla["sexo"];																/**/
	/**/		$this->aa_Form['Telefono']=$la_Tupla["telefono"];														/**/
	/**/		$this->aa_Form['Correo']=$la_Tupla["c_electronico"];													/**/
	/**/		$this->aa_Form['Estado']=$la_Tupla["idestado"];															/**/
	/**/		$this->aa_Form['Municipio']=$la_Tupla["idmunicipio"];													/**/
	/**/		$this->aa_Form['Parroquia']=$la_Tupla["idparroquia"];													/**/
	/**/		$this->aa_Form['Ciudad']=$la_Tupla["idciudad"];															/**/
	/**/		$this->aa_Form['Direccion']=$la_Tupla["direccionesp"];													/**/
	/**/		$lb_Enc=true;																							/**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	$ls_Sql="SELECT cantidad_preguntas AS cp FROM servidor WHERE idconfiguracion='1'";							/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Columnas']=$la_Tupla['cp'];																/**/
	/**/	}																											/**/
	/**/	$cantidad=$this->aa_Form['Columnas'];																		/**/
	/**/	$liX=0;																										/**/
	/**/	$ls_Sql="SELECT * FROM usuario_pregunta WHERE usuario='".$_SESSION['usuario']['Nombre']."' LIMIT $cantidad";/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/		$this->aa_Form['Preguntas'][$liX]=$la_Tupla['pregunta'];												/**/
	/**/		$this->aa_Form['Respuestas'][$liX]=$la_Tupla['respuesta'];												/**/
	/**/		$liX++;																									/**/
	/**/	}																											/**/
	/**/																												/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/


	
}
?>
