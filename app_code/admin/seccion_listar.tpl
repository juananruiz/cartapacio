<div class="span12">
  <h1><i class="fa fa-folder-open"></i> Secciones</h1>
  <table class="table table-striped table-bordered">
    {foreach $secciones as $seccion}
      <tr>
        <td>{$seccion->id}</td>
        <td>{$seccion->nombre}</td>
        <td>
          <a href="index.php?page=admin/seccion_editar&id={$seccion->id}"><i class="fa fa-pencil"></i> Editar</a> 
        </td>
        <td>
          <a href="index.php?page=admin/seccion_eliminar&id={$seccion->id}"><i class="fa fa-trash-o"></i> Eliminar</a> 
        </td>
      </tr>
    {/foreach}
  </table>
  <section><a href="index.php?page=admin/seccion_crear" class="btn btn-inverse"><i class="fa fa-plus-circle"></i> Nueva seccion</a></section>
</div>
