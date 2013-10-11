(mínimo) 
<input {if $disabled=='true'}disabled="disabled"{/if} class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="1" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 1}checked{/if}
> 1 &nbsp;
<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;" class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="2" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 2}checked{/if}
> 2 &nbsp;
<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="3" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 3}checked{/if}
> 3 &nbsp;
<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="4" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 4}checked{/if}
> 4 &nbsp;
<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="5" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 5}checked{/if}
> 5 &nbsp;
<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="6" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 6}checked{/if}
> 6 (máximo)

<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="NSNC" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'NSNC'}checked{/if}
>  No dispongo de la información suficiente para contestar.
