<?php
  $MailToAddress = "ventas@perval.com.ar";
  $MailSubject = "www.perval.com.ar - Email desde WEB";
  $MailFromAddress = "Perval WEB <web@perval.com.ar>";

  $Header = "Contacto:";
  $Message = $Footer = "";

  if (!is_array($_POST)) {
    header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error', true, 500);
    return;
  }

  $Message .= "Nombre: ".$_POST['name']."\n";
  $Message .= "Email: ".$_POST['email']."\n";
  $Message .= "Teléfono: ".$_POST['tel']."\n";
  $Message .= "Mensaje: ".$_POST['content']."\n";

  $Message = $Header."\n\n".$Message."\n\n";

  $REMOTE_ADDR = (isset($_SERVER["REMOTE_ADDR"]))?$_SERVER["REMOTE_ADDR"]:"";
  $Message .= "REMOTE ADDR: ". $REMOTE_ADDR."\n";

  if ($Footer) {
    $Message .= "\n\n".$Footer;
  }

  if( !mail( "$MailToAddress", "$MailSubject", "$Message", "From: $MailFromAddress") ) {
    header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error', true, 500);
  }
