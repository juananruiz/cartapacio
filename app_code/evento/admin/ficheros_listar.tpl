<div class="falso-modal">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Listado de ficheros </h6>
	</div>
	<div class="falso-modal-body">
{if $ficheros|@count > 0}
<table class="table table-striped">
<tr><th>Id del evento</th><th>Fichero</th></tr>
{foreach from=$ficheros item=fichero}
<tr>
<td>{$fichero.id_evento}</td>
<td>
	{foreach from=$fichero.ficheros item=archivo}
		{if $archivo->existe == 1}{$archivo->descripcion}{else}
		<span class="text-error">El archivo <b>"{$archivo->descripcion}"</b> no tiene copia en el directorio.</span>{/if}<br/>
	{/foreach}
</td> 
</tr>
{/foreach}
</table>
{else}
	<div class="alert alert-aviso">
		<h4>Aviso</h4>
			<p>No existen ficheros</p>
	</div>
{/if}
</div>
</div>


