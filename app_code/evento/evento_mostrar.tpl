<div class="falso-modal row-fluid">	
	
	<div class="falso-modal-header">
	<h6>Gestión de Eventos 	<i class="icon-chevron-right"></i> Mostrar  evento 
			<i class="icon-chevron-right"></i> {$evento->id}
			<span class="text-error responsive_oculto">
		<i class="icon-chevron-right"></i>
		<a href="index.php?page=evento/evento_editar&id={$evento->id}&retorno={$smarty.get.page}">{$evento->nombre_corto}</a>
		</span>
		<a href="index.php?page=evento/subevento_crear_intermedia&id_padre={$evento->id}&t=0&c=evento_mostrar" 
		style="margin-right:20px" class="pull-right" title="Crear subeventos"><i class="icon-th"></i></a>
		<a href="index.php?page=evento/evento_editar&id={$evento->id}&retorno={$smarty.get.page}" 
		style="margin-right:20px" class="pull-right"> <i class="icon-pencil"></i></a>
	</h6>
	</div>

	<div class="falso-modal-body">
		<h4>Datos del Evento</h4>
			<div class="row-fluid">
				<div class="span4">
					<h5>Estado</h5>
					<div class="well well-mini">{$evento->estado}</div>
				</div>
				<div class="span4">
					<h5>Autor</h5>
					<div class="well well-mini">{$evento->autor}</div>
				</div>
				<div class="span4">
					<h5>Unidad / Recurso</h5>
					<div class="well well-mini">{$evento->unidad->nombre_corto} - {$evento->recurso->nombre_corto}</div>
				</div>
			</div>
				
			<div class="row-fluid">
				<h5>Título</h5>
				<div class="well well-mini">{$evento->nombre_corto}</div>
			</div>
			
			<div class="row-fluid">
				<h5>Contenido</h5>
				<div class="well well-mini">{$evento->contenido}</div>
			</div>
			
			<div class="row-fluid">
				<h5>Nombre largo</h5>
				<div class="well well-mini">{$evento->nombre_largo}</div>
			</div>
			
			<div class="row-fluid">
				<div class="span4">
					<h5>Fecha de entrada</h5>
					<div class="well well-mini">{$evento->fecha_entrada}</div>
				</div>
				<div class="span4">
					<h5>Fecha de modificación</h5>
					<div class="well well-mini">{$evento->fecha_modificacion}</div>
				</div>
				<div class="span4">
					<h5>Fecha de último subevento</h5>
					<div class="well well-mini">{$evento->fecha_ultimo_subevento}</div>
				</div>
			</div>
			
			<div class="row-fluid">
				<div class="span4">
					<h5>Usar fecha caducidad</h5>
					<div class="well well-mini">{if $evento->usar_fecha_caducidad == 1}Si{else}No{/if}</div>
				</div>
				<div class="span4">
					<h5>Fecha de inicio</h5>
					<div class="well well-mini">{$evento->fecha_inicio}</div>
				</div>
				<div class="span4">
					<h5>Fecha de fín</h5>
					<div class="well well-mini">{$evento->fecha_fin}</div>
				</div>
			</div>

			<div class="row-fluid">
				<div class="span4">
					<h5>Es público</h5>
					<div class="well well-mini">{if $evento->id_publico == 1}Si{else}No{/if}</div>
				</div>
				<div class="span4">
					<h5>Es novedad en su unidad</h5>
					<div class="well well-mini">{if $evento->id_novedad_unidad == 1}Si{else}No{/if}</div>
				</div>
				<div class="span4">
					<h5>Es novedad en intranet</h5>
					<div class="well well-mini">{if $evento->id_novedad_intranet == 1}Si{else}No{/if}</div>
				</div>
			</div>

			<div class="row-fluid">
				<h5>Comentarios</h5>
				<div class="well well-mini">{$evento->comentarios}</div>
			</div>

			<h4>Ficheros del evento:</h4>
					{include file="evento/evento_ajax.tpl" modulo="listar_fichero" retorno="evento/evento_mostrar"}
			<h4>Subeventos:</h4>
			<div style="margin-left:10px">
			{if $subeventos|@count > 0}
				{foreach from=$subeventos item=subevento}
					<h5>
						<a href="index.php?page=evento/subevento_editar&id={$subevento->id}&retorno={$smarty.get.page}">{if $subevento->nombre_corto == ''}¡¡¡ Campo vacio !!!{else}{$subevento->nombre_corto}{/if}</a>
					</h5>
					{if $subevento->ficheros|@count == 0}
						<div class="alert alert-aviso">
							<h4>Aviso</h4>No existen archivos vinculados a este Evento.
						</div>
						{else}
							<div class="well well-mini">
							<table class="table">
							{foreach from=$subevento->ficheros item=fichero}
								<tr>
									<td class="span12">
										{if $fichero->existe == 1}
										<span class="span2">
										<a href="index.php?page=evento/fichero_editar&id_fichero={$fichero->id}&retorno={$smarty.get.page}" title="Editar fichero"><i class="icon-pencil"></i></a>
										<a href="index.php?page=evento/fichero_borrar&id_fichero={$fichero->id}&retorno={$smarty.get.page}" title="Borrar fichero"><i class="icon-remove"></i></a>
										<a href="index.php?page=evento/fichero_descargar&id_fichero={$fichero->id}" title="Descargar fichero"><i class="icon-download-alt"></i></a>
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
				{/foreach}
			{else}
				<div class="alert alert-aviso">
				<h4>Aviso</h4>No existen subeventos.
				</div>
			{/if}
			</div>
</div>
