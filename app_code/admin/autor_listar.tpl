<div class="span12">
  <h1><i class="fa fa-male"></i> Autores</h1>

  <table class="table table-striped table-bordered">
    {foreach $autores as $autor}
      <tr>
        <td>{$autor->id}</td>
        <td>{$autor->nombre}</td>
        <td>{$autor->apellidos}</td>
        <td>
          <a href="index.php?page=admin/autor_editar&id={$autor->id}"><i class="fa fa-pencil"></i> Editar</a> 
        </td>
        <td>
          <a href="index.php?page=admin/autor_eliminar&id={$autor->id}"><i class="fa fa-trash-o"></i> Eliminar</a> 
        </td>
      </tr>
    {/foreach}
  </table>

  <section><a href="index.php?page=admin/autor_crear" class="btn btn-inverse"><i class="fa fa-plus-circle"></i> Crear Autor</a></section>
  
</div>
