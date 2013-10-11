<div class="falso-modal row-fluid">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Mis recursos<span class="text-error responsive_oculto"></span></h6>
	</div>
	<div class="falso-modal-body">
		<table id="no-more-tables" class="table table_7">
		<thead>
		<tr><th>Unidad</th><th>Recurso</th></tr>
		</thead>
		<tbody>
		{foreach from=$permisos item=permiso}
		<tr><td>{$permiso.unidad}</td><td> {foreach from=$permiso.recursos item=recurso} <i class="icon-align-justify"></i> {$recurso.recurso}<br />{/foreach}</td></tr>
		{/foreach}
		</tbody>
		</table>
	</div>
</div>
