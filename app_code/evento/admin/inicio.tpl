<div class="falso-modal row-fluid">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Último publicado<span class="text-error responsive_oculto"></span></h6>
	</div>
		<div class="falso-modal-body">
{if $eventos|@count > 0}
<table id="no-more-tables" class="table table_7_f">
<thead>
<tr><th>Fecha</th><th>Unidad</th><th>Recurso</th><th></th><th>Evento</th></tr>
</thead>
<tbody>
{foreach from=$eventos item=evento}
<tr style="background-color:{cycle values='#f9f9f9,#ffffff'}" class="">
<td class="" >{$evento->fecha_entrada|date_format:"%d-%m-%Y"}</td>
<td class="">{$evento->unidad->nombre_corto}</td>
<td class="">{$evento->recurso->nombre_corto} </td>
<td>{if $evento->id_padre == 0}<i class="icon-th-large"></i>{else}<i class="icon-th"></i>{/if}</td>
<td class="">{$evento->nombre_corto}</td>
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
</div>
<style>
th{
	background-color:#F2DEDE;
	color:#BE4A48;
	text-align:right;
}
.indent{
	margin-left:10px;
}
</style>
<script>
//DataTable que solo muestra 7 filas ,búsquedas y paginación
$('.table_7_f').dataTable({
"iDisplayLength": 7,
	"sDom":"<'row-fluid'<'span6'T>ft<'row-fluid'<'span6'><'span6 pagination pagination-centered'p>>>",
"oLanguage": {
		"sSearch": "<i class='icon-search'></i> ",
		"oPaginate": {
			"sLast": "",
			"sFirst": "",
			"sNext": "",
			"sPrevious": ""
		},
	"sZeroRecords": "<div class='alert alert-info'><h4>Aviso</h4><p>No existen coincidencias. Si esta realizando una búsqueda, y no se han encontrado coincidencias. Puede reiniciar la búsqueda:<ul><li>Borrando los caracteres introducidos.</li></ul></div>"
			}
});
$('.estadistica').on('click',function(){
	$(this).find('tbody').toggle("slow");
});
</script>
