<div class="span8">

  <h1><i class="fa fa-archive"></i> Crear Recurso</h1>

  <form class="form-horizontal" action="index.php?page=recurso_grabar" method="POST">

      <div class="control-group">
        <label class="control-label" for="id_tipo">Tipo</label>
        <div class="controls">
          <select name="id_tipo" id="id_tipo">
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
          <input class="input-xxlarge" type="text" name="nombre" id="nombre" placeholder="Nombre del recurso">
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_autor">Autor</label>
        <div class="controls">
          <select class="input-xxlarge" name="id_autor" id="id_autor">
            <option value=""></option>
            {foreach $autores as $autor}
              <option value="{$autor->id}">{$autor->apellidos}, {$autor->nombre}</option>
            {/foreach}
          </select>
          <a href="index.php?page=admin/autor_crear"><i class="fa fa-plus-circle"></i></a>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="fecha_original">Fecha obra</label>
        <div class="controls">
          <input class="input-mini" type="text" name="fecha_original" id="fecha_original">
          <span class="help-inline">Indique el año en que está datada la obra o documento</span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="descripcion">Descripción</label>
        <div class="controls">
          <textarea class="input-xxlarge" name="descripcion"  id="descripcion" rows="5"></textarea>
          <span class="help-inline">Descripción detallada del recurso</span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_seccion">Sección</label>
        <div class="controls">
          <select class="input-xxlarge" name="id_seccion" id="id_seccion">
            <option value=""></option>
            {foreach $secciones as $seccion}
              <option value="{$seccion->id}">{$seccion->nombre}</option>
            {/foreach}
          </select>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_coleccion">Colección</label>
        <div class="controls">
          <select class="input-xxlarge" name="id_coleccion" id="id_coleccion">
            <option value=""></option>
            {foreach $colecciones as $coleccion}
              <option value="{$coleccion->id}">{$coleccion->nombre}</option>
            {/foreach}
          </select>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="notas">Notas</label>
        <div class="controls">
          <textarea class="input-xxlarge" name="notas" id="notas" rows="5"></textarea>
          <span class="help-inline">Notas sobre el recurso no disponibles al público</span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_estado">Estado</label>
        <div class="controls">
          <select class="input-medium" name="id_estado" id="id_estado">
            <option value=""></option>
            {foreach $estados as $estado}
              <option value="{$estado->id}">{$estado->nombre}</option>
            {/foreach}
          </select>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="fichero1">Añadir fichero 1</label>
        <div class="controls">
          <input id="fichero1" type="file" style="display:none" name="fichero1">
          <div class="input-append">
            <input id="falso1" class="input-xlarge" type="text">
            <a class="btn btn-file"><i class="fa fa-folder-open-o"></i> Seleccionar fichero</a>
          </div>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="fichero2">Añadir fichero 2</label>
        <div class="controls">
          <input id="fichero2" type="file" style="display:none" name="fichero2">
          <div class="input-append">
            <input id="falso2" class="input-xlarge" type="text">
            <a class="btn btn-file"><i class="fa fa-folder-open-o"></i> Seleccionar fichero</a>
          </div>
        </div>
      </div>

      <!-- El que estoy usando: http://duckranger.com/2012/06/pretty-file-input-field-in-bootstrap/ -->
      <!-- Para subir imágenes http://jasny.github.io/bootstrap/javascript/#fileinput -->
    
     
      <!--
      <div class="control-group">
        <label class="control-label" for="nolvide"></label>
        <label class="checkbox">
          <input type="checkbox"> No olvide marcar esta casilla
        </label>
      </div>
      -->
      

    <div class="form-actions">
      <button type="submit" class="btn btn-primary">Guardar cambios</button>
      <button type="button" class="btn">Cancelar</button>
    </div>

  </form>

</div>  <!-- .span12 -->

<script type="text/javascript">
  // ---------- Falso input file ------------
  // Cuando se pulsa el falso manda el click al autentico
  $('.btn-file').on('click', function(){
    console.log(this);
    $(this).parent().prev().click();
  });

  // Cuando el autentico cambia hace cambiar al falso
  $('input[type=file]').change(function() {
    $(this).next().find('input').val($(this).val());
  });
</script>
