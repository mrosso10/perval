<?php
  $MailToAddress = "mrosso10@gmail.com";
  $MailSubject = "www.perval.com.ar - Email desde WEB";
  if (! isset($MailFromAddress) ) {
    $MailFromAddress = "info@perval.com.ar";
  }

  $Header = "Contacto:";
  $Message = $Footer = "";

  if (!is_array($_POST))
    return;
  reset($_POST);
  while(list($key, $val) = each($_POST)) {
    $GLOBALS[$key] = $val;
    $val=stripslashes($val);
    $Message .= "$key = $val\n";
  }

  if ($Header) {
    $Message = $Header."\n\n".$Message."\n\n";
  }
  $REMOTE_USER = (isset($_SERVER["REMOTE_USER"]))?$_SERVER["REMOTE_USER"]:"";
  $REMOTE_ADDR = (isset($_SERVER["REMOTE_ADDR"]))?$_SERVER["REMOTE_ADDR"]:"";
  $Message .= "REMOTE USER: ". $REMOTE_USER."\n";
  $Message .= "REMOTE ADDR: ". $REMOTE_ADDR."\n";

  if ($Footer) {
    $Message .= "\n\n".$Footer;
  }

  $resp = mail( "$MailToAddress", "$MailSubject", "$Message", "From: $MailFromAddress");
  var_dump($resp);
  // header ("Location: http://DOMINIO/CONFIRMACION_DE_RECEPCION");
