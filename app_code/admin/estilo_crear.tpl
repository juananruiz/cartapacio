<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h4>Crear estilo</h4>
</div>
<div class="modal-body">
  <form name="estilo-crear" data-toggle="form-ajax" action="index.php?page=admin/estilo_grabar" method="post" data-div="filas-estilos" data-insert="append">

    <input type="hidden" name="id" value="{$estilo->id}">
    
    <label class="control-label" for="nombre">estilo</label>
    <input class="input-xxlarge" type="text" name="nombre" id="nombre">
    
    <div class="form-actions">
      <button type="submit" id="btn-subir" class="btn btn-primary">Grabar</button>
      <button type="button" class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
    </div>
  </form>
</div>

<script>
  // No se porque no funciona
  $("#nombre").focus();
</script>
