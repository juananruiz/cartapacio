    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="index.php">Proyecto Anunciación</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li>
                <a href="index.php?page=recurso_listar" ><i class="fa fa-archive"></i> RECURSOS</a>
              </li>
              <li>
                <a href="index.php?page=admin/autor_listar"><i class="fa fa-male"></i> AUTORES</a>
              </li>
              <li>
                <a href="index.php?page=admin/ubicacion_listar"><i class="fa fa-folder-open"></i> UBICACIONES</a>
              </li>
              <li>
                <a href="index.php?page=coleccion_listar"><i class="fa fa-camera-retro"></i> COLECCIONES</a>
              </li>
              <li>
                <a href="index.php?page=usuario_perfil">{$usuario->nombre} {$usuario->apellidos}</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
