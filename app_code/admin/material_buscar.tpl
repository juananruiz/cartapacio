{if isset($materiales)}
  {foreach $materiales as $material}
    <li data-id="{$material->id}">{$material->nombre|htmlentities}</li>
  {/foreach}
{/if}
