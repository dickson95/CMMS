/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmacion(Controller,  Id, estado, boton) {
    if (confirm('¿De verdad desea '+boton.value +' este proveedor?')) {
        window.location.href = '../' + Controller + '?btn=archivar&id=' + Id + '&estado='+estado+'';
    }else{
        return false;
    }
}
$(document).on("click", ".open-Modal", function () {
    var id = $(this).data('id');
    var estado = $(this).data('estado');
    var compania = $(this).data('compania');
    var telefono = $(this).data('telefono');
    var direccion = $(this).data('direccion');
    var c_postal = $(this).data('c_postal');
    var email = $(this).data('email');
    var p_web = $(this).data('p_web');
    var ciudad = $(this).data('ciudad');
    var deuda = $(this).data('deuda');
    var descripcion = $(this).data('descripcion');
    $(".modal-body #id").val(id);
    $(".modal-body #estado").val(estado);
    $(".modal-body #compania").val(compania);
    $(".modal-body #telefono").val(telefono);
    $(".modal-body #direccion").val(direccion);
    $(".modal-body #c_postal").val(c_postal);
    $(".modal-body #email").val(email);
    $(".modal-body #p_web").val(p_web);
    $(".modal-body #cityedit").val(ciudad);
    $(".modal-body #deuda").val(deuda);
    $(".modal-body #descripcion").val(descripcion);
});

