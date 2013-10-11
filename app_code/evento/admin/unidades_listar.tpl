<div class="falso-modal">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Listado de unidades <span class="text-error responsive_oculto"></span><a href="" class="btn btn-mini pull-right"><i class="icon-plus-sign"></i> Unidades</a></h6>
	</div>
	<div class="falso-modal-body">
		<ul style="list-style:none">
		{foreach from=$unidades item=unidad}
			<li><a href="javascript:void(0)" class="unidad"><i class="icon-align-justify"></i> {$unidad->nombre}</a>
				<ul style="list-style:none;display:none">
				{foreach from=$unidad->recursos item=recurso}
				<li> <span style="font-weight:bold;;color:#{$recurso->sector->color}">{$recurso->sector->sector}</span> {$recurso->nombre}</li>
				{/foreach}
				</ul>
			</li>
		{/foreach}
		</ul>
	</div>
</div>
