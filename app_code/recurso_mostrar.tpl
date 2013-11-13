<h1 class="ficha">{$recurso->nombre}</h1>

  <div class="span7">
    <div class="caja">
      <a href=""><img class="img-polaroid" src="upload/visitacion_retablo_inmaculada.jpeg" alt="Visitación retablo Inmaculada" width="600px" /></a>
    </div>

    <div class="caja">
      <ul class="thumbnails">
        <li class="span2">
          <div class="thumbnail">
            <img src="upload/visitacion_thumb_1.jpg" alt="">
            <p>Detalle de las santas</p>
          </div>
        </li>
        <li class="span2">
          <div class="thumbnail">
            <img src="upload/visitacion_thumb_2.jpg" alt="">
            <p>Detalle del santo</p
          </div>
        </li>
        <li class="span2">
          <div class="thumbnail">
            <img  src="upload/visitacion_thumb_3.jpg" alt="">
            <p>Detalle de la virgen</p>
          </div>
        </li>
      </ul>
    </div>
  </div>

  <div class="span5">

    <div class="caja">
      <div class="well">
        <p>{$recurso->descripcion}</p>
      </div>

      <table class="table table-condensed">
        <tr><th>Autor</th><td>{$recurso->autor->nombre} {$recurso->autor->apellidos}</td></tr>
        <tr><th>Fecha obra</th><td>{$recurso->fecha_original|date_format:'%Y'}</td></tr>
        <tr><th>Sección</th><td>{$recurso->seccion->nombre}</td></tr>
        <tr><th>Colección</th><td>{$recurso->coleccion->nombre}</td></tr>
      </table>
    </div>
  </div>
