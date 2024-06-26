<?php 
include("../clases/cls_Depuracion.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Depuracion= new cls_Depuracion();
	$lobj_Depuracion->f_SetsForm($laForm);
}else{
	$laForm=$_GET;
	$lobj_Depuracion= new cls_Depuracion();
	$lobj_Depuracion->f_SetsForm($laForm);

}
if($laForm['Operacion']=="buscarEstudiantes")
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$xml.="<contenedor>".$laForm["pmcodigo"]."</contenedor>\n";
	$lb_Enc=false;
	$lb_Enc=$lobj_Depuracion->f_BuscarEstudiantes();
	$laForm=$lobj_Depuracion->f_GetsForm();
	$xml.="<estudiantes>";
	if($lb_Enc)
	{
		for($x=0;$x<count($laForm['estudiantes']);$x++){
			$xml.="<estudiante>";
			for($y=0;$y<count($laForm['estudiantes'][$x]);$y++){				
				$elemento=each($laForm['estudiantes'][$x]);
				$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
			}
			$xml.="</estudiante>";
		}
		$mensaje="<mensaje>Elementos Encontrado con Exito</mensaje>";
	}
	else
	{	
		$mensaje="<mensaje>Error Interno de Servidor</mensaje>";
	}
	$xml.="</estudiantes>";
	$xml.=$mensaje;	
	echo $xml."</cuerpo>";
}
if($laForm['Operacion']=="buscarMaterias")
{

	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="UTF-8"?>'; 
	$xml.="<cuerpo>\n";
	$xml.="<numero>".$laForm["Ins"]."</numero>\n";
	$lb_Enc=false;
	$lb_Enc=$lobj_Depuracion->f_BuscarMaterias();
	$laForm=$lobj_Depuracion->f_GetsForm();
	if($lb_Enc)
	{
		$xml.="<materias>";
		for($x=0;$x<count($laForm['materias']);$x++){
			$xml.="<materia>";
			for($y=0;$y<count($laForm['materias'][$x]);$y++){				
				$elemento=each($laForm['materias'][$x]);
				$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
			}
			$xml.="</materia>";
		}
		$xml.="</materias>";
		$xml.="<mensaje>Elementos Encontrado con Exito</mensaje>";
	}
	else
	{	
		$xml.="<mensaje>Error Interno de Servidor</mensaje>";
	}
	echo $xml."</cuerpo>";
}
if($laForm['Operacion']=="mover"){
	$lb_Hecho=false;
	$lb_Hecho=$lobj_Depuracion->moverEstudiantes();
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="UTF-8"?>'; 
	$xml.="<cuerpo>\n";
	if($lb_Hecho){
		$xml.="<mensaje>Operacion Realizada con Exito</mensaje>";
	}else{
		$xml.="<mensaje>Error Interno Del Servidor</mensaje>";
	}
	echo $xml."</cuerpo>";
}
?>
