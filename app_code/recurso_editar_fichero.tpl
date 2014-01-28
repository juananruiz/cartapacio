<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h4>Modificar datos fichero</h4>
</div>
<div class="modal-body">
  <form name="editor_fichero" action="index.php?page=recurso_grabar_fichero" method="post">
    <input type="hidden" name="id" value="{$fichero->id}">
    <label class="control-label" for="url">URL</label>
    <input class="input-xxlarge" type="text" name="url" id="url" value="{$fichero->url}" disabled="disabled">
    <label class="control-label" for="titulo">Título</label>
    <input class="input-xxlarge" type="text" name="titulo" id="titulo" value="{$fichero->titulo}">
    <label class="control-label" for="descripcion">Descripción</label>
    <textarea class="input-xxlarge" name="descripcion" id="descripcion">{$fichero->descripcion}</textarea>  
    <label class="checkbox" for="es_publico">
      <input type="checkbox" name="es_publico" id="es_publico" {if $fichero->es_publico == 1}checked="checked"{/if}>
      Fichero público      
    </label>
    <label class="checkbox" for="es_imagen_principal">
      <input type="checkbox" name="es_imagen_principal" id="es_imagen_principal" {if $fichero->es_imagen_principal == 1}checked="checked"{/if}>
      Imagen principal del recurso
    </label>
    <div class="form-actions">
      <button type="submit" id="btn-subir" class="btn btn-primary">Grabar</button>
      <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
    </div>
  </form>
</div>

