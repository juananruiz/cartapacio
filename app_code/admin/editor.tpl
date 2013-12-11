{if isset($recurso)}
  <div class="span8">
    <h2>{$_nombre_pagina}</h2>

      <form name="miformu" id="miformu" method="post">
      <input type="hidden" name="recurso_id" id="recurso_id" value="{$recurso->id}">

      <label for="nombre">Nombre</label>
      <input class="automatico span8" type="text" name="nombre" id="nombre" 
       value="{if (isset($recurso->nombre))}{$recurso->nombre}{/if}">

      <label for="descripcion">Descripción</label>
      <textarea class="automatico textarea span8" name="descripcion" id="descripcion" rows="9">{if (isset($recurso->descripcion))}{$recurso->descripcion}{/if}</textarea>
      </form>
    <!--
    <div class="form-actions">
      <a href="index.php?page=admin/editor_listar"><button class="btn btn-primary">Guardar</button></a>
    </div>
    -->
  </div>

  <div id="visor" class="span4" style="margin-top:50px; border:1px solid silver;">
  </div>

{else}
  <p class="error">Faltan datos para mostrar esta página</p>
{/if}

{literal}
<script>

$('#descripcion').wysihtml5({
	'events': {
		'blur': function() { 
      $('#descripcion').blur();
		}
	}
});

var recurso_id = $('#recurso_id').val();

$('.automatico').on('blur', function(){
  var campo = $(this).attr('name');
  var valor = $(this).val();
  var campoValor = {};
  campoValor[campo] = valor;
  console.log(campoValor);
  $.ajax(
    {
      url:"index.php?page=admin/editor&graba=true&ajax=true&recurso_id=" + recurso_id,
      method: "post",
      data: campoValor,
      success: function(datos){
        $("#visor").html(datos);
        console.log(datos);
      },
    }
    );
});

</script>
{/literal}
