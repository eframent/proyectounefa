<?php 
session_start();
$_SESSION['precargado']=$_POST;
header("location: vis_Proyeccion.php");
?>