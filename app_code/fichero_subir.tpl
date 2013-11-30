<!--
<script src="js/dropzone.js"></script>
<div class="span10">
  <form class="dropzone" action="index.php?page=fichero_grabar" method="post">
    <input type="hidden" name="id_recurso" value="{$recurso->id}">
    <h3>Arrastre ficheros o haga click para seleccionarlos desde su equipo</h3>
  </form>
</div>
-->

  <form action="index.php?page=fichero_grabar" method="post" 
    enctype="multipart/form-data">
    <input type="hidden" name="id_recurso" value="{$recurso->id}">
		<input type="file" name="file" id="file" />
    <div class="control-group">
      <label class="control-label" for="fichero1">Añadir fichero 1</label>
      <div class="controls">
        <input id="fichero" type="file" style="display:none" name="fichero">
        <div class="input-append">
          <input id="fichero1" class="input-xlarge" type="text">
          <a class="btn" onclick="$('input[id=fichero1]').click();"><i class="fa fa-folder-open-o"></i> Seleccionar fichero</a>
        </div>
      </div>
    </div>
    <input id="nombre" type="text" name="nombre">
    <input type="submit">
  </form>
