<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h4>Nuevo material</h4>
</div>
<div class="modal-body">
  <form name="material-crear" data-toggle="form-ajax" action="index.php?page=admin/material_grabar" method="post" data-div="filas-materiales" data-insert="append">

    <input type="hidden" name="id" value="{$material->id}">
    
    <label class="control-label" for="nombre">Material</label>
    <input class="input-xxlarge" type="text" name="nombre" id="nombre">
    
    <div class="form-actions">
      <button type="submit" id="btn-subir" class="btn btn-primary">Grabar</button>
      <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
    </div>
  </form>
</div>
