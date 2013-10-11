{if $plantilla_vacia == 'false'}
	{if $envios|@count >0}
	<table class="table">
		<tr>
			<th></th>
			<th>Id envio</th>
				{if $id_rol == 1}
			<th>Uvus</th>
			<th>DNI</th>
				{/if}
			<th>Fecha inicio</th>
			<th>Fecha fín</th>
		</tr>
		{foreach from=$envios item=envio}
			<tr>
				<td>{if $id_rol == 1 AND $envio.fecha_fin != NULL}<a href="#" role="button" class="reabrir" data-id_envio="{$envio.id}" data-toggle="modal" title="Reabrir la encuesta" data-uvus="{$envio.uvus}"><i class="icon-edit"></i></a>{/if}</td>
				<td><a href="index.php?page=cuestor/admin/envio_datos&id_envio={$envio.id}&id_cuestionario={$cuestionario->id}">{$envio.id}</a></td>
					{if $id_rol == 1}
				<td>{$envio.uvus}</td>
				<td>{$envio.nif}</td>
					{/if}
				<td>{$envio.fecha_inicio}</td>
				<td class="fecha_fin_{$envio.id}">{$envio.fecha_fin}</td>
			<tr>
		{/foreach}
	</table>
	{else}
	<div class="text-error">No hay coincidencias</div>
	{/if}
{/if}
{literal}
<script>
$(".reabrir").on('click',function()
{
	var id_envio = $(this).data("id_envio");
	var uvus = $(this).data("uvus");
	if (confirm('¿Quieres reabrir el envio '+id_envio+' del usuario '+uvus+'?'))
	{
		$.ajax({
			url: "index.php?page=cuestor/admin/envios_consultar_ajax&ajax=true&id_envio="+id_envio,
			success: function(datos)
			{
				$('.fecha_fin_'+id_envio).html('<span class="text-success" style="font-weight:bold">!!! Envio reabierto ¡¡¡</span>');	
				//location.reload();
			}
		})
	}
});
</script>
{/literal}
