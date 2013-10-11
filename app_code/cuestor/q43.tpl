<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta " data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Funcionario de carrera"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Funcionario de carrera'}checked {/if} 
	name="q{$id_pregunta}"> 
	Funcionario de carrera.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta " data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Funcionario interino"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Funcionario interino'}checked {/if} 
	name="q{$id_pregunta}"> 
	Funcionario interino.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta " data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Laboral fijo"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Laboral fijo'}checked {/if} 
	name="q{$id_pregunta}"> 
	Laboral fijo.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta " data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Laboral eventual"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Laboral eventual'}checked {/if} 
	name="q{$id_pregunta}"> 
	Laboral eventual.<br />
