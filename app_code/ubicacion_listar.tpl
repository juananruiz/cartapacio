<div class="span12">
  <h1><i class="fa fa-map-marker"></i> Ubicaciones</h1>
  <table class="table table-striped table-bordered">
    {foreach $ubicaciones as $ubicacion}
      <tr>
        <td>{$ubicacion->id}</td>
        <td><a href="index.php?page=ubicacion_mostrar&id_ubicacion={$ubicacion->id}">{$ubicacion->nombre}</a></td>
        {if $_usuario->id_rol < 4}
          <td>
            <a href="index.php?page=admin/ubicacion_editar&id={$ubicacion->id}"><i class="fa fa-pencil"></i> Editar</a> 
          </td>
          <td>
            <a href="index.php?page=admin/ubicacion_eliminar&id={$ubicacion->id}"><i class="fa fa-trash-o"></i> Eliminar</a> 
          </td>
        {/if}
      </tr>
    {/foreach}
  </table>
  {if $_usuario->id_rol < 3}
    <section>
      <a class="btn btn-inverse" href="index.php?page=admin/ubicacion_crear"><i class="fa fa-plus-circle"></i> Crear Ubicación</a>
    </section>
  {/if}
</div>
