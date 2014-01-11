<div class="falso-modal" style="margin-bottom:20px">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Estadística<span class="text-error responsive_oculto"></span></h6>
	</div>
	<div class="falso-modal-body">
		{foreach from=$unidades item=unidad}
			<table class="table">
			<thead>
			<tr>
				<th>{$unidad->nombre_corto}</th>
				<th class="span3"><i class="icon-plus pull-right"></i><span class="pull-right span2">{$unidad->numero_de_eventos}</span> </th>
			</tr>
			</thead>
			<tbody style="display:none">
			{foreach from=$unidad->recursos item=recurso}
				<tr><td>{$recurso->nombre_corto|capitalize:true}</td><td class="span3"><span class="pull-right">{$recurso->numero_de_eventos}</span></td></tr>
			{/foreach}
			<tr>
				<td></td>
				<th class="span3 alert-success" style="font-weight:bold">Total {$unidad->nombre_corto}: <span class="pull-right">{$unidad->numero_de_eventos}</th>
			</tr>
			</tbody>
		</table>
		{/foreach}
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
$('.icon-plus').on('click',function(){
	$(this).closest('table').find('tbody').toggle('slow');
	if ($(this).hasClass('icon-minus'))
	{
		$(this).removeClass('icon-minus').addClass('icon-plus');
	}
	else
	{
		$(this).removeClass('icon-plus').addClass('icon-minus');
	}
});
</script>
