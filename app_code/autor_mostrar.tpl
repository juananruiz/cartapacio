<div class="span12">
  <h1><i class="fa fa-camera-retro"></i> {$autor->nombre}</h1>
  {if $recursos}
    <table class="table table-striped table-bordered">
      {foreach $recursos as $recurso}
        <tr {if $recurso->id_estado == 1}class="muted"{/if}>
          <td>{$recurso->id}</td>
          <td><a href="index.php?page=recurso_mostrar&id={$recurso->id}">{$recurso->nombre}</a></td>
          <td>{$recurso->ubicacion->nombre}</td>
          {if $_usuario->id_rol < 4}
            <td>{$recurso->estado->nombre}</td>
            <td>
              <a href="index.php?page=recurso_editar&id={$recurso->id}"><i class="fa fa-pencil"></i></a> 
            </td>
            <td>
              <a href="index.php?page=recurso_eliminar&id={$recurso->id}"><i class="fa fa-trash-o"></i></a> 
            </td>
          {/if}
        </tr>
      {/foreach}
    </table>
  {else}
    <h4>No hay ningún recurso asociado a esta ubicación</h4>
  {/if}

</div>


