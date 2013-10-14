<form class="form-horizontal" action="index.php?page=recurso_grabar" method="POST">

  <div class="control-group">
    <label class="control-label" for="id_tipo">Tipo</label>
    <div class="controls">
      <select id="id_tipo">
        <option value=""></option>
        {foreach $tipos as $tipo}
          <option value="{$tipo->id}">{$tipo->nombre}</option>
        {/foreach}
      </select>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="nombre">Nombre</label>
    <div class="controls">
      <input class="input-xxlarge" type="text" id="nombre" placeholder="Nombre del recurso">
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="id_autor">Autor</label>
    <div class="controls">
      <select class="input-xxlarge" id="id_autor">
        <option value=""></option>
        {foreach $autores as $autor}
          <option value="{$autor->id}">{$autor->apellidos}, {$autor->nombre}</option>
        {/foreach}
      </select>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="fecha_original">Fecha obra</label>
    <div class="controls">
      <input class="input-mini" type="text" id="fecha_original"><span class="help-inline">Indique el año en que está datada la obra o documento</span>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="descripcion">Descripción</label>
    <div class="controls">
      <textarea class="input-xxlarge" id="descripcion" rows="5">Descripción detallada del recurso</textarea>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="id_seccion">Sección</label>
    <div class="controls">
      <select class="input-xxlarge" id="id_seccion">
        <option value=""></option>
        {foreach $secciones as $seccion}
          <option value="{$seccion->id}">{$seccion->nombre}</option>
        {/foreach}
      </select>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="id_serie">Serie</label>
    <div class="controls">
      <select class="input-xxlarge" id="id_serie">
        <option value=""></option>
        {foreach $series as $serie}
          <option value="{$serie->id}">{$serie->nombre}</option>
        {/foreach}
      </select>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="comentarios">Comentarios</label>
    <div class="controls">
      <textarea class="input-xxlarge" id="comentarios" rows="5">Comentarios sobre el recurso no disponibles al público</textarea>
    </div>
  </div>

  <div class="control-group">
    <label class="control-label" for="id_estado">Estado</label>
    <div class="controls">
      <select class="input-medium" id="id_estado">
        <option value=""></option>
        {foreach $estados as $estado}
          <option value="{$estado->id}">{$estado->nombre}</option>
        {/foreach}
      </select>
    </div>
  </div>

  <div class="form-actions">
    <button type="submit" class="btn btn-primary">Guardar cambios</button>
    <button type="button" class="btn">Cancelar</button>
  </div>
</form>
