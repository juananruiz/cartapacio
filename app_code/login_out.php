<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: login_out.php
//--------------------------------------------------------------------------
// Controlador que tramita el logout de la aplicación
//--------------------------------------------------------------------------

// Elimina variables de usuario y sesión
unset($_SESSION['usuario']);
unset($usuario);

header("location:index.php");
exit();
