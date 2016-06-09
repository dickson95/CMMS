/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function desactivar(Controller, Id, Nombre, Codigo, Estado) {
    if (confirm('¿Está seguro de desactivar el registro?')) {
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