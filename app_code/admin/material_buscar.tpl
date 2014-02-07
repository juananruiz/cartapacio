{if isset($materiales)}
  {foreach $materiales as $material}
    <li><a href="#" data-id="{$material->id}">{$material->nombre|htmlentities}</a></li>
  {/foreach}
{else}
  No se ha encontrado ningún material coincidente
{/if}
