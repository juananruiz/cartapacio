<h1 class="ficha">{$recurso->nombre} 
  {if $_usuario->id_rol < 4}<a href="index.php?page=recurso_editar&id={$recurso->id}"><i class="fa fa-pencil"></i></a>{/if}</h1>

  <div class="span5">
    <div class="caja">
    <ul class="thumbnails">
      {foreach $recurso->ficheros as $fichero}
      <li>
        <div class="thumbnail" id="{$fichero->id}">
          <a href="{$fichero->url}" title="{$fichero->titulo}"> <img src="thumb/timthumb.php?h=100&w=100&src={$fichero->url}" alt="{$fichero->titulo}"></a>
        </div>
      </li>
      {/foreach}
    </ul>
    </div>

    <div class="caja">
      <table class="table table-condensed">
        <tr><th>Tipo</th><td>{$recurso->tipo->nombre}</td></tr>
        <tr><th>Autor</th><td><a href="index.php?page=autor_mostrar&id={$recurso->autor->id}">{$recurso->autor->nombre} {$recurso->autor->apellidos}</a></td></tr>
        <tr><th>Fecha</th><td>{$recurso->fecha_minima}{if $recurso->fecha_maxima > $recurso->fecha_minima} - {$recurso->fecha_maxima}{/if}</td></tr>
        {if isset($recurso->ubicacion->id)}<tr><th>Ubicación</th><td><a href="index.php?page=ubicacion_mostrar?id={$recurso->ubicacion->id}">{$recurso->ubicacion->nombre}</a></td></tr>{/if}
        {if isset($recurso->url_externa)}<tr><th>URL externa</th><td><a href="{$recurso->url_externa}">{$recurso->url_externa|truncate:'65':'...'}</a></td></tr>{/if}
        {if isset($recurso->coleccion->id)}<tr><th>Colección</th><td><a href="index.php?page=coleccion_mostrar&id={$recurso->coleccion->id}">{$recurso->coleccion->nombre}</a></td></tr>{/if}
        {if isset($recurso->cantidad)}<tr><th>Cantidad</th><td>{$recurso->cantidad}</td></tr>{/if}
        {if isset($recurso->medidas)}<tr><th>Medidas</th><td>{$recurso->medidas}</td></tr>{/if}
        {if isset($recurso->iconografia)}<tr><th>Iconografía</th><td>{$recurso->iconografia->nombre}</td></tr>{/if}
        {if is_array($recurso->materiales)}<tr><th>Materiales</th><td>{foreach $recurso->materiales as $material}{$material->material->nombre}{if !$material@last}, {/if} {/foreach}</td></tr>{/if}
      </table>
    </div>

    <div class="caja">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#descripcion" data-toggle="tab">Descripción</a></li>
        <li><a href="#historia" data-toggle="tab">Historia</a></li>
        <li><a href="#alteraciones" data-toggle="tab">Alteraciones</a></li>
        <li><a href="#restauraciones" data-toggle="tab">Restauraciones</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="descripcion">
          {$recurso->descripcion}
        </div>
        <div class="tab-pane" id="historia">
          {$recurso->historia}
        </div>
        <div class="tab-pane" id="alteraciones">
          {$recurso->alteraciones}
        </div>
        <div class="tab-pane" id="restauraciones">
          {$recurso->restauraciones}
        </div>
      </div>

    </div>
  </div><!-- panel info -->

  <div class="span7">
    {if isset($recurso->imagen_principal)}
      <div class="caja" id="imagen-principal" data-path="{$smarty.const.CC_URL_BASE}thumb/timthumb.php?w=700&src={$recurso->imagen_principal->url}">
      </div>

      <div id="pie-visor">
        <p class="muted">{$recurso->imagen_principal->titulo}</p>
        {if $recurso->imagen_principal->es_publico == 1}
          <p><a href="{$recurso->imagen_principal->url}"><i class="fa fa-expand"></i> Ver a pantalla completa</a></p>
        {/if}
      </div>
    {/if}
  </div><!-- panel visor -->

{literal}
<link rel="stylesheet" href="documentViewer/css/style.css">
<script type="text/javascript" src="documentViewer/libs/yepnope.1.5.3-min.js"></script>
<script type="text/javascript" src="documentViewer/ttw-document-viewer.min.js"></script>
￼ 
<script type="text/javascript">
  $(function() {
    var currentDocument = $("#imagen-principal").attr("data-path"), 
        currentWidth = 650;
        documentViewer = $("#imagen-principal").documentViewer();

    documentViewer.load(currentDocument, {width:currentWidth});
    
    $(".thumbnail a").on("click", function(e){
      var path = $(this).attr('href');
      var title = $(this).attr('title');
      var htmlPieVisor = "<p class='muted'>" + title + "</p>" + "<p><a href='" + path + "'><i class='fa fa-expand'></i> Ver a pantalla completa</a></p>";

      documentViewer.load(path, {width:currentWidth});
      $("#pie-visor").html(htmlPieVisor);
      e.preventDefault();
    });

    /* No funciona ni patrás
    $("#size").on("change", function(e){
      currentWidth = $(this).val();
      console.log(currentWidth);
      console.log(currentDocument);
      if(currentDocument) {
        documentViewer.load(currentDocument, {width:currentWidth});
      }
    });
    */ 
  });
</script>
{/literal}
