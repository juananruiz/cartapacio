//-------------------------------------------------------------------------------- 
//
//  Modals Window Handler 
//
//-------------------------------------------------------------------------------- 
function modalsHandler()
{
	//Modals Window Handler 
    $('body').on('click','a[data-toggle="modal"]',function(e){
        var action = $(this).attr('href');
        $.ajax({
            //Le añado ajax=true para que el controlador principal no cargue
            //la plantilla principal
            url : action + "&ajax=true",
            type: "GET",
    
            success: function(response) {
                $('#modalGlobal').html(response);
                $('#modalGlobal').modal('show');
            },

            error: function (xhr, ajaxOptions, thrownError) {
             //console.log(xhr.status);
             //console.log(thrownError);
             //notification ('Error', thrownError, 'error', true);
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
        type: "GET",
        url: url,
        dataType: "html",
        
        beforeSend : function (data) {
            $('#'+div).addClass("loading");
        },

        success: function(data) 
        {
            $('#'+div).removeClass("loading");
            $('#'+div).html(data);
            //Update URL bar if div is content
            if( refresh === true )
            {
                var reg = /.+?\:\/\/.+?(\/.+?)(?:#|\?|$)/;
                if ( !reg.exec(url) )
                {
                    var pathname = "/";
                }
                else
                {
                    var pathname = reg.exec(url)[1];
                }
                var stateObj = { foo: "bar" };
                history.pushState(stateObj, "page 2", pathname);
            }
        },                    

        error: function (xhr, ajaxOptions, thrownError) {
         $('#'+div).removeClass("loading");
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
  $( "form" ).on( "submit", function( event ) {
    var form = $(this);
    event.preventDefault();
    $.ajax(
    {
      type: form.attr("method"),
      url: form.attr("action") + '&ajax=true',
      data: form.serialize(),

      success: function(data){
        $('#modal').modal('hide');
        console.log(data);
        window.location.href = data;
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
    var form = $(this).closest("form");
    var registroId = form.attr("data-registro-id");
    campoValor['registro_id'] = registroId;
    campoValor[campo] = valor;

    $.ajax(
    {
      type: form.attr("method"),
      url: form.attr("action") + '&ajax=true',
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
