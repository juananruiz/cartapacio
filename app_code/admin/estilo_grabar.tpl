    <tr>
      <td class="editable" id="{$estilo->id}"><i class="fa fa-edit"></i> &nbsp; <span>{$estilo->nombre}</span></td>
      <td>0</td>
      {if $_usuario->id_rol < 3}
        <td>
            <a href="index.php?page=admin/estilo_eliminar&id={$estilo->id}" class="eliminar-estilo"><i class="fa fa-trash-o"></i></a> 
        </td>
      {/if}
    </tr>
