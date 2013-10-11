<div class="falso-modal row-fluid">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Listado de usuarios<span class="text-error responsive_oculto"></span><a href="index.php?page=evento/admin/usuario_buscar" class="btn pull-right btn-mini"><i class="icon-plus-sign"></i> Usuario/Permiso</a></h6>
	</div>
	<div class="falso-modal-body">
		<table id="no-more-tables" class="table table_7">
			<thead>
				<tr><th class="span2"></th><th class="span4">Usuario</th><th></th><th><span class="ancho_fijo_80">Id permiso</span> - <span class="ancho_fijo_80">Unidades</span> - <span class="ancho_fijo_110">Recursos</span></th></tr>
			</thead>
			<tbody>
				{foreach from=$usuarios item=usuario}
				<tr><td><a href="index.php?page=evento/admin/usuario_crear&id={$usuario->usuario->id}">{$usuario->usuario->uvus}</a></td>
				<td>
				{$usuario->usuario->nombre|capitalize} {$usuario->usuario->apellidos|capitalize:'true'}
				</td>
				<td><i class="icon-plus"></i></td>
				<td>
				<table class="table table-striped" style="display:none">
				{foreach from=$usuario->permiso item=permiso}
				<tr>
					 <td>{$permiso->id}</td> 
					 <td>{$permiso->recurso->unidad->nombre_corto}</td>
					 <td>{$permiso->recurso->nombre_corto}</td>
				</tr>
				{/foreach}
				</table>
				</td>
				</tr>
				{/foreach}
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</div>
</div>
<script src="js/evento.js"></script>
<script>
$('.icon-plus').on('click',function(){
	$(this).closest('table').find('table').toggle();
	$(this).toggleClass('icon-minus');
});
$('#usuario_buscar').keyup(function(){
	var cadena = $(this).val();
	$.ajax({
		url: "index.php?page=evento/admin/usuario_buscar&ajax=true&cadena="+cadena,
		success: function(datos)
		{
			$('#box').html(datos);
		}
	}); 
});
</script>
