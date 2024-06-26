<?php
   /*
   *      clsTabla.php
   *      
   *      Copyleft 2013 Victor Leon, Yorfren Silva, Maria Ocanto y Javier Aranguren
   *      
   *      Este programa es software libre, puede redistribuirlo y / o modificar
   *      Bajo los términos de la GNU Licensia Pública General(GPL) publicada por
   *      La Fundación de Software Libre(FSF), bien de la versión 2 o cualquier versión posterior.
   *      
   *      Este programa se distribuye con la esperanza de que sea útil,
   *      Pero SIN NINGUNA GARANTÍA, incluso sin la garantía implícita de
   *      COMERCIALIZACIÓN o IDONEIDAD PARA UN PROPÓSITO PARTICULAR.
   */
	include_once("../modulos/BITACORA/clases/cls_Bitacora.php");
   class clsbusqueda extends cls_Bitacora
   {
	  public function __construct()
	  {
	  }
	  
	  public function __destruct()
	  {
	  }
	  
      public function fbusqueda2($psSql,$psValue,$psValue2,$psValue3,$psValue4,$psValue5)
	  {
		  /*****************************************FBUSQUEDA2*******************************************/
		  /* Esta funcion se utiliza para la realizacion de busquedas sencillas, con solo la utilizacion*/
		  /* de un sql con el cual se extrae todos lo campos que se le coloque como values, ya sea      */
		  /* cualquiera del 1 al 5                                                                      */
		  /**********************************************************************************************/
		  
		  /************************************PARAMETROS***************************************************/
		  /*      psSql: este es el sql de busqueda                                                        */
		  /*      psValue: son los nombres de los campos en la base de datos a los cuales se les va a      */
		  /*               extraer la informacion, ya sean el 1,2,3,4 o el 5.                              */
		  /*               por ejemplo si se le quiere extraer los datos de la tabla persona, expecifico   */
		  /*               en el sql la tabla persona y el psValue1, seria "cedula", el psValue2 "nombre1" */
		  /*               el psValue3 "nombre2", el psValue4 "apellido1" y al final psValue5 "apellido2"  */
		  /************************************PARAMETROS***************************************************/
		 $laResultado=array();
		 $liI=0;
	  	 $this->f_Con();
		 $lrTb=$this->f_Filtro($psSql);
		 while($laTupla=$this->f_Arreglo($lrTb))
         {
		    $laResultado[$liI][0]=$laTupla[$psValue];
		    $laResultado[$liI][1]=$laTupla[$psValue2];
			if ($psValue3!=""){
				 $laResultado[$liI][2]=$laTupla[$psValue3];
			}
			if ($psValue4!=""){
				 $laResultado[$liI][3]=$laTupla[$psValue4];
			}
			if ($psValue5!=""){
				 $laResultado[$liI][4]=$laTupla[$psValue5];
			}
			$liI++;
		 }
		 $this->f_Cierra($lrTb);
		 $this->f_Des();
		 return $laResultado;
	  }
	  public function fTrans($psidtipo,$psCedula,$psCargo){
		  /*****************************************FTRANS**********************************************/
		  /* Esta funcion se utiliza para mandar el sql correcto dependiendo del tipo                  */
		  /* de evaluacion que se le mande como parametro                                              */
		  /*********************************************************************************************/
		  
		  /************************************PARAMETROS************************************************/
		  /*       psidtipo: me trae el tipo de evaluacion                                              */
		  /*       psCedula: me trae la cedula del evaluador para cuestiones de busqueda                */
		  /*       psCargo: me trae el cargo actual del evaluador para cuestiones de busqueda           */
		  /************************************PARAMETROS************************************************/
		  if($psidtipo=="1"){
		  	//AUTOEVALUACION
			  $lsSql="SELECT nombre1,apellido1,cedula FROM persona WHERE (cedula='".$psCedula."')";
		  }else if($psidtipo=="2"){
		  	//EVALUACION ESTUDIANTES
			 $lsSql="SELECT pm.cedula_docente AS cedula,p.nombre1,p.nombre2,p.apellido1,p.apellido2 
				FROM inscripcion_pre AS i 
				INNER JOIN planificacion_materias AS pm ON(pm.pm_codigo=i.pm_codigo)
				INNER JOIN persona AS p ON(pm.cedula_docente=p.cedula)
				WHERE (i.cedula_est_pre='$psCedula')
				AND (i.peraca='".$_SESSION['peraca']."')
				GROUP BY pm.cedula_docente,p.nombre1,p.nombre2,p.apellido1,p.apellido2 ";
		  }else if($psidtipo=="3"){
		  	//EVALUACION COORDINADORES
		  	  $variable=substr($_SESSION['usuario']['Cargo'], 26);
			  $lsSql="SELECT p.nombre1, p.nombre2,p.apellido1,p.apellido2,p.cedula
						FROM carrera AS c
						INNER JOIN planificacion_sec as pla ON(c.codesp=pla.codesp)
						INNER JOIN planificacion_materias AS pm ON(pm.idplanificacion=pla.idplanificacion)
						INNER JOIN persona AS p ON(p.cedula=pm.cedula_docente)
						WHERE (c.nombre='$variable')
						AND (pla.peraca='".$_SESSION['peraca']."')
						GROUP BY p.cedula";
		  }else if($psidtipo=="4"){
		  	//EVALUACION ACOMPAÑAMIENTO DOCENTE
			  $lsSql="SELECT p.nombre1,p.apellido1,d.cedula FROM 
					  evaluadores AS e
					  INNER JOIN detalle_evaluadores as d ON (e.idevaluadores=d.idevaluadores)
					  INNER JOIN persona as p ON(p.cedula=d.cedula)
					  WHERE (e.cedula='$psCedula')
					  AND (e.peraca='".$_SESSION['peraca']."') ";
		  }
		  return $lsSql;
	  }
	  public function fPro($psidtipo){
		  /*****************************************FPRO************************************************/
		  /* Esta funcion se utiliza saber si hay un proceso activo del tipo que se recibe como        */
		  /* parametro, para ser utilizada en una validacion                                           */
		  /*********************************************************************************************/
		  
		  /************************************PARAMETROS************************************************/
		  /*       psidtipo: me trae el tipo de proceso                                                 */
		  /************************************PARAMETROS************************************************/

		 $lsResultado=false;
		 $psSql="SELECT * FROM proceso WHERE (estatus='A') AND (idtipo='$psidtipo')";
		 $this->f_Con();
		 $lrTb=$this->f_Filtro($psSql);
		 if($laTupla=$this->f_Arreglo($lrTb))
         {
		    $lsResultado=true;
		 }
		 $this->f_Cierra($lrTb);
		 $this->f_Des();
		 return $lsResultado;
	  }
	  public function fInsc(){
	  	 $lsResultado="0";
		 $psSql="SELECT num_inscripcion FROM inscripcion_pre WHERE (cedula_est_pre='".$_SESSION["usuario"]["Cedula"]."') AND (peraca='".$_SESSION["peraca"]."')";
		 $this->f_Con();
		 $lrTb=$this->f_Filtro($psSql);
		 if($laTupla=$this->f_Arreglo($lrTb))
         {
		    $lsResultado="1";
		 }
		 $this->f_Cierra($lrTb);
		 $this->f_Des();
		 return $lsResultado;
	  }
}
?>
