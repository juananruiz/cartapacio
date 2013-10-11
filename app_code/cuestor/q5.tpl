<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Ordenación y valoración de puestos de trabajo"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Ordenación y valoración de puestos de trabajo'}checked {/if} 
	name="q{$id_pregunta}"> Ordenación y valoración de puestos de trabajo.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Comités de expertos para la provisión de puestos de trabajo"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Comités de expertos para la provisión de puestos de trabajo'}checked {/if} 
	name="q{$id_pregunta}"> Comités de expertos para la provisión de puestos de trabajo.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Comités de expertos para la medición de niveles competenciales"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Comités de expertos para la medición de niveles competenciales'}checked {/if} 
	name="q{$id_pregunta}"> Comités de expertos para la medición de niveles competenciales.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Grupos de trabajo para la definición de perfiles profesionales"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Grupos de trabajo para la definición de perfiles profesionales'}checked {/if} 
	name="q{$id_pregunta}"> Grupos de trabajo para la definición de perfiles profesionales.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Comités para el seguimiento del desempeño institucional"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Comités para el seguimiento del desempeño institucional'}checked {/if} 
	name="q{$id_pregunta}"> Comités para el seguimiento del desempeño institucional.<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Comités para la gestión de la información, comunicación interna"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Comités para la gestión de la información, comunicación interna]'}checked {/if} 
	name="q{$id_pregunta}"> Comités para la gestión de la información (comunicación interna).<br />

<input 
	{if $disabled=='true'}disabled="disabled"{/if}
	class="pregunta" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="NSNC" 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'NSNC'}checked {/if}
	name="q{$id_pregunta}"> No dispongo de la información suficiente para contestar.<br />
