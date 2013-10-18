<p><a href="index.php?page=admin/autor_crear">Nuevo autor</a></p>
<table>
{foreach $autores as $autor}
  <tr>
    <td>{$autor->id}</td>
    <td>{$autor->nombre}</td>
    <td>{$autor->apellidos}</td>
    <td>
      <a href="index.php?page=admin/autor_editar&id={$autor->id}">Editar</a> 
      <a href="index.php?page=admin/autor_eliminar&id={$autor->id}">Eliminar</a> 
    </td>
  </tr>
{/foreach}
</table>
