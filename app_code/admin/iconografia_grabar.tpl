    <tr>
      <td class="editable" id="{$iconografia->id}"><i class="fa fa-edit"></i> &nbsp;<span>{if $iconografia->nombre != ""}{$iconografia->nombre}{else}<i class="fa fa-pencil"></i>{/if}</span></td>
      <td>0</td>
      {if $_usuario->id_rol < 3}
        <td>
            <a href="index.php?page=admin/iconografia_eliminar&id={$iconografia->id}" class="eliminar-iconografia"><i class="fa fa-trash-o"></i></a> 
        </td>
      {/if}
    </tr>
