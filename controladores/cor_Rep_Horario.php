<?php 
include("../clases/reportes/cls_Rep_Horario.php");
session_start();
if(array_key_exists(Operacion,$_POST))
{
	$laForm=$_POST;
	$lobj_Rep_Horario= new cls_Rep_Horario();
	$lobj_Rep_Horario->f_SetsForm($laForm);
}else{
	$laForm=$_GET;
	$lobj_Rep_Horario= new cls_Rep_Horario();
	$lobj_Rep_Horario->f_SetsForm($laForm);

}
if($laForm['Operacion']=="buscarElementos")
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$xml.="<tipo>".$laForm['busqueda']."</tipo>";
	$lb_Enc=false;
	if($laForm['busqueda']=="aula"){
		$lb_Enc=$lobj_Rep_Horario->f_BuscarAula();
	}else if($laForm['busqueda']=="docente"){
		$lb_Enc=$lobj_Rep_Horario->f_BuscarDocente();		
	}else if($laForm['busqueda']=="seccion"){
		$lb_Enc=$lobj_Rep_Horario->f_BuscarSeccion();
	}
	$laForm=$lobj_Rep_Horario->f_GetsForm();
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
if($laForm['Operacion']=="buscarHorario")
{
	header('Content-Type: text/xml');
	$xml='<?xml version="1.0" encoding="iso-88859-1"?>'; 
	$xml.="<cuerpo>\n";
	$xml.="<tipo>".$laForm['busqueda']."</tipo>";
	$lb_Enc=false;
	if($laForm['busqueda']=="aula"){
		$bloquesOcupados=$lobj_Rep_Horario->f_HorarioAula();
	}else if($laForm['busqueda']=="docente"){
		$bloquesOcupados=$lobj_Rep_Horario->f_HorarioDocente();
	}else if($laForm['busqueda']=="seccion"){
		$bloquesOcupados=$lobj_Rep_Horario->f_HorarioSeccion();
	}
	$lobj_Rep_Horario->f_BuscarBloques();
	$laForm=$lobj_Rep_Horario->f_GetsForm();
	$xml.="<registros>".$laForm['cantidadReg']."</registros>\n";
	//sector bloques vacios para armado
	$xml.="<bloques>";
	for($x=0;$x<count($laForm['bloques']);$x++){
		$xml.="<bloque>";
		for($y=0;$y<count($laForm['bloques'][$x]);$y++){				
			$elemento=each($laForm['bloques'][$x]);
			$xml.="<".$elemento[key].">".$elemento[value]."</".$elemento[key].">\n";
		}
		$xml.="</bloque>";
	}
	$xml.="</bloques>";
	//sector bloques ocupados
	$xml.="<ocupados>";
	for($x=0;$x<count($bloquesOcupados);$x++){
		$xml.="<materia>";
		for($y=0;$y<count($bloquesOcupados[$x]);$y++){
			$xml.="<bloque>";
				$xml.="<Dia>".$bloquesOcupados[$x][$y][0]."</Dia>";
				$xml.="<CodigoBloque>".$bloquesOcupados[$x][$y][1]."</CodigoBloque>";
				$xml.="<CodigoAmbiente>".$bloquesOcupados[$x][$y][2]."</CodigoAmbiente>";
				$xml.="<CodigoMateria>".$bloquesOcupados[$x][$y][3]."</CodigoMateria>";
				$xml.="<NombreDocente>".$bloquesOcupados[$x][$y][4]."</NombreDocente>";
				$xml.="<NombreAmbiente>".$bloquesOcupados[$x][$y][5]."</NombreAmbiente>";
				$xml.="<NombreMateria>".$bloquesOcupados[$x][$y][6]."</NombreMateria>";
				$xml.="<CodigoSeccionPla>".$bloquesOcupados[$x][$y][7]."</CodigoSeccionPla>";
				$xml.="<Unidades>".$bloquesOcupados[$x][$y][8]."</Unidades>";
			$xml.="</bloque>";
		}
		$xml.="</materia>";
	}
	$xml.="</ocupados>";
	$xml.="<mensaje>Elementos Encontrado con Exito</mensaje>";
	
	echo $xml."</cuerpo>";
}

?>
