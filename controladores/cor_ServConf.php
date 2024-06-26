<?php 
include("../clases/cls_ServConf.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_ServConf= new cls_ServConf();
	$laForm['cantidad']="10";
	$lobj_ServConf->f_SetsForm($laForm);
}else{
	$laForm=$_GET;
	$lobj_ServConf= new cls_ServConf();
	$laForm['cantidad']="10";
	$lobj_ServConf->f_SetsForm($laForm);

}
if(($laForm['Operacion']=="buscarBloqueados")||(($laForm['Operacion']=="buscarOnline")))
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$xml.="<Valor>".$laForm['Valor']."</Valor>\n";
	$xml.="<paginaActual>".$laForm['pag']."</paginaActual>\n";
	$xml.="<cantidad>".$laForm['cantidad']."</cantidad>\n";
	$lb_Enc=false;
	if($laForm['Operacion']=="buscarBloqueados"){
		$lb_Enc=$lobj_ServConf->f_BuscarBloqueados();
	}else if($laForm['Operacion']=="buscarOnline"){
		$lb_Enc=$lobj_ServConf->f_BuscarOnline();		
	}
	$laForm=$lobj_ServConf->f_GetsForm();
	$xml.="<registros>".$laForm['cantidadReg']."</registros>\n";
	if($lb_Enc)
	{

		$xml.="<usuarios>";
		for($x=0;$x<count($laForm['usuarios']);$x++){
			$xml.="<usuario>";
			for($y=0;$y<count($laForm['usuarios'][$x]);$y++){				
				$elemento=each($laForm['usuarios'][$x]);
				$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
			}
			$xml.="</usuario>";
		}
		$xml.="</usuarios>";
		$xml.="<mensaje>Elementos Encontrado con Exito</mensaje>";
	}
	else
	{	
		$xml.="<mensaje>No Hay Usuarios Bloqueados</mensaje>";
	}
	echo $xml."</cuerpo>";
}
if(($laForm['Operacion']=="buscarTrans")||(($laForm['Operacion']=="buscarAcceso")))
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$xml.="<Valor>".$laForm['Valor']."</Valor>\n";
	$xml.="<paginaActual>".$laForm['pag']."</paginaActual>\n";
	$xml.="<cantidad>".$laForm['cantidad']."</cantidad>\n";
	$lb_Enc=false;
	if($laForm['Operacion']=="buscarAcceso"){
		$lb_Enc=$lobj_ServConf->f_BuscarAcceso();
	}else if($laForm['Operacion']=="buscarTrans"){
		$lb_Enc=$lobj_ServConf->f_BuscarTrans();		
	}
	$laForm=$lobj_ServConf->f_GetsForm();
	$xml.="<registros>".$laForm['cantidadReg']."</registros>\n";
	if($lb_Enc)
	{
		$xml.="<elementos>";
		for($x=0;$x<count($laForm['elementos']);$x++){
			$xml.="<elemento>";
			for($y=0;$y<count($laForm['elementos'][$x]);$y++){				
				$elemento=each($laForm['elementos'][$x]);
				$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
			}
			$xml.="</elemento>";
		}
		$xml.="</elementos>";
		$xml.="<mensaje>Elementos Encontrado con Exito</mensaje>";
	}
	else
	{	
		$xml.="<mensaje>No Hay Usuarios Bloqueados</mensaje>";
	}
	echo $xml."</cuerpo>";
}
if((($laForm['Operacion']=="cerrarSesion"))||($laForm['Operacion']=="desbloquear")){
	$lb_Hecho=false;
	if($laForm['Operacion']=="desbloquear"){
		$lb_Hecho=$lobj_ServConf->desbloquearUsuario();
	}else if($laForm['Operacion']=="cerrarSesion"){
		$lb_Hecho=$lobj_ServConf->cerrarSesion();
	}
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
if(($laForm['Operacion']=="buscarServidor")||($laForm['Operacion']=="guardarServidor")){
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$lb_Enc=false;
	if(($laForm['Operacion']=="guardarServidor")){
		$lobj_ServConf->fGuardarServidor();
	}
	$lb_Enc=$lobj_ServConf->fBuscarServidor();		
	$laForm=$lobj_ServConf->f_GetsForm();
	if($lb_Enc)
	{
		$xml.="<busqueda>";
		for($y=0;$y<count($laForm['elemento']);$y++){				
			$elemento=each($laForm['elemento']);
			$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
		}
		$xml.="</busqueda>";
		if($laForm['Operacion']=="guardarServidor"){
			$xml.="<mensaje>Modificacion Finalizada con Exito</mensaje>";	
		}else{
			$xml.="<mensaje>Busqueda Finalizada con Exito</mensaje>";	
		}
	}
	else
	{	
		$xml.="<mensaje>Error interno del Servidor</mensaje>";
	}
	echo $xml."</cuerpo>";
}
?>
