<div class="span8">
  <h1><i class="fa fa-male"></i> Editar Usuario</h1>

  <form class="form-horizontal" action="index.php?page=admin/usuario_grabar" method="POST">
    <input type="hidden" name="id" value="{$perfil->id}">

    <div class="control-group">
      <label class="control-label" for="id_rol">Rol</label>
      <div class="controls">
        <select class="input-medium" name="id_rol" id="id_rol">
          <option value=""></option>
          {foreach $roles as $rol}
            <option value="{$rol->id}" {if $perfil->id_rol == $rol->id}selected="selected"{/if}>{$rol->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="nombre">Nombre</label>
      <div class="controls">
        <input class="input-xlarge" type="text" name="nombre" id="nombre" value="{$perfil->nombre}">
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="apellidos">Apellidos</label>
      <div class="controls">
        <input class="input-xlarge" type="text" name="apellidos" id="apellidos" value="{$perfil->apellidos}">
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="correo">Correo</label>
      <div class="controls">
        <input class="input-xlarge" type="text" name="correo" id="correo" value="{$perfil->correo}">
      </div>
    </div>

    {if !isset($perfil->clave)}  
      <div class="control-group">
        <label class="control-label" for="clave">Clave de acceso</label>
        <div class="controls">
          <input class="input-xlarge" type="password" name="clave" id="clave" value="{$perfil->clave}">
        </div>
      </div>
    {else}
      <div class="control-group">
        <label class="control-label" for="fecha_alta">Fecha de alta</label>
        <div class="controls">
          <input class="input-medium" type="text" disabled="disabled" id="fecha_alta" value="{$perfil->fecha_alta}">
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="ultimo_acceso">Último acceso registrado</label>
        <div class="controls">
          <input class="input-medium" type="text" disabled="disabled" id="ultimo_acceso" value="{$perfil->ultimo_acceso}">
        </div>
      </div>
    {/if}

    <div class="form-actions">
      <button type="submit" class="btn btn-primary">Guardar cambios</button>
      <button type="button" class="btn">Cancelar</button>
    </div>

  </form>
</div> <!-- .span8 -->

{if isset($perfil->clave)}  
  <div class="span8">
    <h1><i class="fa fa-male"></i> Cambiar clave</h1>

    <form class="form-horizontal" action="index.php?page=admin/usuario_cambiar_clave" method="POST">
      <div class="control-group">
        <label class="control-label" for="clave">Clave de acceso</label>
        <div class="controls">
          <input class="input-medium" type="password" name="clave" id="clave" value="{$perfil->clave}">
        </div>
      </div>

      <div class="form-actions">
        <button type="submit" class="btn btn-primary">Cambiar clave</button>
      </div>

    </form>
  </div> <!-- .span8 -->
{/if}


