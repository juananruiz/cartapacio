<div class="span12">
  <h1><i class="fa fa-archive"></i> Recursos</h1>
  <table class="table table-striped table-bordered">
    {foreach $recursos as $recurso}
      <tr {if $recurso->id_estado == 1}class="muted"{/if}>
        <td>{$recurso->id}</td>
        <td><a href="index.php?page=recurso_mostrar&id={$recurso->id}"><i class="fa fa-arrow-right"></i> {$recurso->nombre}</a></td>
        <td>{$recurso->autor->apellidos}, {$recurso->autor->nombre}</td>
        <td>{$recurso->seccion->nombre}</td>
        <td>{$recurso->estado->nombre}</td>
        <td>
          <a href="index.php?page=recurso_editar&id={$recurso->id}"><i class="fa fa-pencil"></i></a> 
        </td>
        <td>
          <a href="index.php?page=recurso_eliminar&id={$recurso->id}"><i class="fa fa-trash-o"></i></a> 
        </td>
      </tr>
    {/foreach}
  </table>
  <section><a href="index.php?page=recurso_editar" class="btn btn-inverse"><i class="fa fa-plus-circle"></i> Crear Recurso</a></section>
</div>

