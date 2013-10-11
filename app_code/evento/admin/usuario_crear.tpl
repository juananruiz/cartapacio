<div class="falso-modal">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Crear permiso para <span class="text-error">{$usuario->nombre} {$usuario->apellidos}</span></h6>
	</div>
	<div class="falso-modal-body">
		<ul style="list-style:none">
		{foreach from=$unidades item=unidad}
			<li class="fila_unidad"><a href="javascript:void(0)"  class="unidad"><i class="icon-align-justify"></i> {$unidad->nombre}</a> <span class="aviso"></span>
				<ul style="list-style:none;display:none" class="lista_recursos">
				{foreach from=$unidad->recursos item=recurso}
				<li>
					<input name="id_recurso_{$recurso->id}" {if $recurso->permiso_usuario == 1}checked{/if} type="checkbox" class="recurso" data-id_usuario="{$usuario->id}" value="1" data-id_recurso="{$recurso->id}"> 
					<span style="display:none;font-weight:bold;color:#{$recurso->sector->color}">{$recurso->sector->sector}</span> {$recurso->nombre} 
					<span id="span_{$recurso->id}"></span>
				</li>
				{/foreach}
				</ul>
			</li>
		{/foreach}
		</ul>
	</div>
</div>
<script>
$('.unidad').on('click',function(){
	$(this).nextAll('.lista_recursos').toggle("slow");
});
$('.recurso').on('change',function(){
	var elemento = $(this);
	var aviso = elemento.closest('.fila_unidad').find('.aviso');
	var id_recurso = elemento.data('id_recurso');
	var id_usuario = elemento.data('id_usuario');
	var aviso = elemento.closest('.fila_unidad').find('.aviso');
	$('.aviso').html('').fadeIn();
	$.ajax({
		url:"index.php?page=evento/admin/evento_ajax&ajax=true&modulo=permiso&id_usuario="+id_usuario+"&id_recurso="+id_recurso,
		success:function(datos){
			aviso.html(datos).delay(2000).fadeOut();
     }
	});
});
</script>

