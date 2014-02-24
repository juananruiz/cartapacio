{if isset($iconografias)}
  {foreach $iconografias as $iconografia}
    <li><a href="#" data-id="{$iconografia->id}">{$iconografia->nombre|htmlentities}</a></li>
  {/foreach}
{else}
  No se ha encontrado ninguna iconografia coincidente
{/if}
