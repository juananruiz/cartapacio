<table class="table dataTable">
  <tr>
		<th class="span2"></th>
    <th>Proyecto</th>
  </tr>
{foreach from=$cuestionarios item=cuestionario}
  <tr>
    <td>
			{if $cuestionario->estado == 1}
				<a href="#" title="Activo"><i class="icon-ok"></i></a>
			{else}
				<a href="#" title="No activo"><i class="icon-remove"></i></a>
			{/if}

				<a href="index.php?page=cuestor/admin/resultados_envio&id={$cuestionario->id}" title="Detalle de los envios del cuestionario '{$cuestionario->nombre_corto}'"><i class="icon-list"></i></a>
				<a href="index.php?page=cuestor/admin/envios_consultar&id={$cuestionario->id}" title="Localizar un envio del cuestionario '{$cuestionario->nombre_corto}'"><i class="icon-search"></i></a>
		</td>
    <td>{$cuestionario->nombre_largo}</td>
  </tr>
{/foreach}
</table>
