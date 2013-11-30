<div class="span10">
  <h3>Ficheros asociados al recurso</h3>

  <form method="post" action="index.php?page=archivo_subir&dir={$directorio}" enctype="multipart/form-data" > 
      <input type="file" name="archivo"/>
      <input name="enviar" type="submit" value="Subir archivo" />
  </form>

  <p>Recuerda que el nombre del archivo es el que se verá en la relación inferior, por ello renombra tu archivo antes de subirlo para que sea clarificador de su contenido.</p>
  <p class="alert"><strong>IMPORTANTE:</strong> el nombre de los ficheros no deben contener caracteres como ñ, acentos o espacios en blanco.</p>

  <table class="table">
  {foreach from=$archivos item=archivo }
      {* Evitamos que se vean los directorios ".", ".." y cualquier archivo o directorio que empiece por "." *}
      {if $archivo[0][0] == '.'}
      {else}
          <tr>
          <td><a href="upload/{$directorio}/{$archivo[0]}"><i class="fa fa-file"</i> {$archivo[0]}</a></td>
          <td>{$archivo[1]}</td>
          <td><a href="index.php?page=archivo_borrar&fichero={$archivo[0]}&dir={$directorio}" 
              onclick="javascript: return confirm('Quieres borrar el archivo : {$archivo[0]}');"><i class="fa fa-trash-o"></i></a></td>
          </tr>
      {/if}
  {/foreach}
  </table>
</div>
