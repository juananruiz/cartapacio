<div class="span8">
  <h1><i class="fa fa-glass"></i> Materiales
  {if $_usuario->id_rol < 3}
    <a class="btn pull-right" data-toggle="modal" href="index.php?page=admin/material_crear" data-url="index.php?page=admin/material_crear"><i class="fa fa-plus-circle"></i> Crear material</a>
  {/if}
  </h1>

  <table class="table table-striped table-bordered">
    <thead>
      <tr>
        <th class="span1">id</th>
        <th{if $_usuario->id_rol < 3} colspan="2"{/if}>Material</th>
        
    </thead>
    <tbody>
      {foreach $materiales as $material}
        <tr>
          <td>{$material->id}</td>
          <td class="editable" id="{$material->id}"><span>{if $material->nombre != ""}{$material->nombre}{else}<i class="fa fa-pencil"></i>{/if}</span></td>
          {if $_usuario->id_rol < 3}
            <td>
                <a href="index.php?page=admin/material_eliminar&id={$material->id}"><i class="fa fa-trash-o"></i></a> 
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
    $(this).replaceWith("<input type='text' name='nombre' value='" + value + "'>").focus();
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
        console.log(data);
      },
      error: {
      }
    });
    $(this).replaceWith("<span>" + value + "</span");
  });
{/literal}
</script>
