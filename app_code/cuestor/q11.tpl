<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Normativa interna actualizada"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Normativa interna actualizada'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Normativa interna actualizada.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Normativa externa actualizada"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Normativa externa actualizada'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Normativa externa actualizada.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Procedimientos y protocolos de trabajo internos"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Procedimientos y protocolos de trabajo internos'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Procedimientos y protocolos de trabajo internos.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Información presupuestaria general" 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Información presupuestaria general'}checked {/if}
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Información presupuestaria general.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Resultados de los grupos de trabajo" 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'Resultados de los grupos de trabajo'}checked {/if}
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Resultados de los grupos de trabajo.<br />

<input {if $disabled=='true'}disabled="disabled"{/if} class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="NSNC" name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'NSNC'}checked{/if}
>  No dispongo de la información suficiente para contestar.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta activar_otro" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="otro" 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}checked {/if}
	name="activar_otro_q{$id_pregunta}"> Otro.

<input
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado != 'otro'}disabled="disabled"{/if} 
	{if $disabled=='true'}disabled="disabled"{/if}

	class="nuevo_texto" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="text" value="{$envio->respuestas[{$id_pregunta}]->valor_abierto}" 
		name="q{$id_pregunta}">
