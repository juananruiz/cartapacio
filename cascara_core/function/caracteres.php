<?php
//grabar archivos de evento
function QuitaAcentos($cadena){
  $p = array('á','é','í','ó','ú','Á','É','Í','Ó','Ú',' ');
	$r = array('a','e','i','o','u','A','E','I','O','U','_');
	return str_replace($p, $r, $cadena);
}  
function caracteres($cadena){
   $tofind = "ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÈÉÊËèéêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ· ";
   $replac = "AAAAAAaaaaaaOOOOOOooooooEEEEeeeeCcIIIIiiiiUUUUuuuuyNn-_";
   return(strtr($cadena,$tofind,$replac));
}
?>
