<form id="subir_fichero" name="subir_fichero" method="post" enctype="multipart/form-data">
    <!-- Modal -->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">Descripción y subida de archivos</h3>
</div>
    <div class="modal-body">
	<div class="row-fluid">
				<div class="well well-mini">
					<i class="icon-star  pull-right"></i>
							<input class="required"type="text" style="width:90%" id="descripcion_archivo" value="" name="descripcion_archivo" placeholder="Descripción el archivo">
				</div>
			</div>
			<div class="row-fluid">
				<div class="well well-mini">
					<input type="checkbox" class="" name="id_tipo" id="id_tipo" value="1" /> Es una imagen.
				</div>
			</div>
			<div class="row-fluid">
				<div class="well well-mini">
					<i class="icon-star  pull-right"></i>
					<input type="file" class="required" name="archivo" id="archivo" />
				</div>
			</div>
    </div>
    <div class="modal-footer">
	    <button class="btn" type="reset">Restablecer</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cerrar</button>
			<button class="btn btn-primary">Subir archivo</button>
		</div>
   </div>
</form>
{literal}
<script>
var id_evento = {/literal}{$evento->id};{literal}
var retorno ={/literal}'{$smarty.get.page}&id={$evento->id}&t=ficheros'{literal};

function sendForm(id_evento,tipo,descripcion) {
	var	oOutput = document.getElementById("ficheros_evento"),
	oData = new FormData(document.forms.namedItem("subir_fichero"));

	oData.append("CustomField", "This is some extra data");
	var oReq = new XMLHttpRequest();
	oReq.open("POST", "index.php?page=evento/fichero_subir&id_evento="+id_evento+"&descripcion_archivo="+descripcion+"&id_tipo="+id_tipo, true);
	oReq.onload = function(oEvent) {
			$.ajax({
				url:"index.php?page=evento/evento_ajax&ajax=true&modulo=listar_fichero&retorno="+retorno+"&id_evento="+id_evento,
				success: function(datos)
				{
					$('#ficheros_evento').html(datos);
				}
		});
	};
	oReq.send(oData);
}
$('#subir_fichero').validate({
				messages:{
				descripcion_archivo:{
					required: "<span class='text-error'>Debe hacer una descripción del archivo</span>"
				},
				file:{
					required: "<span class='text-error'>Seleccione un archivo</span>"
				}
			},
submitHandler: function(form){
	var tipo = ($('#id_tipo').is(':checked'))?1:0;
	var	descripcion = $('#descripcion_archivo').val();
	sendForm(id_evento,tipo,descripcion);
	$('#myModal').modal('hide');	
	}
});
</script>
{/literal}
