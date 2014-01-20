<h1 class="ficha">{$recurso->nombre} 
  {if $_usuario->id_rol < 4}<a href="index.php?page=recurso_editar&id={$recurso->id}"><i class="fa fa-pencil"></i></a>{/if}</h1>

  <div class="span5">
    <div class="caja">
      <div class="well">
        <p>{$recurso->descripcion}</p>
      </div>

      <table class="table table-condensed">
        <tr><th>Tipo</th><td>{$recurso->tipo->nombre}</td></tr>
        <tr><th>Autor</th><td><a href="index.php?page=autor_mostrar&id={$recurso->autor->id}">{$recurso->autor->nombre} {$recurso->autor->apellidos}</a></td></tr>
        <tr><th>Fecha</th><td>{$recurso->fecha_minima}{if $recurso->fecha_maxima > $recurso->fecha_minima} - {$recurso->fecha_maxima}{/if}</td></tr>
        <tr><th>Ubicación</th><td><a href="index.php?page=ubicacion_mostrar?id={$recurso->ubicacion->id}">{$recurso->ubicacion->nombre}</a></td></tr>
        {if isset($recurso->url_externa)}<tr><th>URL externa</th><td><a href="{$recurso->url_externa}">{$recurso->url_externa|truncate:'65':'...'}</a></td></tr>{/if}
        <tr><th>Colección</th><td><a href="index.php?page=coleccion_mostrar&id={$recurso->coleccion->id}">{$recurso->coleccion->nombre}</a></td></tr>
        {if isset($recurso->cantidad)}<tr><th>Cantidad</th><td>{$recurso->cantidad}</td></tr>{/if}
        {if isset($recurso->medidas)}<tr><th>Medidas</th><td>{$recurso->medidas}</td></tr>{/if}
      </table>
    </div>
  </div><!-- .span5 -->

  <div class="span7">
    <div class="caja">
      <ul class="thumbnails">
        {foreach $recurso->ficheros as $fichero}
        <li class="span2" style="width:initial;">
          <div class="thumbnail" id="{$fichero->id}" data-url="{$fichero->url}">
            <a href="#"><img src="thumb/timthumb.php?h=140&w=140&src={$fichero->url}" alt="{$fichero->titulo}"></a>
          </div>
          <p>{$fichero->titulo}</p>
        </li>
        {/foreach}
      </ul>
    </div>

    {if isset($recurso->imagen_principal)}
      <div class="caja" id="imagen-principal">
        <a href="{$recurso->imagen_principal->url}"><img class="img-polaroid" 
          src="thumb/timthumb.php?src={$recurso->imagen_principal->url}&w=500" alt="{$recurso->imagen_principal->titulo}"></a>
        <p>{$recurso->imagen_principal->titulo}</p>
      </div>
    {/if}
  </div><!-- .span7 -->

  
  <script>
    $(".thumbnail").on("click", function(e){
      var newHtml = "<a href='" + $(this).attr('data-url') + "'><img class='img-polaroid' src='thumb/timthumb.php?src=" + $(this).attr('data-url') + "&w=500' alt=''></a>";
      $("#imagen-principal").html(newHtml);
      e.preventDefault();
    });
  </script>
