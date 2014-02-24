//-------------------------------------------------------------------------------- 
//
//  Modals Window Handler 
//
//-------------------------------------------------------------------------------- 
function modalsHandler()
{
	//Modals Window Handler 
  $('body').on('click','a[data-toggle="modal"]',function(e){
    var action = $(this).attr('data-url');
    $.ajax({
      type: 'GET',
      //Le añado ajax=true para que no cargue la plantilla principal
      url: action + '&ajax=true',

      success: function(response) {
        $('#modalGlobal').html(response);
        $('#modalGlobal').modal('show');
      },

      error: function (xhr, ajaxOptions, thrownError) {
        //console.log(xhr.status);
        //console.log(thrownError);
      }
    });
    e.preventDefault();
  });
}


//--------------------------------------------------------------------------------
//
// Ajax href handler 
//
//--------------------------------------------------------------------------------
function ajaxHandler()
{
    $('body').on('click','a[data-toggle="ajax"]',function(e){
        var action = $(this).attr('href');
        var div = $(this).attr('data-div');
        var undef;
        
        if(div == undef)
            div = 'content';

        var refresh = false;
        if(div == 'content' || div == 'subcontent')
            refresh = true;

        ldAjax(action,div,refresh);
        e.preventDefault();
    });
}


//--------------------------------------------------------------------------------
//
// Load Server response from url into div (replace content)
//
//--------------------------------------------------------------------------------
function ldAjax (url, div, refresh) 
{
    $.ajax(
    {
        type: 'GET',
        url: url,
        dataType: 'html',
        
        beforeSend : function (data) {
            $('#'+div).addClass('loading');
        },

        success: function(data) 
        {
            $('#'+div).removeClass('loading');
            $('#'+div).html(data);
            //Update URL bar if div is content
            if( refresh === true )
            {
                var reg = /.+?\:\/\/.+?(\/.+?)(?:#|\?|$)/;
                if ( !reg.exec(url) )
                {
                    var pathname = '/';
                }
                else
                {
                    var pathname = reg.exec(url)[1];
                }
                var stateObj = { foo: 'bar' };
                history.pushState(stateObj, 'page 2', pathname);
            }
        },                    

        error: function (xhr, ajaxOptions, thrownError) {
         $('#'+div).removeClass('loading');
         //console.log(xhr.status);
         //console.log(thrownError);
         //notification ('Error', thrownError, 'error', true);
        }
    });    
}

//--------------------------------------------------------------------------------
//
// Ajax Form handler
//
//--------------------------------------------------------------------------------

function formHandler()
{
  //$('body').on('submit', 'form[data-toggle="form-ajax"]', function(event) {
  $('body').on('submit', 'form', function(event) {
    event.preventDefault();
    var form = $(this);
    var div = form.attr('data-div');
    var dataInsert = form.attr('data-insert');
    var undef;

    $.ajax(
    {
      type: form.attr('method'),
      url: form.attr('action') + '&ajax=true',
      data: form.serialize(),

      success: function(data){
        $('.modal').modal('hide');
        console.log(data);
        if (dataInsert == "replace")
        {
          $('#'+div).replaceWith(data);
        }
        else if (dataInsert == "inside")
        {
          $('#'+div).html(data);
        }
        else if (dataInsert == "prepend")
        {
          $('#'+div).prepend(data);
        }
        else if (dataInsert == "append")
        {
          $('#'+div).append(data);
        }
        else
        {
          window.location.href = data;
        }
      },

      error: function (xhr, ajaxOptions, thrownError) {
        //console.log(xhr.status);
        //console.log(thrownError);
        //notification ('Error', thrownError, 'error', true);
      }
    });
  });
}

//--------------------------------------------------------------------------------
//
// Autosave para los campos de un formulario (han de tener de la clase .autosave)
//
//--------------------------------------------------------------------------------
function autosave()
{
  $('.autosave').on('change', function(evento){ 
    var campo = $(this).attr('name');
    var valor = $(this).val();
    var campoValor = {};
    var form = $(this).closest('form');
    var registroId = form.attr('data-registro-id');
    campoValor['registro_id'] = registroId;
    campoValor[campo] = valor;

    $.ajax(
    {
      type: form.attr('method'),
      url: form.attr('action') + '&ajax=true',
      data: campoValor ,
      success: function(datos) {  
        // Lanza la respuesta a consola para depurar
        console.log(datos)
      },                    
      error: function (xhr, ajaxOptions, thrownError) {
        //console.log(xhr.status);
        //console.log(thrownError);
      }
    });    
  });
}
