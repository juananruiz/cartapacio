<table class="table">
<tr><th></th><th>Uvus</th><th>DNI</th><th>Nombre y Apellidos</th></tr>
{foreach from=$usuarios item=usuario}
<tr>
<td><a href="index.php?page=evento/admin/usuario_crear&id={$usuario.id}"><i class="icon-plus-sign"></i></a> </td>
<td>{$usuario.uvus}</td>
<td>{$usuario.nif}</td>
<td>{$usuario.nombre} {$usuario.apellidos}</td>
</tr>
{/foreach}
