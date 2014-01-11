<?php
function limpiaCadena($cadena) {
	$cadena = trim($cadena);
	$cadena = strtr($cadena,
	"ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÈÉÊËèéêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ",
	"aaaaaaaaaaaaooooooooooooeeeeeeeecciiiiiiiiuuuuuuuuynn");
	$cadena = strtr($cadena,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz");
	$cadena = preg_replace('#([^.a-z0-9]+)#i', '-', $cadena);
  $cadena = preg_replace('#-{2,}#','-',$cadena);
  $cadena = preg_replace('#-$#','',$cadena);
  $cadena = preg_replace('#^-#','',$cadena);
	return $cadena;
}
?>
