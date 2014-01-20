<form name="editor_fichero" action="index.php?page=recurso_regrabar_fichero" method="post">
  <input type="hidden" name="id" value="{$fichero->id}">
  <label class="control-label" for="titulo">Título</label>
  <input class="input-xlarge" type="text" name="titulo" id="titulo">
  <label class="control-label" for="descripcion">Descripción</label>
  <textarea class="input-xlarge" name="descripcion" id="descripcion"></textarea>  
  <label class="checkbox" for="es_publico">
    <input type="checkbox" name="es_publico" id="es_publico">
    Fichero público      
  </label>

  <label class="checkbox" for="es_imagen_principal">
    <input type="checkbox" name="es_imagen_principal" id="es_imagen_principal">
    Imagen principal del recurso
  </label>
  <div class="form-actions">
    <button type="button" id="btn-subir" class="btn btn-primary">Grabar</button>
    <button type="button" class="btn">Cancelar</button>
  </div>

</form>


