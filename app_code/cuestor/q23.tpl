<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_pregunta="{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Presupuesto total disponible, y porcentaje del total"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Presupuesto total disponible, y porcentaje del total'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Presupuesto total disponible (y % del total).<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_pregunta="{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Requisito de acceso a la acción social no automática"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Requisito de acceso a la acción social no automática'}checked {/if}
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Requisito de acceso a la acción social no automática.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_pregunta="{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Requisitos de acceso a la acción social automática"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Requisitos de acceso a la acción social automática'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Requisitos de acceso a la acción social automática.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_pregunta="{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Condiciones específicas para cada ayuda"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Condiciones específicas para cada ayuda'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Condiciones específicas para cada ayuda.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_pregunta="{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Plazos de solicitud"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Plazos de solicitud'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Plazos de solicitud.<br />


<input {if $disabled=='true'}disabled="disabled"{/if}  class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="NSNC" name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'NSNC'}checked{/if}
>  No dispongo de la información suficiente para contestar.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta activar_otro" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="otro"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'otro'}checked {/if} 
	name="activar_otro_q{$id_pregunta}"> Otro. 

<input 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado != "otro"}disabled="disabled"{/if} 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="nuevo_texto" data-id_pregunta="{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="text" value="{$envio->respuestas[{$id_pregunta}]->valor_abierto}" 
	name="q{$id_pregunta}">
