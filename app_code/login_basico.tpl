<div class="span4">
  <h1>{$_nombre_pagina}</h1>
  <form method="post" action="index.php?page=login_basico" id="formlogin" >
      <input type="hidden" name="acceso" value="true">

      <label for="correo">Correo</label> 
      <input type="text" name="correo" id="correo">

      <label for="clave">Clave</label>
      <input type="password" name="clave" id="clave">

      <div class="form-actions">
        <input type="submit" class="btn btn-primary" value="Acceder">
      </div>
  </form>
</div>
