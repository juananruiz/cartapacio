<div class="span8">
  <h1><i class="fa fa-archive"></i> Editar Recurso</h1>

  <form class="form-horizontal" action="index.php?page=recurso_grabar" method="POST">
    <input type="hidden" name="id_recurso" value="{$recurso->id}">
    <div class="control-group">
      <label class="control-label" for="id_tipo">Tipo</label>
      <div class="controls">
        <select name="id_tipo" id="id_tipo">
          <option value=""></option>
          {foreach $tipos as $tipo}
            <option value="{$tipo->id}" {if $recurso->id_tipo == $tipo->id}selected="selected"{/if}>{$tipo->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="nombre">Nombre</label>
      <div class="controls">
        <input class="input-xxlarge" type="text" name="nombre" id="nombre" placeholder="Nombre del recurso" value="{$recurso->nombre}">
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_autor">Autor</label>
      <div class="controls">
        <select class="input-xxlarge" name="id_autor" id="id_autor">
          <option value=""></option>
          {foreach $autores as $autor}
            <option value="{$autor->id}" {if $recurso->id_autor == $autor->id}selected="selected"{/if}>{$autor->apellidos}, {$autor->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="fecha_original">Fecha obra</label>
      <div class="controls">
        <input class="input-mini" type="text" name="fecha_original" id="fecha_original" value="{$recurso->fecha_original}">
        <span class="help-inline">Indique el año en que está datada la obra o documento</span>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="descripcion">Descripción</label>
      <div class="controls">
        <textarea class="input-xxlarge" name="descripcion"  id="descripcion" rows="5">{$recurso->descripcion}</textarea>
        <span class="help-inline">Descripción detallada del recurso</span>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_seccion">Sección</label>
      <div class="controls">
        <select class="input-xxlarge" name="id_seccion" id="id_seccion">
          <option value=""></option>
          {foreach $secciones as $seccion}
            <option value="{$seccion->id}">{$seccion->nombre} {if $recurso->id_seccion == $seccion->id}selected="selected"{/if}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_coleccion">coleccion</label>
      <div class="controls">
        <select class="input-xxlarge" name="id_coleccion" id="id_coleccion">
          <option value=""></option>
          {foreach $colecciones as $coleccion}
            <option value="{$coleccion->id}" {if $recurso->id_coleccion == $coleccion->id}selected="selected"{/if}>{$coleccion->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="notas">Notas</label>
      <div class="controls">
        <textarea class="input-xxlarge" name="notas" id="notas" rows="5">{$recurso->notas}</textarea>
        <span class="help-inline">Notas sobre el recurso no disponibles al público</span>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_estado">Estado</label>
      <div class="controls">
        <select class="input-medium" name="id_estado" id="id_estado">
          <option value=""></option>
          {foreach $estados as $estado}
            <option value="{$estado->id}" {if $recurso->id_estado == $estado->id}selected="selected"{/if}>{$estado->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="form-actions">
      <button type="submit" class="btn btn-primary">Guardar cambios</button>
      <button type="button" class="btn">Cancelar</button>
    </div>
  </form>
</div> <!-- .span8 -->
