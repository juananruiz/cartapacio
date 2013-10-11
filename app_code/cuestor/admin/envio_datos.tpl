<table class="table" >
<tr><th>Pregunta</th><th>Valor</th></tr>
{foreach from=$respuestas item=respuesta}
<tr><td>{$respuesta->id_pregunta}</td><td>{if $respuesta->valor_cerrado == 'otro'}{$respuesta->valor_abierto}{else}{$respuesta->valor_cerrado}{/if}</td></tr>
{/foreach}
</table>
