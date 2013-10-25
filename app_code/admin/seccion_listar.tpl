<div class="span12">
  <h1><i class="fa fa-folder-open"></i> Secciones</h1>
  <table class="table table-striped">
    {foreach $secciones as $seccion}
      <tr>
        <td>{$seccion->id}</td>
        <td>{$seccion->nombre}</td>
        <td>
          <a href="index.php?page=admin/seccion_editar&id={$seccion->id}">Editar</a> 
          <a href="index.php?page=admin/seccion_eliminar&id={$seccion->id}">Eliminar</a> 
        </td>
      </tr>
    {/foreach}
  </table>
  <p><button><a href="index.php?page=admin/seccion_crear"><i class="fa fa-plus-circle"></i> Nueva seccion</a></button></p>
</div>
