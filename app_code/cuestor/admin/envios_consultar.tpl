<div class="row-fluid">
	<form  id="form">
	<h4>Puede buscar por el ID del envio{if $id_rol ==1}, el NIF o el UVUS{/if}.</h4>
		<div class="row">
			<input class="input-xlarge pull-right" name="filtro" id="filtro" 
			placeholder="Buscar ..." type="text">
		</div>
		<div id="box" class="">
			{*include file='cuestor/envios_consultar_ajax.tpl'*}
		</div>
	</form>
</div>
{literal}
<script>
$('#filtro').keyup(function(){
	var cadena = $(this).val();
	$('#box').html('<img src="images/loading.gif">');
	$.ajax({
		url: "index.php?page=cuestor/admin/envios_consultar&ajax=true&id=1&cadena="+cadena,
		success: function(datos)
		{
			$('#box').html(datos);
		}
	}); 
})
</script>
{/literal}
