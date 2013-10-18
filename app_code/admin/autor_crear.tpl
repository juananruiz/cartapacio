<form class="form-horizontal" action="index.php?page=admin/autor_grabar" method="POST">

  <div class="control-group">
    <label class="control-label" for="nombre">Nombre</label>
    <div class="controls">
      <input class="input-xxlarge" type="text" name="nombre" id="nombre">
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="apellidos">Apellidos</label>
    <div class="controls">
      <input class="input-xxlarge" type="text" name="apellidos" id="apellidos">
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="fecha_nacimiento">Fecha nacimiento</label>
    <div class="controls">
      <input class="input-medium" type="text" name="fecha_nacimiento" id="fecha_nacimiento">
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="descripcion">Descripción</label>
    <div class="controls">
      <textarea class="input-xxlarge" name="descripcion" id="descripcion" rows="5"></textarea>
      <span class="help-inline">Breve biografía y/o comentario sobre este autor</span>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="notas">Notas</label>
    <div class="controls">
      <textarea class="input-xxlarge" name="notas" id="notas" rows="5"></textarea>
      <span class="help-inline">Notas sobre el autor no disponibles al público</span>
    </div>
  </div>

  <div class="form-actions">
    <button type="submit" class="btn btn-primary">Guardar cambios</button>
    <button type="button" class="btn">Cancelar</button>
  </div>

</form>
