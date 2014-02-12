<h1 class="ficha">{$recurso->nombre} 
  {if $_usuario->id_rol < 4}<a href="index.php?page=recurso_editar&id={$recurso->id}"><i class="fa fa-pencil"></i></a>{/if}</h1>

  <div class="span7">
    {if isset($recurso->imagen_principal)}
      <div class="caja" id="imagen-principal">
      <p class="muted">{$recurso->imagen_principal->titulo}</p>
        <a href="{$recurso->imagen_principal->url}"><img class="img-polaroid" 
          src="thumb/timthumb.php?src={$recurso->imagen_principal->url}&w=700" alt="{$recurso->imagen_principal->titulo}"></a>
      </div>
    {/if}
  </div><!-- .span7 -->

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
  </div><!-- .span5 -->

<script>
  $(".thumbnail a").on("click", function(e){
    var newHtml = "<p class='muted'>" + $(this).attr('title') + "</p><a href='" + $(this).attr('href') + "'><img class='img-polaroid' src='thumb/timthumb.php?src=" + $(this).attr('href') + "&w=700' alt=''></a>";
    $("#imagen-principal").html(newHtml);
    e.preventDefault();
  });
</script>
