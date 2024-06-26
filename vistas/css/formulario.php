<?php
	require_once('predeterminado.php');
	header('content-type:text/css');
	echo <<<FINCSS

	table{
		margin:0px auto;
		width:100%;
	}

	table label{
		$mderecho 20px;
		font-size:12px;
		color:#6C7A89
	}

	table input, table select, table textarea,input[type="text"],select,textarea{
		$mizquierdo 0px;
		padding:8px 0px;
		$tamaño 12px;
		width:200px;
		border: 2px solid rgb(189, 195, 199) !important;
		$br3
		background-color:white;
		color:#6C7A89;
		text-indent:10px;
	}
    
    	table textarea{
		padding:8px 0px;
		rezise:none !important;
	}

	table input:disabled, table select:disabled, table textarea:disabled,input[type="text"]:disabled,select:disabled,textarea:disabled{
		background-color:rgba(0, 0, 0, 0.1);
	}

	table input:focus, table select:focus, table textarea:focus{
		border-color: rgb(52, 152, 219) !important;
	}

	table input:hover, table select:hover, table textarea:hover{
		border-color: rgb(112, 182, 229) !important;
	}

	/*table select{
		-moz-appearance: none;
	    text-indent: 0.5px;
	    text-overflow: '';
	}*/

	fieldset{
		margin:20px 0px;
		padding:10px;
		$br5;
		border: 1px solid rgb(222, 222, 222);
		box-shadow: 0px 0px 10px rgba(189, 189, 189, 0.4);
		margin:5px;
	}		

	legend{
		list-style: none outside none;
		background-color: rgb(251, 251, 251);
		background-image: -moz-linear-gradient(center top , rgb(255, 255, 255), rgb(245, 245, 245));
		background-image: -webkit-linear-gradient(center top , rgb(255, 255, 255), rgb(245, 245, 245));
		background-repeat: repeat-x;
		border: 1px solid rgb(221, 221, 221);
		border-radius: 3px;
		box-shadow: 0px 0px 10px rgba(189, 189, 189, 0.4);
		font-size: 25px;
		padding: 5px 20px;
		margin-top: 10px;
		margin-left: 20px;
	}

		table input[name="Cedula"]{
		    width: 28%;
		    margin-left:1px;
		}

	/*********************************************************calendario****************************************************/

	table[class="DynarchCalendar-topCont"]{
		width:250px;
	}

	div[dyc-type="nav"]{
		width:auto !important;
	}

	input[class="DynarchCalendar-menu-year"]{
		margin-left:80px;
		width:90px;
		text-aling:center;
		text-indent:0px !important;
	}

	div[dyc-btn="today"]{
		width:30px;
	}

	div[class="DynarchCalendar-bottomBar"]{
		width:auto;
	}

	div[dyc-type="menubtn"]{
		width:60px;
	}

	.icon-date{
		margin-top:-6px !important;
	}

	select#nacionalidad{
		width: 40px;
		text-indent: 2px;
		padding: 6px 3px 6px 0px;
	}

	input[name="Cedula"]{
		width:16.5% !important;
	}
	/************************************************************************************************************************/
	
	@media screen and (max-width: 1024px) {
		div[formulario],div[Botonera]{
			width: 95%;
			border: 1px solid silver;
		}

		table{
			font-size:15px;
		}

		table input, table select, table textarea {
			width:95%;
		    margin-left: 0px;
		    padding: 8px 0px;
		    font-size: 16px;
		    border: 1px solid rgb(222, 222, 222);
		    border-radius: 3px;
		    background: none repeat scroll 0% 0% white;
		}

		select#nacionalidad{
			width:14px;
		}


		table input[name="Nombre_Usu"]{
		    width: 33%;
		}

		table select{
			-moz-appearance: none;
		    text-indent: -1px;
		    text-overflow: '';
		}


		#legendObligatorio{
			width:95% !important;
		}

		ul#css3menu1{
			width:94%;
		}
	}

	@media screen and (max-width: 900px) {

		h2{
			height:auto;
			font-size:15px;
			padding-bottom:8px;
		}

		table{
			width:95%;
			font-size:12px;
		}

		table tr td{
			width:25%;
		}

		table label{
			$mderecho 0px;
			font-size:12px;
		}

		table input[type="text"],table input[name="Nombre_Usu"],{
			width:100%;
		}

		table input[name="Cedula"]{
			width:75px;
		}

		table input, table select, table textarea{
			padding:3px 0px;
			$tamaño 12px;
			border: 1px solid rgb(222, 222, 222);
			$br3
		}

		table select{
			-moz-appearance: none;
		    text-indent: -1px;
		    text-overflow: '';
		}

		select#nacionalidad{
			padding:2px 0px;
		}

		table input[name="Cedula"] {
		    width: 33%;
		    margin-left:1px;
		}

		[validar] {
		    background-image: url("../imagenes/ast.png") no-repeat scroll right center transparent !important;
		    background-size:8px 8px;
		    padding-right: 10px;
		}

		div[Botonera] input{
			font-size: 12px;
		}


		table input, table select, table textarea{
			padding:3px 0px;
			$tamaño 12px;
			border: 1px solid rgb(222, 222, 222);
			$br3
			width:100%;
		}

		table input[name="Cedula"] {
		    width: 75px;
		    margin-left:1px;
		}

		div[Botonera] input{
			font-size: 10px;
		}

		div[Menu]{
			font-size:8px;
		}

		input.atras[type="button"] {
			margin:0px;
		}

		input.inicio[type="button"] {
			margin: 0px 10px 0px 0px;
		}

		div[Menu] span{
			display:none;
		}

		ul#css3menu1 a {
			width: auto;
			padding: 5.5px 10px;
			font-size: 10px;
		}

		ul#css3menu1 li.topmenu > a {
			font-size: 10px;
		}

		div[ordenar] {
			font-size: 10px;
			font-weight:normal;
		}

		ul#css3menu1 li ul {
			width:150px !important;
		}

		ul#css3menu1{
			width:92%;
		}

		ul li a label{
			display:none;
		}

	}

	@media screen and (max-width: 550px) {
		table{
			font-size:10px;
		}
		input[type="text"] {
		    width: 100%;
		    font-size: 10px;
		    padding: 11px 0px;
		    height: 20px;
		}

		#legendObligatorio{
			font-size: 12px;
		}

		textarea{
			resize:vertical;
		}	

		input[type="button"], input[type="submit"], input[type="reset"] {
			padding: 7px 20px;
		}	

		h2{
			text-indent:10px;
			font-size:12px;
		}

		label{
			font-size:10px !important;
		}

		table input, table select, table textarea, input[type="text"], select, textarea {
			height:auto;
			padding: 5px 0px;
			text-indent:0px;
			font-size:10px;
		}

		table select {
		    -moz-appearance: none;
		    text-indent: 1px;
		    text-overflow: "";
		    padding-right:0px;
		}

		select#nacionalidad {
		    width:16px;
		    text-indent:0px;
		}

		input[name="Correo"]{
			width:220%;
		}

		legend{
			font-size:12px;
			margin-left:10px;
			margin-top:5px;
		}

		ul li a label{
			display:none;
		}

		ul#css3menu1{
			width:90%;
		}

	}
FINCSS;
?>