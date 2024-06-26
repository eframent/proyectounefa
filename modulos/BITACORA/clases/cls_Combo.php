<?php
   /*
   *      clsCombo.php
   *      
   *      Copyright 2012 José Baldomero Silva Hernández jobasiher@cantv.net
   *      
   *      Este programa es software libre, puede redistribuirlo y / o modificar
   *      Bajo los términos de la GNU Licensia Pública General(GPL) publicada por
   *      La Fundación de Software Libre(FSF), bien de la versión 2 o cualquier versión posterior.
   *      
   *      Este programa se distribuye con la esperanza de que sea útil,
   *      Pero SIN NINGUNA GARANTÍA, incluso sin la garantía implícita de
   *      COMERCIALIZACIÓN o IDONEIDAD PARA UN PROPÓSITO PARTICULAR.
   */
   require_once("../CORE/cls_ConexionPos.php");
   class cls_Combo extends cls_Conexion
   {
	  
	  public function __construct()
	  {
	  }
	  
	  public function __destruct()
	  {
	  }
	  
      public function fGenerar($psSql,$psValue,$psNombre,$psSeleccionado,$psPadre)//el psValue guarda el nombre del campo primary de la tabla y el psSelecionado el que se codigo seleccionado en ese momento
	  {
		 $lbResultado=false;
		 $this->f_Con();
		 $lrTb=$this->f_Filtro($psSql);
		 while($laTupla=$this->f_Arreglo($lrTb))
         {
			$lbResultado=true;
		    $lsValue=$laTupla[$psValue];
			$lsNombre=$laTupla[$psNombre];
			$lsPadre=$laTupla[$psPadre];
			if($psPadre!=""){
				$cadena="class='hijo $lsPadre'";
			}
			if ($lsValue==$psSeleccionado)
			{
			   print("<option value='$lsValue' $cadena selected>$lsNombre  $lsNombre2</option>");
			}
			else
			{
			   print("<option value='$lsValue' $cadena >$lsNombre  $lsNombre2</option>");
			}
		 }
		 $this->f_Cierra($lrTb);
		 $this->f_Des();
		 return $lbResultado;
	  }
	  public function fTabla($psSql,$psValue,$psNombre,$psSeleccionado,$psNombre2,$psPadre)//el psValue guarda el nombre del campo primary de la tabla y el psSelecionado el que se codigo seleccionado en ese momento
	  {
		 $laResultado=array();
		 $liI=0;
		 $this->f_Con();
		 $lrTb=$this->f_Filtro($psSql);
		 while($laTupla=$this->f_Arreglo($lrTb))
         {
		    $lsValue=$laTupla[$psValue];
			$lsNombre=$laTupla[$psNombre];
			$lsNombre2=$laTupla[$psNombre2];
			$lsPadre=$laTupla[$psPadre];
			if($psPadre!=""){
				$cadena="class='hijo $lsPadre'";
			}
			if ($lsValue==$psSeleccionado)
			{
			   $laResultado[$liI]="<option value='$lsValue' $cadena selected>$lsNombre $lsNombre2</option>";
			}
			else
			{
			   $laResultado[$liI]="<option value='$lsValue' $cadena >$lsNombre $lsNombre2</option>";
			}
			$liI++;
		 }
		 $this->f_Cierra($lrTb);
		 $this->f_Des();
		 return $laResultado;
	  }
	  public function fCampos($psSql,$psValue,$psValue2,$psValue3)//el psValue guarda el nombre del campo a mostrar de la tabla 
	  {
		 $laResultado=array();
		 $liI=0;
	  	 $this->f_Con();
		 $lrTb=$this->f_Filtro($psSql);
		 while($laTupla=$this->f_Arreglo($lrTb))
         {
		    $laResultado[$liI][0]="\n".$laTupla[$psValue]."  ".$laTupla[$psValue2];
		    $laResultado[$liI][1]=$laTupla[$psValue3];
			$liI++;
		 }
		 $this->f_Cierra($lrTb);
		 $this->f_Des();
		 return $laResultado;
	  }
	  public function fBuscar ($pcedula){
			$lbEncontro=false;
			$laMatriz=Array();
			$laMatriz[0]=$pcedula;
			$lbEncontro2=false;
			$lsSql="select *, date_format(fecha_nac,'%d-%m-%Y') as fecha_nac from persona where (cedula='$pcedula')";
			$this->Funcion_Conectar();
			$lrTb=$this->fFiltro($lsSql);
			if($laTupla=$this->fArreglo($lrTb)){
				$laMatriz[1]=$laTupla["nombre1"];
				$laMatriz[2]=$laTupla["nombre2"];
				$laMatriz[3]=$laTupla["apellido1"];
				$laMatriz[4]=$laTupla["apellido2"];
				$laMatriz[5]=$laTupla["fecha_nac"];
				$laMatriz[6]=$laTupla ["sexo"];
				$laMatriz[7]=$laTupla["estado_civil"];
				$laMatriz[8]=$laTupla["lugar_nac"];
				$laMatriz[9]=$laTupla ["telefono"];
				$laMatriz[10]=$laTupla ["correo_electronico"];
				$laMatriz[11]=$laTupla ["idciudad"];
				$lbEncontro2=true;
			}
			$lsSql="select * from ciudad where (idciudad='".$laMatriz[11]."' )";
			$lrTb=$this->fFiltro($lsSql);
			if($laTupla=$this->fArreglo($lrTb)){
				$laMatriz[12]=$laTupla["idparroquia"];
			}
			$lsSql="select * from parroquia where (idparroquia='".$laMatriz[12]."')";
			$lrTb=$this->fFiltro($lsSql);
			if($laTupla=$this->fArreglo($lrTb)){
				$laMatriz[12]=$laTupla["idmunicipio"];
			}
			$lsSql="select * from municipio where (idmunicipio='".$laMatriz[13]."' )";
			$lrTb=$this->fFiltro($lsSql);
			if($laTupla=$this->fArreglo($lrTb)){
				$laMatriz[14]=$laTupla["idestado"];
			}
			$this->fCFiltro($lrTb);
			$this->fDesconect;
			return $laMatriz;
		}
   }
?>
