    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="index.php?page=inicio"><i class="icon-home icon-white"></i>Intranet</a>
          <div class="nav-collapse subnav-collapse">
            <ul class="nav">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">PAS<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Planificación</a></li>
                  <li><a href="#">RPT</a></li>
                  <li><a href="#">Gestión del PAS</a></li>
                  <li><a href="#">Jornada, vacaciones, permisos y licencias</a></li>
                  <li><a href="#">Retribuciones y Seguridad Social</a></li>
                  <li><a href="#">Selección PAS</a></li>
                  <li><a href="#">Formación</a></li>
                  <li><a href="#">Evaluación Desempeño</a></li>
                  <li><a href="#">Excelencia</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">PDI<b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="index.php?page=pdi">Inicio</a></li>
                    <li><a href="index.php?page=pdi/impresos">Impresos y Solicitudes</a></li>
                    <li><a href="index.php?page=pdi/convocatorias">Convocatorias y Concursos</a></li>
                    <li><a href="index.php?page=pdi/normativa">Normativa</a></li>
                    <li><a href="#">Directorio / Organigrama</a></li>
                    <li><a href="#">Preguntas Frecuentes</a></li>
                    <li><a href="#">Plan de Calidad</a></li>
                    <li><a href="#">Contacta con nosotros</a></li>
                  </ul>
              </li>
              <li><a href="index.php?page=accion_social"><span>Acción Social</span></a></li>
              <li><a href="index.php?page=prevencion"><span>Prevención</span></a></li>
              <li><a href="{$CC_URL_PORTAL}"> <i class="icon-globe icon-white"></i> Web RRHH</span></a></li>
            </ul>
            <p class="navbar-text pull-right">
              <i class="icon-user icon-white"></i> 
              <a href="#" class="navbar-link" id="usuario-pop" rel="popover" 
              data-content="<b>{$_usuario->puesto_trabajo}</b><br>
              <b>{$_usuario->unidad}</b><br>
              <b>Teléfono:</b> {$_usuario->telefono_trabajo}<br>
              <b>Correo:</b> {$_usuario->correo1}<br>
              <hr>
              {if $_usuario->validador1}Validador 1: {$_usuario->validador1}<br>{/if}
              {if $_usuario->validador2}Validador 2: {$_usuario->validador2}<br>{/if}
              Unidad funcional: (pendiente implementar)
              <hr>
              <a href='https://identidad.us.es/idm/user/changePassword.jsp'><i class='icon-wrench'></i> Cambiar contraseña UVUS</a><br>
              <a href='https://sevius.us.es/EntradaLdap.php'><i class='icon-briefcase'></i> Secretaría Virtual</a><br>
              <a href='index.php?page=login_out'><i class='icon-off'></i> Cerrar sesión</a>" 
              data-original-title="Datos profesionales"
              data-placement="bottom" style="text-decoration:none;">{$_usuario->nombre} {$_usuario->apellidos}</a>
            </p>
          </div><!-- .nav-collapse -->
        </div><!-- .container -->
      </div><!-- .navbar-inner -->
    </div><!-- .navbar navbar-inverse navbar-fixed-top -->
