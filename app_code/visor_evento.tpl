<h4>{$evento->nombre_corto}</h4>
<div class="well well-mini">{$evento->contenido}</div>
{if $evento->ficheros|@count > 0}
<h5>Ficheros:</h5>
	<div class="">
		<ul style="list-style:none">
		{foreach from=$evento->ficheros item=fichero}
					<li><i class="icon-file"></i>
					{if $fichero->existe == 1}
					<a href="index.php?page=fichero_descargar&id_fichero={$fichero->id}">{$fichero->descripcion}</a>
					{else}
						<span class="text-error"> El fichero {$fichero->nombre} no tiene copia en el directorio. Contecte con el administrador de sistema.</span>
					{/if}
					</li>
		{/foreach}
		</ul>
	</div>
{/if}
{if $evento->subeventos|@count > 0}
<h5>Subeventos:</h5>
	{foreach from=$evento->subeventos item=subevento}
				<div class="" style="margin-left:25px">
					<span class="subevento_open"><i class="icon-th"></i> {$subevento->nombre_corto}</span>
					<div style="margin-left:25px;display:none">
						<hr/>
						<div class="subevento_contenido">
							{$subevento->contenido}
						</div>
						<div class="subevento_ficheros">
							{if $evento->ficheros|@count == 0}
								<div class="alert alert-aviso">
									<h5>Aviso</h5>No existen archivos vinculados a este evento.
								</div>
							{else}
								<hr/>
								<ul class="ficheros_subevento"style="list-style:none">
								{foreach from=$subevento->ficheros item=fichero_subevento}
									<li>
										<img class="icon-file"></i>
										<a href="index.php?page=fichero_descargar&id_fichero={$fichero_subevento->id}">{$fichero_subevento->descripcion}</a>
									</li>
								{/foreach}
								</ul>
							{/if}
						</div>
					</div>
				</div>
	{/foreach}
{/if}
<script>
$('.subevento_open').on('click',function(){
	$(this).next().toggle();
});
</script>

