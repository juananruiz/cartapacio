<!--
{$atributos|@print_r}
-->	
{foreach $atributos as $nombre => $valor}
  <h2>{$nombre}</h2>
  <ul>
  {foreach $valor as $val}
    <li>{$val}</li>
  {/foreach}
  </ul>
{/foreach}

