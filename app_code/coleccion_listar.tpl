<div class="span12">
  <h1><i class="fa fa-camera-retro"></i> Colecciones</h1>
  <table class="table table-striped table-bordered">
    {foreach $colecciones as $coleccion}
      <tr>
        <td>{$coleccion->id}</td>
        <td><a href="index.php?page=coleccion_mostrar&id_coleccion={$coleccion->id}">{$coleccion->nombre}</a></td>
        {if $_usuario->id_rol < 3}
          <td>
            <a href="index.php?page=admin/coleccion_editar&id={$coleccion->id}"><i class="fa fa-pencil"></i> Editar</a> 
          </td>
          <td>
            <a href="index.php?page=admin/coleccion_eliminar&id={$coleccion->id}"><i class="fa fa-trash-o"></i> Eliminar</a> 
          </td>
        {/if}
      </tr>
    {/foreach}
  </table>
  {if $_usuario->id_rol < 3}
    <section>
      <a class="btn btn-inverse" href="index.php?page=admin/coleccion_crear"><i class="fa fa-plus-circle"></i> Crear colección</a>
    </section>
  {/if}
</div>
