<div class="falso-modal row-fluid">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Último publicado<span class="text-error responsive_oculto"></span><a href="index.php?page=evento/evento_crear_intermedia&c=eventos_listar" class="btn pull-right btn-mini"><i class="icon-plus-sign"></i> Evento</a></h6>
	</div>
		<div class="falso-modal-body">
{if $eventos|@count > 0}
<table id="no-more-tables" class="table table_7">
<thead>
<tr><th class="hide"></th><th>Fecha</th><th>Unidad</th><th></th><th>Evento</th></tr>
</thead>
<tbody>
{foreach from=$eventos item=evento}
<tr style="background-color:{cycle values='#f9f9f9,#ffffff'}" class="">
<td class="responsive_oculto hide" >{$evento.id}</td>
<td class="responsive_destacado span1">{$evento.fecha_entrada|date_format:"%d-%m-%Y"}</td>
<td class="responsive_indentado responsive_cursiva muted span3">{$evento.recurso->unidad->nombre_corto} - {$evento.recurso->nombre_corto}</td>
<td>{if $evento.id_padre == 0}<i class="icon-th-large"></i>{else}<i class="icon-th"></i>{/if}</td>
<td class="">
{if $evento.id_padre == 0}<a href="index.php?page=evento/evento_mostrar&id={$evento.id}">{$evento.nombre_corto}</a>{else}{$evento.nombre_corto}{/if}
<div class="responsive_oculto">{$evento.contenido|truncate:200:"..."}</div>
</td>
</tr>
{/foreach}
</tbody>
</table>
{else}
	<div class="alert alert-aviso">
		<h4>Aviso</h4>
		No hay eventos.
	</div>
{/if}
</div>
</div>
</div>{literal}
<script src="js/evento.js"></script>
{/literal}
