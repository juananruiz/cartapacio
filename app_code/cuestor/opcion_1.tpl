<input {if $disabled=='true'}disabled="disabled"{/if}   class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="1" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 1}checked{/if}
> Si <br />
<input {if $disabled=='true'}disabled="disabled"{/if}  class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="2" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 2}checked{/if}
> No  
