/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmacion(Controller,  Id, boton, estado) {
    if (confirm('¿De verdad desea '+boton.value+' este usuario?')) {
        window.location.href = '../' + Controller + '?btn=vetar&id=' + Id + '&estado='+estado+'';
    }
}
$(document).on("click", ".open-Modal", function () {
    var nombre = $(this).data('nombre');
    var id = $(this).data('id');
    var estado = $(this).data('estado');
    var cod = $(this).data('codigo');
    var locid = $(this).data('locid');
    var locnom = $(this).data('locnom');
    $(".modal-body #nombre").val(nombre);
    $(".modal-body #id").val(id);
    $(".modal-body #estado").val(estado);
    $(".modal-body #codigo").val(cod);
    $(".modal-body #locid").val(locid);
    document.getElementById('locid').innerHTML=locnom;
});

$(document).on("ready", function () {
    $("span.help-block").hide();
    $("#btnnew").click(validar);
    $("#btnmodify").click(validarmodify);
});

function validar() {
    var nombre = document.getElementById("nombre").value;
    var usuario = document.getElementById("usuario").value;
    var contrasena = document.getElementById("contrasena").value;
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
        if(usuario == null || usuario.length == 0 || /^\s+$/.test(usuario)){
            $('#iconotexto2').remove();
            $('#usuario').parent().attr('class', 'form-group has-error has-feedback');
            $('#usuario').parent().children('span').text('Debe diligenciar este campo').show();
            $('#usuario').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }
        else if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(usuario)) {
            $('#iconotexto2').remove();
            $('#usuario').parent().attr('class', 'form-group has-success has-feedback');
            $('#usuario').parent().children('span').text('').hide();
            $('#usuario').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-ok form-control-feedback'></span>");
            console.log('Correo válido');
        }else{
            console.log('Correo inválido');
            $('#iconotexto2').remove();
            $('#usuario').parent().attr('class', 'form-group has-error has-feedback');
            $('#usuario').parent().children('span').text('El usuario debe ser un correo electrónico').show();
            $('#usuario').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }
        if(contrasena == null || contrasena.length == 0 || /^\s+$/.test(contrasena)){
            $('#iconotexto3').remove();
            $('#contrasena').parent().attr('class', 'form-group has-error has-feedback');
            $('#contrasena').parent().children('span').text('Debe diligenciar este campo').show();
            $('#contrasena').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else if(contrasena.length < 4){
            $('#iconotexto3').remove();
            $('#contrasena').parent().attr('class', 'form-group has-error has-feedback');
            $('#contrasena').parent().children('span').text('La contraseña debe tener mínimo 4 caracteres').show();
            $('#contrasena').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto3').remove();
            $('#contrasena').parent().attr('class', 'form-group has-success has-feedback');
            $('#contrasena').parent().children('span').text('').hide();
            $('#contrasena').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        return ban;
}

function validarmodify() {
    var nombre = document.getElementById("nombremodify").value;
    var usuario = document.getElementById("usuariomodify").value;
    var contrasena = document.getElementById("contrasenamodify").value;
    var contrasenaconf = document.getElementById("contrasenaconfirmodify").value;
    var ban = true;
        if (nombre == null || nombre.length == 0 || /^\s+$/.test(nombre)){
            $('#iconotexto').remove();
            $('#nombremodify').parent().attr('class', 'form-group has-error has-feedback');
            $('#nombremodify').parent().children('span').text('Debe diligenciar este campo').show();
            $('#nombremodify').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else{
            $('#iconotexto').remove();
            $('#nombremodify').parent().attr('class', 'form-group has-success has-feedback');
            $('#nombremodify').parent().children('span').text('').hide();
            $('#nombremodify').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(usuario == null || usuario.length == 0 || /^\s+$/.test(usuario)){
            $('#iconotexto2').remove();
            $('#usuariomodify').parent().attr('class', 'form-group has-error has-feedback');
            $('#usuariomodify').parent().children('span').text('Debe diligenciar este campo').show();
            $('#usuariomodify').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }
        else if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(usuario)) {
            $('#iconotexto2').remove();
            $('#usuariomodify').parent().attr('class', 'form-group has-success has-feedback');
            $('#usuariomodify').parent().children('span').text('').hide();
            $('#usuariomodify').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }else{
            $('#iconotexto2').remove();
            $('#usuariomodify').parent().attr('class', 'form-group has-error has-feedback');
            $('#usuariomodify').parent().children('span').text('El usuario debe ser un correo electrónico').show();
            $('#usuariomodify').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }
        if(contrasena == null || contrasena.length == 0 || /^\s+$/.test(contrasena)){
            $('#iconotexto3').remove();
            $('#contrasenamodify').parent().attr('class', 'form-group has-error has-feedback');
            $('#contrasenamodify').parent().children('span').text('Debe diligenciar este campo').show();
            $('#contrasenamodify').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else if(contrasena.length < 4){
            $('#iconotexto3').remove();
            $('#contrasenamodify').parent().attr('class', 'form-group has-error has-feedback');
            $('#contrasenamodify').parent().children('span').text('La contraseña debe tener mínimo 4 caracteres').show();
            $('#contrasenamodify').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }else if(contrasena === contrasenaconf){
            $('#iconotexto3').remove();
            $('#contrasenamodify').parent().attr('class', 'form-group has-success has-feedback');
            $('#contrasenamodify').parent().children('span').text('').hide();
            $('#contrasenamodify').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-ok form-control-feedback'></span>");
            
            $('#iconotexto4').remove();
            $('#contrasenaconfirmodify').parent().attr('class', 'form-group has-success has-feedback');
            $('#contrasenaconfirmodify').parent().children('span').text('').hide();
            $('#contrasenaconfirmodify').parent().append("<span id='iconotexto4' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }else{
            $('#iconotexto3').remove();
            $('#contrasenamodify').parent().attr('class', 'form-group has-error has-feedback');
            $('#contrasenamodify').parent().children('span').text('Las contraseñas deben coincidir').show();
            $('#contrasenamodify').parent().append("<span id='iconotexto3' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            
            $('#iconotexto4').remove();
            $('#contrasenaconfirmodify').parent().attr('class', 'form-group has-error has-feedback');
            $('#contrasenaconfirmodify').parent().children('span').text('Las contraseñas deben coincidir').show();
            $('#contrasenaconfirmodify').parent().append("<span id='iconotexto4' class='glyphicon glyphicon-remove form-control-feedback'></span>");
            ban = false;
        }
        return ban;
}