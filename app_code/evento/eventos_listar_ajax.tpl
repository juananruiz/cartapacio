{if !empty($eventos)}
<table id="no-more-tables" class="table datatable table_7">
<thead>
<tr><th></th><th></th><th class="">Id</th><th>Fecha</th><th>Unidad - Recurso</th><th>Evento</th></tr>
</thead>
<tbody>
{foreach from=$eventos item=evento}
<tr style="background-color:{cycle values='#f9f9f9,#ffffff'}" class="">
<td class="span1">
<a href="index.php?page=evento/evento_editar&id={$evento.id}&retorno={$smarty.get.page}" class="" title="Editar evento"><i class="icon-pencil"></i></a> </td>
<td>
{if $evento.id_recurso == NULL}
	<a data-original-title="Crear subevento" href="#" class="" data-toggle="popover" title="" data-content="No se puede crear un subevento sino esta definido el recurso del evento. Edite el evento y seleccione un recurso." title="No se puede crear un subevento sino esta definido el recurso del evento. Edite el evento y seleccione un recurso."><i class="icon-th"></i></a>
{else}
<a href="index.php?page=evento/subevento_crear_intermedia&id_padre={$evento.id}&retorno={$smarty.get.page}" class="" title="Crear subeventos"><i class="icon-th"></i></a>
{/if}
</td>
<td class="responsive_oculto" >{$evento.id}</td>
<td class="responsive_destacado span1">{$evento.fecha_entrada|date_format:"%d-%m-%Y"}</td>
<td class="responsive_indentado responsive_cursiva muted span3">{$evento.recurso->unidad->nombre_corto} - {$evento.recurso->nombre_corto}</td>
<td class="">
<a href="index.php?page=evento/evento_mostrar&id={$evento.id}">{$evento.nombre_corto}</a>
<div class="responsive_oculto">{$evento.contenido|truncate:200:"..."}</div>
</td>
</tr>
{/foreach}
</tbody>
</table>
{else}
	<div class="alert alert-aviso">
		<h4>Aviso</h4>
			<p>No existen coincidencias. Si esta realizando una búsqueda, y no se han encontrado coincidencias. Puede reiniciar la búsqueda:
			<ul>
				<li>Borrando los caracteres introducidos.</li>
			</ul>
			</p>
	</div>
{/if}
{literal}
<script>
//DataTable que solo muestra 7 filas y paginación
	$('.table_7').dataTable({
	"aaSorting": [[ 1, "desc" ]],
	"iDisplayLength": 7,
	"sDom":"<'row-fluid'<'span6'T>t<'row-fluid'<'span6 pagination '><'span6 pagination pagination-centered'p>>>",
	"oLanguage": {
			"oPaginate": {
        "sLast": "",
				"sFirst": "",
				"sNext": "",
				"sPrevious": ""
			},
		"sZeroRecords": "<div class='alert alert-info'><h4>Aviso</h4><p>No existen registros. Si esta realizando una búsqueda, y no se han encontrado coincidencias, puede reiniciar la búsqueda:<ul><li>Borrando los caracteres introducidos.</li></ul></div>"
    }
	});
</script>
<script src="js/evento.js"></script>
{/literal}

