<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
class  cls_ServConf extends  cls_Bitacora{
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

	/************************ Funcion BuscarBloqueados   **************************************************************/
	/* Busca en la base de datos todos los usuarios bloqueados 														  */
	/******************************************************************************************************************/
		public function f_BuscarBloqueados(){																							
			$usuarios=Array();
			$liI=0;
			$lb_Enc=false;
			//cantidad de registro por pagina
			$cantidad=$this->aa_Form['cantidad'];
			//desde cual registro empieza la busqueda
			$inicial=$this->aa_Form['pag']*$cantidad;
			$valor=($this->aa_Form['Valor']=="")?"":"AND nombre LIKE '%".$this->aa_Form['Valor']."%'";	
			$ls_Sql="SELECT * FROM usuario WHERE estatus='B' $valor";		
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){	
				$lb_Enc=true;																								
			}
			//cantidad de paginas en la paginacions			
			$this->aa_Form['cantidadReg']=$this->f_Registro($lr_Tabla);
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();													
			
			$ls_Sql="SELECT * FROM usuario WHERE estatus='B' $valor LIMIT $cantidad OFFSET $inicial";								
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$usuarios[$liI]['Nombre']=$la_Tupla['nombre'];													
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['usuarios']=$usuarios;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/**********************************************************************************************************************/

	/************************ Funcion BuscarOnline   **********************************************************************/
	/* Busca en la base de datos todos los usuarios que tengan la session abierta										  */
	/**********************************************************************************************************************/
		public function f_BuscarOnline(){																							
			$usuarios=Array();
			$liI=0;
			$lb_Enc=false;
			//cantidad de registro por pagina
			$cantidad=$this->aa_Form['cantidad'];
			//desde cual registro empieza la busqueda
			$inicial=$this->aa_Form['pag']*$cantidad;
			$valor=($this->aa_Form['Valor']=="")?"":"AND nombre LIKE '%".$this->aa_Form['Valor']."%'";	
			$ls_Sql="SELECT * FROM usuario WHERE sesion_abierta='1' $valor";		
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){	
				$lb_Enc=true;																								
			}
			//cantidad de paginas en la paginacions			
			$this->aa_Form['cantidadReg']=$this->f_Registro($lr_Tabla);
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();													
			
