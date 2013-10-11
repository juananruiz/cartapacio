<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Administrativo (alumnado)"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Administrativo (alumnado)'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Administrativo (alumnado).<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Administrativo (gestión económica)"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Administrativo (gestión económica)'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Administrativo (gestión económica).<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Administrativo (gestión PDI)"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Administrativo (gestión PDI)'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Administrativo (gestión PDI).<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Atención al Público"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Atención al Público'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Atención al Público.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Biblioteca"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Biblioteca'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Biblioteca.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Conserjería"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Conserjería'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Conserjería.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Cultura"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Cultura'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Cultura.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Deportes"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Deportes'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Deportes.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Infraestructuras"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Infraestructuras'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Infraestructuras.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Laboratorios"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Laboratorios'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Laboratorios.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Mantenimiento"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Mantenimiento'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Mantenimiento.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Medios para la docencia"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Medios para la docencia'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Medios para la docencia.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Nuevas tecnologías"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Nuevas tecnologías'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Nuevas tecnologías.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Órganos de Gobierno"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Órganos de Gobierno'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Órganos de Gobierno.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="Personal"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'Personal'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	Personal.<br />
<input 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="pregunta opcion_cerrada q{$id_pregunta}" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" 
	value="RRHH"
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado  == 'RRHH'}checked {/if} 
	name="{if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}noname{else}q{$id_pregunta}{/if}"> 
	RRHH.<br />

	<input {if $disabled=='true'}disabled="disabled"{/if}  class="pregunta activar_otro" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="radio" value="otro" {if $envio->respuestas[{$id_pregunta}]->valor_cerrado == 'otro'}checked{/if} name="activar_otro_q{$id_pregunta}"> Otro.

	<input 
	{if $envio->respuestas[{$id_pregunta}]->valor_cerrado != 'otro'}disabled="disabled"{/if} 
	{if $disabled=='true'}disabled="disabled"{/if}  
	class="nuevo_texto" data-id_envio="{$envio->id}" data-id_pregunta="{$id_pregunta}" data-id_cuestionario="{$cuestionario->id}"type="text" value="{$envio->respuestas[{$id_pregunta}]->valor_abierto}" name="q{$id_pregunta}" >
