<p><a href="index.php?page=admin/serie_crear">Nueva serie</a></p>
<table>
{foreach $series as $serie}
  <tr>
    <td>{$serie->id}</td>
    <td>{$serie->nombre}</td>
    <td>
      <a href="index.php?page=admin/serie_editar&id={$serie->id}">Editar</a> 
      <a href="index.php?page=admin/serie_eliminar&id={$serie->id}">Eliminar</a> 
    </td>
  </tr>
{/foreach}
</table>