			$ls_Sql="SELECT * FROM usuario WHERE sesion_abierta='1' $valor LIMIT $cantidad OFFSET $inicial";								
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$usuarios[$liI]['Nombre']=$la_Tupla['nombre'];													
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['usuarios']=$usuarios;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/**********************************************************************************************************************/
	/************************ Funcion BuscarTrans  **********************************************************************/
	/* Busca en la base de datos todos los usuarios que tengan la session abierta										  */
	/**********************************************************************************************************************/
		public function f_BuscarTrans(){																							
			$usuarios=Array();
			$liI=0;
			$cont=0;
			$lb_Enc=false;
			//cantidad de registro por pagina
			$cantidad=$this->aa_Form['cantidad'];
			//desde cual registro empieza la busqueda
			$inicial=$this->aa_Form['pag']*$cantidad;
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
			
			$ls_Sql="SELECT *,fecha(fecha) AS fecha_t FROM bitacora $fecha $usuarioT $Op ORDER BY fecha DESC,hora DESC LIMIT $cantidad OFFSET $inicial";								
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$elementos[$liI]['Usuario']=$la_Tupla['nombre_usu'];													
				$elementos[$liI]['Op']=$la_Tupla['operacion'];													
				$elementos[$liI]['Fecha']=$la_Tupla['fecha_t'];													
				$elementos[$liI]['Tabla']=$la_Tupla['tabla'];													
				$elementos[$liI]['Hora']=$la_Tupla['hora'];													
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['elementos']=$elementos;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/**********************************************************************************************************************/
	
	/************************ Funcion BuscarTrans  **********************************************************************/
	/* Busca en la base de datos todos los usuarios que tengan la session abierta										  */
	/**********************************************************************************************************************/
		public function f_BuscarAcceso(){																							
			$usuarios=Array();
			$liI=0;
			$cont=0;
			$lb_Enc=false;
			//cantidad de registro por pagina
			$cantidad=$this->aa_Form['cantidad'];
			//desde cual registro empieza la busqueda
			$inicial=$this->aa_Form['pag']*$cantidad;
			if(($this->aa_Form['Fecha_ini']!="")&&($this->aa_Form['Fecha_fin']!="")){
				$fecha="WHERE fecha BETWEEN '".$this->aa_Form['Fecha_ini']."' AND '".$this->aa_Form['Fecha_fin']."' AND";
				$cont=1;
			} 
			
			$usuarioT=" usuario LIKE '%".$this->aa_Form['Usuario']."%'";	
			$Op=($this->aa_Form['Op']=="")?"":" AND operacion LIKE '%".$this->aa_Form['Op']."%'";	
			$Ip=($this->aa_Form['Ip']=="")?"":"AND ip_acceso LIKE '%".$this->aa_Form['Ip']."%'";	
			if($cont==0){
				$fecha="WHERE";
			}
			$ls_Sql="SELECT *FROM bitacora_acceso $fecha $usuarioT $Op $Ip";		
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){	
				$lb_Enc=true;																						
			}
			//cantidad de paginas en la paginacions			
			$this->aa_Form['cantidadReg']=($this->f_Registro($lr_Tabla)=="")?0:$this->f_Registro($lr_Tabla);
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();													
			
			$ls_Sql="SELECT *,fecha(fecha) AS fecha_ac  FROM bitacora_acceso $fecha $usuarioT $Op $Ip ORDER BY fecha DESC,hora DESC LIMIT $cantidad OFFSET $inicial ";								
			$this->f_Con();																									
			$lr_Tabla=$this->f_Filtro($ls_Sql);																				
			while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																		
				$elementos[$liI]['Usuario']=$la_Tupla['usuario'];													
				$elementos[$liI]['Op']=$la_Tupla['operacion'];													
				$elementos[$liI]['Fecha']=$la_Tupla['fecha_ac'];													
				$elementos[$liI]['IP']=$la_Tupla['ip_acceso'];													
				$elementos[$liI]['Hora']=$la_Tupla['hora'];													
				$liI++;
				$lb_Enc=true;																								
			}
			$this->aa_Form['elementos']=$elementos;
			$this->f_Cierra($lr_Tabla);																						
			$this->f_Des();																									
			return $lb_Enc;																									
		}																													
	/**********************************************************************************************************************/
	
	
	/************************ Funcion desbloquearUsuario  *****************************************************************/
	/* Esta funcion se encarga de desbloquear al usuario en cuestion 													  */
	/**********************************************************************************************************************/
		public function desbloquearUsuario(){		
			$lb_Hecho=false;
			$this->f_Con();	
			$ip=$this->obtenerIP();																								
			$this->f_Acceso($ip,"Desbloqueo de Usuario".$this->aa_Form['Valor'],$_SESSION['usuario']['Nombre']);
			$this->f_Des();
			$ls_Sql="UPDATE usuario SET estatus='P'";
			$ls_Sql.=" WHERE(nombre='".$this->aa_Form['Valor']."')";
			$this->f_Con();																									
			$lb_Hecho=$this->f_Ejecutar($ls_Sql);
			$this->f_Des();
			return $lb_Hecho;																									
		}																													
	/**********************************************************************************************************************/
	
	/************************ Funcion cerrarSesion  ***********************************************************************/
	/* Esta funcion se encarga de desbloquear al usuario en cuestion 													  */
	/**********************************************************************************************************************/
		public function cerrarSesion(){		
			$lb_Hecho=false;
			$this->f_Con();	
			$ip=$this->obtenerIP();
			$this->f_Acceso($ip,"Sesion Cerrada de Manera Forzosa a usuario".$this->aa_Form['Valor'],$_SESSION['usuario']['Nombre']);
			$this->f_Des();
			$ls_Sql="UPDATE usuario SET sesion_abierta='0'";
			$ls_Sql.=" WHERE(nombre='".$this->aa_Form['Valor']."')";
			$this->f_Con();																									
			$lb_Hecho=$this->f_Ejecutar($ls_Sql);
			$this->f_Des();
			return $lb_Hecho;																									
		}																													
	/**********************************************************************************************************************/

	/************************ Funcion Buscar   ****************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	public function fBuscarServidor(){																						
		$lb_Enc=false;																								
		$ls_Sql="SELECT *FROM servidor WHERE(idconfiguracion='1')";													
		$this->f_Con();																								
		$lr_Tabla=$this->f_Filtro($ls_Sql);				
		$laMatriz= array();																		
		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																	
			$laMatriz['InFaUs']=$la_Tupla["intentos_fallidos_usuario"];										
			$laMatriz['TieInac']=$la_Tupla["tiempo_inactividad"];												
			$laMatriz['CaCla']=$la_Tupla["caducidad_clave"];													
			$laMatriz['CantPre']=$la_Tupla["cantidad_preguntas"];												
			$laMatriz['CantRes']=$la_Tupla["cantidad_respuestas"];												
			$laMatriz['HistCla']=$la_Tupla["historial_clave"];												
			$laMatriz['CodSeg']=$la_Tupla["codigo_seguridad"];												
			$lb_Enc=true;																							
		}																											
		$this->f_Cierra($lr_Tabla);																					
		$this->f_Des();
		$this->aa_Form['elemento']=$laMatriz;																								
		return $lb_Enc;																								
	}																												
	/**********************************************************************************************************************/


	/************************ Funcion Guardar   *************************************************************************/
	/* esta esta funcion modifica los datos de configuracion del servidor en la base de datos 							*/
	/* situacion																										*/
	/********************************************************************************************************************/
	public function fGuardarServidor(){																					
		$lb_Hecho=false;																							
		$ls_Sql="UPDATE servidor SET ";																			
		$ls_Sql.="Intentos_fallidos_usuario='".$this->aa_Form['InFaUs']."', ";									
		$ls_Sql.="caducidad_clave='".$this->aa_Form['CaCla']."', ";												
		$ls_Sql.="Tiempo_inactividad='".$this->aa_Form['TieInac']."', ";										
		$ls_Sql.="cantidad_preguntas='".$this->aa_Form['CantPre']."', ";										
		$ls_Sql.="cantidad_respuestas='".$this->aa_Form['CantRes']."', ";										
		$ls_Sql.="historial_clave='".$this->aa_Form['HistCla']."', ";										
		$ls_Sql.="codigo_seguridad='".$this->aa_Form['CodSeg']."' ";										
		$ls_Sql.="WHERE(idconfiguracion='1')";																																											
		if($this->f_Supervisar("Servidor",$ls_Sql,"Usuario en session")){											
			$this->f_Con();																							
			$lb_Hecho=$this->f_Ejecutar($ls_Sql);																	
			$this->f_Des();																							
		}																											
		return $lb_Hecho;																							
	}																												
	/**********************************************************************************************************************/	
}
?>
