<div class="span5">
  <div class="caja">
    <!-- De momento no funciona
    <div id="size-wrapper" class="clearfix">
      <h4>Tamaño Visor</h4>
      <input id="size" type="range" min="200" max="1000" step="100" value="500">
    </div>
    -->

    <ul class="thumbnails">
      {foreach $recurso->ficheros as $fichero}
      <li>
        <div class="thumbnail" id="{$fichero->id}">
          <a href="{$smarty.const.CC_URL_BASE}{$fichero->url}" title="{$fichero->titulo}"> <img src="{$smarty.const.CC_URL_BASE}thumb/timthumb.php?h=100&w=100&src={$fichero->url}" alt="{$fichero->titulo}"></a>
        </div>
      </li>
      {/foreach}
    </ul>
  </div>
</div>

<div class="span7">
  {if isset($recurso->imagen_principal)}
    <div class="caja" id="imagen-principal" data-path="{$smarty.const.CC_URL_BASE}thumb/timthumb.php?w=700&src={$recurso->imagen_principal->url}">
    <!--
    <p class="muted">{$recurso->imagen_principal->titulo}</p>
      <a href="{$recurso->imagen_principal->url}"><img class="img-polaroid" 
        src="thumb/timthumb.php?src={$recurso->imagen_principal->url}&w=700" alt="{$recurso->imagen_principal->titulo}"></a>
    -->
    </div>
    <div id="pie-visor">
      <p class="muted">{$recurso->imagen_principal->titulo}</p>
      {if $recurso->imagen_principal->es_publico == 1}
        <p><a href="{$recurso->imagen_principal->url}"><i class="fa fa-expand"></i> Ver a pantalla completa</a></p>
      {/if}
    </div>
  {/if}
</div>

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
