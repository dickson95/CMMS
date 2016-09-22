/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function desactivar(Controller, Id, Nombre, Codigo, Estado, boton) {
    if (confirm('¿Está seguro de '+boton.value+' el registro?')) {
        window.location.href = '../'+Controller+'?btn=guardarcambios&\n\
localizacionId=' + Id + '&nombreLocalizacion=' + Nombre + '&codigo=' + Codigo + '&Estado=' + Estado + '';
    }
}
$(document).on("click", ".open-Modal", function () {
    var nombre = $(this).data('nombre');
    var id = $(this).data('id');
    var estado = $(this).data('estado');
    var cod = $(this).data('codigo');
    $(".modal-body #nombre").val(nombre);
    $(".modal-body #id").val(id);
    $(".modal-body #estado").val(estado);
    $(".modal-body #codigo").val(cod);
});

$(document).on("ready", function () {
    $("span.help-block").hide();
    $("#btnnew").click(validar);
    $("#btnedit").click(validaredit);
});

function validar() {
    var localidad = document.getElementById("notnull").value;
    var codigo = document.getElementById("codigonew").value;
    console.log('Voy a validar el nombre');
    if (localidad == null || localidad.length == 0 || /^\s+$/.test(localidad)
            || codigo == null || codigo.length == 0 || /^\s+$/.test(codigo)) {
        if (localidad == null || localidad.length == 0 || /^\s+$/.test(localidad)){
            $('#iconotexto').remove();
            $('#notnull').parent().attr('class', 'form-group has-error has-feedback');
            $('#notnull').parent().children('span').text('Debe diligenciar este campo').show();
            $('#notnull').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        }else{
            $('#iconotexto').remove();
            $('#notnull').parent().attr('class', 'form-group has-success has-feedback');
            $('#notnull').parent().children('span').text('').hide();
            $('#notnull').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(codigo == null || codigo.length == 0 || /^\s+$/.test(codigo)){
            $('#iconotexto2').remove();
            $('#codigonew').parent().attr('class', 'form-group has-error has-feedback');
            $('#codigonew').parent().children('span').text('Debe diligenciar este campo').show();
            $('#codigonew').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        }else{
            $('#iconotexto2').remove();
            $('#codigonew').parent().attr('class', 'form-group has-success has-feedback');
            $('#codigonew').parent().children('span').text('').hide();
            $('#codigonew').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        return false;
    }else{
        return true;
    }
}

function validaredit() {
    var localidad = document.getElementById("nombre").value;
    var codigo = document.getElementById("codigo").value;
    console.log('Voy a validar el nombre');
    if (localidad == null || localidad.length == 0 || /^\s+$/.test(localidad)
            || codigo == null || codigo.length == 0 || /^\s+$/.test(codigo)) {
        if (localidad == null || localidad.length == 0 || /^\s+$/.test(localidad)){
            $('#iconotexto').remove();
            $('#nombre').parent().attr('class', 'form-group has-error has-feedback');
            $('#nombre').parent().children('span').text('Debe diligenciar este campo').show();
            $('#nombre').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        }else{
            $('#iconotexto').remove();
            $('#nombre').parent().attr('class', 'form-group has-success has-feedback');
            $('#nombre').parent().children('span').text('').hide();
            $('#nombre').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        if(codigo == null || codigo.length == 0 || /^\s+$/.test(codigo)){
            $('#iconotexto2').remove();
            $('#codigo').parent().attr('class', 'form-group has-error has-feedback');
            $('#codigo').parent().children('span').text('Debe diligenciar este campo').show();
            $('#codigo').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        }else{
            $('#iconotexto2').remove();
            $('#codigo').parent().attr('class', 'form-group has-success has-feedback');
            $('#codigo').parent().children('span').text('').hide();
            $('#codigo').parent().append("<span id='iconotexto2' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        }
        return false;
    }else{
        return true;
    }
}