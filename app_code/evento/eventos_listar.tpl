<div class="falso-modal row-fluid">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Listado de eventos<span class="text-error responsive_oculto"></span><a href="index.php?page=evento/evento_crear_intermedia" class="btn pull-right btn-mini"><i class="icon-plus-sign"></i> Evento</a></h6>
	</div>
		<div class="falso-modal-body">
		<form method="post" action="" enctype="multipart/form-data">
		<b>Buscar en:</b> 
		<input checked="checked" style="vertical-align:top" type="checkbox" value="1" name="ambito[]"> Publicados
		<input checked="checked" style="vertical-align:top" type="checkbox" value="2" name="ambito[]"> Borradores
		<input style="vertical-align:top" type="checkbox" value="3" name="ambito[]"> Historial
		<input style="vertical-align:top" type="checkbox" value="4" name="ambito[]"> Eliminados
		<input class="input-xlarge pull-right" name="evento_buscar" id="evento_buscar" placeholder="Buscar ..." type="text">
		</form>
		<div id="box">
		{include file="evento/eventos_listar_ajax.tpl"}
		</div>
	</div>
</div>
{literal}
<script>
	//consulta en la tabla eventos
	$('#evento_buscar').keyup(function () {
		var chekeados = $('input[name="ambito[]"]:checked').length;
		if (chekeados > 0)
		{
			var ambito_busqueda = [];
			$('input[name="ambito[]"]:checked').each(function(){
					ambito_busqueda.push($(this).val());
			});
			var termino = $(this).val();
			$.ajax({
				url: "index.php?page=evento/eventos_listar_ajax&ajax=true&objeto=evento&ambito_busqueda="+ambito_busqueda+"&termino="+termino,
				success: function(datos)
				{
					$('#box').html(datos);
				}
			}); 
		}
		else
		{
			alert('Debe seleccionar un ámbito de búsqueda');
		}
	});
</script>
{/literal}
