<div class="span12">
  <h1><i class="fa fa-camera-retro"></i> Colecciones</h1>
  <table class="table table-striped">
    {foreach $colecciones as $coleccion}
      <tr>
        <td>{$coleccion->id}</td>
        <td>{$coleccion->nombre}</td>
        <td>
          <a href="index.php?page=admin/coleccion_editar&id={$coleccion->id}">Editar</a> 
          <a href="index.php?page=admin/coleccion_eliminar&id={$coleccion->id}">Eliminar</a> 
        </td>
      </tr>
    {/foreach}
  </table>
  <p><a href="index.php?page=admin/coleccion_crear">Nueva coleccion</a></p>
</div>
