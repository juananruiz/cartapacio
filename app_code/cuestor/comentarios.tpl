<textarea 
  rows="20" 
  {if $disabled=='true'}disabled="disabled"{/if}   
  class="textarea" 
  style="width:90%" 
  data-id_envio="{$envio->id}" 
  data-id_cuestionario="{$cuestionario->id}" 
  name="q{$id_pregunta}"
  >
{$envio->respuestas[$id_pregunta]->valor_abierto}
</textarea>

