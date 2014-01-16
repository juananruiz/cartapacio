<div class="span12">
  <h1><i class="fa fa-camera-retro"></i> Usuarios web</h1>
  <table class="table table-striped table-bordered">
    {foreach $usuarios as $usuario}
      <tr>
        <td>{$usuario->id}</td>
        <td>{$usuario->apellidos}, {$usuario->nombre}</td>
        <td><a href="mailto:{$usuario->correo}">{$usuario->correo}</a></td>
        <td>{$usuario->rol->nombre}</td>
        <td>{$usuario->fecha_alta}</td>
        <td>
          <a href="index.php?page=admin/usuario_editar&id={$usuario->id}"><i class="fa fa-pencil"></i> Editar</a> 
        </td>
        <td>
          <a href="index.php?page=admin/usuario_eliminar&id={$usuario->id}"><i class="fa fa-trash-o"></i> Eliminar</a> 
        </td>
      </tr>
    {/foreach}
  </table>
  <section><a class="btn btn-inverse" href="index.php?page=admin/usuario_crear"><i class="fa fa-plus-circle"></i> Crear usuario</a></section>
</div>
