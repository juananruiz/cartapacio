<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="index.php?page=inicio"><i class="icon-home icon-white"></i>Cartapacio</a>
      <div class="nav-collapse subnav-collapse">
        <p class="navbar-text pull-right">
          <i class="icon-user icon-white"></i> 
          <a href="#" class="navbar-link" id="usuario-pop" rel="popover" data-html=true
          data-content="Visitante<br/><b>Teléfono:</b> {$_usuario->telefono_trabajo}<br/>
          <b>Correo:</b> {$_usuario->correo1}<br/>
          <hr />
          <a href='index.php?page=login_out'><i class='icon-off'></i> Cerrar sesión</a>" 
          data-original-title="Datos profesionales"
          data-placement="bottom" style="text-decoration:none;">{$_usuario->nombre} {$_usuario->apellidos}</a>
        </p>
        <ul class="nav">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Recursos<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="index.php?page=recurso_listar">Listar Recursos</a></li>
              <li><a href="index.php?page=recurso_crear">Nuevo Recurso</a></li>
            </ul>
          </li>
          <li><a href="index.php?page="><span>Secciones</span></a></li>
          <li><a href="index.php?page="><span>Colecciones</span></a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Usuarios<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="index.php?page=usuario_listar">Listar Usuarios</a></li>
              <li><a href="index.php?page=usuario_crear">Nuevo Usuario</a></li>
            </ul>
          </li>
        </ul>
      </div><!-- .nav-collapse -->
    </div><!-- .container -->
  </div><!-- .navbar-inner -->
</div><!-- .navbar navbar-inverse navbar-fixed-top -->

<script>
$('#usuario-pop').popover();
</script>

