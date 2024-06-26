<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_Estudiante extends  cls_Bitacora{
		private $aa_Form;
//AL TENER LA SEGURIDAD REEMPLAZAR EL NUMERO "2" POR EL PERIODO ACADEMICO DE LA SESSION Y "Usuario en session" POR EL USURIO DE LA VARIABLE $_SESSION
		public function __construct(){
			$this->aa_Form=Array();
		}

	/********* Funcion Obtener Formulario *************************************************/
	/**/public function f_SetsForm($pa_Form){											/**/
	/**/	$this->aa_Form=$pa_Form;													/**/
	/**/	$this->aa_Form["Contrasena"]=hash('whirlpool',$this->aa_Form["Contrasena"]);/**/
	/**/}																				/**/
	/**************************************************************************************/

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
	/**/	$ls_Sql="SELECT e.*, p.*, u.nombre, u.tipo_usu,";															/**/
	/**/	$ls_Sql.="c.idciudad, par.idparroquia, m.idmunicipio, es.idestado ";										/**/
	/**/	$ls_Sql.="FROM alumno AS e ";																				/**/
	/**/	$ls_Sql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";											/**/
	/**/	$ls_Sql.="INNER JOIN usuario AS u ON(e.cedula_est_pre=u.cedula) AND (u.tipo_usu='3') ";						/**/
	/**/	$ls_Sql.="INNER JOIN ciudad AS c ON(c.idciudad=p.idciudad) ";												/**/
	/**/	$ls_Sql.="INNER JOIN parroquia AS par ON(c.idparroquia=par.idparroquia) ";									/**/
	/**/	$ls_Sql.="INNER JOIN municipio AS m ON(par.idmunicipio=m.idmunicipio) ";									/**/
	/**/	$ls_Sql.="INNER JOIN estado AS es ON(m.idestado=es.idestado) ";												/**/
	/**/	$ls_Sql.="WHERE (e.cedula_est_pre='".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."') AND (e.borrado='I')";/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$this->aa_Form['Cedula']=$la_Tupla["cedula_est_pre"];													/**/
	/**/		$this->aa_Form['Nacio']=$la_Tupla["nac"];																/**/
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
	/**/		$this->aa_Form['Fecha_Ing']=$la_Tupla["fecing"];														/**/
	/**/		$this->aa_Form['Carrera']=$la_Tupla["codesp"];															/**/
	/**/		$this->aa_Form['Semestre']=$la_Tupla["semestre"];														/**/
	/**/		$this->aa_Form['Pensum']=$la_Tupla["idpensum"];															/**/
	/**/		$this->aa_Form['Estudios']=$la_Tupla["lugar_est"];														/**/
	/**/		$this->aa_Form['Rusnies']=$la_Tupla["codigo_rusnies"];													/**/
	/**/		$this->aa_Form['Tipo_ret']=$la_Tupla["tipo_retiro"];													/**/
	/**/		$this->aa_Form['Condicion']=$la_Tupla["condicion"];														/**/
	/**/		$this->aa_Form['Permin']=$la_Tupla["tipo_persona"];														/**/
	/**/		$this->aa_Form['Indgen']=$la_Tupla["indice_general"];													/**/
	/**/		$this->aa_Form['Etnia']=$la_Tupla["etnia_indig"];														/**/
	/**/		$this->aa_Form['Disc']=$la_Tupla["discapacidad"];														/**/
	/**/		$this->aa_Form['Estatus']=$la_Tupla["estatus"];															/**/
	/**/		$this->aa_Form['Nombre_Usu']=$la_Tupla["nombre"];														/**/
	/**/		$lb_Enc=true;																							/**/
	/**/	}																											/**/
	/**/	$this->f_Cierra($lr_Tabla);																					/**/
	/**/	$this->f_Des();																								/**/
	/**/	return $lb_Enc;																								/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Incluir  ****************************************************************************/
	/* esta funcion Incluye un regusitro en la base de datos que previamente no existeia en la misma 					  */
	/**********************************************************************************************************************/
	/**/public function f_Incluir(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	$this->aa_Form['Fecha_Nac']=$this->fFechaBD($this->aa_Form['Fecha_Nac']);									/**/
	/**/	$this->aa_Form['Fecha_Ing']=$this->fFechaBD($this->aa_Form['Fecha_Ing']);									/**/
	/**/	$ls_Sql="SELECT * FROM persona WHERE cedula='".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."'";	/**/
	/**/	$this->f_Con();																								/**/
	/**/	$lr_Tabla=$this->f_Filtro($ls_Sql);																			/**/
	/**/	if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	/**/
	/**/		$ls_Sql="SELECT * FROM alumno WHERE cedula_est_pre='".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."'";/**/
	/**/		$lr_Tabla=$this->f_Filtro($ls_Sql);																		/**/
	/**/		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																/**/
	/**/			$ls_Sql="UPDATE alumno SET borrado='I' WHERE cedula_est_pre='".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."',";/**/
	/**/			if($this->f_Supervisar("Estudiante",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/		}else{																									/**/
	/**/			$ls_Sql="INSERT INTO alumno ";																		/**/
	/**/			$ls_Sql.="(cedula_est_pre,fecing,codesp,semestre,idpensum,lugar_est";								/**/
	/**/			$ls_Sql.=",codigo_rusnies,tipo_retiro,condicion,tipo_persona,indice_general,";						/**/
	/**/			$ls_Sql.="etnia_indig,discapacidad,estatus) ";														/**/
	/**/			$ls_Sql.="VALUES ";																					/**/
	/**/			$ls_Sql.="('".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."','".$this->aa_Form['Fecha_Ing']."',";/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Carrera']."','".$this->aa_Form['Semestre']."',";						/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Pensum']."',";															/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Estudios']."','".$this->aa_Form['Rusnies']."',";						/**/
	/**/			if($this->aa_Form['Tipo_ret']!="-"){$ls_Sql.="'".$this->aa_Form['Tipo_ret']."',";}else{$ls_Sql.="Null,";}/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Condicion']."','".$this->aa_Form['Permin']."',";						/**/
	/**/			if($this->aa_Form['Indgen']!=""){$ls_Sql.="'".$this->aa_Form['Indgen']."',";}else{$ls_Sql.="Null,";}/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Etnia']."','".$this->aa_Form['Disc']."',";								/**/
	/**/			$ls_Sql.="'".$this->aa_Form['Estatus']."')";														/**/
	/**/			if($this->f_Supervisar("Estudiante",$ls_Sql,"Usuario en session")){									/**/
	/**/				$this->f_Con();																					/**/
	/**/				$lb_Hecho=$this->f_Ejecutar($ls_Sql);															/**/
	/**/				$this->f_Des();																					/**/
	/**/			}																									/**/
	/**/		}																										/**/
	/**/		$ls_Sql="INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES ";								/**/
	/**/		$ls_Sql.="('".$this->aa_Form["Nombre_Usu"]."','".$this->aa_Form["Contrasena"]."','1'";					/**/
	/**/		$ls_Sql.=",'".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."')";															/**/	
	/**/		if($this->f_Supervisar("Usuario",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/	}else {																										/**/
	/**/		$ls_Sql="INSERT INTO persona ";																			/**/
	/**/		$ls_Sql.="(cedula,nombre1,nombre2,apellido1,apellido2,fecha_nac,lugar_naci,edociv,sexo";				/**/
	/**/		$ls_Sql.=",telefono,c_electronico,idciudad) ";															/**/
	/**/		$ls_Sql.="VALUES ";																						/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."','".$this->aa_Form['Nombre1']."',";/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Nombre2']."','".$this->aa_Form['Apellido1']."',";							/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Apellido2']."','".$this->aa_Form['Fecha_Nac']."',";						/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Lugar_Nac']."','".$this->aa_Form['Estado_civ']."',";						/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Sexo']."','".$this->aa_Form['Telefono']."',";								/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Correo']."','".$this->aa_Form['Ciudad']."')";								/**/
	/**/		if($this->f_Supervisar("Persona",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/		if($this->aa_Form['Indgen']==""){$this->aa_Form['Indgen']=0;}											/**/
	/**/		$ls_Sql="INSERT INTO alumno ";																			/**/
	/**/		$ls_Sql.="(cedula_est_pre,fecing,codesp,semestre,idpensum,lugar_est";									/**/
	/**/		$ls_Sql.=",codigo_rusnies,tipo_retiro,condicion,tipo_persona,indice_general,";							/**/
	/**/		$ls_Sql.="etnia_indig,discapacidad,estatus) ";															/**/
	/**/		$ls_Sql.="VALUES ";																						/**/
	/**/		$ls_Sql.="('".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."','".$this->aa_Form['Fecha_Ing']."',";/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Carrera']."','".$this->aa_Form['Semestre']."',";							/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Pensum']."',";																/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estudios']."','".$this->aa_Form['Rusnies']."',";							/**/
	/**/		if($this->aa_Form['Tipo_ret']!="-"){$ls_Sql.="'".$this->aa_Form['Tipo_ret']."',";}else{$ls_Sql.="Null,";}/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Condicion']."','".$this->aa_Form['Permin']."',";							/**/
	/**/		if($this->aa_Form['Indgen']!=""){$ls_Sql.="'".$this->aa_Form['Indgen']."',";}else{$ls_Sql.="Null,";}	/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Etnia']."','".$this->aa_Form['Disc']."',";									/**/
	/**/		$ls_Sql.="'".$this->aa_Form['Estatus']."')";															/**/
	/**/		if($this->f_Supervisar("Estudiante",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/		$ls_Sql="INSERT INTO usuario (nombre,contrasena,tipo_usu,cedula) VALUES ";								/**/
	/**/		$ls_Sql.="('".$this->aa_Form["Nombre_Usu"]."','".$this->aa_Form["Contrasena"]."','3'";					/**/
	/**/		$ls_Sql.=",'".$this->aa_Form['Nacio']."-".$this->aa_Form['Cedula']."')";								/**/	
	/**/		if($this->f_Supervisar("Usuario",$ls_Sql,"Usuario en session")){										/**/
	/**/			$this->f_Con();																						/**/
	/**/			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																/**/
	/**/			$this->f_Des();																						/**/
	/**/		}																										/**/
	/**/	}																											/**/
	/**/	return $lb_Hecho;																							/**/
	/**/}																												/**/
	/*********************************************************************************************************************/

	/************************ Funcion Modificar   *************************************************************************/
	/* es la encargada de modificar un registro ya existia previamente en base de datos								  	  */
	/**********************************************************************************************************************/
	/**/public function f_Modificar(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	$ls_Sql="UPDATE persona SET ";																				/**/
	/**/	$ls_Sql.=" nombre1='".$this->aa_Form["Nombre1"]."', nombre2='".$this->aa_Form["Nombre2"]."',";				/**/
	/**/	$ls_Sql.=" apellido1='".$this->aa_Form["Apellido1"]."', apellido2='".$this->aa_Form["Apellido2"]."'";		/**/
	/**/	$ls_Sql.=" fecha_nac='".$this->aa_Form["Fecha_Nac"]."', lugar_naci='".$this->aa_Form["Lugar_Nac"]."'";		/**/
	/**/	$ls_Sql.=" edociv='".$this->aa_Form["Estado_civ"]."', sexo='".$this->aa_Form["Sexo"]."'";					/**/
	/**/	$ls_Sql.=" telefono='".$this->aa_Form["Telefono"]."', c_electronico='".$this->aa_Form["Correo"]."'";		/**/
	/**/	$ls_Sql.=" idciudad='".$this->aa_Form["Ciudad"]."'";														/**/
	/**/	$ls_Sql.=" WHERE (cedula='".$this->aa_Form["Cedula"]."')";													/**/
	/**/	if($this->f_Supervisar("Persona",$ls_Sql,"Usuario en session")){											/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	$ls_Sql="UPDATE alumno SET ";																				/**/
	/**/	$ls_Sql.=" fecing='".$this->aa_Form["Fecha_Ing"]."', codesp='".$this->aa_Form["Carrera"]."',";				/**/
	/**/	$ls_Sql.=" semestre='".$this->aa_Form["Semestre"]."', idpensum='".$this->aa_Form["Pensum"]."',";			/**/
	/**/	$ls_Sql.=" lugar_est='".$this->aa_Form["Estudios"]."',";													/**/
	/**/	$ls_Sql.=" codigo_rusnies='".$this->aa_Form["Rusnies"]."',";												/**/
	/**/	$ls_Sql.=" tipo_retiro='".$this->aa_Form["Tipo_ret"]."', condicion='".$this->aa_Form["Condicion"]."',";		/**/
	/**/	$ls_Sql.=" tipo_persona='".$this->aa_Form["Permin"]."',";													/**/
	/**/	$ls_Sql.=" indice_general='".$this->aa_Form["Indgen"]."', etnia_indig='".$this->aa_Form["Etnia"]."',";		/**/
	/**/	$ls_Sql.=" discapacidad='".$this->aa_Form["Disc"]."'";														/**/
	/**/	$ls_Sql.=" WHERE (cedula_est_pre='".$this->aa_Form["Cedula"]."')";											/**/
	/**/	if($this->f_Supervisar("Estudiante",$ls_Sql,"Usuario en session")){											/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	return  $lb_Hecho;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Eliminar   **************************************************************************/
	/* es la encargada de realizar el borrado logico de un registro en la base de datos									  */
	/**********************************************************************************************************************/
	/**/public function f_Eliminar(){																					/**/
	/**/	$lb_Hecho=false;																							/**/
	/**/	$ls_Sql="UPDATE alumno SET borrado='A' WHERE (cedula_est_pre='".$this->aa_Form["Cedula"]."')";				/**/
	/**/	if($this->f_Supervisar("Estudiante",$ls_Sql,"Usuario en session")){											/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	$ls_Sql="DELETE FROM usuario WHERE (cedula='".$this->aa_Form["Cedula"]."')";								/**/
	/**/	if($this->f_Supervisar("Estudiante",$ls_Sql,"Usuario en session")){											/**/
	/**/		$this->f_Con();																							/**/
	/**/		$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	/**/
	/**/		$this->f_Des();																							/**/
	/**/	}																											/**/
	/**/	return $lb_Hecho;																							/**/
	/**/}																												/**/
	/**********************************************************************************************************************/

	/************************ Funcion Listar      *************************************************************************/
	/* esta funcion se encarga de listar todos los registros que se encuentren en la base de datos  					  */
	/**********************************************************************************************************************/
	/**/	public function fListar ()																					/**/
	/**/	{																											/**/
	/**/		$laMatriz=Array();																						/**/
	/**/		$liI=1;																									/**/
	/**/		$cantidad=8;// cantidad de resultados por página														/**/
	/**/		$inicial= $this->aa_Form['pg'] * $cantidad; // desde que registro va a iniciar la busqueda				/**/
	/**/		$this->f_Con();																							/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT e.*, p.*, u.nombre, u.tipo_usu,";													/**/
	/**/			$lsSql.="c.idciudad, par.idparroquia, m.idmunicipio, es.idestado ";									/**/
	/**/			$lsSql.="FROM alumno AS e ";																		/**/
	/**/			$lsSql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";									/**/
	/**/			$lsSql.="INNER JOIN usuario AS u ON(e.cedula_est_pre=u.cedula) AND (u.tipo_usu='3') ";				/**/
	/**/			$lsSql.="LEFT JOIN ciudad AS c ON(c.idciudad=p.idciudad) ";											/**/
	/**/			$lsSql.="LEFT JOIN parroquia AS par ON(c.idparroquia=par.idparroquia) ";							/**/
	/**/			$lsSql.="LEFT JOIN municipio AS m ON(par.idmunicipio=m.idmunicipio) ";								/**/
	/**/			$lsSql.="LEFT JOIN estado AS es ON(m.idestado=es.idestado) ";										/**/
	/**/			$lsSql.="WHERE (e.borrado='I') AND ";																/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%')  ";										/**/
	/**/			$lsSql.="ORDER BY nombre1 LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT e.*, p.*, u.nombre, u.tipo_usu,";													/**/
	/**/			$lsSql.="c.idciudad, par.idparroquia, m.idmunicipio, es.idestado ";									/**/
	/**/			$lsSql.="FROM alumno AS e ";																		/**/
	/**/			$lsSql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";									/**/
	/**/			$lsSql.="INNER JOIN usuario AS u ON(e.cedula_est_pre=u.cedula) AND (u.tipo_usu='3') ";				/**/
	/**/			$lsSql.="LEFT JOIN ciudad AS c ON(c.idciudad=p.idciudad) ";											/**/
	/**/			$lsSql.="LEFT JOIN parroquia AS par ON(c.idparroquia=par.idparroquia) ";							/**/
	/**/			$lsSql.="LEFT JOIN municipio AS m ON(par.idmunicipio=m.idmunicipio) ";								/**/
	/**/			$lsSql.="LEFT JOIN estado AS es ON(m.idestado=es.idestado) ";										/**/
	/**/			$lsSql.="WHERE (e.borrado='I') ";																	/**/
	/**/			$lsSql.="ORDER BY nombre1 LIMIT $cantidad OFFSET $inicial";											/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		While($la_Tupla=$this->f_Arreglo($lrTb)){																/**/
	/**/			$laMatriz [$liI] [0]=$la_Tupla["cedula_est_pre"];													/**/
	/**/			$laMatriz [$liI] [1]=$la_Tupla["nombre1"];															/**/
	/**/			$laMatriz [$liI] [2]=$la_Tupla["nombre2"];															/**/
	/**/			$laMatriz [$liI] [3]=$la_Tupla["apellido1"];														/**/
	/**/			$laMatriz [$liI] [4]=$la_Tupla["apellido2"];														/**/
	/**/			$laMatriz [$liI] [5]=$la_Tupla["nombre"];															/**/
	/**/			$laMatriz [$liI] [6]=$la_Tupla["nac"];																/**/
	/**/			$laMatriz [$liI] [7]=$la_Tupla["estatus"];															/**/
	/**/			$laMatriz [$liI] [8]=$la_Tupla["edociv"];															/**/
	/**/			$laMatriz [$liI] [9]=$la_Tupla["sexo"];																/**/
	/**/			$laMatriz [$liI] [10]=$la_Tupla["telefono"];														/**/
	/**/			$laMatriz [$liI] [11]=$la_Tupla["c_electronico"];													/**/
	/**/			$laMatriz [$liI] [12]=$la_Tupla["idestado"];														/**/
	/**/			$laMatriz [$liI] [13]=$la_Tupla["idmunicipio"];														/**/
	/**/			$laMatriz [$liI] [14]=$la_Tupla["idparroquia"];														/**/
	/**/			$laMatriz [$liI] [15]=$la_Tupla["idciudad"];														/**/
	/**/			$laMatriz [$liI] [16]=$la_Tupla["fecing"];															/**/
	/**/			$laMatriz [$liI] [17]=$la_Tupla["codesp"];															/**/
	/**/			$laMatriz [$liI] [18]=$la_Tupla["semestre"];														/**/
	/**/			$laMatriz [$liI] [19]=$la_Tupla["idpensum"];														/**/
	/**/			$laMatriz [$liI] [23]=$la_Tupla["lugar_est"];														/**/
	/**/			$laMatriz [$liI] [24]=$la_Tupla["codigo_rusnies"];													/**/
	/**/			$laMatriz [$liI] [26]=$la_Tupla["tipo_retiro"];														/**/
	/**/			$laMatriz [$liI] [27]=$la_Tupla["condicion"];														/**/
	/**/			$laMatriz [$liI] [28]=$la_Tupla["tipo_persona"];													/**/
	/**/			$laMatriz [$liI] [30]=$la_Tupla["indice_general"];													/**/
	/**/			$laMatriz [$liI] [31]=$la_Tupla["etnia_indig"];														/**/
	/**/			$laMatriz [$liI] [32]=$la_Tupla["discapacidad"];													/**/
	/**/			$laMatriz [$liI] [33]=$la_Tupla["lugar_naci"];														/**/
	/**/			$laMatriz [$liI] [34]=$la_Tupla["fecha_nac"];														/**/
	/**/			$liI++;   																							/**/
	/**/		}																										/**/
	/**/		if ($this->aa_Form['valor']!=""){																		/**/
	/**/			$lsSql="SELECT e.*, p.*, u.nombre, u.tipo_usu,";													/**/
	/**/			$lsSql.="c.idciudad, par.idparroquia, m.idmunicipio, es.idestado ";									/**/
	/**/			$lsSql.="FROM alumno AS e ";																		/**/
	/**/			$lsSql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";									/**/
	/**/			$lsSql.="INNER JOIN usuario AS u ON(e.cedula_est_pre=u.cedula) AND (u.tipo_usu='3') ";				/**/
	/**/			$lsSql.="LEFT JOIN ciudad AS c ON(c.idciudad=p.idciudad) ";											/**/
	/**/			$lsSql.="LEFT JOIN parroquia AS par ON(c.idparroquia=par.idparroquia) ";							/**/
	/**/			$lsSql.="LEFT JOIN municipio AS m ON(par.idmunicipio=m.idmunicipio) ";								/**/
	/**/			$lsSql.="LEFT JOIN estado AS es ON(m.idestado=es.idestado) ";										/**/
	/**/			$lsSql.="WHERE (e.borrado='I') AND ";																/**/
	/**/			$lsSql.="(p.nombre1 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.nombre2 like '%".$this->aa_Form['valor']."%') OR ";										/**/
	/**/			$lsSql.="(p.apellido1 like '%".$this->aa_Form['valor']."%') OR ";									/**/
	/**/			$lsSql.="(p.apellido2 like '%".$this->aa_Form['valor']."%')  ";										/**/
	/**/		}else if ($this->aa_Form['valor']==""){																	/**/
	/**/			$lsSql="SELECT e.*, p.*, u.nombre, u.tipo_usu,";													/**/
	/**/			$lsSql.="c.idciudad, par.idparroquia, m.idmunicipio, es.idestado ";									/**/
	/**/			$lsSql.="FROM alumno AS e ";																		/**/
	/**/			$lsSql.="INNER JOIN persona AS p ON(e.cedula_est_pre=p.cedula) ";									/**/
	/**/			$lsSql.="INNER JOIN usuario AS u ON(e.cedula_est_pre=u.cedula) AND (u.tipo_usu='3') ";				/**/
	/**/			$lsSql.="LEFT JOIN ciudad AS c ON(c.idciudad=p.idciudad) ";											/**/
	/**/			$lsSql.="LEFT JOIN parroquia AS par ON(c.idparroquia=par.idparroquia) ";							/**/
	/**/			$lsSql.="LEFT JOIN municipio AS m ON(par.idmunicipio=m.idmunicipio) ";								/**/
	/**/			$lsSql.="LEFT JOIN estado AS es ON(m.idestado=es.idestado) ";										/**/
	/**/			$lsSql.="WHERE (e.borrado='I') ";																	/**/
	/**/		}																										/**/
	/**/		$lrTb=$this->f_Filtro($lsSql);																			/**/
	/**/		if (!isset($_SESSION["num_reg"])){ // revisa si la variable existe 										/**/
	/**/			$_SESSION["num_reg"]=$this->f_Registro($lrTb); // se busca la cantidad de registros 				/**/
	/**/		}																										/**/
	/**/		$this->f_Cierra($lrTb);																					/**/
	/**/		$this->f_Des();																							/**/
	/**/		return $laMatriz;																						/**/
	/**/}																												/**/
	/**********************************************************************************************************************/
}
?>
