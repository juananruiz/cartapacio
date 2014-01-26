<div class="span12" style="margin-left:0;">
<h1><i class="fa fa-archive"></i> {$_nombre_pagina} </h1>
</div>

<div class="row-fluid">
<div class="span8">
  <p class="pull-right"><a href="index.php?page=recurso_mostrar&id={$recurso->id}"><i class="fa fa-eye"></i> Mostrar recurso</a></p>
  <form action="index.php?page=recurso_grabar" method="POST" data-registro-id="{$recurso->id}">

    <input type="hidden" id="id_recurso" name="registro_id" value="{$recurso->id}">

    <div class="control-group">
      <label class="control-label" for="id_estado">Estado de publicación en esta web</label>
      <div class="controls">
        <select class="autosave input-medium" name="id_estado" id="id_estado">
          <option value=""></option>
          {foreach $estados as $estado}
            <option value="{$estado->id}" {if $recurso->id_estado == $estado->id}selected="selected"{/if}>{$estado->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_tipo">Tipo</label>
      <div class="controls">
        <select class="autosave" name="id_tipo" id="id_tipo">
          <option value=""></option>
          {foreach $tipos as $tipo}
            <option value="{$tipo->id}" {if $recurso->id_tipo == $tipo->id}selected="selected"{/if}>{$tipo->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="nombre">Denominación o título</label>
      <div class="controls">
        <input class="autosave input-xxlarge" type="text" name="nombre" id="nombre" placeholder="Nombre del recurso" value="{$recurso->nombre}">
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_ubicacion">Ubicación</label>
      <div class="controls">
        <select class="autosave input-xxlarge" name="id_ubicacion" id="id_ubicacion">
          <option value=""></option>
          {foreach $ubicaciones as $ubicacion}
            <option value="{$ubicacion->id}" {if $recurso->id_ubicacion == $ubicacion->id}selected="selected"{/if}>{$ubicacion->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_autor">Autor</label>
      <div class="controls">
        <select class="autosave input-xxlarge" name="id_autor" id="id_autor">
          <option value=""></option>
          {foreach $autores as $autor}
            <option value="{$autor->id}" {if $recurso->id_autor == $autor->id}selected="selected"{/if}>{$autor->apellidos}, {$autor->nombre}</option>
          {/foreach}
        </select>
        <a href="#modalGlobal" role="button" class="btn" data-toggle="modal" data-href="index.php?page=admin/autor_crear"><i class="fa fa-plus"></i></a>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="fecha_minima">Fecha obra</label>
      <div class="controls">
        <input class="autosave input-small" type="text" name="fecha_minima" id="fecha_minima" value="{$recurso->fecha_minima}"> - 
        <input class="autosave input-small" type="text" name="fecha_maxima" id="fecha_maxima" value="{$recurso->fecha_maxima}">
        <span class="help-inline">Indique los años en que está datada la obra o documento</span>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="medidas">Medidas</label>
      <div class="controls">
        <input class="autosave input-xxlarge" type="text" name="medidas" id="medidas" placeholder="Medidas de la obra" value="{$recurso->medidas}">
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="inscripcion_autor">URL externa</label>
      <div class="controls">
        <input class="autosave input-xxlarge" type="text" name="url_externa" id="url_externa" value="{$recurso->url_externa}">
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="inscripcion_autor">Inscripciones de autoría</label>
      <div class="controls">
        <input class="autosave input-xxlarge" type="text" name="inscripcion_autor" id="inscripcion_autor" value="{$recurso->inscripcion_autor}">
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_coleccion">Colección</label>
      <div class="controls">
        <select class="autosave input-xxlarge" name="id_coleccion" id="id_coleccion">
          <option value=""></option>
          {foreach $colecciones as $coleccion}
            <option value="{$coleccion->id}" {if $recurso->id_coleccion == $coleccion->id}selected="selected"{/if}>{$coleccion->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#descripcion" data-toggle="tab">Descripción</a></li>
      <li><a href="#historia" data-toggle="tab">Historia</a></li>
      <li><a href="#alteraciones" data-toggle="tab">Alteraciones</a></li>
      <li><a href="#restauraciones" data-toggle="tab">Restauraciones</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="descripcion">
        <textarea class="autosave input-xxlarge" name="descripcion"  id="descripcion" rows="5">{$recurso->descripcion}</textarea>
      </div>
      <div class="tab-pane" id="historia">
        <textarea class="autosave input-xxlarge" name="historia"  id="historia" rows="5">{$recurso->historia}</textarea>
      </div>
      <div class="tab-pane" id="alteraciones">
        <textarea class="autosave input-xxlarge" name="alteraciones"  id="alteraciones" rows="5">{$recurso->alteraciones}</textarea>
      </div>
      <div class="tab-pane" id="restauraciones">
        <textarea class="autosave input-xxlarge" name="restauraciones"  id="restauraciones" rows="5">{$recurso->restauraciones}</textarea>
      </div>
    </div>
    </div>
<hr>
    <div class="control-group">
      <label class="control-label" for="notas">Notas internas</label>
      <div class="controls">
        <textarea class="autosave input-xxlarge" name="notas" id="notas" rows="5">{$recurso->notas}</textarea>
      </div>
    </div>

    <div class="form-actions">
      <button type="submit" class="btn btn-primary" name="grabar" value="salir">Grabar</button>
      <!--<button type="button" class="btn">Cancelar</button>-->
    </div>
  </form>

</div> <!-- .span8 -->
<div class="span4" style="padding-left:20px;border-left:1px solid #dedede;">
  <div id="lista-ficheros">
    <h3><i class="fa fa-paperclip"></i> Ficheros asociados al recurso</h3>

    {if isset($ficheros)}
      <div class="accordion" id="accordion">
      {foreach from=$ficheros item=fichero }
        {include file="recurso_fichero_acordeon.tpl" fichero=$fichero}
      {/foreach}
      </div>

    {else}
      <p class="alert">No existen ficheros asociados a este recurso</p>
    {/if}
  </div>

  <!--
  <p class="alert alert-info"><strong>IMPORTANTE:</strong> el nombre de los ficheros no debe contener caracteres como ñ, acentos o espacios en blanco. Renombra tu archivo antes de subirlo para que sea clarificador de su contenido.</p>
  -->

  <form id="form-fichero" enctype="multipart/form-data" action="index.php?page=recurso_grabar_fichero">
    <input type="hidden" id="id_recurso" name="id_recurso" value="{$recurso->id}">
    <input type="hidden" name="MAX_FILE_SIZE" value="50000000">
    <div class="control-group">
      <label class="control-label" for="fichero1">Añadir nuevo fichero</label>
      <div class="controls">
        <input id="fichero1" type="file" style="display:none" name="fichero1">
        <div class="input-append">
          <input id="falso1" class="input-xlarge" type="text">
          <a class="btn btn-file"><i class="fa fa-folder-open-o"></i> Seleccionar</a>
        </div>
      </div>

      <label class="control-label" for="titulo">Título</label>
      <input class="input-xlarge" type="text" name="titulo" id="titulo">

      <label class="control-label" for="descripcion">Descripción</label>
      <textarea class="input-xlarge" name="descripcion" id="descripcion"></textarea>  

      <label class="checkbox" for="es_publico">
        <input type="checkbox" name="es_publico" id="es_publico">
        Fichero público      
      </label>

      <label class="checkbox" for="es_imagen_principal">
        <input type="checkbox" name="es_imagen_principal" id="es_imagen_principal">
        Imagen principal del recurso
      </label>
    </div>
    <div class="form-actions">
      <button type="button" id="btn-subir" class="btn btn-primary">Subir fichero</button>
      <button type="reset" class="btn">Cancelar</button>
    </div>
  </form>

</div>  <!-- .span4 -->
</div>  <!-- .row-fluid -->

{literal}
<script type="text/javascript">
  // ---------- Estas tres funciones se cargan desde /js/cartapacio.js
  modalsHandler();
  formHandler();
  autosave();

  // ---------- Función Borrar fichero --------------
  function borrarFichero(e) {
    e.preventDefault();
    var id = $(this).attr("data-fichero-id"); 
    if (confirm('¿Quiéres borrar el fichero?'))
    {
      $.ajax(
      {
        type: "GET",
        url: $(this).attr('href'),
        success: function(data) {
          $("#fichero" + id).remove();   
        }
      });
    }
  }

  $('.borrar-fichero').on('click', function(e){
    e.preventDefault();
    var id = $(this).attr("data-fichero-id"); 
    if (confirm('¿Quiéres borrar el fichero?'))
    {
      $.ajax(
      {
        type: "GET",
        url: $(this).attr('href'),
        success: function(data) {
          $("#fichero" + id).remove();   
        }
      });
    }
  });

  // ---------- Falso input file ------------
  // http://duckranger.com/2012/06/pretty-file-input-field-in-bootstrap/ 
  // Cuando se pulsa el falso manda el click al autentico
  $('.btn-file').on('click', function(){
    $(this).parent().prev().click();
  });
  // Cuando el autentico cambia hace cambiar al falso
  $('input[type=file]').on('change', function(e){
    $(this).next().find('input').val($(this).val());
  });

  // ---------- Petición ajax subir fichero --------
  $('#btn-subir').on('click', function(e){
    e.preventDefault();
    var formDatos = new FormData($('#form-fichero')[0]);

    $.ajax(
    {
      type: 'POST',
      url: $('#form-fichero').attr('action') + '&ajax=true',
      data: formDatos,
      //Options to tell jQuery not to process data or worry about content-type.
      cache: false,
      contentType: false,
      processData: false,
      beforeSend : function (data) {
        $('#btn-subir').html('Subiendo...').attr('disabled','disabled');
      },
      success: function(datos) {  
        // Recarga el div#lista-ficheros con el resultado de 
        // procesar recurso_grabar_fichero.php, que llama a recurso_fichero_acordeon.tpl
        $('#accordion').append(datos);
        $('.borrar-fichero').bind('click', function(e) {
          e.preventDefault();
          var id = $(this).attr("data-fichero-id"); 
          if (confirm('¿Quiéres borrar el fichero?'))
          {
            $.ajax(
            {
              type: "GET",
              url: $(this).attr('href'),
              success: function(data) {
                $("#fichero" + id).remove();   
              }
            });
          }
        });
        $('#form-fichero')[0].reset();
        $('#btn-subir').html('Subir fichero').css('background','#04c').prop('disabled',false);
      },                    
    });    
  });

</script>
{/literal}
