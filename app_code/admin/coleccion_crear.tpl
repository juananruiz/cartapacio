<div class="span8">
  <h2>Alta coleccion</h2>

  <div class="well">
    <form class="form-horizontal" action="index.php?page=admin/coleccion_grabar" method="POST">

      <div class="control-group">
        <label class="control-label" for="nombre">Nombre</label>
        <div class="controls">
          <input class="input-xxlarge" type="text" name="nombre" id="nombre">
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="descripcion">Descripción</label>
        <div class="controls">
          <textarea class="input-xxlarge" name="descripcion" id="descripcion" rows="5"></textarea>
          <span class="help-inline">Descripción pública de la coleccion</span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="notas">Notas</label>
        <div class="controls">
          <textarea class="input-xxlarge" name="notas" id="notas" rows="5"></textarea>
          <span class="help-inline">Notas sobre la coleccion no disponibles al público</span>
        </div>
      </div>

      <div class="form-actions">
        <button type="submit" class="btn btn-primary">Guardar cambios</button>
        <button type="button" class="btn">Cancelar</button>
      </div>

    </form>
  </div>
</div>
