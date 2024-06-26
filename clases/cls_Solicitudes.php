<?php
include_once("../modulos/BITACORA/clases/cls_Bitacora.php");

class  cls_Solicitudes extends  cls_Bitacora{
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
		$ls_Sql="select p.cedula, (p.nombre1 ||' '||p.nombre2) as nombres, (p.apellido1||' '||p.apellido2) as apellidos, 
					p.telefono,	p.c_electronico, c.nombre as carrera,s.nombre as semestre,per.nombre from persona as p
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


	/************************ Funcion Solicitudes   ***********************************************************************/
	/* Busca el listado de solicitudes paginado  */
	/**********************************************************************************************************************/
	public function fSolicitudes(){																
		//cantidad de registro por pagina
		$cantidad=$this->aa_Form['cantidad'];
		//desde cual registro empieza la busqueda
		$inicial=$this->aa_Form['pag']*$cantidad;
		$valor=($this->aa_Form['Valor']=="")?"":"AND nombre LIKE '%".$this->aa_Form['Valor']."%'";	
		$ls_Sql="SELECT s.*,p.*,t.nombre AS nombrets FROM solicitud AS s 
					 INNER JOIN persona AS p ON(p.cedula=s.solicitante)
					 INNER JOIN tipo_solicitud AS t ON(t.idtipo=s.idtipo)
					 WHERE t.idtipo<>'4' $valor";		
		$this->f_Con();						
		$lr_Tabla=$this->f_Filtro($ls_Sql);	
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){	
			$lb_Enc=true;					
		}
		//cantidad de paginas en la paginacions			
		$this->aa_Form['cantidadReg']=$this->f_Registro($lr_Tabla);
		$this->f_Cierra($lr_Tabla);			
		$this->f_Des();										        	
		$liI=0;				        	
		$ls_Sql="SELECT s.*,p.*,t.nombre AS nombrets,fecha(s.fecha) AS fechab FROM solicitud AS s 
					 INNER JOIN persona AS p ON(p.cedula=s.solicitante)
					 INNER JOIN tipo_solicitud AS t ON(t.idtipo=s.idtipo)
					 WHERE t.idtipo<>'4' $valor
					 ORDER BY s.fecha DESC
					 LIMIT $cantidad OFFSET $inicial";
		$this->f_Con();					
		$laMatriz= array();				
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																
			$laMatriz [$liI] ['ID']=$la_Tupla["idsoli"];        	   									    		
			$laMatriz [$liI] ['Nombre']=$la_Tupla["nombre1"]." ".$la_Tupla["apellido1"];								
			$laMatriz [$liI] ['Tipo']=$la_Tupla["nombrets"];
			$laMatriz [$liI] ['idTipo']=$la_Tupla["idtipo"];        	    									    
			$laMatriz [$liI] ['Estatus']=$la_Tupla["estatus"];        		        								
			$laMatriz [$liI] ['Codesp']=$la_Tupla["codesp"];
			$laMatriz [$liI] ['Regimen']=$la_Tupla["regimen"];
			$laMatriz [$liI] ['Solicitante']=$la_Tupla["solicitante"];        			        					
			$laMatriz [$liI] ['Fecha']=$la_Tupla["fechab"];    
			$liI++; 						
			$lb_Enc=true;															            
		}								
		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();		
		$this->aa_Form['elementos']=$laMatriz;
		return $lb_Enc;																		
	}									
	/**********************************************************************************************************************/



	/************************ Funcion Solicitud  **************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	public function fSolicitud(){
		$id=$this->aa_Form['ID'];																		        	
		$ls_Sql="SELECT s.*,p.*,t.nombre AS nombrets,c.nombre AS carrera,r.tipo_turno AS turno FROM solicitud AS s 
				INNER JOIN persona AS p ON(p.cedula=s.solicitante) 
				INNER JOIN tipo_solicitud AS t ON(t.idtipo=s.idtipo) 
				FULL OUTER JOIN regimen AS r ON(r.idregimen=s.regimen) 
				FULL OUTER JOIN carrera AS c ON(c.codesp=s.codesp) 
				WHERE s.idsoli=$id";
		$this->f_Con();					
		$laMatriz= array();
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																
			$laMatriz ['ID']=$la_Tupla["idsoli"];        	   									    		
			$laMatriz ['Nombre']=$la_Tupla["nombre1"]." ".$la_Tupla["apellido1"];								
			$laMatriz ['Tipo']=$la_Tupla["nombrets"];
			$laMatriz ['idTipo']=$la_Tupla["idtipo"];        	    									    
			$laMatriz ['Estatus']=$la_Tupla["estatus"];        		        								
			$laMatriz ['Codesp']=$la_Tupla["codesp"];
			$laMatriz ['Regimen']=$la_Tupla["regimen"];
			$laMatriz ['Solicitante']=$la_Tupla["solicitante"];        			        					
			$laMatriz ['Fecha']=$la_Tupla["fecha"];    
			$laMatriz ['Carrera']=$la_Tupla["carrera"];    
			$laMatriz ['Turno']=$la_Tupla["turno"];    
			$laMatriz ['Motivo']=$la_Tupla["motivo"];    
			$liI++; 						
			$lb_Enc=true;															            
		}								
		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();		
		$this->aa_Form['elemento']=$laMatriz;
		return $lb_Enc;																		
	}									
	/**********************************************************************************************************************/

	/************************ Funcion ComboPensum  ************************************************************************/
	/* Arma las opciones para el combo pensum dependiendo de si pido o no cambio de carrera								  */
	/**********************************************************************************************************************/
	public function fComboPensum(){
		$id=$this->aa_Form['ID'];	
		$codesp="";																	        	
		$idpensum="";																	        	
		$ls_Sql="SELECT a.*,s.* FROM solicitud AS s 
				INNER JOIN alumno AS a ON(a.cedula_est_pre=s.solicitante) 
				WHERE s.idsoli=$id";
		$this->f_Con();	
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){	    	   		        								
			$codesp=$la_Tupla["codesp"];
			$idpensum=$la_Tupla["idpensum"];										            
		}								
		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();	
		if($codesp!=""){
			$ls_Sql="SELECT * FROM pensum_pre WHERE codesp='$codesp'";
		}else{
			$ls_Sql="SELECT * FROM pensum_pre WHERE codesp=("."SELECT codesp FROM pensum_pre WHERE idpensum='$idpensum'".")";
		}
		$this->f_Con();	
		$liI=0;
		$laMatriz= array();
		$lr_Tabla=$this->f_Filtro($ls_Sql);
		while($la_Tupla=$this->f_Arreglo($lr_Tabla)){																
			$laMatriz [$liI]['ID']=$la_Tupla["idpensum"];        	   									    		
			$laMatriz [$liI]['Nombre']=$la_Tupla["nombre"];  
			$liI++; 						
			$lb_Enc=true;															            
		}								
		$this->f_Cierra($lr_Tabla);		
		$this->f_Des();
		$this->aa_Form['elementos']=$laMatriz;
		return $lb_Enc;																		
	}									
	/**********************************************************************************************************************/

	/************************ Funcion Operacion  *****************************************/
	/* Modifica en la base de datos el estatus de la solicitud segun sea la Operacion	*/
	/************************************************************************************/
	public function fOperacion(){
		$id=$this->aa_Form['ID'];
		$lb_Hecho=false;
		if($this->aa_Form['Operacion']=='rechazar'){//RECHAZAR SOLICITUD	
			$ls_Sql="UPDATE solicitud SET estatus='R' WHERE idsoli='$id'";
			if($this->f_Supervisar("Solicitud",$ls_Sql,"Usuario en session")){
				$this->f_Con();
				$lb_Hecho=$this->f_Ejecutar($ls_Sql);
				$this->f_Des();
			}
			if($lb_Hecho){
				$this->fEnviarCorreo();
			}
		}
		else if($this->aa_Form['Operacion']=="cancelarMatricula"){//CANCELACION DE MATRICULA
			$subsql="";
			$ls_Sql="UPDATE alumno SET estatus='I', tipo_retiro=
						(SELECT idtipo_ret FROM tipo_retiro WHERE abreviatura=
							(SELECT ts.nombre FROM solicitud AS s 
							 INNER JOIN tipo_solicitud AS ts ON(ts.idtipo=s.idtipo)
							 WHERE s.idsoli='$id'
							)
						) WHERE cedula_est_pre=(SELECT solicitante FROM solicitud WHERE idsoli='$id')";
			$this->f_Con();
			$this->f_Begin();
			if($this->f_SupervisarTransaccion("Cancelacion de Matricula(solicitud)",$ls_Sql,$_SESSION['usuario']['Nombre'])){
				$lb_Hecho=$this->f_Ejecutar($ls_Sql);
			}
			if($lb_Hecho){
				$ls_Sql="INSERT INTO retiro (tipo,cedula_est_pre) VALUES 
						 ((SELECT idtipo_ret FROM tipo_retiro WHERE abreviatura=
							(SELECT ts.nombre FROM solicitud AS s 
							 INNER JOIN tipo_solicitud AS ts ON(ts.idtipo=s.idtipo)
							 WHERE s.idsoli='$id'
							)
							),(SELECT solicitante FROM solicitud WHERE idsoli='$id'))";
				if($this->f_SupervisarTransaccion("Cancelacion de Matricula(solicitud)",$ls_Sql,$_SESSION['usuario']['Nombre'])){
					$lb_Hecho=$this->f_Ejecutar($ls_Sql);
				}
				if($lb_Hecho){
					$ls_Sql="UPDATE solicitud SET estatus='A' WHERE idsoli='$id'";
					if($this->f_SupervisarTransaccion("Cancelacion de Matricula(solicitud)",$ls_Sql,$_SESSION['usuario']['Nombre'])){
						$lb_Hecho=$this->f_Ejecutar($ls_Sql);
					}
				}else{
					$this->RollBack();
				}
			}else{
				$this->RollBack();
			}
			if($lb_Hecho){
				$this->f_Commit();
				$this->fEnviarCorreo();
			}else{
				$this->RollBack();
			}
			$this->f_Des();
		}else if($this->aa_Form['Operacion']=="equivalencia"){
			$pensum=$this->aa_Form['Pensum'];
			$ls_Sql="UPDATE solicitud SET estatus='E', observacion='se sugiere utilizar pensum'||' '||(";
			$ls_Sql.="SELECT nombre FROM pensum_pre WHERE idpensum='$pensum') WHERE idsoli='$id'";
			if($this->f_Supervisar("Solicitud",$ls_Sql,"Usuario en session")){
				$this->f_Con();
				$lb_Hecho=$this->f_Ejecutar($ls_Sql);
				$this->f_Des();
			}
			if($lb_Hecho){
				$this->fEnviarCorreo();
			}
			
		}
		return $lb_Hecho;																		
	}									
	/************************************************************************************/

	/************************ Funcion Solicitud  **************************************************************************/
	/* Busca en la base de datos un registro en especifico y trae todos sus campos										  */
	/**********************************************************************************************************************/
	public function fEnviarCorreo(){		
		require_once("../modulos/MAILS/clases/cls_Correos.php");												
		$lobjCorreo=new cls_Correos;
		$id=$this->aa_Form['ID'];											
		$ls_Sql="SELECT * FROM persona WHERE cedula=(SELECT solicitante FROM solicitud WHERE idsoli='$id')";						
		$laParametros=array();																					
																												
		$this->f_Con();																							
		$lr_Tabla=$this->f_Filtro($ls_Sql);																		
		if($la_Tupla=$this->f_Arreglo($lr_Tabla)){																
			$laParametros['Para']=$la_Tupla['c_electronico'];													
			$laParametros['ParaNombre']=$la_Tupla['nombre1']." ".$la_Tupla['nombre2']." ";						
			$laParametros['ParaNombre'].=$la_Tupla['apellido1']." ".$la_Tupla['apellido2'];						
		}																										
		$this->f_Cierra($lr_Tabla);																				
		$this->f_Des();
		if($this->aa_Form['Operacion']=='rechazar'){
			$laParametros['Asunto']="Cambio de Estado en Solicitud";
			$laParametros['AltContenido']="La solicitud N° <b>$id</b> a sido Rechazada.";	
			$laParametros['Contenido']='<html>
										<head>
											<meta charset="utf-8">
											<style type="text/css">
												*{
													padding: 0;
													margin: 0;
												}
												div[cabecera], div[pie]{
													width: 100%;
													background-color: rgb(41, 56, 140);
													padding: 10px 0px
												}

												div[cabecera] p{
													color: white;
													font-size: 30px;
													text-indent: 10%;
												}

												div[pie]{
													bottom: 0px;
													left: 0px;
													position: absolute;
													right: 0px;
												}

												div[pie] p{
													color: white;
													font-size: 16px;
													text-indent: 10%;
												}

												div[contenido]{
													height: auto;
													min-height: 300px;
													width: 80%;
													margin:5px auto;
												}

												h1{
													color: rgb(52, 152, 219);
													height: auto;
													font-size: 25px;
													margin-top: 30px;
												}

												a{
													color: rgb(41, 56, 140);
												}


											</style>
										</head>
										<body>
											<div cabecera>
												<p>UNEFA Portuguesa.</p>
											</div>
											<div contenido>
												<h1>La solicitud N° <b>$id</b> a sido Rechazada.</h1><br>
												
											</div>
											<div pie>
												<p>Carretera Nacional Vía Payara Sector Piedritas Blancas Edificio Pozo Blanco, Acarigua - Portuguesa.</p>
											</div>
										</body>
									</html>';	
		}else if($this->aa_Form['Operacion']=='cancelarMatricula'){
			$laParametros['Asunto']="Cambio de Estado en Solicitud";
			$laParametros['AltContenido']="La solicitud N° <b>$id</b> a sido Aprobada y Ejecutada con Exito.";	
			$laParametros['Contenido']='<html>
										<head>
											<meta charset="utf-8">
											<style type="text/css">
												*{
													padding: 0;
													margin: 0;
												}
												div[cabecera], div[pie]{
													width: 100%;
													background-color: rgb(41, 56, 140);
													padding: 10px 0px
												}

												div[cabecera] p{
													color: white;
													font-size: 30px;
													text-indent: 10%;
												}

												div[pie]{
													bottom: 0px;
													left: 0px;
													position: absolute;
													right: 0px;
												}

												div[pie] p{
													color: white;
													font-size: 16px;
													text-indent: 10%;
												}

												div[contenido]{
													height: auto;
													min-height: 300px;
													width: 80%;
													margin:5px auto;
												}

												h1{
													color: rgb(52, 152, 219);
													height: auto;
													font-size: 25px;
													margin-top: 30px;
												}

												a{
													color: rgb(41, 56, 140);
												}


											</style>
										</head>
										<body>
											<div cabecera>
												<p>UNEFA Portuguesa.</p>
											</div>
											<div contenido>
												<h1>La solicitud N° <b>$id</b> a sido Aprobada y Ejecutada con Exito.</h1><br>
												
											</div>
											<div pie>
												<p>Carretera Nacional Vía Payara Sector Piedritas Blancas Edificio Pozo Blanco, Acarigua - Portuguesa.</p>
											</div>
										</body>
									</html>';
		}else if($this->aa_Form['Operacion']=='equivalencia'){
			$laParametros['Asunto']="Cambio de Estado en Solicitud";
			$laParametros['AltContenido']="La solicitud N° <b>$id</b> a sido Pasada a un Estudio de Equivalencia ahora se encuentra en proceso.";	
			$laParametros['Contenido']='<html>
										<head>
											<meta charset="utf-8">
											<style type="text/css">
												*{
													padding: 0;
													margin: 0;
												}
												div[cabecera], div[pie]{
													width: 100%;
													background-color: rgb(41, 56, 140);
													padding: 10px 0px
												}

												div[cabecera] p{
													color: white;
													font-size: 30px;
													text-indent: 10%;
												}

												div[pie]{
													bottom: 0px;
													left: 0px;
													position: absolute;
													right: 0px;
												}

												div[pie] p{
													color: white;
													font-size: 16px;
													text-indent: 10%;
												}

												div[contenido]{
													height: auto;
													min-height: 300px;
													width: 80%;
													margin:5px auto;
												}

												h1{
													color: rgb(52, 152, 219);
													height: auto;
													font-size: 25px;
													margin-top: 30px;
												}

												a{
													color: rgb(41, 56, 140);
												}


											</style>
										</head>
										<body>
											<div cabecera>
												<p>UNEFA Portuguesa.</p>
											</div>
											<div contenido>
												<h1>La solicitud N° <b>$id</b> a sido Pasada a un Estudio de Equivalencia ahora se encuentra en proceso.</h1><br>
												
											</div>
											<div pie>
												<p>Carretera Nacional Vía Payara Sector Piedritas Blancas Edificio Pozo Blanco, Acarigua - Portuguesa.</p>
											</div>
										</body>
									</html>';
		}
		$lobjCorreo->setParametros($laParametros);																
		if($lobjCorreo->enviarCorreo()){																		
			//se envio
		}else{																									
			//no se envio																					
		}																																					
	}									
	/**********************************************************************************************************************/

	
}
?>