$(function() {
    function log( message ) {
      $( "<div>" ).text( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
    }
 
    $( "#city" ).autocomplete({
      source: function( request, response ) {
        var value = document.getElementById("city").value;
        console.log(value);
        $.ajax({
          url: "../ProveedoresC?btn=ciudad&",
          dataType: "json",
          data: {
            q: request.term
          },
          success: function( data ) {
            response( data );
          }
        });
      },
      minLength: 2,
      select: function( event, ui ) {
        log( ui.item ?
          "Selected: " + ui.item.label :
          "Nothing selected, input was " + this.value);
      },
      open: function() {
        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
      },
      close: function() {
        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
      }
    });
  });
$(function() {
    function log( message ) {
      $( "<div>" ).text( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
    }
 
    $( "#cityedit" ).autocomplete({
      source: function( request, response ) {
        var value = document.getElementById("cityedit").value;
        console.log(value);
        $.ajax({
          url: "../ProveedoresC?btn=ciudad",
          dataType: "json",
          data: {
            q: request.term
          },
          success: function( data ) {
            response( data );
          }
        });
      },
      minLength: 3,
      select: function( event, ui ) {
        log( ui.item ?
          "Selected: " + ui.item.label :
          "Nothing selected, input was " + this.value);
      },
      open: function() {
        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
      },
      close: function() {
        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
      }
    });
  });
  
$(document).on("ready", function () {
    $("span.help-block").hide();
    $("#btnnew").click(validar);
    $("#btnedit").click(validaredit);
});

function validar() {
    var compania = document.getElementById("companew").value;
    var telefono = document.getElementById("telnew").value;
    var email = document.getElementById("emailnew").value;
    var saldo = document.getElementById("saldnew").value;
    var ciudad = document.getElementById("city").value;
    var ban = true;
    console.log('Voy a validar el nombre');
        if (compania == null || compania.length == 0 || /^\s+$/.test(compania)){
            $('#iconotexto').remove();
            $('#companew').parent().attr('class', 'form-group has-error has-feedback');
            $('#companew').parent().children('span').text('Debe diligenciar este campo').show();
            $('#companew').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto').remove();
            $('#companew').parent().attr('class', 'form-group has-success has-feedback');
            $('#companew').parent().children('span').text('').hide();
            $('#companew').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(telefono == null || telefono.length == 0 || /^\s+$/.test(telefono)){
            $('#iconotexto2').remove();
            $('#telnew').parent().attr('class', 'form-group has-error has-feedback');
            $('#telnew').parent().children('span').text('Debe diligenciar este campo').show();
            $('#telnew').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto2').remove();
            $('#telnew').parent().attr('class', 'form-group has-success has-feedback');
            $('#telnew').parent().children('span').text('').hide();
            $('#telnew').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(email == null || email.length == 0 || /^\s+$/.test(email)){
            $('#iconotexto3').remove();
            $('#emailnew').parent().attr('class', 'form-group has-error has-feedback');
            $('#emailnew').parent().children('span').text('Debe diligenciar este campo').show();
            $('#emailnew').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto3').remove();
            $('#emailnew').parent().attr('class', 'form-group has-success has-feedback');
            $('#emailnew').parent().children('span').text('').hide();
            $('#emailnew').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(saldo == null || saldo.length == 0 || /^\s+$/.test(saldo)){
            $('#iconotexto4').remove();
            $('#saldnew').parent().attr('class', 'form-group has-error has-feedback');
            $('#saldnew').parent().children('span').text('Debe diligenciar este campo').show();
            $('#saldnew').parent().append("<span id='iconotexto4' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto4').remove();
            $('#saldnew').parent().attr('class', 'form-group has-success has-feedback');
            $('#saldnew').parent().children('span').text('').hide();
            $('#saldnew').parent().append("<span id='iconotexto4' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(ciudad == null || ciudad.length == 0 || /^\s+$/.test(ciudad)){
            $('#iconotexto5').remove();
            $('#city').parent().parent().attr('class', 'form-group has-error has-feedback');
            $('#city').parent().children('span').text('Debe diligenciar este campo').show();
            $('#city').parent().parent().append("<span id='iconotexto5' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto5').remove();
            $('#city').parent().parent().attr('class', 'form-group has-success has-feedback');
            $('#city').parent().children('span').text('').hide();
            $('#city').parent().parent().append("<span id='iconotexto5' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        return ban;
}

function validaredit() {
    var compania = document.getElementById("compania").value;
    var telefono = document.getElementById("telefono").value;
    var email = document.getElementById("email").value;
    var saldo = document.getElementById("deuda").value;
    var ciudad = document.getElementById("cityedit").value;
    var ban = true;
    console.log('Voy a validar el nombre');
        if (compania == null || compania.length == 0 || /^\s+$/.test(compania)){
            $('#iconotexto').remove();
            $('#compania').parent().attr('class', 'form-group has-error has-feedback');
            $('#compania').parent().children('span').text('Debe diligenciar este campo').show();
            $('#compania').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto').remove();
            $('#compania').parent().attr('class', 'form-group has-success has-feedback');
            $('#compania').parent().children('span').text('').hide();
            $('#compania').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(telefono == null || telefono.length == 0 || /^\s+$/.test(telefono)){
            $('#iconotexto2').remove();
            $('#telefono').parent().attr('class', 'form-group has-error has-feedback');
            $('#telefono').parent().children('span').text('Debe diligenciar este campo').show();
            $('#telefono').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto2').remove();
            $('#telefono').parent().attr('class', 'form-group has-success has-feedback');
            $('#telefono').parent().children('span').text('').hide();
            $('#telefono').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(email == null || email.length == 0 || /^\s+$/.test(email)){
            $('#iconotexto3').remove();
            $('#email').parent().attr('class', 'form-group has-error has-feedback');
            $('#email').parent().children('span').text('Debe diligenciar este campo').show();
            $('#email').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto3').remove();
            $('#email').parent().attr('class', 'form-group has-success has-feedback');
            $('#email').parent().children('span').text('').hide();
            $('#email').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(saldo == null || saldo.length == 0 || /^\s+$/.test(saldo)){
            $('#iconotexto4').remove();
            $('#deuda').parent().attr('class', 'form-group has-error has-feedback');
            $('#deuda').parent().children('span').text('Debe diligenciar este campo').show();
            $('#deuda').parent().append("<span id='iconotexto4' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto4').remove();
            $('#deuda').parent().attr('class', 'form-group has-success has-feedback');
            $('#deuda').parent().children('span').text('').hide();
            $('#deuda').parent().append("<span id='iconotexto4' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(ciudad == null || ciudad.length == 0 || /^\s+$/.test(ciudad)){
            $('#iconotexto5').remove();
            $('#cityedit').parent().parent().attr('class', 'form-group has-error has-feedback');
            $('#cityedit').parent().children('span').text('Debe diligenciar este campo').show();
            $('#cityedit').parent().parent().append("<span id='iconotexto5' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto5').remove();
            $('#cityedit').parent().parent().attr('class', 'form-group has-success has-feedback');
            $('#cityedit').parent().children('span').text('').hide();
            $('#cityedit').parent().parent().append("<span id='iconotexto5' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        return ban;
}