    <tr>
      <td class="editable" id="{$estilo->id}"><span>{if $estilo->nombre != ""}{$estilo->nombre}{else}<i class="fa fa-pencil"></i>{/if}</span></td>
      <td>0</td>
      {if $_usuario->id_rol < 3}
        <td>
            <a href="index.php?page=admin/estilo_eliminar&id={$estilo->id}"><i class="fa fa-trash-o"></i></a> 
        </td>
      {/if}
    </tr>
