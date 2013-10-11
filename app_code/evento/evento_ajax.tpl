{if $modulo == 'actualizar_fichero' OR $modulo == 'campo_grabar' OR $modulo == 'fechas_grabar' OR $modulo == 'estado_grabar'}
	{if $aviso == 1 }
		<span class="badge badge-success"><i class="icon-ok icon-white"></i> Grabado</span>
	{else $aviso == 0}
		<span class=""><i class="icon-remove icon-white"></i> Error</span>
	{/if}
{/if}
{if $modulo == 'listar_fichero'}
	
	{if $ficheros|@count == 0}
	<div class="alert alert-aviso">
		<h4>Aviso</h4>No existen archivos vinculados a este evento.
	</div>
	{else}
		<div class="well well-mini">
		<table class="table">
		{foreach from=$ficheros item=fichero}
			<tr>
				<td class="span12">
					{if $fichero->existe == 1}
					<span class="span2">
					<a href="index.php?page=evento/fichero_editar&id_fichero={$fichero->id}&retorno={$retorno}" title="Editar fichero"><i class="icon-pencil"></i></a>
					<a href="index.php?page=evento/fichero_borrar&id_fichero={$fichero->id}&retorno={$smarty.get.page}" title="Borrar fichero"><i class="icon-remove"></i></a>
					<a href="index.php?page=evento/fichero_descargar&id_fichero={$fichero->id}" title="Descargar fichero"><i class="icon-download-alt"></i></a>
					{if $fichero->id_tipo == 1}
					<a href="#" title="Copiar enlace"><i class="icon-camera"></i></a>
					{/if}
				</span>
						{$fichero->descripcion}
					{else}
						<span class="text-error"> El fichero {$fichero->nombre} no tiene copia en el directorio. Contecte con el administrador de sistema.
					{/if}
				</td>
			</tr>
		{/foreach}
		</table>
	</div>
	{/if}
{/if}
