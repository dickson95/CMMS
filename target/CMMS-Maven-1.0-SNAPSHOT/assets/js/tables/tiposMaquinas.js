/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function confirmacion(Controller, Id, Nombre, Estado, boton) {
    if (confirm('¿Está seguro de ' + boton.value + ' el registro?')) {
        window.location.href = '../' + Controller + '?btn=guardarcambios&tipoId='
                + Id + '&nombreTipo=' + Nombre + '&Estado=' + Estado + '';
    }
}
$(document).on("click", ".open-Modal", function () {
    var nombre = $(this).data('nombre');
    var id = $(this).data('id');
    var estado = $(this).data('estado');
    $(".modal-body #nombre").val(nombre);
    $(".modal-body #id").val(id);
    $(".modal-body #estado").val(estado);
});

$(document).on("ready", function () {
    $("span.help-block").hide();
    $("#btnnew").click(validar);
    $("#btnedit").click(validaredit);
});

function validar() {
    var valor = document.getElementById("notnull").value;
    if (valor == null || valor.length == 0 || /^\s+$/.test(valor)) {
        $('#iconotexto').remove();
        $('#notnull').parent().attr('class', 'form-group has-error has-feedback');
        $('#notnull').parent().children('span').text('Debe diligenciar este campo').show();
        $('#notnull').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        return false;
    }else{
        $('#iconotexto').remove();
        $('#notnull').parent().attr('class', 'form-group has-success has-feedback');
        $('#notnull').parent().children('span').text('').hide();
        $('#notnull').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        return true;
    }
}

function validaredit() {
    var valor = document.getElementById("nombre").value;
    if (valor == null || valor.length == 0 || /^\s+$/.test(valor)) {
        $('#iconotexto').remove();
        $('#nombre').parent().attr('class', 'form-group has-error has-feedback');
        $('#nombre').parent().children('span').text('Debe diligenciar este campo').show();
        $('#nombre').parent().append("<span id='iconotexto' class='glyphicon glyphicon-remove form-control-feedback'></span>");
        return false;
    }else{
        $('#iconotexto').remove();
        $('#nombre').parent().attr('class', 'form-group has-success has-feedback');
        $('#nombre').parent().children('span').text('').hide();
        $('#nombre').parent().append("<span id='iconotexto' class='glyphicon glyphicon-ok form-control-feedback'></span>");
        return true;
    }
}