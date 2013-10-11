<input {if $disabled=='true'}disabled="disabled"{/if} class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="menor 2 años" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'menor 2 años'}checked{/if}
> Menor dos años &nbsp;

<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;" class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="2 5" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 2}checked{/if}
> 2-5 años &nbsp;

<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="5 10" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == '5 10'}checked{/if}
> 5-10 años &nbsp;

<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="10 15" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == '10 15'}checked{/if}
> 10-15 años &nbsp;

<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="15 20" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == '15 20'}checked{/if}
> 15-20 años &nbsp;

<input {if $disabled=='true'}disabled="disabled"{/if}  style="margin-left:10px;"class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="mayor 20 años" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'mayor 20 años'}checked{/if}
> Mayor 20 años
