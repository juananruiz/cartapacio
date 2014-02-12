<div class="span8">
  <h1><i class="fa fa-glass"></i> Materiales
  {if $_usuario->id_rol < 3}
    <a class="btn pull-right" data-toggle="modal" href="#" data-url="index.php?page=admin/material_crear"><i class="fa fa-plus-circle"></i> Crear material</a>
  {/if}
  </h1>

  <table class="table table-striped table-bordered">
    <thead>
      <tr>
        <th>Material</th>
        <th class="span1">Uso</th>
        {if $_usuario->id_rol < 3}<th class="span1"></th>{/if}
        
    </thead>
    <tbody id="filas-materiales">
      {foreach $materiales as $material}
        <tr>
          <td class="editable" id="{$material->id}"><span>{if $material->nombre != ""}{$material->nombre}{else}<i class="fa fa-pencil"></i>{/if}</span></td>
          <td>{$material->usos}</td>
          {if $_usuario->id_rol < 3}
            <td>
                <a href="index.php?page=admin/material_eliminar&id={$material->id}" class="eliminar-material"><i class="fa fa-trash-o"></i></a> 
            </td>
          {/if}
        </tr>
      {/foreach}
    </tbody>
  </table>
</div>
<script>

  modalsHandler();
  formHandler();

  {literal}
    
    $("table").on("click","td.editable span",function(e) {
      var value = $(this).text();
      $(this).replaceWith("<input type='text' name='nombre' value='" + value + "'>");
      $("table input").focus();
      console.log($(this).children("input"));
      //TODO: pillar enfoque
    });

    $("table").on("blur","td.editable input",function(e) {
      var value = $(this).val();
      var id = $(this).parent().attr("id");
      $.ajax(
      {
        url: "index.php?page=admin/material_grabar&ajax=true",
        type: "POST",
        data: {'id': id, 'nombre': value},
        success: function(data){
        },
        error: {
        }
      });
      $(this).replaceWith("<span>" + value + "</span");
    });

    $("table").on('click',".eliminar-material", function(e){
      var fila_actual = $(this).closest("tr");
      var usos = $(this).parent().prev().text();
      var mensaje;
      if (usos > 0)
      {
        mensaje = "Hay " + usos + " recursos asociados a este material, al eliminarlo se borrarán dichas asociaciones. ¿Seguro que quieres borrar el material?";
      }
      else
      {
        mensaje = '¿Quiéres borrar este material?';
      }

      if (confirm(mensaje))
      {
        $.ajax(
        {
          type: "GET",
          url: $(this).attr('href') + "&ajax=true",
          success: function(data) {
            fila_actual.remove();   
          }
        });
      }
      e.preventDefault();
    });

  {/literal}
</script>
