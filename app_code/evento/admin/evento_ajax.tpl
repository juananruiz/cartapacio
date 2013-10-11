{if $modulo == 'permiso'}
	{if $aviso == 1}
		<span class="badge badge-success"><i class="icon-trash icon-white"></i> Permiso borrado</span>
	{/if}
	{if $aviso == 2}
		<span class="badge badge-success"><i class="icon-remove icon-white"></i> Error al borrar permiso</span>
	{/if}
	{if $aviso == 3}
		<span class="badge badge-success"><i class="icon-ok icon-white"></i> Permiso creado</span>
	{/if}
	{if $aviso == 4}
		<span class="badge badge-success"><i class="icon-remove icon-white"></i> Error al crear permiso</span>
	{/if}
{/if}

