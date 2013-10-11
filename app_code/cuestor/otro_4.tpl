<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Dirección de RRHH"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Dirección de RRHH'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Dirección de RRHH.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Responsables de Unidad"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Responsables de Unidad'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Responsables de Unidad.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Personal, no responsables de Unidad"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Personal, no responsables de Unidad'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Personal, no responsables de Unidad.<br />

<input {if $disabled=='true'}disabled="disabled"{/if}  class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="NSNC" 
name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"
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
