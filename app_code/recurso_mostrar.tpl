<h1 class="ficha">{$recurso->nombre} 
  {if $_usuario->id_rol < 4}<i class="fa fa-pencil"></i>{/if}</h1>

  <div class="span7">
    <div class="caja">
      <a href="{$recurso->imagen_principal->url}"><img class="img-polaroid" 
        src="thumb/timthumb.php?src={$recurso->imagen_principal->url}&w=600" alt="{$recurso->imagen_principal->titulo}"></a>
    </div>

    <div class="caja">
      <ul class="thumbnails">
        {foreach $recurso->ficheros as $fichero}
        <li class="span2">
          <div class="thumbnail">
            <img src="thumb/timthumb.php?h=140&w=140&src={$fichero->url}" alt="{$fichero->titulo}">
            <p>{$fichero->titulo}</p>
          </div>
        </li>
        {/foreach}
      </ul>
    </div>
  </div><!-- .span7 -->


  <div class="span5">
    <div class="caja">
      <div class="well">
        <p>{$recurso->descripcion}</p>
      </div>

      <table class="table table-condensed">
        <tr><th>Autor</th><td><a href="index.php?page=autor_mostrar&id={$recurso->autor->id}">{$recurso->autor->nombre} {$recurso->autor->apellidos}</a></td></tr>
        <tr><th>Fecha obra</th><td>{$recurso->fecha_original|date_format:'%Y'}</td></tr>
        <tr><th>Sección</th><td><a href="index.php?page=seccion_mostrar?id={$recurso->seccion->id}">{$recurso->seccion->nombre}</a></td></tr>
        <tr><th>Colección</th><td><a href="index.php?page=coleccion_mostrar&id={$recurso->coleccion->id}">{$recurso->coleccion->nombre}</a></td></tr>
      </table>
    </div>
  </div><!-- .span5 -->
