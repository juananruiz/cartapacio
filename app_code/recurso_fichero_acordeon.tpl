      <div class="accordion-group" id="fichero{$fichero->id}">
        <div class="accordion-heading">
          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse{$fichero->id}"><i class="fa fa-star-o"></i> {$fichero->titulo}</a>
        </div>
        <div id="collapse{$fichero->id}" class="accordion-body collapse">
          <div class="accordion-inner">
            <p>
              <a href="{$fichero->url}" title="{$fichero->titulo}"> <img src="{$fichero->miniatura}" style="float:left;margin:0 10px 10px 0;"></a>
              {$fichero->descripcion}
            </p>

            <p>{if $fichero->es_publico}<i class="fa fa-world"></i> Fichero público{else}<i class="fa fa-door"></i> Fichero privado{/if} - <a href="{$fichero->url}">Ver/descargar fichero</a></p>
            <p style="margin:5px 40px;"><a href="#" data-url="index.php?page=recurso_editar_fichero&id={$fichero->id}" data-toggle="modal"><i class="fa fa-pencil"></i></a> <a href="index.php?page=recurso_borrar_fichero&id={$fichero->id}" data-fichero-id="{$fichero->id}" class="borrar-fichero" ><i class="fa fa-trash-o pull-right"></i></a>
          </div>
        </div>
      </div>

