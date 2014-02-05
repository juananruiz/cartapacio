<div class="span12">
  <h1><i class="fa fa-user"></i> Usuarios registrados
  {if $_usuario->id_rol == 1}
    <a class="btn pull-right" href="index.php?page=admin/usuario_crear"><i class="fa fa-plus-circle"></i> Crear usuario</a>
  {/if}
  </h1>

  <table class="table table-striped table-bordered">
    <thead>
      <tr>
        <th>id</th>
        <th>Apellidos, nombre</th>
        <th>Correo</th>
        <th>Rol</th>
        <th>Último acceso</th>
        {if $_usuario->id_rol == 1}
          <th></th>
          <th></th>
        {/if}
    </thead>
    <tbody>
      {foreach $usuarios as $usuario}
        <tr{if $usuario->activo==0} class="muted"{/if}>
          <td>{$usuario->id}</td>
          <td>{$usuario->apellidos}, {$usuario->nombre}</td>
          <td><a href="mailto:{$usuario->correo}">{$usuario->correo}</a></td>
          <td>{$usuario->rol->nombre}</td>
          <td>{$usuario->ultimo_acceso}</td>
          {if $_usuario->id_rol == 1}
            <td>
              <a href="index.php?page=admin/usuario_editar&id={$usuario->id}"><i class="fa fa-pencil"></i></a> 
            </td>
            <td>
              {if $usuario->activo==1}
                <a href="index.php?page=admin/usuario_eliminar&id={$usuario->id}"><i class="fa fa-trash-o"></i></a> 
              {/if}
            </td>
          {/if}
        </tr>
      {/foreach}
    </tbody>
  </table>
</div>
