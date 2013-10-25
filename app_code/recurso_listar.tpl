<div class="span12">
  <p><a href="index.php?page=admin/recurso_crear">Nuevo recurso</a></p>
  <table class="table table-striped">
    {foreach $recursoes as $recurso}
      <tr>
        <td>{$recurso->id}</td>
        <td>{$recurso->nombre}</td>
        <td>{$recurso->seccion->nombre}</td>
        <td>
          <a href="index.php?page=admin/recurso_editar&id={$recurso->id}">Editar</a> 
          <a href="index.php?page=admin/recurso_eliminar&id={$recurso->id}">Eliminar</a> 
        </td>
      </tr>
    {/foreach}
  </table>
</div>

