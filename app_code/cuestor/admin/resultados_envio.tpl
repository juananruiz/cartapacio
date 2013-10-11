<div class="well well-mini">
<h4>{$cuestionario->nombre_largo}</h4>
<p>Total envios al cuestionario :<b>{$total_envios}</b> Total finalizados :<b>{$total_envios_finalizados}</b></p>
<a href="index.php?page=cuestor/admin/resultados_exportar&modulo=respuestas&id={$cuestionario->id}" title="Exportar cuestionario '{$cuestionario->nombre_corto}' en formato Excel"><i class="icon-download-alt"></i> Descargar respuestas en formato CSV</a><br />
<a href="index.php?page=cuestor/admin/resultados_exportar&modulo=empleados&id={$cuestionario->id}" title="Exportar empleados que han participado en '{$cuestionario->nombre_corto}' en formato Excel"><i class="icon-download-alt"></i> Descargar empleados en formato CSV</a>
</div>

<!--
<table class="table">
<tr>
	<th>Id</th>
	{foreach from=$envios.0.respuestas item=pregunta}
		<th>{$pregunta->id_pregunta}</th>
	{/foreach}
</tr>
{foreach from=$envios item=respuesta}
	<tr>
		<td>{$respuesta.id}</td>
			{foreach from=$respuesta.respuestas item=pregunta}
				<td>{$pregunta->valor_cerrado}</td>
			{/foreach}
	</tr>
{/foreach}
</table>
-->
