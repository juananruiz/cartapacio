<div class="span12">
  <h1><i class="fa fa-folder-open"></i> ubicaciones</h1>
  <table class="table table-striped table-bordered">
    {foreach $ubicaciones as $ubicacion}
      <tr>
        <td>{$ubicacion->id}</td>
        <td>{$ubicacion->nombre}</td>
        <td>
          <a href="index.php?page=admin/ubicacion_editar&id={$ubicacion->id}"><i class="fa fa-pencil"></i> Editar</a> 
        </td>
        <td>
          <a href="index.php?page=admin/ubicacion_eliminar&id={$ubicacion->id}"><i class="fa fa-trash-o"></i> Eliminar</a> 
        </td>
      </tr>
    {/foreach}
  </table>
  <section><a href="index.php?page=admin/ubicacion_crear" class="btn btn-inverse"><i class="fa fa-plus-circle"></i> Nueva ubicacion</a></section>
</div>
