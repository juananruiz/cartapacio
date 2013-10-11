{include file="evento/fichero_subir.tpl"}
<form id="" action="" method="POST" enctype="multipart/form-data">
	<div class="falso-modal row-fluid">	
		<div class="falso-modal-header">
			<h6>Gestión de Eventos 
			<i class="icon-chevron-right"></i> Editar subevento <i class="icon-chevron-right"></i> {$evento->id} <i class="icon-chevron-right"></i> 	<span class="text-error responsive_oculto"> {$evento->nombre_corto}</span>
			</h6>
		</div>
	<div class="falso-modal-body">
		<div id="contenedor_errores" class="alert alert-error" style="display:none"></div>
		<ul id="tab_evento" class="nav nav-tabs">
			<li>
				<a href="#evento_padre" data-toggle="tab"><i class="icon-file"></i> Padre</a></li>
			<li class="active">
				<a href="#evento" data-toggle="tab"><i class="icon-th-large"></i> Evento</a></li>
			<li>
				<a href="#ficheros" data-toggle="tab"><i class="icon-file"></i> Ficheros</a></li>
			<li>
				<a href="#meta" data-toggle="tab"><i class="icon-comment"></i> Opciones ...</a></li>
		</ul>
		<div class="tab-content" id="tab-content">
			<div class="tab-pane" id="evento_padre">
				{include file="evento/subevento_crear_padre.tpl"}
			</div>
			<div class="tab-pane active" id="evento">
				{include file="evento/evento_editar_evento.tpl"}
			</div>
			<div class="tab-pane" id="ficheros">
				{include file="evento/evento_editar_fichero.tpl"}
			</div>
			<div class="tab-pane" id="meta">
				{include file="evento/evento_editar_opcion.tpl"}
			</div>
		</div>
	</div>
	<div class="falso-modal-footer">
		<span class="pull-left"><i class="icon-star"></i> Campos obligatorios</span>
		<a href="index.php?page={$retorno}&id={$evento_padre->id}{if $retorno == 'evento/evento_editar'}&t=subeventos{/if}" class="btn btn-primary" >Grabar y salir</a>
	</div>
</div>
</form>
<script>
{literal}
var tabshow = {/literal}'{$t}'{literal};
{/literal}
if (tabshow != 'null')$('#tab_evento a[href="#'+tabshow+'"]').tab('show');
</script>
