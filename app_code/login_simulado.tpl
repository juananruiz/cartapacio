{if $modulo == 'inicio'}
<div class="falso-modal row-fluid">
	<div class="falso-modal-header">
		<h6>Entrada simulada <i class="icon-chevron-right"></i> Administrador <i class="icon-chevron-right"></i> {$usuario_admin}</h6>
	</div>
		<div class="falso-modal-body">
		<form method="post" action="" enctype="multipart/form-data">
				<input class="input-xlarge" name="usuario_buscar" id="usuario_buscar" placeholder="Buscar ..." type="text">
		<div id="box">
		</div>
		<div class="well">
		<b>Usuario actual :</b><br />
		<ul id="usuario_actual">
		<li>{$usuario->uvus}</li>
		<li>{$usuario->nombre} {$usuario->apellidos}</li>
		</ul>
		</div>
	</div>
		</form>
</div>
{literal}
<script>
$('#usuario_buscar').keyup(function () {
	var cadena = $(this).val();
	$.ajax({
		url: "index.php?page=login_simulado&ajax=true&modulo=filtro&cadena="+cadena,
		success: function(datos)
		{
			$('#box').html(datos);
		}
	}); 
});
</script>
{/literal}
{/if}
{if $modulo == 'filtro'}
<div class="well">
	<b>Entrar como :</b>
	{foreach from=$usuarios item=usuario}
	<label class="radio">
	<input data-nombre_usuario="{$usuario->nombre} {$usuario->apellidos}" class="usuario_simulado" type="radio" name="id_usuario" value="{$usuario->id}"><small>{$usuario->nombre} {$usuario->apellidos}</small>
	</label>
	{/foreach}
</div>
{literal}
<script>
$('.usuario_simulado').on('click',function(){
	var id_usuario = $(this).val();
	var nombre_usuario = $(this).data('nombre_usuario');
	if (confirm("¿Desea simular al usuario "+nombre_usuario+" ?"))
	{
		$.ajax({
				type: "GET",
				url: "index.php?page=login_simulado",
				data: {id_usuario:id_usuario,ajax:'true',modulo:'simular'},
				success: function(datos){
					location.reload();
				}//fin success
			});//fin ajax
	}
})
</script>
{/literal}
{/if}

