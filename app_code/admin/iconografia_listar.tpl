<div class="span8">
  <h1><i class="fa fa-picture"></i> Iconografias
  {if $_usuario->id_rol < 3}
    <a class="btn pull-right" data-toggle="modal" href="#" data-url="index.php?page=admin/iconografia_crear"><i class="fa fa-plus-circle"></i> Crear iconografía</a>
  {/if}
  </h1>

  {if is_array($iconografias)}
    <table class="table table-striped table-bordered">
      <thead>
        <tr>
          <th>Iconografia</th>
          <th class="span1">Uso</th>
          {if $_usuario->id_rol < 3}<th class="span1"></th>{/if}
          
      </thead>
      <tbody id="filas-iconografias">
        {foreach $iconografias as $iconografia}
          <tr>
            <td class="editable" id="{$iconografia->id}"><span>{if $iconografia->nombre != ""}{$iconografia->nombre}{else}<i class="fa fa-pencil"></i>{/if}</span></td>
            <td>{$iconografia->usos}</td>
            {if $_usuario->id_rol < 3}
              <td>
                  <a href="index.php?page=admin/iconografia_eliminar&id={$iconografia->id}" class="eliminar-iconografia"><i class="fa fa-trash-o"></i></a> 
              </td>
            {/if}
          </tr>
        {/foreach}
      </tbody>
    </table>
  {else}
    <p class="warning">Todavía no existe ninguna iconografía en la base de datos</p>
  {/if}

</div>
<script>

  modalsHandler();
  formHandler();

  {literal}
    
    $("table").on("click","td.editable span",function(e) {
      var filaActual = $(this).closest("tr");
      var value = $(this).text();
      $(this).replaceWith("<input type='text' name='nombre' value='" + value + "'>");
      filaActual.find("input").focus();
    });

    $("table").on("blur","td.editable input",function(e) {
      var value = $(this).val();
      var id = $(this).parent().attr("id");
      $.ajax(
      {
        url: "index.php?page=admin/iconografia_grabar&ajax=true",
        type: "POST",
        data: {'id': id, 'nombre': value},
        success: function(data){
        },
        error: {
        }
      });
      $(this).replaceWith("<span>" + value + "</span");
    });

    $('.eliminar-iconografia').on('click', function(e){
      var filaActual = $(this).closest("tr");
      var usos = $(this).parent().prev().text();
      var mensaje;
      if (usos > 0)
      {
        mensaje = "Hay " + usos + " recursos asociados a este iconografia, al eliminarlo se borrarán dichas asociaciones. ¿Seguro que quieres borrar el iconografia?";
      }
      else
      {
        mensaje = '¿Quiéres borrar esta iconografia?';
      }

      if (confirm(mensaje))
      {
        $.ajax(
        {
          type: "GET",
          url: $(this).attr('href') + "&ajax=true",
          success: function(data) {
            filaActual.remove();   
          }
        });
      }
      e.preventDefault();
    });

  {/literal}
</script>
