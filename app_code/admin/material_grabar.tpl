    <tr>
      <td class="editable" id="{$material->id}"><i class="fa fa-edit"></i> &nbsp;<span>{if $material->nombre != ""}{$material->nombre}{else}<i class="fa fa-pencil"></i>{/if}</span></td>
      <td>0</td>
      {if $_usuario->id_rol < 3}
        <td>
            <a href="index.php?page=admin/material_eliminar&id={$material->id}" class="eliminar-material"><i class="fa fa-trash-o"></i></a> 
        </td>
      {/if}
    </tr>
