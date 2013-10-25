<div class="span12">
  <h1><i class="fa fa-male"></i> Autores</h1>

  <table class="table table-striped">
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

  <p><button><a href="index.php?page=admin/autor_crear"><i class="fa fa-plus-circle"></i> Nuevo autor</a></button></p>
  
</div>
