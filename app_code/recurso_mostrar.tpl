<div class="page-header">
  <h1>{$recurso->nombre} <small>Subtext for header</small></h1>
</div>

<p class="lead">{$recurso->descripcion}</p>

<dl class="dl-horizontal">
  
  <dt>Autor</dt>
  <dd>{$recurso->autor->apellidos}, {$recurso->autor->nombre}</dd>

  <dt>Fecha obra</dt>
  <dd>{$recurso->fecha_obra}</dd>

</dl>
