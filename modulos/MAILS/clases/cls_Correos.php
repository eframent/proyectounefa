<?php
class  cls_Correos {
	private $aaParametros=array();

	public function setParametros($paParametros){
		$this->aaParametros['Contenido']="../modulos/MAILS/plantillas/plantillaPrueba.html";
		$this->aaParametros=$paParametros;
		$this->aaParametros['De']='noresponder@testing-case.com.ve';
		$this->aaParametros['DeNombre']='UNEFA-PORTUGUESA';
	}
	public function enviarCorreo(){
		$lb_Enviado=false;
		require "../modulos/MAILS/PHPMailer/PHPMailerAutoload.php";
 		include('../modulos/MAILS/PHPMailer/class.smtp.php');
		$mail = new PHPMailer;

		//$mail->SMTPDebug = 3;                               // Enable verbose debug output
		
		$mail->isSMTP();                                      // Set mailer to use SMTP
		$mail->Host = 'host.caracashosting20.com ';  			// Specify main and backup SMTP servers
		$mail->SMTPAuth = true;                               // Enable SMTP authentication
		$mail->Username = 'noresponder@testing-case.com.ve';                 // SMTP username
		$mail->Password = 'v21057251';                           // SMTP password
		$mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
		$mail->Port = 465;                                    // TCP port to connect to

		$mail->From = $this->aaParametros["De"];
		$mail->FromName = $this->aaParametros["DeNombre"];
		$mail->addAddress($this->aaParametros["Para"], $this->aaParametros["ParaNombre"]);     // Add a recipient
		$mail->addReplyTo($this->aaParametros['De'], 'No responder a esta Direccion de Correo');

		$mail->isHTML(true);                                  // Set email format to HTML

		$mail->Subject = $this->aaParametros["Asunto"];
		if(substr($this->aaParametros['Contenido'],0,2)==".."){
			$mail->Body    =file_get_contents($this->aaParametros['Contenido']);
		}else{
			$mail->Body    = $this->aaParametros['Contenido'];
		}
		$mail->AltBody = $this->aaParametros['AltContenido'];
			
		if(!$mail->send()) {
		    //echo 'Correo no pudo ser enviado.';
		    //echo "\n Error: " . $mail->ErrorInfo;
		} else {
		    //echo 'Correo enviado con exito';
		    $lb_Enviado=true;
		}
		return $lb_Enviado;
	}
	
}
?>
