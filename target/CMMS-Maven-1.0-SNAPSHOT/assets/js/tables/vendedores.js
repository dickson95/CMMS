/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmar(controller, id, nombre,email,proveedor,codigo,estado, boton) {
    if (confirm('¿Está seguro de '+boton.value+' el registro?')) {
        window.location.href = '../'+controller+'?btn=guardarcambios&id='+id+'&estado=' + estado + '&nombre=' + nombre + '&email=' + email + '&proveedor=' + proveedor + '&codigo=' + codigo + '&email=' + email +'';
    }
}
$(document).on("click", ".open-Modal", function () {
    var id = $(this).data('id');
    var nombre = $(this).data('nombre');
    var email = $(this).data('email');
    var proid = $(this).data('proid');
    var proveedor = $(this).data('proveedor');
    var codigo = $(this).data('codigo');
    var estado = $(this).data('estado');
    $(".modal-body #id").val(id);
    $(".modal-body #nombre").val(nombre);
    $(".modal-body #email").val(email);
    $(".modal-body #codigo").val(codigo);
    $(".modal-body #estado").val(estado);
    $(".modal-body #proid").val(proid);
    document.getElementById('proid').innerHTML=proveedor;
});

$(document).on("ready", function () {
    $("span.help-block").hide();
    $("#btnnew").click(validar);
    $("#btnedit").click(validaredit);
});

function validar() {
    var nombre = document.getElementById("nomnew").value;
    var email = document.getElementById("emailnew").value;
    var codigo = document.getElementById("codenew").value;
    var ban = true;
        if (nombre == null || nombre.length == 0 || /^\s+$/.test(nombre)){
            $('#iconotexto').remove();
            $('#nomnew').parent().attr('class', 'form-group has-error has-feedback');
            $('#nomnew').parent().children('span').text('Debe diligenciar este campo').show();
            $('#nomnew').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto').remove();
            $('#nomnew').parent().attr('class', 'form-group has-success has-feedback');
            $('#nomnew').parent().children('span').text('').hide();
            $('#nomnew').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(email == null || email.length == 0 || /^\s+$/.test(email)){
            $('#iconotexto2').remove();
            $('#emailnew').parent().attr('class', 'form-group has-error has-feedback');
            $('#emailnew').parent().children('span').text('Debe diligenciar este campo').show();
            $('#emailnew').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto2').remove();
            $('#emailnew').parent().attr('class', 'form-group has-success has-feedback');
            $('#emailnew').parent().children('span').text('').hide();
            $('#emailnew').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(codigo == null || codigo.length == 0 || /^\s+$/.test(codigo)){
            $('#iconotexto3').remove();
            $('#codenew').parent().attr('class', 'form-group has-error has-feedback');
            $('#codenew').parent().children('span').text('Debe diligenciar este campo').show();
            $('#codenew').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto3').remove();
            $('#codenew').parent().attr('class', 'form-group has-success has-feedback');
            $('#codenew').parent().children('span').text('').hide();
            $('#codenew').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        return ban;
}

function validaredit() {
    var nombre = document.getElementById("nombre").value;
    var email = document.getElementById("email").value;
    var codigo = document.getElementById("codigo").value;
    var ban = true;
        if (nombre == null || nombre.length == 0 || /^\s+$/.test(nombre)){
            $('#iconotexto').remove();
            $('#nombre').parent().attr('class', 'form-group has-error has-feedback');
            $('#nombre').parent().children('span').text('Debe diligenciar este campo').show();
            $('#nombre').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto').remove();
            $('#nombre').parent().attr('class', 'form-group has-success has-feedback');
            $('#nombre').parent().children('span').text('').hide();
            $('#nombre').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(email == null || email.length == 0 || /^\s+$/.test(email)){
            $('#iconotexto2').remove();
            $('#email').parent().attr('class', 'form-group has-error has-feedback');
            $('#email').parent().children('span').text('Debe diligenciar este campo').show();
            $('#email').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto2').remove();
            $('#email').parent().attr('class', 'form-group has-success has-feedback');
            $('#email').parent().children('span').text('').hide();
            $('#email').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(codigo == null || codigo.length == 0 || /^\s+$/.test(codigo)){
            $('#iconotexto3').remove();
            $('#codigo').parent().attr('class', 'form-group has-error has-feedback');
            $('#codigo').parent().children('span').text('Debe diligenciar este campo').show();
            $('#codigo').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto3').remove();
            $('#codigo').parent().attr('class', 'form-group has-success has-feedback');
            $('#codigo').parent().children('span').text('').hide();
            $('#codigo').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        return ban;
}