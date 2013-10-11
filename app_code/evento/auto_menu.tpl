<div class="row-fluid">
		<div class="span2" id="automenu">
		{if $_menu == 'admin'}
			<a  class="evento_btn btn pull-let" href="index.php?page=evento/admin/inicio" 
			title="Inicio administración de eventos">
					<span class="pull-left">
						<i class="icon-home"></i>
						<span class="responsive_oculto"> Inicio</span>
					</span>
				</a>
			<a  class="evento_btn btn pull-let" href="index.php?page=evento/admin/unidades_listar" 
			title="Unidades de eventos">
					<span class="pull-left">
						<i class="icon-align-justify"></i>
						<span class="responsive_oculto"> Unidades</span>
					</span>
				</a>
			<a  class="evento_btn btn pull-let" href="index.php?page=evento/admin/usuarios_listar" 
			title="Listar los usuarios de Evento">
					<span class="pull-left">
						<i class="icon-user"></i>
						<span class="responsive_oculto"> Usuarios</span>
					</span>
				</a>
				<a  class="evento_btn btn " href="index.php?page=evento/admin/eventos_estadistica" title="Gestión de Eventos-Estadísticas">
				<span class="pull-left"><i class="icon-signal"></i></i><span class="responsive_oculto"> Estadísticas</span>
				</a>
				<a  class="evento_btn btn " href="index.php?page=evento/admin/ficheros_listar" title="Gestión de archivos">
				<span class="pull-left"><i class="icon-file "></i><span class="responsive_oculto"> Ficheros</span>
				</a>
			{elseif $_menu == 'editor'}
			<a  class="evento_btn btn pull-let" href="index.php?page=evento/inicio" title="Inicio de eventos">
					<span class="pull-left">
						<i class="icon-home"></i>
						<span class="responsive_oculto"> Inicio</span>
					</span>
				</a>
			<a  class="evento_btn btn pull-let" href="index.php?page=evento/eventos_listar" title="Gestión de eventos">
					<span class="pull-left">
						<i class="icon-th-large"></i>
						<span class="responsive_oculto"> Mis eventos</span>
					</span>
				</a>
			<a  class="evento_btn btn pull-let" href="index.php?page=evento/usuario_permisos" title="Usuarios de mi área">
					<span class="pull-left">
						<i class="icon-align-justify"></i>
						<span class="responsive_oculto"> Mis Unidades</span>
					</span>
				</a>
			{if $_usuario->uvus == 'jjmc' OR $_usuario->uvus == 'juanan' OR $_usuaio->uvus == 'vaquero'}
			<a  class="evento_btn btn pull-let" href="index.php?page=evento/admin" title="Zona administrativa">
					<span class="pull-left">
						<i class="icon-folder-close"></i>
						<span class="responsive_oculto"> Administración</span>
					</span>
				</a>
			{/if}
			{/if}
	</div>
	<div class="span10">
		{include file="$plantilla"}
	</div>
</div> <!-- /.row-fluid -->
