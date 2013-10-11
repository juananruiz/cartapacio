<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="El Rectorado"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'El Rectorado'}checked {/if} 
	name="q{$id_pregunta}"> El Rectorado.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="La Dirección de RRHH"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'La Dirección de RRHH'}checked {/if} 
	name="q{$id_pregunta}"> La Dirección de RRHH.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Los responsables de Unidad"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Los responsables de Unidad'}checked {/if} 
	name="q{$id_pregunta}"> Los responsables de Unidad.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="La situación económica"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'La situación económica'}checked {/if} 
	name="q{$id_pregunta}"> La situación económica.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="Las condiciones sociolaborales"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Las condiciones sociolaborales'}checked {/if} 
	name="q{$id_pregunta}"> Las condiciones sociolaborales.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"
	type="radio" value="El desconocimiento del personal acerca del impacto real de su trabajo en el logro de objetivos"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'El desconocimiento del personal acerca del impacto real de su trabajo en el logro de objetivos'}checked {/if} 
	name="q{$id_pregunta}"> El desconocimiento del personal acerca del impacto real de su trabajo en el logro de objetivos.<br /> 

<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="NSNC" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'NSNC'}checked{/if}
>  No dispongo de la información suficiente para contestar.
