<div class="well well-mini">
	<h3>Bienvenido al Portal de Participación de la Administración y Servicios de la Universidad de Sevilla</h3>
</div>

<table class="table dataTable">
  <tr>
    <th><i class="icon-tasks"></i> Proyecto</th><th>Estado</th><th>Envio por el usuario</th><th>Informe resultados</th>
  </tr>
{foreach from=$cuestionarios item=cuestionario}
  <tr>
    <td> {if  $cuestionario->estado_envio->fecha_fin  == NULL}<a href="index.php?page=cuestor/cuestionario_cumplimentar&id={$cuestionario->id}"><i class="icon-edit"></i> {$cuestionario->nombre_largo}</a>{else}{$cuestionario->nombre_largo}{/if}</td>
    <td>{if $cuestionario->estado == 1}Activo{else}Finalizado{/if}</td>
    <td><a href="index.php?page=cuestor/envio_mostrar&id={$cuestionario->id}"><i class="icon-check"></i>{if $cuestionario->estado_envio->fecha_fin  == NULL}No enviado{else} Enviado el {$cuestionario->estado_envio->fecha_fin}</a>{/if}</td>
    <td>Disponible el 15 de diciembre de 2013</td>
  </tr>
{/foreach}
</table>
