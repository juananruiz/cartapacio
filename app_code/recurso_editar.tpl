<div class="span12">
<h1><i class="fa fa-archive"></i> Editar Recurso</h1>
</div>

<div class="row-fluid">
<div class="span8">
  <form action="index.php?page=recurso_grabar" method="POST">
    <input type="hidden" name="id_recurso" value="{$recurso->id}">
    <div class="control-group">
      <label class="control-label" for="id_tipo">Tipo</label>
      <div class="controls">
        <select class="ajax" name="id_tipo" id="id_tipo">
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
        <input class="ajax input-xxlarge" type="text" name="nombre" id="nombre" placeholder="Nombre del recurso" value="{$recurso->nombre}">
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_autor">Autor</label>
      <div class="controls">
        <select class="ajax input-xxlarge" name="id_autor" id="id_autor">
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
        <input class="ajax input-normal" type="text" name="fecha_original" id="fecha_original" value="{$recurso->fecha_original}">
        <span class="help-inline">Indique el año en que está datada la obra o documento</span>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="descripcion">Descripción</label>
      <div class="controls">
        <textarea class="ajax input-xxlarge" name="descripcion"  id="descripcion" rows="5">{$recurso->descripcion}</textarea>
        <span class="help-inline">Descripción detallada del recurso</span>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_seccion">Sección</label>
      <div class="controls">
        <select class="ajax input-xxlarge" name="id_seccion" id="id_seccion">
          <option value=""></option>
          {foreach $secciones as $seccion}
            <option value="{$seccion->id}">{$seccion->nombre} {if $recurso->id_seccion == $seccion->id}selected="selected"{/if}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_coleccion">Colección</label>
      <div class="controls">
        <select class="ajax input-xxlarge" name="id_coleccion" id="id_coleccion">
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
        <textarea class="ajax input-xxlarge" name="notas" id="notas" rows="5">{$recurso->notas}</textarea>
        <span class="help-inline">Notas sobre el recurso no disponibles al público</span>
      </div>
    </div>

    <div class="control-group">
      <label class="control-label" for="id_estado">Estado</label>
      <div class="controls">
        <select class="ajax input-medium" name="id_estado" id="id_estado">
          <option value=""></option>
          {foreach $estados as $estado}
            <option value="{$estado->id}" {if $recurso->id_estado == $estado->id}selected="selected"{/if}>{$estado->nombre}</option>
          {/foreach}
        </select>
      </div>
    </div>

    <!--
    <div class="form-actions">
      <button type="submit" class="btn btn-primary">Guardar cambios</button>
      <button type="button" class="btn">Cancelar</button>
    </div>
    -->

  </form>
</div> <!-- .span8 -->
<div class="span4" style="padding-left:20px;border-left:1px solid #dedede;">
  <h3><i class="fa fa-file"></i> Ficheros asociados al recurso</h3>

  {if isset($archivos)}
    <table class="table">
    {foreach from=$archivos item=archivo }
        {* Evitamos que se vean los directorios ".", ".." y cualquier archivo o directorio que empiece por "." *}
        {if $archivo[0][0] == '.'}
        {else}
            <tr>
            <td><a href="upload/{$directorio}/{$archivo[0]}"><i class="fa fa-star-o"</i> {$archivo[0]}</a></td>
            <!--<td>{$archivo[1]}</td>-->
            <td><a href="index.php?page=archivo_borrar&fichero={$archivo[0]}&dir={$directorio}" 
                onclick="javascript: return confirm('Quieres borrar el archivo : {$archivo[0]}');"><i class="fa fa-trash-o"></i></a></td>
            </tr>
        {/if}
    {/foreach}
    </table>
  {else}
    <p class="alert">No existen ficheros asociados con este recurso</p>
  {/if}

  <p class="alert alert-info"><strong>IMPORTANTE:</strong> el nombre de los ficheros no debe contener caracteres como ñ, acentos o espacios en blanco. Renombra tu archivo antes de subirlo para que sea clarificador de su contenido.</p>
  
  <form id="form-fichero" enctype="multipart/form-data">
    <input type="hidden" name="id_recurso" value="{$recurso->id}">
    <div class="control-group">
      <label class="control-label" for="fichero1">Añadir nuevo fichero</label>
      <div class="controls">
        <input id="fichero1" type="file" style="display:none" name="fichero1">
        <div class="input-append">
          <input id="falso1" class="input-xlarge" type="text">
          <a class="btn btn-file"><i class="fa fa-folder-open-o"></i> Seleccionar</a>
        <progress></progress>
        </div>
      </div>
    </div>
    
    <div class="form-actions">
      <button type="button" id="btn-subir" class="btn btn-primary">Subir fichero</button>
      <button type="button" class="btn">Cancelar</button>
    </div>
  </form>

</div>  <!-- .span4 -->
</div>  <!-- .row-fluid -->

{literal}
<script type="text/javascript">
  // ---------- Falso input file ------------
  // http://duckranger.com/2012/06/pretty-file-input-field-in-bootstrap/ 
  // Cuando se pulsa el falso manda el click al autentico
  $('.btn-file').on('click', function(){
    $(this).parent().prev().click();
  });

  // Cuando el autentico cambia hace cambiar al falso
  $('input[type=file]').on('change', function(evento){
    $(this).next().find('input').val($(this).val());
  });

  // ---------- Petición ajax modificar campos ----------
  $('.ajax').on('change', function(evento){ 
    var campo = $(this).attr('name');
    var valor = $(this).val();
    var id_recurso = $('#id_recurso').val();
    $.ajax(
    {
      type: 'POST',
      url: 'index.php?page=recurso_grabar&recurso_id='+id_recurso,
      data: { campo: valor },
      success: function(datos) {  
        // Lanza la respuesa a consola para depurar
        console.log(datos)
      },                    
      error: function (xhr, ajaxOptions, thrownError) {
        console.log(xhr.status);
        console.log(thrownError);
      }
    });    
  });
  // ---------- Petición ajax subir fichero --------
  $('#btn-subir').on('click', function(evento){
    evento.preventDefault();
    var formDatos = new FormData($('#form-fichero')[0]);
    $.ajax(
    {
      type: 'POST',
      url: 'index.php?page=recurso_grabar_fichero',
      xhr: function() {  // Custom XMLHttpRequest
        var myXhr = $.ajaxSettings.xhr();
        if(myXhr.upload){ // Check if upload property exists
          // For handling the progress of the upload
          console.log("tenemos upload");
          myXhr.upload.addEventListener('progress',progressFunction, false); 
        }
        return myXhr;
      },
      // Form data
      data: formDatos,
      //Options to tell jQuery not to process data or worry about content-type.
      cache: false,
      contentType: false,
      processData: false,
      success: function(datos) {  
        // Lanza la respuesa a consola para depurar
        console.log(datos)
      },                    
      error: function (xhr, ajaxOptions, thrownError) {
        console.log(xhr.status);
        console.log(thrownError);
      }
    });    
  });

  function progressFunction(e){
    if(e.lengthComputable){
      $('progress').attr({value:e.loaded,max:e.total});
    }
  }
</script>
{/literal}
