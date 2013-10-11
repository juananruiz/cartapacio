<input {if $disabled=='true'}disabled="disabled"{/if} class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="Apoyo a la Docencia" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'Apoyo a la Docencia'}checked{/if}
> Apoyo a la Docencia<br />

<input {if $disabled=='true'}disabled="disabled"{/if}   class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="Apoyo a la Investigación" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'Apoyo a la Investigación'}checked{/if}
> Apoyo a la Investigación<br />
<input {if $disabled=='true'}disabled="disabled"{/if}  class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="Atención a la Comunidad Universitaria" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'Atención a la Comunidad Universitaria'}checked{/if}
> Atención a la Comunidad Universitaria<br />
<input {if $disabled=='true'}disabled="disabled"{/if}  class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="Económico y financiero" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'Económico y financiero'}checked{/if}
> Económico y financiero<br />
<input {if $disabled=='true'}disabled="disabled"{/if}  class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="Infraestructuras" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'Infraestructuras'}checked{/if}
> Infraestructuras<br />
<input {if $disabled=='true'}disabled="disabled"{/if}  class="pregunta" data-id_envio="{$envio->id}" data-id_cuestionario="{$cuestionario->id}" type="radio" value="RRHH" name="q{$id_pregunta}"
{if $envio->respuestas[$id_pregunta]->valor_cerrado == 'RRHH'}checked{/if}
> RRHH
