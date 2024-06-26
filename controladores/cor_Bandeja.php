<?php 
include("../clases/cls_Solicitudes.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Solicitudes= new cls_Solicitudes();
	$laForm['cantidad']="12";
	$lobj_Solicitudes->f_SetsForm($laForm);
}else{
	$laForm=$_GET;
	$lobj_Solicitudes= new cls_Solicitudes();
	$laForm['cantidad']="12";
	$lobj_Solicitudes->f_SetsForm($laForm);

}
if($laForm['Operacion']=="buscar")
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$xml.="<Valor>".$laForm['Valor']."</Valor>\n";
	$xml.="<paginaActual>".$laForm['pag']."</paginaActual>\n";
	$xml.="<cantidad>".$laForm['cantidad']."</cantidad>\n";
	$lb_Enc=false;
	$lb_Enc=$lobj_Solicitudes->fSolicitudes();		
	$laForm=$lobj_Solicitudes->f_GetsForm();
	$xml.="<registros>".$laForm['cantidadReg']."</registros>\n";
	if($lb_Enc)
	{
		$xml.="<Solicitudes>";
		for($x=0;$x<count($laForm['elementos']);$x++){
			$xml.="<solicitud>";
			for($y=0;$y<count($laForm['elementos'][$x]);$y++){				
				$elemento=each($laForm['elementos'][$x]);
				$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
			}
			$xml.="</solicitud>";
		}
		$xml.="</Solicitudes>";
		$xml.="<mensaje>Elementos Encontrado con Exito</mensaje>";
	}
	else
	{	
		$xml.="<mensaje>No Hay Solicitudes</mensaje>";
	}
	echo $xml."</cuerpo>";
}
if($laForm['Operacion']=="atender")
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$lb_Enc=false;
	$lb_Enc=$lobj_Solicitudes->fSolicitud();		
	$laForm=$lobj_Solicitudes->f_GetsForm();
	if($lb_Enc)
	{
		$xml.="<solicitud>";
		for($y=0;$y<count($laForm['elemento']);$y++){				
			$elemento=each($laForm['elemento']);
			$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
		}
		$xml.="</solicitud>";		
		$xml.="<mensaje>Solicitud Encontrada con Exito</mensaje>";
	}
	else
	{	
		$xml.="<mensaje>Error interno del Servidor</mensaje>";
	}
	echo $xml."</cuerpo>";
}
if(($laForm['Operacion']=="rechazar")||($laForm['Operacion']=="cancelarMatricula")||($laForm['Operacion']=="equivalencia"))
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$lb_Hecho=false;
	$lb_Hecho=$lobj_Solicitudes->fOperacion();
	if($lb_Hecho)
	{		
		$xml.="<mensaje>Operacion Realizada con Exito</mensaje>";
	}
	else
	{	
		$xml.="<mensaje>Error interno del Servidor</mensaje>";
	}
	echo $xml."</cuerpo>";
}
if($laForm['Operacion']=="construirComboPensum")
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$lb_Enc=false;
	$lb_Enc=$lobj_Solicitudes->fComboPensum();		
	$laForm=$lobj_Solicitudes->f_GetsForm();
	if($lb_Enc)
	{
		$xml.="<Opciones>";
		for($x=0;$x<count($laForm['elementos']);$x++){
			$xml.="<opcion>";
			for($y=0;$y<count($laForm['elementos'][$x]);$y++){				
				$elemento=each($laForm['elementos'][$x]);
				$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
			}
			$xml.="</opcion>";
		}
		$xml.="</Opciones>";
		$xml.="<mensaje>Elementos Encontrado con Exito</mensaje>";
	}
	else
	{	
		$xml.="<mensaje>Error interno del Servidor</mensaje>";
	}
	echo $xml."</cuerpo>";
}
?>
