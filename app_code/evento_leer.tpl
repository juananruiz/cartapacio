{if isset($evento_padre)}
  <h2>{$evento_padre->nombre_corto}</h2>
{/if}

<h3>{$evento->nombre_corto}</h3>

{$evento->contenido}

{if $evento->ficheros|count > 0}

		<div class="well well-mini">
				{if $evento->ficheros|@count > 0}
				<ul style="list-style:none">
			{foreach from=$evento->ficheros item=fichero}
		<li>
			{if $fichero.file_in_bd == 1}
			<a href="index.php?page=evento/fichero_descargar&id={$fichero.0}" title="Descargar archivo"><i class="icon-download-alt"></i></a>  
							<a id="file{$fichero.0}" href="#" data-nombre_fichero="{$fichero.nombre}" data-id_fichero="{$fichero.0}" class="eliminar_archivo" title="Eliminar archivo"><i class="icon-remove"></i></a> 
							<a style="margin-left:10px" href="index.php?page=evento/fichero_editar&id={$fichero.0}" title="Editar datos del archivo">{$fichero.nombre}</a>
			{else}
			<i class="icon-question-sign"></i> <span class="text-error">{$fichero.nombre}</span>
			{/if}
			</li>
			{/foreach}
			</ul>
			{else}
			<div class="alert alert-info">Este evento no tiene ficheros.</div>
			{/if}
			</div>
{/if}

{if isset($subeventos)}
  <ul>
  {foreach $subeventos as $subevento}
    <li>{$subevento->titulo_corto}</li>
  {/foreach}
  </ul>
{/if}

