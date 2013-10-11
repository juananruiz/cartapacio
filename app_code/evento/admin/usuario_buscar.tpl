<form  id="form">
<div class="falso-modal">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Buscar usuarios </h6>
	</div>
	<div class="falso-modal-body">
			<h4>Puede buscar por el NIF o el UVUS</h4>
			<div class="row">
				<input class="input-xlarge pull-right" name="filtro" id="filtro" 
				placeholder="Buscar ..." type="text">
			</div>
			<div id="box" class="">
				{*include file='cuestor/envios_consultar_ajax.tpl'*}
			</div>
	</div>
</div>
</form>

{literal}
<script>
$('#filtro').keyup(function(){
	var cadena = $(this).val();
	$('#box').html('<img src="images/loading.gif">');
	$.ajax({
		url: "index.php?page=evento/admin/usuario_buscar_ajax&ajax=true&cadena="+cadena,
		success: function(datos)
		{
			$('#box').html(datos);
		}
	}); 
})
</script>
{/literal}
