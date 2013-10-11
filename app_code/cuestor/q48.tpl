<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Grado de complejidad del trabajo"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Grado de complejidad del trabajo'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Grado de complejidad del trabajo.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Nivel de responsabilidad general"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Nivel de responsabilidad general'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Nivel de responsabilidad general asignado al puesto.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Polivalencia funcional del puesto"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Polivalencia funcional del puesto'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Polivalencia funcional del puesto.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="Número de personas que dependen funcionalmente del puesto"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Número de personas que dependen funcionalmente del puesto'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> Número de personas que dependen funcionalmente del puesto.<br />

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
