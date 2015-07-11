<?php
session_start();
 ## Determino la url desde donde viene
 ## Si tiene algún Msg, lo elimino
$urlFrom = '';
$urlFrom = strpos(getenv('HTTP_REFERER'), 'Msg=') !== false ? substr(getenv('HTTP_REFERER'), 0, strpos(getenv('HTTP_REFERER'), 'Msg=')) : getenv('HTTP_REFERER').'?';

function ValidarDatos($campo){
	//Array con las posibles cabeceras a utilizar por un spammer
	$badHeads = array("Content-Type:",
					  "MIME-Version:",
					  "Content-Transfer-Encoding:",
					  "Return-path:",
					  "Subject:",
					  "From:",
					  "Envelope-to:",
					  "To:",
					  "bcc:",
					  "cc:");
	//Comprobamos que entre los datos no se encuentre alguna de
	//las cadenas del array. Si se encuentra alguna cadena se
	//dirige a una página de Forbidden
	foreach($badHeads as $valor){
		if(strpos(strtolower($campo), strtolower($valor)) !== false){
			header('Location:' . $urlFrom . 'Msg=bm');
			exit;
		}
	}
}
ValidarDatos($_POST['Emilio']);
$Correo		= substr($_POST['Emilio'],0,60);

$Captcha = (string) $_POST["mirtuono_captcha"];
if(sha1($Captcha) != $_SESSION["mirtuono_captcha"]){
	header('Location:' . $urlFrom . 'Msg=bc');
	exit;
}else{
  
	if($_POST['accion']=='contactar'){
		$Nombre		= $_POST['Nombre'];
		$Correo		= $Correo;
		$Mensaje	=	$_POST['Comentario'];
		
		require_once './phpMailer/class.phpmailer.php';
		$mail = new PHPMailer(true); //defaults to using php "mail()"; the true param means it will throw exceptions on errors, which we need to catch
		
		try {
			$mail->CharSet = 'UTF-8';
			$mail->SetFrom($Correo, $Nombre);
			//$mail->AddReplyTo('federico@mirtuono.com', 'Federico Teiserskis');
			$mail->Subject = 'PHPMailer Test Subject via mail(), advanced';
			
			$mail->AddAddress('clientes@estudiorwd.com.ar', 'Federico Teiserskis');
			$mail->AddCC('federico@mirtuono.com', 'Federico Teiserskis');
			//$mail->SetFrom('clientes@estudiorwd.com.ar', 'Federico Teiserskis');
			
			
			$mail->AddEmbeddedImage("./phpMailer/imagenes/phpmailer.gif", "my-attach", "phpmailer.gif");
			$body  = file_get_contents('./phpMailer/correos/contacto.html');
		
			$body  = str_replace("##imgheader##", ('<img alt="PHPMailer" src="cid:my-attach">'), $body);
			$body  = str_replace("##Nombre##", $Nombre, $body);
			$body  = str_replace("##Email##", $Correo, $body);
			$body  = str_replace("##Mensaje##", $Mensaje, $body);
			$mail->MsgHTML($body);
			$mail->IsHTML(true);
			  
		
			//-> formato de texto plano
			$txtAlt  = file_get_contents('./phpMailer/correos/contacto.txt');
			$txtAlt  = str_replace("##Nombre##", stripslashes($Nombre), $txtAlt);
			$txtAlt  = str_replace("##Email##", stripslashes($Correo), $txtAlt);
			$txtAlt  = str_replace("##Mensaje##", stripslashes($Mensaje), $txtAlt);
			  
			$mail->AltBody = $txtAlt; // optional - MsgHTML will create an alternate automatically
		
			$mail->AddAttachment('./phpMailer/imagenes/phpmailer_mini.gif'); // attachment
			  
			$mail->Send();
			  
			echo "Message Sent OK</p>\n";
		} catch (phpmailerException $e) {
			echo $e->errorMessage(); //Pretty error messages from PHPMailer
		} catch (Exception $e) {
			echo $e->getMessage(); //Boring error messages from anything else!
		}
	}	//-> cierra if de acción (agregar else acá mismo)
} 	//-> cierra validación de captcha
?>