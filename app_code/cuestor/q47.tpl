<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Antigüedad"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Antigüedad'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Antigüedad.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Experiencia profesional"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Experiencia profesional'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Experiencia profesional.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Factores de conciliación"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Factores de conciliación'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Factores de conciliación.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Adecuación de competencias técnicas" 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Adecuación de competencias técnicas'}checked {/if}
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Adecuación de competencias técnicas.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Adecuación de competencias de otro tipo, genéricas o específicas" 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'Adecuación de competencias de otro tipo, genéricas o específicas'}checked {/if}
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Adecuación de competencias de otro tipo (genéricas o específicas).<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="NSNC" 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'NSNC'}checked {/if}
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> No dispongo de la información suficiente para contestar.<br />


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
