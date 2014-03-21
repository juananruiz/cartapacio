<div class="span8">
  <h1><i class="fa fa-picture"></i> Estilos
  {if $_usuario->id_rol < 3}
    <a class="btn pull-right" data-toggle="modal" href="#" data-url="index.php?page=admin/estilo_crear"><i class="fa fa-plus-circle"></i> Crear estilo</a>
  {/if}
  </h1>

  {if isset($estilos)}
    <table class="table table-striped table-bordered">
      <thead>
        <tr>
          <th>Estilo</th>
          <th class="span1">Uso</th>
          {if $_usuario->id_rol < 3}<th class="span1"></th>{/if}
          
      </thead>
      <tbody id="filas-estilos">
        {foreach $estilos as $estilo}
          <tr>
            <td class="editable" id="{$estilo->id}"><span>{if $estilo->nombre != ""}{$estilo->nombre}{else}<i class="fa fa-pencil"></i>{/if}</span></td>
            <td>{$estilo->usos}</td>
            {if $_usuario->id_rol < 3}
              <td>
                  <a href="index.php?page=admin/estilo_eliminar&id={$estilo->id}" class="eliminar-estilo"><i class="fa fa-trash-o"></i></a> 
              </td>
            {/if}
          </tr>
        {/foreach}
      </tbody>
    </table>
  {else}
    <p class="warning">Todavía no existe ningún estilo en la base de datos</p>
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
        url: "index.php?page=admin/estilo_grabar&ajax=true",
        type: "POST",
        data: {'id': id, 'nombre': value},
        success: function(data){
        },
        error: {
        }
      });
      $(this).replaceWith("<span>" + value + "</span");
    });

    $('.eliminar-estilo').on('click', function(e){
      var filaActual = $(this).closest("tr");
      var usos = $(this).parent().prev().text();
      var mensaje;
      if (usos > 0)
      {
        mensaje = "Hay " + usos + " recursos asociados a este estilo, al eliminarlo se borrarán dichas asociaciones. ¿Seguro que quieres borrar el estilo?";
      }
      else
      {
        mensaje = '¿Quiéres borrar esta estilo?';
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
